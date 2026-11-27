#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""校验 DSH Go 成品包（IPA / HAP / APK）。

默认抽样 300 条文件哈希，`--full` 全量校验（1.2 万条，约 1 分钟）。

用法:
    python verify_release.py DSH-Go-1.4.1-破甲+品牌-无扩展.ipa
    python verify_release.py DSH-Go-1.4.0-破甲+品牌.hap --full
    python verify_release.py DSH-Go-1.4.1-旗舰版.apk
"""
import argparse
import hashlib
import io
import json
import os
import plistlib
import struct
import sys
import zipfile

# 已发布资产的 (sha256, size, 资产名)
RELEASED = [
    ("fc9e85b90126d9cdf9e5c748ba7405810a9f5ba08e423089b0d752bb767a76d7", 233731232, "DSHGo-Flagship-1.4.1.apk"),
    ("4a1e33d1ecf64b793ff2040a2b7ad33df4b42ec24c251547f2b1b1ba1a24dcea", 233440416, "DSHGo-Flagship-1.4.1-NoBlind.apk"),
    ("cc4012cec3524405e80a33ac8e5c62e6dfd65a9e851ce4985ee7b834d86d0d32", 129420760, "DSHGo-Flagship-1.4.1-ios-brand-noext.ipa"),
    ("508026cd729a487d0ca46adbcd2aa9c5bd0f681e23e9cff3a819b5ad95cd7a27", 129528493, "DSHGo-Flagship-1.4.1-ios-brand.ipa"),
    ("d7184f5f0d9e1802228f80b4bfc5371c22275f774b7b7895389e86cde57781a2", 129653201, "DSHGo-Flagship-1.4.1-ios.ipa"),
    ("6f9f0494a99c6744e90030bf801dce67ab6b3f713f83935b288c81c1795230c7", 122698576, "DSHGo-Flagship-1.4.0-ohos-brand.hap"),
    ("56c6d1436a5c2b375a36c2c21c39981bc19d328ad7b1180d35f6e6485e65c835", 124906965, "DSHGo-Flagship-1.4.0-ohos.hap"),
]

PRESET_TAIL = "node_modules/@deepseek-ai/dsh-web-app/presets/standard.patch.yml"
PERSONA_MARK = "你是 DSH，运行在这台手机上的本地智能体。"
RUNTIME = {
    "ipa": "Payload/Runner.app/dsh-runtime/runtime.zip",
    "hap": "resources/rawfile/dsh-runtime/runtime.zip",
}

ok_cnt = 0
fail_cnt = 0


def sha256_file(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def check(label, cond, detail=""):
    global ok_cnt, fail_cnt
    if cond:
        ok_cnt += 1
        print("  [OK]   %-44s %s" % (label, detail))
    else:
        fail_cnt += 1
        print("  [FAIL] %-44s %s" % (label, detail))
    return cond


def detect_kind(path):
    low = path.lower()
    if low.endswith(".ipa"):
        return "ipa"
    if low.endswith(".hap"):
        return "hap"
    if low.endswith(".apk"):
        return "apk"
    raise SystemExit("只认 .ipa / .hap / .apk，实际是: %s" % path)


def verify_runtime(z, kind, full):
    """校验 runtime.zip：manifest 条目数、逐文件哈希、preset 破甲标记。"""
    data = z.read(RUNTIME[kind])
    print("\n[3] runtime.zip  %d B" % len(data))
    rz = zipfile.ZipFile(io.BytesIO(data))
    check("runtime.zip 内部 CRC", rz.testzip() is None)

    m = json.loads(rz.read("manifest.json").decode())
    recs = {e["path"]: e for e in m["files"]}
    check("manifest schema", m.get("schema") == 1, "schema=%r dsh=%r node=%r runtime=%r" % (
        m.get("schema"), m.get("dshVersion"), m.get("nodeVersion"), m.get("runtimeVersion")))
    check("manifest 条目数", len(recs) > 10000, "%d 条" % len(recs))

    names = set(rz.namelist())
    missing = [p for p in recs if "files/" + p not in names]
    check("manifest 声明的文件都在包里", not missing, "缺 %d 个" % len(missing) if missing else "")

    # 抽样或全量
    targets = sorted(recs)
    if not full and len(targets) > 300:
        step = len(targets) // 300
        targets = targets[::step][:300]
    if PRESET_TAIL in recs and PRESET_TAIL not in targets:
        targets.append(PRESET_TAIL)

    bad = []
    for p in targets:
        raw = rz.read("files/" + p)
        r = recs[p]
        if len(raw) != r["size"] or hashlib.sha256(raw).hexdigest() != r["sha256"]:
            bad.append(p)
    check("文件哈希校验（%s）" % ("全量" if full else "抽样"),
          not bad, "%d/%d 通过" % (len(targets) - len(bad), len(targets)) +
          ("；不匹配: " + ", ".join(bad[:3]) if bad else ""))

    # preset 内容
    preset = rz.read("files/" + PRESET_TAIL).decode("utf-8")
    check("preset 含 complete: true", "complete: true" in preset, "%d 字符" % len(preset))
    check("preset 含正文标记", PERSONA_MARK in preset)
    check("preset 只有一个 prefix 块", preset.count("prefix: |-") == 1)
    check("preset plugin 项数", preset.count("- id: ") >= 20, "%d 项" % preset.count("- id: "))
    check("preset !!js 表达式", preset.count("!!js") == 3, "%d 处" % preset.count("!!js"))
    return len(recs)


def verify_ipa(z, path, full):
    root = "Payload/Runner.app/"
    names = z.namelist()
    print("\n[2] IPA 结构")
    check("条目数 463", len(names) == 463, "%d" % len(names))
    for n in ("Payload/Runner.app/Info.plist", "Payload/Runner.app/Runner", RUNTIME["ipa"]):
        check("必需条目 " + n.split("/")[-1], n in names)

    info = plistlib.loads(z.read(root + "Info.plist"))
    check("bundle id", info.get("CFBundleIdentifier") == "io.github.ccch1mneyyy.dshgo",
          info.get("CFBundleIdentifier", ""))
    check("版本 1.4.1", info.get("CFBundleShortVersionString") == "1.4.1",
          info.get("CFBundleShortVersionString", ""))
    check("最低系统 15.0", info.get("MinimumOSVersion") == "15.0", info.get("MinimumOSVersion", ""))

    # Mach-O 魔数
    for rel in ("Runner", "Frameworks/App.framework/App", "Frameworks/NodeMobile.framework/NodeMobile"):
        b = z.read(root + rel)
        le = struct.unpack("<I", b[:4])[0]
        be = struct.unpack(">I", b[:4])[0]
        kind = "thin" if le == 0xFEEDFACF else ("fat" if be == 0xCAFEBABE else "?")
        check("Mach-O " + rel.split("/")[-1], kind != "?", "magic=%#x (%s)" % (le, kind))

    plugins = [n for n in names if n.startswith(root + "PlugIns/") and not n.endswith("/")]
    if plugins:
        check("扩展存在（分享 / 小组件）", True, "%d 条目" % len(plugins))
    else:
        check("扩展已删除（签名友好）", True, "0 条目，只占 1 个 App ID")

    # 品牌
    app = z.read(root + "Frameworks/App.framework/App")
    old, new = app.count(b"ccch1mneyyy"), app.count(b"leizhicheng")
    if new:
        check("品牌已替换", old <= 1,
              "ccch1mneyyy x%d（Android 遗留分支 1 处属预期）  leizhicheng x%d" % (old, new))
    else:
        check("未做品牌替换", old > 1, "ccch1mneyyy x%d" % old)
    return verify_runtime(z, "ipa", full)


def verify_hap(z, path, full):
    names = z.namelist()
    print("\n[2] HAP 结构")
    check("条目数 305", len(names) == 305, "%d" % len(names))
    for n in ("module.json", "pack.info", RUNTIME["hap"]):
        check("必需条目 " + n.split("/")[-1], n in names)

    mod = json.loads(z.read("module.json").decode())
    app = mod.get("app", {})
    check("bundleName", app.get("bundleName") == "ccchimneyyy.dsh.go", app.get("bundleName", ""))
    check("版本 1.4.0", app.get("versionName") == "1.4.0", app.get("versionName", ""))
    check("minAPIVersion 26", app.get("minAPIVersion") == 26, str(app.get("minAPIVersion")))

    for rel in ("libs/arm64-v8a/libapp.so", "libs/arm64-v8a/libnode.so"):
        b = z.read(rel)
        check("ELF " + rel.split("/")[-1], b[:4] == b"\x7fELF", "%d B" % len(b))

    so = z.read("libs/arm64-v8a/libapp.so")
    old, new = so.count(b"ccch1mneyyy"), so.count(b"leizhicheng")
    if new:
        check("品牌已替换", old == 0, "ccch1mneyyy x%d  leizhicheng x%d" % (old, new))
    else:
        check("未做品牌替换", old > 1, "ccch1mneyyy x%d" % old)
    return verify_runtime(z, "hap", full)


def verify_apk(z, path):
    names = z.namelist()
    print("\n[2] APK 结构")
    for n in ("AndroidManifest.xml", "classes.dex", "assets/runtime/manifest.json"):
        check("必需条目 " + n.split("/")[-1], n in names)
    m = json.loads(z.read("assets/runtime/manifest.json").decode())
    argv = m.get("launch", {}).get("argv", [])
    joined = " ".join(argv)
    check("启动参数含 --patch", "--patch" in joined)
    check("启动参数含 pojia overlay", "pojia" in joined)
    check("--no-open 唯一", joined.count("--no-open") == 1, "x%d" % joined.count("--no-open"))
    check("rootfsSha256 存在", bool(m.get("rootfsSha256")), (m.get("rootfsSha256") or "")[:16])
    check("runtimeVersion 带 pojia", "pojia" in (m.get("runtimeVersion") or ""), m.get("runtimeVersion", ""))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("pkg", help="要校验的 .ipa / .hap / .apk")
    ap.add_argument("--full", action="store_true", help="全量校验 manifest 哈希（默认抽样 300 条）")
    args = ap.parse_args()

    p = args.pkg
    if not os.path.isfile(p):
        raise SystemExit("文件不存在: " + p)
    kind = detect_kind(p)

    size = os.path.getsize(p)
    print("=" * 78)
    print("文件   %s" % os.path.basename(p))
    print("类型   %s   大小 %d B" % (kind.upper(), size))

    print("\n[1] 完整性")
    digest = sha256_file(p)
    print("  sha256 %s" % digest)
    hit = [r for r in RELEASED if r[0] == digest]
    if hit:
        check("匹配已发布资产", True, hit[0][2])
    else:
        check("匹配已发布资产", False, "自定义构建，或文件被改过")

    z = zipfile.ZipFile(p)
    check("ZIP CRC 全通过", z.testzip() is None, "%d 条目" % len(z.namelist()))

    if kind == "ipa":
        n = verify_ipa(z, p, args.full)
        print("\n[4] manifest 文件数  %d（iOS 基准 12659）" % n)
    elif kind == "hap":
        n = verify_hap(z, p, args.full)
        print("\n[4] manifest 文件数  %d（鸿蒙基准 12628）" % n)
    else:
        verify_apk(z, p)
    z.close()

    print("\n" + "=" * 78)
    print("结果   %d 项通过，%d 项失败" % (ok_cnt, fail_cnt))
    print("=" * 78)
    return 0 if fail_cnt == 0 else 1


if __name__ == "__main__":
    sys.exit(main())

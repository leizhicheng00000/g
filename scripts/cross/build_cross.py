# -*- coding: utf-8 -*-
"""iOS / HarmonyOS 破甲包构建。

两平台共用同一种 runtime.zip：manifest.json（逐文件 sha256）+ files/**。
破甲点与 Android 完全一致 —— 都是 dsh-web-app/presets/standard.patch.yml 里的
persona 行。区别只在交付载体：

  Android : proot rootfs，走 manifest.launch.argv 插 --patch overlay
  iOS     : DshGuest.framework（iSH）跑 x86 node，无启动参数通道 → 直接改 preset 本体
  Harmony : 原生 libnode.so 跑 arm64 node，同上

改本体后必须同步重算 manifest 里那一条的 sha256/size，否则启动时校验失败。
"""
import io
import json
import os
import hashlib
import zipfile

import zipraw

HERE = os.path.dirname(os.path.abspath(__file__))
PERSONA_MD = os.path.join(HERE, "..", "persona_system.md")

PRESET_PATH = "node_modules/@deepseek-ai/dsh-web-app/presets/standard.patch.yml"
PRESET_KEY = "files/" + PRESET_PATH
OLD_PREFIX_LINE = "              prefix: You are a coding agent powered by the {{model}} model."
INDENT = " " * 16

TARGETS = [
    {
        "tag": "ios",
        "src": "dsh-1.4.1-ios.ipa",
        "out": "DSH-Go-1.4.1-破甲.ipa",
        "runtime": "Payload/Runner.app/dsh-runtime/runtime.zip",
    },
    {
        "tag": "ohos",
        "src": "dsh-1.4.0-ohos.hap",
        "out": "DSH-Go-1.4.0-破甲.hap",
        "runtime": "resources/rawfile/dsh-runtime/runtime.zip",
    },
]


def build_preset(text):
    """把 persona 行替换成 complete + 正文块。"""
    lines = text.replace("\r\n", "\n").rstrip("\n").split("\n")
    for ln in lines:
        if "\t" in ln:
            raise SystemExit("正文含 tab，YAML 会报错")
    body = "\n".join(INDENT + ln if ln.strip() else "" for ln in lines)
    new = (
        "              complete: true\n"
        "              prefix: |-\n"
        + body
    )
    return new


def patch_preset_bytes(raw):
    s = raw.decode("utf-8")
    if OLD_PREFIX_LINE not in s:
        raise SystemExit("找不到 persona prefix 原始行，preset 结构变了")
    if s.count(OLD_PREFIX_LINE) != 1:
        raise SystemExit("prefix 原始行出现 %d 次，不唯一" % s.count(OLD_PREFIX_LINE))
    out = s.replace(OLD_PREFIX_LINE, build_preset(PERSONA_TEXT), 1)
    return out.encode("utf-8")


def patch_manifest(raw):
    m = json.loads(raw.decode("utf-8"))
    hit = None
    for e in m["files"]:
        if e.get("path") == PRESET_PATH:
            hit = e
            break
    if hit is None:
        raise SystemExit("manifest 里没有 %s" % PRESET_PATH)
    hit["sha256"] = hashlib.sha256(NEW_PRESET).hexdigest()
    hit["size"] = len(NEW_PRESET)
    return json.dumps(m, ensure_ascii=False, separators=(",", ":")).encode("utf-8"), hit


PERSONA_TEXT = open(PERSONA_MD, encoding="utf-8").read()
NEW_PRESET = None  # 运行期赋值


def main():
    global NEW_PRESET
    print("正文 %d 字符 %d 行" % (len(PERSONA_TEXT), PERSONA_TEXT.count("\n") + 1))

    for t in TARGETS:
        print("\n" + "=" * 68)
        print("=== %s : %s ===" % (t["tag"], t["src"]))
        src = os.path.join(HERE, t["src"])
        out = os.path.join(HERE, t["out"])

        z = zipfile.ZipFile(src)
        rt = z.read(t["runtime"])
        print("runtime.zip %d B" % len(rt))
        z.close()

        # --- 第一层：改 runtime.zip 内部 ---
        rt_in = os.path.join(HERE, "_rt_in_%s.zip" % t["tag"])
        rt_out = os.path.join(HERE, "_rt_out_%s.zip" % t["tag"])
        open(rt_in, "wb").write(rt)

        rzi = zipfile.ZipFile(rt_in)
        old_preset = rzi.read(PRESET_KEY)
        NEW_PRESET = patch_preset_bytes(old_preset)
        new_manifest, hit = patch_manifest(rzi.read("manifest.json"))
        rzi.close()
        print("preset %d -> %d B" % (len(old_preset), len(NEW_PRESET)))
        print("manifest 条目 size=%d sha256=%s…" % (hit["size"], hit["sha256"][:16]))

        rep, kept = zipraw.rebuild(rt_in, rt_out, {
            PRESET_KEY: NEW_PRESET,
            "manifest.json": new_manifest,
        })
        print("runtime 重建: 替换 %d 条 / 原样 %d 条 → %d B" % (rep, kept, os.path.getsize(rt_out)))

        # --- 第二层：换掉容器里的 runtime.zip ---
        new_rt = open(rt_out, "rb").read()
        rep2, kept2 = zipraw.rebuild(src, out, {t["runtime"]: new_rt})
        print("容器重建: 替换 %d 条 / 原样 %d 条 → %d B" % (rep2, kept2, os.path.getsize(out)))

        for f in (rt_in, rt_out):
            try:
                os.remove(f)
            except OSError:
                pass

        # --- 校验 ---
        v = zipfile.ZipFile(out)
        if v.testzip() is not None:
            raise SystemExit("容器 CRC 校验失败")
        got = v.read(t["runtime"])
        if got != new_rt:
            raise SystemExit("容器内 runtime.zip 与预期不一致")
        v.close()

        v = zipfile.ZipFile(io.BytesIO(new_rt))
        if v.testzip() is not None:
            raise SystemExit("runtime CRC 校验失败")
        m = json.loads(v.read("manifest.json").decode())
        bad = 0
        for e in m["files"]:
            try:
                d = v.read("files/" + e["path"])
            except KeyError:
                print("   缺失:", e["path"]); bad += 1; continue
            if len(d) != e["size"] or hashlib.sha256(d).hexdigest() != e["sha256"]:
                print("   不匹配:", e["path"]); bad += 1
                if bad > 5: break
        print("manifest 全量校验: %d 条, 异常 %d" % (len(m["files"]), bad))
        if bad:
            raise SystemExit("manifest 校验未通过")

        yml = v.read(PRESET_KEY).decode()
        assert "complete: true" in yml, "缺 complete"
        assert "破甲自检" in yml, "缺回执口令段"
        assert yml.count("prefix: |-") == 1, "prefix 块数不对"
        print("preset 断言通过（complete / 回执段 / 单一 prefix 块）")
        v.close()

        h = hashlib.sha256(open(out, "rb").read()).hexdigest()
        print("产出 %s  %d B  sha256 %s" % (t["out"], os.path.getsize(out), h))


if __name__ == "__main__":
    main()

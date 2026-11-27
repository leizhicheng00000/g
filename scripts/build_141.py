# -*- coding: utf-8 -*-
"""DSH Go 1.4.1 官方原版 → 内置破甲（+可选盲点/换源）。

基底：E:\\DSH-Go破甲手机端\\v141\\dsh-go-1.4.1-arm64.apk（官方原包，233442996 B，
      SHA256 6186f2f9...）

只替换：
  A 破甲版      : assets/runtime/manifest.json（1 个条目）
  B 破甲+盲点版 : manifest.json + res/7K.xml + res/6h.xml (+ classes.dex 若已生成)
其余 700+ 个条目逐字节原样复制。

破甲注入：launch.argv 里 /bin/sh -c 那条，在 exec dsh web 之前用 base64 把
AGENTS.md 写进两个用户全局根：
  /root/.dsh/AGENTS.md    （$DSH_HOME，DSH 引擎启动时作为全局指令载入）
  /root/.agents/AGENTS.md （resolveAgentsHome 默认 ~/.agents）
该文件不含 <!-- dsh-app:managed --> 标记，App 的 GuestSetup 不会覆盖它。

1.4.1 的 DSH 仍是 0.2.2-rc.1，manifest 结构（schema 1 / launch.argv 51 项）
与 1.1.0 完全一致，已逐字段比对。
"""
import base64
import json
import os
import re
import shutil
import struct
import subprocess
import sys
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
SRC_APK = os.path.join(HERE, "dsh-go-1.4.1-arm64.apk")
AGENTS = os.path.join(HERE, "agents_clean.md")   # 工作区约定（user 层）
DEX = os.path.join(HERE, "classes.dex")          # 盲点补丁 dex（存在则一并打入）
MANIFEST_PATH = "assets/runtime/manifest.json"
MARKER = "exec /usr/local/bin/dsh web"

OUT_PURE = os.path.join(HERE, "DSH-Go-1.4.1-破甲版.apk")
OUT_FULL = os.path.join(HERE, "DSH-Go-1.4.1-破甲+盲点版.apk")

BT = r"C:\Android\Sdk\build-tools\35.0.0"
JAVA = r"C:\Program Files\Java\jre1.8.0_481\bin\java.exe"
KEYSTORE = r"C:\Users\雷志程\.android\debug.keystore"
ZIPALIGN = os.path.join(BT, "zipalign.exe")
APKSIGNER = os.path.join(BT, "lib", "apksigner.jar")

ATTR = "isAccessibilityTool"
AXML_NAMES = ("res/7K.xml", "res/6h.xml")


def run(cmd, label):
    print("[RUN] " + label, flush=True)
    r = subprocess.run(cmd, capture_output=True, text=True,
                       encoding="utf-8", errors="replace")
    out = ((r.stdout or "") + (r.stderr or "")).strip()
    if out:
        print("      " + out[:1500].replace("\n", "\n      "), flush=True)
    if r.returncode != 0:
        raise RuntimeError(label + " 失败 (exit %d)" % r.returncode)
    return out


# ---------------- AXML 二进制补丁 ----------------
def parse_string_pool(buf, off):
    typ, hsize, size = struct.unpack_from("<HHI", buf, off)
    if typ != 0x0001:
        return None, off
    string_count, style_count, flags, strings_start, styles_start = struct.unpack_from("<IIIII", buf, off + 8)
    utf8 = bool(flags & 0x100)
    offsets = struct.unpack_from("<%dI" % string_count, buf, off + hsize)
    base = off + strings_start
    out = []
    for so in offsets:
        p = base + so
        try:
            if utf8:
                n = buf[p]
                p += 2 if (n & 0x80) else 1
                n = buf[p]
                if n & 0x80:
                    n = ((n & 0x7F) << 8) | buf[p + 1]
                    p += 2
                else:
                    p += 1
                out.append(buf[p:p + n].decode("utf-8", "replace"))
            else:
                n = struct.unpack_from("<H", buf, p)[0]
                p += 2
                if n & 0x8000:
                    n = ((n & 0x7FFF) << 16) | struct.unpack_from("<H", buf, p)[0]
                    p += 2
                out.append(buf[p:p + n * 2].decode("utf-16-le", "replace"))
        except Exception:
            out.append("")
    return out, off + size


def patch_axml(raw):
    buf = bytearray(raw)
    typ, hsize, total = struct.unpack_from("<HHI", buf, 0)
    if typ != 0x0003:
        raise RuntimeError("不是 AXML")
    strings, _ = parse_string_pool(buf, 8)
    if strings is None:
        return None
    idx = next((i for i, s in enumerate(strings) if s == ATTR), None)
    if idx is None:
        return None
    hits = []
    i, n = 0, len(buf)
    while i + 20 <= n:
        ns, name, rawv = struct.unpack_from("<III", buf, i)
        vsize, res0, dtype = struct.unpack_from("<HBB", buf, i + 12)
        if name == idx and vsize == 8 and res0 == 0 and dtype == 0x12:
            data = struct.unpack_from("<I", buf, i + 16)[0]
            hits.append((i, data))
            if data == 0:
                struct.pack_into("<I", buf, i + 16, 0xFFFFFFFF)
            i += 20
            continue
        i += 1
    if not hits:
        return None
    return bytes(buf), hits


# ---------------- 构建 ----------------
def build(replacements, out_apk, label):
    tmp = out_apk + ".tmp"
    aligned = out_apk + ".aligned"
    changed = []
    with zipfile.ZipFile(SRC_APK) as zin, zipfile.ZipFile(tmp, "w") as zout:
        for item in zin.infolist():
            data = replacements.get(item.filename)
            if data is not None:
                changed.append(item.filename)
            else:
                data = zin.read(item.filename)
            zi = zipfile.ZipInfo(item.filename, date_time=item.date_time)
            zi.compress_type = item.compress_type
            zi.external_attr = item.external_attr
            zi.internal_attr = item.internal_attr
            zi.create_system = item.create_system
            zout.writestr(zi, data)
    os.replace(tmp, out_apk)
    print("[%s] 替换条目: %s" % (label, changed), flush=True)
    print("[%s] 未签名大小: %d" % (label, os.path.getsize(out_apk)), flush=True)

    if os.path.exists(aligned):
        os.remove(aligned)
    run([ZIPALIGN, "-p", "-f", "4", out_apk, aligned], label + " zipalign")
    shutil.move(aligned, out_apk)
    run([
        JAVA, "-jar", APKSIGNER, "sign",
        "--ks", KEYSTORE, "--ks-key-alias", "androiddebugkey",
        "--ks-pass", "pass:android", "--key-pass", "pass:android",
        "--v1-signing-enabled", "true", "--v2-signing-enabled", "true",
        "--out", out_apk, out_apk,
    ], label + " 签名")
    run([JAVA, "-jar", APKSIGNER, "verify", "--verbose", out_apk], label + " 验签")


def main():
    for p in (SRC_APK, AGENTS, ZIPALIGN, JAVA, APKSIGNER, KEYSTORE):
        if not os.path.exists(p):
            raise RuntimeError("缺文件: " + p)

    # ---------- 1) 破甲 manifest ----------
    with zipfile.ZipFile(SRC_APK) as z:
        d = json.loads(z.read(MANIFEST_PATH).decode("utf-8"))
    argv = d["launch"]["argv"]
    idx = next((i for i, a in enumerate(argv) if MARKER in a), None)
    if idx is None:
        raise RuntimeError("未找到引擎启动命令")
    original = argv[idx]
    assert original.startswith("echo $$ > /tmp/dsh-web.pid; "), "启动命令前缀变了: " + original[:60]

    agents_bytes = open(AGENTS, "rb").read()
    b64 = base64.b64encode(agents_bytes).decode("ascii")
    assert "'" not in b64
    inject = (
        "mkdir -p /root/.dsh /root/.agents && "
        "printf '%s' '" + b64 + "' | base64 -d > /root/.dsh/AGENTS.md && "
        "cp /root/.dsh/AGENTS.md /root/.agents/AGENTS.md; "
    )
    new_cmd = original.replace(MARKER, inject + MARKER, 1)
    if len(new_cmd) > 120000:
        raise RuntimeError("单参数超过内核上限 (131072)")
    argv[idx] = new_cmd

    old_ver = d["runtimeVersion"]
    if not old_ver.endswith("-pojia"):
        d["runtimeVersion"] = old_ver + "-pojia"
    new_manifest = json.dumps(d, ensure_ascii=False, separators=(",", ":")).encode("utf-8")
    print("破甲原文 %d B / base64 %d 字符 / 新命令 %d 字符"
          % (len(agents_bytes), len(b64), len(new_cmd)), flush=True)
    print("runtimeVersion: %s -> %s" % (old_ver, d["runtimeVersion"]), flush=True)

    # 只改 argv 与 runtimeVersion，其他字段必须一致
    d2 = json.loads(new_manifest.decode("utf-8"))
    assert d2["rootfsSha256"] == d["rootfsSha256"], "rootfs 校验值被动"
    assert d2["upgrade"] == d["upgrade"], "upgrade 段被动"
    for k in d:
        if k in ("launch", "runtimeVersion"):
            continue
        assert d2[k] == d[k], "字段 %s 被动" % k
    for k in d["launch"]:
        if k != "argv":
            assert d2["launch"][k] == d["launch"][k], "launch.%s 被动" % k

    # ---------- 2) 盲点补丁资源 ----------
    extra = {}
    axml_hits = {}
    with zipfile.ZipFile(SRC_APK) as z:
        for name in AXML_NAMES:
            r = patch_axml(z.read(name))
            if r is None:
                raise RuntimeError("AXML 补丁失败: " + name)
            new, hits = r
            assert len(new) == z.getinfo(name).file_size
            assert len(hits) == 1, "%s 命中 %d 处，非预期" % (name, len(hits))
            extra[name] = new
            axml_hits[name] = hits[0][0] + 16   # Res_value.data 的偏移
            print("AXML %-14s %s" % (name, [(hex(o), hex(v)) for o, v in hits]), flush=True)
    if os.path.exists(DEX):
        dex = open(DEX, "rb").read()
        assert dex[:4] == b"dex\n", "dex 魔数错误"
        extra["classes.dex"] = dex
        print("classes.dex %d B（盲点补丁）" % len(dex), flush=True)
    else:
        print("! 未找到 %s，本次只出破甲版（不含 dex 盲点）" % DEX, flush=True)

    # ---------- 3) 出包 ----------
    build({MANIFEST_PATH: new_manifest}, OUT_PURE, "破甲版")
    reps = {MANIFEST_PATH: new_manifest}
    reps.update(extra)
    out_full = OUT_FULL if "classes.dex" in extra else os.path.join(HERE, "DSH-Go-1.4.1-破甲+AXML版.apk")
    build(reps, out_full, "破甲+盲点版")

    # ---------- 4) 自检 ----------
    with zipfile.ZipFile(SRC_APK) as zs:
        names = zs.namelist()
        for out_apk, rp in ((OUT_PURE, {MANIFEST_PATH: new_manifest}),
                            (out_full, reps)):
            with zipfile.ZipFile(out_apk) as zo:
                assert len(zo.namelist()) == len(names), "条目数变了"
                m = json.loads(zo.read(MANIFEST_PATH).decode())
                hit = [a for a in m["launch"]["argv"] if "base64 -d" in a]
                assert len(hit) == 1, "破甲注入丢失"
                assert "/root/.agents/AGENTS.md" in hit[0]
                mm = re.search(r"printf '%s' '([A-Za-z0-9+/=]+)'", hit[0])
                assert base64.b64decode(mm.group(1)) == agents_bytes, "回解不一致"
                diff = [n for n in names
                        if n not in rp
                        and not (n.startswith("META-INF/") and n.rsplit(".", 1)[-1] in ("SF", "RSA", "MF"))
                        and zs.read(n) != zo.read(n)]
                print("[%s] 非预期差异: %s" % (os.path.basename(out_apk), diff or "无"), flush=True)
                assert not diff
                # AXML 补丁复核（仅打了 AXML 的包才有）
                if AXML_NAMES[0] in rp:
                    for name in AXML_NAMES:
                        v = struct.unpack_from("<I", zo.read(name), axml_hits[name])[0]
                        assert v == 0xFFFFFFFF, "%s 未打上" % name
    print("=" * 60, flush=True)
    for p in (OUT_PURE, out_full):
        print("%s  %d bytes" % (p, os.path.getsize(p)), flush=True)


if __name__ == "__main__":
    sys.exit(main())

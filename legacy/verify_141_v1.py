# -*- coding: utf-8 -*-
"""v1.4.1 两个交付包的完整独立校验（不重建，只读）。"""
import base64
import hashlib
import json
import os
import re
import struct
import subprocess
import sys
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(HERE, "dsh-go-1.4.1-arm64.apk")
AGENTS = os.path.join(HERE, "AGENTS-v1.0.md")
PURE = os.path.join(HERE, "DSH-Go-1.4.1-破甲版.apk")
FULL = os.path.join(HERE, "DSH-Go-1.4.1-破甲+盲点版.apk")
MAN = "assets/runtime/manifest.json"
AXML_NAMES = ("res/7K.xml", "res/6h.xml")
JAVA = r"C:\Program Files\Java\jre1.8.0_481\bin\java.exe"
APKSIGNER = r"C:\Android\Sdk\build-tools\35.0.0\lib\apksigner.jar"

ok_all = True


def chk(cond, msg, extra=""):
    global ok_all
    if cond:
        print("  [PASS] " + msg + ("  " + extra if extra else ""))
    else:
        ok_all = False
        print("  [FAIL] " + msg + ("  " + extra if extra else ""))


def axml_value(buf, off):
    return struct.unpack_from("<I", buf, off)[0]


def main():
    agents = open(AGENTS, "rb").read()
    src = zipfile.ZipFile(SRC)
    snames = src.namelist()
    sm = json.loads(src.read(MAN).decode())
    print("源包 %d 条目 / manifest %d B / runtimeVersion %s"
          % (len(snames), src.getinfo(MAN).file_size, sm["runtimeVersion"]))

    for path, expect_axml, expect_dex in ((PURE, False, False), (FULL, True, True)):
        print("\n=== " + os.path.basename(path) + "  %d bytes" % os.path.getsize(path))
        if not os.path.exists(path):
            chk(False, "文件存在")
            continue
        z = zipfile.ZipFile(path)
        zn = set(z.namelist())

        chk(len(zn) == len(snames), "条目数不变", "%d / %d" % (len(zn), len(snames)))
        chk(not (zn - set(snames)), "无新增条目", str(sorted(zn - set(snames))[:5]))

        # manifest
        m = json.loads(z.read(MAN).decode())
        hit = [a for a in m["launch"]["argv"] if "base64 -d" in a]
        chk(len(hit) == 1, "注入唯一", "%d 条" % len(hit))
        mm = re.search(r"printf '%s' '([A-Za-z0-9+/=]+)'", hit[0])
        dec = base64.b64decode(mm.group(1))
        chk(dec == agents, "回解与 AGENTS.md 一致", "%d B" % len(dec))
        chk("/root/.dsh/AGENTS.md" in hit[0], "写入 $DSH_HOME")
        chk("/root/.agents/AGENTS.md" in hit[0], "写入 ~/.agents")
        chk(hit[0].index("base64 -d") < hit[0].index("exec /usr/local/bin/dsh web"),
            "注入在 exec 之前")
        chk(m["runtimeVersion"] == sm["runtimeVersion"] + "-pojia", "runtimeVersion 加后缀",
            m["runtimeVersion"])
        chk(m["rootfsSha256"] == sm["rootfsSha256"], "rootfsSha256 未动")
        chk(m["upgrade"] == sm["upgrade"], "upgrade 段未动")
        chk(len(m["launch"]["argv"]) == len(sm["launch"]["argv"]), "argv 项数不变",
            "%d" % len(m["launch"]["argv"]))
        other = [k for k in m["launch"] if k != "argv" and m["launch"][k] != sm["launch"][k]]
        chk(not other, "launch 其余字段未动", str(other))

        # AXML
        for name in AXML_NAMES:
            v = axml_value(z.read(name), 0x284)
            want = 0xFFFFFFFF if expect_axml else 0
            chk(v == want, "%s isAccessibilityTool" % name,
                "0x%X%s" % (v, "" if expect_axml else "（本包不改）"))

        # dex
        dex = z.read("classes.dex")
        if expect_dex:
            chk(dex[:4] == b"dex\n", "dex 魔数", dex[:8].decode("latin1"))
            chk(dex != src.read("classes.dex"), "dex 已替换", "%d B" % len(dex))
            # 直接扫字节码模式：iget-object vN, vM, Lso;->k 之后紧跟两个 move vN, v1
            pat = re.compile(rb"\x54\x43([\x00-\xff])...")  # iget-object opcode 0x54 fmt 22c
            txt = dex
            # 用 dexdump 已核过，这里做粗检：新文案必须存在，旧文案必须消失
            for s_new, s_old in (
                (b"\xe6\x8c\x89\xe6\x88\xaa\xe5\x9b\xbe\xe5\x9d\x90\xe6\xa0\x87\xe7\x9b\xb4\xe6\x8e\xa5\xe7\x82\xb9",  # 按截图坐标直接点
                 b"\xe4\xb8\x8d\xe7\x9b\xb2\xe7\x82\xb9"),  # 不盲点
                (b"\xe6\x8c\x89\xe6\x88\xaa\xe5\x9b\xbe\xe5\x9d\x90\xe6\xa0\x87\xe7\x9b\xb4\xe6\x8e\xa5\xe6\xbb\x91",  # 按截图坐标直接滑
                 b"\xe4\xb8\x8d\xe7\x9b\xb2\xe6\xbb\x91"),  # 不盲滑
            ):
                chk(txt.count(s_new) >= 1, "新文案存在", s_new.decode("utf-8", "replace"))
                chk(txt.count(s_old) == 0, "旧文案已清除", s_old.decode("utf-8", "replace"))

        # 逐字节差异
        reps = {MAN}
        if expect_axml:
            reps |= set(AXML_NAMES)
        if expect_dex:
            reps.add("classes.dex")
        diff = [n for n in sorted(zn & set(snames))
                if not n.startswith("META-INF/") and n not in reps
                and z.read(n) != src.read(n)]
        chk(not diff, "非预期差异为零", str(diff[:5]))

        # 结构完整性：assets/runtime 大件仍在
        for name in ("assets/runtime/rootfs-arm64-v8a.tar.xz",
                     "lib/arm64-v8a/libapp.so",
                     "lib/arm64-v8a/libproot.so"):
            chk(z.getinfo(name).file_size == src.getinfo(name).file_size,
                "原件未动 " + name.split("/")[-1], "%d B" % z.getinfo(name).file_size)

        # 签名
        r = subprocess.run([JAVA, "-jar", APKSIGNER, "verify", "--verbose", path],
                           capture_output=True, text=True, encoding="utf-8", errors="replace")
        out = (r.stdout or "") + (r.stderr or "")
        chk("Verified using v2 scheme (APK Signature Scheme v2): true" in out, "v2 验签")
        chk("Verified using v3 scheme (APK Signature Scheme v3): true" in out, "v3 验签")
        z.close()

    print("\n" + "=" * 56)
    print("总计: " + ("全部通过" if ok_all else "存在失败项"))
    return 0 if ok_all else 1


if __name__ == "__main__":
    sys.exit(main())

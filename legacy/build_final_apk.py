# -*- coding: utf-8 -*-
"""步骤 3：汇总三项改动并重签名，产出最终 APK（仓库版）。

在步骤 1 的 dsh-go-1.0.13-pojia.apk 基础上叠加：
  1. classes.dex          ← apktool 回编译产物（盲点方案 A）
  2. res/7K.xml           ← isAccessibilityTool false→true（4 字节等长）
  3. lib/arm64-v8a/libapp.so ← updateRepo 等长替换（Star/更新/社区链接 → 本仓库）
最后 zipalign + apksigner 重新签名。

Star 链接：ccch1mneyyy/dsh-go（18 字节）等长替换为 leizhicheng00000/g（18 字节）。
如需指向别的仓库，改 NEW_REPO 即可（必须同为 18 字节，否则 Dart 快照结构会坏）。
"""
import os
import shutil
import struct
import subprocess
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
BASE = os.path.join(HERE, "dsh-go-1.0.13-pojia.apk")
OUT = os.path.join(HERE, "dsh-go-1.0.13-pojia-blindspot.apk")
ALIGNED = OUT + ".aligned"
DEX = os.path.join(HERE, "apk_dec", "build", "apk", "classes.dex")
JAVA = os.environ.get("JAVA_HOME", r"C:\Program Files\Java\jre1.8.0_481") + "/bin/java.exe"
BT = os.environ.get("ANDROID_BUILD_TOOLS", r"C:\Android\Sdk\build-tools\35.0.0")
ZIPALIGN = os.path.join(BT, "zipalign.exe")
APKSIGNER = os.path.join(BT, "lib", "apksigner.jar")
KEYSTORE = os.path.join(os.path.expanduser("~"), ".android", "debug.keystore")

OLD_REPO = b"ccch1mneyyy/dsh-go"        # 18 bytes
NEW_REPO = b"leizhicheng00000/g"        # 18 bytes，等长替换
assert len(OLD_REPO) == len(NEW_REPO) == 18
AXML_ENTRY = "res/7K.xml"
AXML_VALUE_OFFSET = 0x284               # isAccessibilityTool 的 Res_value.data


def run(cmd, label):
    r = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace")
    out = ((r.stdout or "") + (r.stderr or "")).strip()
    if out:
        print("  " + out[:1000].replace("\n", "\n  "), flush=True)
    if r.returncode != 0:
        raise RuntimeError(label + " 失败 (exit %d)" % r.returncode)


def main():
    assert os.path.exists(BASE), "缺少 %s（请先跑 build_pojia_apk.py）" % BASE
    assert os.path.exists(DEX), "缺少 %s（请先 apktool b 回编译）" % DEX
    zin = zipfile.ZipFile(BASE)
    names = set(zin.namelist())
    assert AXML_ENTRY in names, "无障碍 XML 条目缺失"

    new_dex = open(DEX, "rb").read()
    assert new_dex[:4] == b"dex\n", "dex 魔数错误"
    print("新 dex:", len(new_dex), "bytes", flush=True)

    axml = bytearray(zin.read(AXML_ENTRY))
    before = struct.unpack_from("<I", axml, AXML_VALUE_OFFSET)[0]
    assert before == 0, "原属性值不是 false(0)"
    struct.pack_into("<I", axml, AXML_VALUE_OFFSET, 0xFFFFFFFF)
    print("AXML: 0x%x -> 0x%x (isAccessibilityTool=true)" % (before, 0xFFFFFFFF), flush=True)

    so = bytearray(zin.read("lib/arm64-v8a/libapp.so"))
    cnt = bytes(so).count(OLD_REPO)
    print("libapp.so 原串出现:", cnt, "处", flush=True)
    assert cnt > 0, "未找到 updateRepo 字符串"
    so = bytearray(bytes(so).replace(OLD_REPO, NEW_REPO))
    assert len(so) == zin.getinfo("lib/arm64-v8a/libapp.so").file_size
    print("替换后长度不变:", len(so), "新串出现:", bytes(so).count(NEW_REPO), flush=True)

    replacements = {
        "classes.dex": bytes(new_dex),
        AXML_ENTRY: bytes(axml),
        "lib/arm64-v8a/libapp.so": bytes(so),
    }
    tmp = OUT + ".tmp"
    changed = []
    with zipfile.ZipFile(tmp, "w") as zout:
        for item in zin.infolist():
            data = replacements.get(item.filename)
            if data is None:
                data = zin.read(item.filename)
            else:
                changed.append(item.filename)
            zi = zipfile.ZipInfo(item.filename, date_time=item.date_time)
            zi.compress_type = item.compress_type
            zi.external_attr = item.external_attr
            zi.internal_attr = item.internal_attr
            zi.create_system = item.create_system
            zout.writestr(zi, data)
    os.replace(tmp, OUT)
    print("改动条目:", changed, flush=True)

    m = json.loads if False else __import__("json").loads
    manifest = m(zipfile.ZipFile(OUT).read("assets/runtime/manifest.json").decode())
    assert any("base64 -d" in a for a in manifest["launch"]["argv"]), "破甲注入丢失"
    print("破甲注入保留: OK", flush=True)

    if os.path.exists(ALIGNED):
        os.remove(ALIGNED)
    run([ZIPALIGN, "-p", "-f", "4", OUT, ALIGNED], "zipalign")
    shutil.move(ALIGNED, OUT)
    run([
        JAVA, "-jar", APKSIGNER, "sign",
        "--ks", KEYSTORE, "--ks-key-alias", "androiddebugkey",
        "--ks-pass", "pass:android", "--key-pass", "pass:android",
        "--v1-signing-enabled", "true", "--v2-signing-enabled", "true",
        "--out", OUT, OUT,
    ], "apksigner 签名")
    run([JAVA, "-jar", APKSIGNER, "verify", "--verbose", OUT], "验签")

    zo = zipfile.ZipFile(OUT)
    zi0 = zipfile.ZipFile(BASE)
    diff = [n for n in zi0.namelist() if zi0.read(n) != zo.read(n)]
    print("最终差异条目:", diff, flush=True)
    print("=== 构建完成:", OUT, os.path.getsize(OUT), "bytes ===", flush=True)


if __name__ == "__main__":
    main()

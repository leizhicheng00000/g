# -*- coding: utf-8 -*-
"""构建最终 APK（你名下版本）：破甲注入 + 无障碍盲点改造 + 全面去原作者信息。

基底：dsh-go-1.0.13-pojia.apk（已含底层破甲注入，assets/runtime/manifest.json）
本脚本叠加 7 组改动，其余 ZIP 条目逐字节原样复制：

  1. classes.dex              ← apktool 回编译产物（包名改名 + 三道墙 + UrlFix 跳转还原）
  2. AndroidManifest.xml      ← 字符串池整池重建，包名 io.github.ccch1mneyyy → leizhicheng00000
  3. res/Eq.xml               ← 快捷方式 targetPackage/targetClass 同步改名
  4. res/7K.xml               ← isAccessibilityTool false→true（偏移 0x284，4 字节等长）
  5. lib/arm64-v8a/libapp.so  ← 作者串/仓库链接 = 等长替换（Dart 快照长度字段不可变）
  6. community.json           ← 社区页 GitHub 链接改名 + 填入 QQ 群号
  7. example-header.json      ← 更新日志链接改名

最后 zipalign + apksigner 重新签名。
"""
import json
import os
import shutil
import struct
import subprocess
import zipfile

from axml_pool import rewrite as axml_rewrite, decode_pool

ROOT = os.path.dirname(os.path.abspath(__file__))
BASE = os.path.join(ROOT, "dsh-go-1.0.13-pojia.apk")
OUT = os.path.join(ROOT, "dsh-go-1.0.13-pojia-blindspot.apk")
ALIGNED = OUT + ".aligned"

DEX = os.path.join(ROOT, "apk_dec", "build", "apk", "classes.dex")

JAVA = os.environ.get("JAVA", r"C:\Program Files\Java\jre1.8.0_481\bin\java.exe")
BT = os.environ.get("BUILD_TOOLS", r"C:\Android\Sdk\build-tools\35.0.0")
ZIPALIGN = os.path.join(BT, "zipalign.exe")
APKSIGNER = os.path.join(BT, "lib", "apksigner.jar")
KEYSTORE = os.environ.get(
    "KEYSTORE", os.path.expanduser(r"~\.android\debug.keystore"))

OLD_PKG = "io.github.ccch1mneyyy"
NEW_PKG = "io.github.leizhicheng00000"
QQ_GROUP = "1108636855"

# libapp.so 等长替换表：(旧, 新)，两端长度必须一致
SO_MAP = [
    # 分享页地址（43 = 43，正好等长）
    (b"https://ccch1mneyyy.github.io/dsh-go/share/",
     b"https://leizhicheng00000.github.io/g/share/"),
    # Star / 更新检查用的仓库 slug（18 = 18）
    (b"ccch1mneyyy/dsh-go", b"leizhicheng00000/g"),
    # 社交主页 URL（30/27 字节定长槽位，只能存缩写，跳转时由 UrlFix 还原完整主页）
    (b"https://x.com/cccch1mneyyyy", b"https://x.com/leizhicheng00"),
    (b"https://github.com/ccch1mneyyy", b"https://github.com/leizhicheng"),
    # 界面上显示的作者 handle
    (b"@cccch1mneyyyy", b"@leizhicheng00"),
    (b"@ccch1mneyyy", b"@leizhicheng"),
    # 独立 handle
    (b"ccch1mneyyy", b"leizhicheng"),
]

AXML_ENTRY = "res/7K.xml"          # 无障碍服务配置
AXML_VALUE_OFFSET = 0x284          # isAccessibilityTool 的 Res_value.data


def run(cmd, label):
    r = subprocess.run(cmd, capture_output=True, text=True,
                       encoding="utf-8", errors="replace")
    out = ((r.stdout or "") + (r.stderr or "")).strip()
    if out:
        print("  " + out[:1200].replace("\n", "\n  "), flush=True)
    if r.returncode != 0:
        raise RuntimeError(label + " 失败 (exit %d)" % r.returncode)
    return out


def main():
    zin = zipfile.ZipFile(BASE)
    names = set(zin.namelist())
    for need in ("AndroidManifest.xml", AXML_ENTRY, "res/Eq.xml",
                 "lib/arm64-v8a/libapp.so",
                 "assets/flutter_assets/assets/community/community.json",
                 "assets/flutter_assets/assets/skills/dsh-go-ui/example-header.json"):
        assert need in names, "缺少条目 " + need

    repl = {}

    # ---- 1) 新 dex ----
    dex = open(DEX, "rb").read()
    assert dex[:4] == b"dex\n", "dex 魔数错误"
    assert dex.count(b"ccch1mneyyy") == 0, "dex 里仍有旧包名"
    print("新 dex:", len(dex), "bytes, 旧包名残留:", dex.count(b"ccch1mneyyy"), flush=True)
    repl["classes.dex"] = dex

    # ---- 2/3) 二进制 XML 字符串池重建：包名改名 ----
    for name in ("AndroidManifest.xml", "res/Eq.xml"):
        old = zin.read(name)
        new, hits = axml_rewrite(old, [(OLD_PKG, NEW_PKG)])
        assert hits > 0, name + " 未命中包名"
        s2, _ = decode_pool(new)
        assert not any("ccch1mneyyy" in x for x in s2), name + " 改名后仍残留"
        assert struct.unpack_from("<I", new, 4)[0] == len(new)
        print("AXML %-22s %d 字节 -> %d 字节（%d 处改名）" %
              (name, len(old), len(new), hits), flush=True)
        repl[name] = new

    # ---- 4) 无障碍属性 ----
    ax = bytearray(zin.read(AXML_ENTRY))
    before = struct.unpack_from("<I", ax, AXML_VALUE_OFFSET)[0]
    assert before == 0, "isAccessibilityTool 原值不是 0，拒绝改动"
    struct.pack_into("<I", ax, AXML_VALUE_OFFSET, 0xFFFFFFFF)
    assert struct.unpack_from("<I", ax, AXML_VALUE_OFFSET)[0] == 0xFFFFFFFF
    print("AXML %s isAccessibilityTool: 0x0 -> 0xffffffff（等长 %d 字节）"
          % (AXML_ENTRY, len(ax)), flush=True)
    repl[AXML_ENTRY] = bytes(ax)

    # ---- 5) Dart 快照：等长替换 ----
    so = zin.read("lib/arm64-v8a/libapp.so")
    print("libapp.so 原始 %d 字节" % len(so), flush=True)
    for old, new in SO_MAP:
        assert len(old) == len(new), "不等长: %r -> %r" % (old, new)
        c = so.count(old)
        print("  %-46r x%-3d -> %r" % (old, c, new), flush=True)
        so = so.replace(old, new)
    assert len(so) == zin.getinfo("lib/arm64-v8a/libapp.so").file_size, "快照长度变了！"
    left = so.count(b"ccch1mneyyy")
    print("  替换后快照长度: %d（未变），旧作者串残留: %d" % (len(so), left), flush=True)
    assert left == 0, "快照里仍有旧作者串"
    repl["lib/arm64-v8a/libapp.so"] = so

    # ---- 6) 社区页 JSON ----
    cp = "assets/flutter_assets/assets/community/community.json"
    cj = zin.read(cp)
    qq_old = ('{ "kind": "qq", "title": "QQ 交流群", "subtitle": "", '
              '"url": "", "qr": "", "copy": "" }').encode("utf-8")
    qq_new = ('{ "kind": "qq", "title": "QQ 交流群", "subtitle": "群号 %s", '
              '"url": "", "qr": "", "copy": "%s" }' % (QQ_GROUP, QQ_GROUP)).encode("utf-8")
    for old, new in [
        (b"https://github.com/ccch1mneyyy/dsh-go/issues",
         b"https://github.com/leizhicheng00000/g/issues"),
        (b"https://github.com/ccch1mneyyy/dsh-go",
         b"https://github.com/leizhicheng00000/g"),
        (qq_old, qq_new),
    ]:
        cj = cj.replace(old, new)
    cfg = json.loads(cj.decode("utf-8"))
    assert all("ccch1mneyyy" not in json.dumps(x, ensure_ascii=False) for x in [cfg])
    print("community.json: GitHub 链接已改名，QQ 群 copy =",
          [g.get("copy") for g in cfg["groups"] if g["kind"] == "qq"], flush=True)
    repl[cp] = cj

    # ---- 7) 技能页示例 JSON ----
    ep = "assets/flutter_assets/assets/skills/dsh-go-ui/example-header.json"
    ej = zin.read(ep).replace(
        b"https://github.com/ccch1mneyyy/dsh-app/releases",
        b"https://github.com/leizhicheng00000/g/releases")
    assert b"ccch1mneyyy" not in ej
    json.loads(ej.decode("utf-8"))
    print("example-header.json: Releases 链接已改名", flush=True)
    repl[ep] = ej

    # ---- 8) 逐条复制 ----
    tmp = OUT + ".tmp"
    with zipfile.ZipFile(tmp, "w") as zout:
        for item in zin.infolist():
            data = repl.get(item.filename)
            if data is None:
                data = zin.read(item.filename)
            zi = zipfile.ZipInfo(item.filename, date_time=item.date_time)
            zi.compress_type = item.compress_type
            zi.external_attr = item.external_attr
            zi.internal_attr = item.internal_attr
            zi.create_system = item.create_system
            zout.writestr(zi, data)
    os.replace(tmp, OUT)
    print("改动条目:", list(repl.keys()), flush=True)

    # ---- 9) 破甲注入仍在 + 回执群号 ----
    m = json.loads(zipfile.ZipFile(OUT).read("assets/runtime/manifest.json").decode())
    assert any("base64 -d" in a for a in m["launch"]["argv"]), "破甲注入丢失！"
    print("破甲注入保留: OK", flush=True)

    # ---- 10) 对齐 + 签名 ----
    if os.path.exists(ALIGNED):
        os.remove(ALIGNED)
    run([ZIPALIGN, "-p", "-f", "4", OUT, ALIGNED], "zipalign")
    shutil.move(ALIGNED, OUT)
    run([JAVA, "-jar", APKSIGNER, "sign",
         "--ks", KEYSTORE, "--ks-key-alias", "androiddebugkey",
         "--ks-pass", "pass:android", "--key-pass", "pass:android",
         "--v1-signing-enabled", "true", "--v2-signing-enabled", "true",
         "--out", OUT, OUT], "apksigner 签名")
    run([JAVA, "-jar", APKSIGNER, "verify", "--verbose", OUT], "验签")

    # ---- 11) 终检 ----
    zo = zipfile.ZipFile(OUT)
    bad = []
    for n in zo.namelist():
        if n.endswith("/"):
            continue
        if b"ccch1mneyyy" in zo.read(n):
            bad.append(n)
    print("全包 ccch1mneyyy 残留条目:", bad if bad else "无", flush=True)
    assert not bad, "仍有残留"
    mi = zo.getinfo("classes.dex")
    print("dex 条目大小:", mi.file_size, flush=True)
    s2, _ = decode_pool(zo.read("AndroidManifest.xml"))
    print("清单包名:", [x for x in s2 if x.endswith(".dsh_app")][:1], flush=True)
    assert any(x == "io.github.leizhicheng00000.dsh_app" for x in s2), "包名未改成功"
    assert struct.unpack_from("<I", zo.read(AXML_ENTRY), AXML_VALUE_OFFSET)[0] == 0xFFFFFFFF
    assert b"leizhicheng00000/g" in zo.read("lib/arm64-v8a/libapp.so")
    print("=== 构建完成:", OUT, os.path.getsize(OUT), "bytes ===", flush=True)


if __name__ == "__main__":
    main()

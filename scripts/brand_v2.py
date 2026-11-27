# -*- coding: utf-8 -*-
"""品牌替换：把 DSH Go 的作者信息换成操作者（leizhicheng00000 / 群 1108636855）。

三处：
  1. assets/flutter_assets/assets/community/community.json —— JSON 长度自由，整段重写
  2. lib/arm64-v8a/libapp.so —— Dart AOT 快照，字符串是紧凑字符池，
     长度在编译期固化，只能**等长**替换。这里利用一个恒等式：
         ccch1mneyyy(11) → leizhicheng00000(16)   +5
         dsh-go(6)       → g(1)                   -5
     用户名和仓库名一起换净增 0，所以所有含 `/dsh-go` 的 URL 都能精确等长。
     单独的 https://github.com/ccch1mneyyy (30) 装不下 35 字节的完整主页，
     只能落到 https://github.com/leizhicheng (30)，由 dex 层 UrlFix 在跳转前还原。
  3. AndroidManifest / res —— 包名保持 io.github.ccch1mneyyy.dsh_app 不动
     （改了 remote_background 与既有安装数据都会对不上）
"""
import json
import os
import re
import sys
import zipfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import build_141 as B

HERE = B.HERE
SRC_APK = B.SRC_APK
OUT = os.path.join(HERE, "DSH-Go-1.4.1-品牌替换.apk")

COMMUNITY = "assets/flutter_assets/assets/community/community.json"
SO = "lib/arm64-v8a/libapp.so"
PKG_GUARD = re.compile(rb"io\.github\.ccch1mneyyy\.dsh_app")

# (旧, 新) 必须等长；按长度降序替换，避免短串先吃掉长串
SO_MAP = [
    (b"https://raw.githubusercontent.com/ccch1mneyyy/dsh-go/main/community.json",
     b"https://raw.githubusercontent.com/leizhicheng00000/g/main/community.json"),
    (b"https://fastly.jsdelivr.net/gh/ccch1mneyyy/dsh-go@main/community.json",
     b"https://fastly.jsdelivr.net/gh/leizhicheng00000/g@main/community.json"),
    (b"https://github.com/ccch1mneyyy/dsh-go/releases/latest/download/update.json",
     b"https://github.com/leizhicheng00000/g/releases/latest/download/update.json"),
    (b"https://cdn.jsdelivr.net/gh/ccch1mneyyy/dsh-go@main/community.json",
     b"https://cdn.jsdelivr.net/gh/leizhicheng00000/g@main/community.json"),
    (b"https://api.github.com/repos/ccch1mneyyy/dsh-go/releases/latest",
     b"https://api.github.com/repos/leizhicheng00000/g/releases/latest"),
    (b"https://github.com/ccch1mneyyy/dsh-go/releases/latest",
     b"https://github.com/leizhicheng00000/g/releases/latest"),
    (b"https://ccch1mneyyy.github.io/dsh-go/share/",
     b"https://leizhicheng00000.github.io/g/share/"),
    # 37 字节槽：装得下 35 字节的完整主页，末尾补一个空 hash（浏览器不发这部分）
    (b"https://github.com/ccch1mneyyy/dsh-go",
     b"https://github.com/leizhicheng00000/#"),
    (b"https://github.com/ccch1mneyyy",
     b"https://github.com/leizhicheng"),
    (b"https://x.com/cccch1mneyyyy",
     b"https://x.com/leizhicheng00"),
    (b"ccch1mneyyy/dsh-go",
     b"leizhicheng00000/g"),
    (b"@cccch1mneyyyy",
     b"@leizhicheng00"),
    (b"@ccch1mneyyy",
     b"@leizhicheng"),
    (b"ccch1mneyyy",
     b"leizhicheng"),
]


def patch_community(raw):
    d = json.loads(raw.decode("utf-8"))
    d["tagline"] = "开源项目，欢迎点星 · 交流群 1108636855"
    for g in d.get("groups", []):
        if g.get("kind") == "qq":
            g["copy"] = "1108636855"
            g["subtitle"] = "点一下复制群号"
        if g.get("kind") == "github":
            g["url"] = "https://github.com/leizhicheng00000"
    for u in d.get("updates", []):
        if "ccch1mneyyy" in u.get("url", ""):
            u["url"] = "https://github.com/leizhicheng00000"
    d["revision"] = int(d.get("revision", 1)) + 1
    return json.dumps(d, ensure_ascii=False, indent=2).encode("utf-8")


def patch_so(raw):
    """等长替换。先保护包名，再按长度降序替换，最后还原包名。"""
    guard = b"\x00DSHPKG\x00"
    b = PKG_GUARD.sub(guard, raw)
    cnt = {}
    for old, new in SO_MAP:
        assert len(old) == len(new), "长度不等: %r" % old
        n = b.count(old)
        if n:
            b = b.replace(old, new)
            cnt[old.decode()[:48]] = n
    b = b.replace(guard, b"io.github.ccch1mneyyy.dsh_app")
    assert len(b) == len(raw), "长度变了"
    return b, cnt


def main():
    with zipfile.ZipFile(SRC_APK) as z:
        names = z.namelist()
        comm_old = z.read(COMMUNITY)
        so_old = z.read(SO)

    comm_new = patch_community(comm_old)
    so_new, cnt = patch_so(so_old)

    print("community.json %d -> %d 字节" % (len(comm_old), len(comm_new)), flush=True)
    for k, v in sorted(cnt.items(), key=lambda x: -x[1]):
        print("  so 替换 %-50s x%d" % (k, v), flush=True)

    reps = {COMMUNITY: comm_new, SO: so_new}
    B.build(reps, OUT, "品牌替换")

    # 自检：条目数、非预期差异、残留
    with zipfile.ZipFile(OUT) as zo:
        assert len(zo.namelist()) == len(names), "条目数变了"
        assert zo.read(SO) == so_new
        left = zo.read(SO).count(b"ccch1mneyyy")
        print("so 里 ccch1mneyyy 残留 %d 处（应只剩包名 1 处）" % left, flush=True)
        assert left == 1, "还有未替换的作者串"
        d = json.loads(zo.read(COMMUNITY).decode())
        assert d["groups"][0]["copy"] == "1108636855"
        diff = [n for n in names
                if n not in reps
                and not (n.startswith("META-INF/") and n.rsplit(".", 1)[-1] in ("SF", "RSA", "MF"))
                and zipfile.ZipFile(SRC_APK).read(n) != zo.read(n)]
        assert not diff, "非预期差异: %s" % diff
    print("[OK] %s  %d bytes" % (os.path.basename(OUT), os.path.getsize(OUT)), flush=True)


if __name__ == "__main__":
    sys.exit(main())

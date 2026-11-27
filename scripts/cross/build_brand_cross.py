# -*- coding: utf-8 -*-
"""iOS / 鸿蒙品牌替换：作者信息换成 leizhicheng00000 / 群 1108636855。

与 Android 的 brand_v2.py 同一套映射。Dart AOT 字符池只能等长替换，
靠 `ccch1mneyyy(11→16) +5` 和 `dsh-go(6→1) -5` 把带仓库名的长 URL 做平。

与 Android 的差异：
  · iOS 的 App 二进制里残留一处 `io.github.ccch1mneyyy.dsh_app/remote_background`
    （Android 专属分支的字符串），必须保护，不能当成作者名换掉
  · 两平台包名都不在 Dart 里（iOS 在 Info.plist，鸿蒙在 module.json），不用动
  · community.json 在 App.framework/flutter_assets 或 rawfile/flutter_assets 下，
    改完必须重签整个 framework
"""
import hashlib
import io
import json
import os
import zipfile

import zipraw

HERE = os.path.dirname(os.path.abspath(__file__))

# 与 v141/brand_v2.py 完全一致的映射；按长度降序，避免短串先吃掉长串
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

GUARDS = [
    b"ccch1mneyyy.dsh_app",
    b"ccch1mneyyy.dshgo",
]
# 保护手段：把包名里的用户名段换成 11 个 0x01（等长、绝不可能与映射串相撞），
# 全部替换完成后再原样填回。不能删、不能变长，因为 Dart 快照的长度是编译期固化的。
GUARD_MASK = b"\x01" * 11

TARGETS = [
    {
        "tag": "ios",
        "src": "DSH-Go-1.4.1-破甲.ipa",
        "out": "DSH-Go-1.4.1-破甲+品牌.ipa",
        "bin": "Payload/Runner.app/Frameworks/App.framework/App",
        "community": "Payload/Runner.app/Frameworks/App.framework/flutter_assets/assets/community/community.json",
    },
    {
        "tag": "ohos",
        "src": "DSH-Go-1.4.0-破甲.hap",
        "out": "DSH-Go-1.4.0-破甲+品牌.hap",
        "bin": "libs/arm64-v8a/libapp.so",
        "community": "resources/rawfile/flutter_assets/assets/community/community.json",
    },
]


def patch_community(raw):
    d = json.loads(raw.decode("utf-8"))
    d["tagline"] = "开源项目，欢迎点星 · 交流群 1108636855"
    for g in d.get("groups", []):
        if g.get("kind") == "qq":
            g["copy"] = "1108636855"
            g["subtitle"] = "点一下复制群号"
        if g.get("kind") == "github":
            g["url"] = "https://github.com/leizhicheng00000/g/issues"
            g["subtitle"] = "GitHub Issues"
    for u in d.get("updates", []):
        if "ccch1mneyyy" in (u.get("url") or ""):
            u["url"] = "https://github.com/leizhicheng00000/g"
    d["revision"] = int(d.get("revision", 1)) + 1
    return json.dumps(d, ensure_ascii=False, indent=2).encode("utf-8")


def patch_bin(raw, tag):
    """等长替换；先把包名里的用户名段挖成 0x01，改完再填回。"""
    holes = {}
    b = raw
    for g in GUARDS:
        if b.count(g):
            masked = GUARD_MASK + g[len(b"ccch1mneyyy"):]
            assert len(masked) == len(g)
            holes[g] = masked
            b = b.replace(g, masked)

    cnt = {}
    for old, new in SO_MAP:
        assert len(old) == len(new), "长度不等: %r -> %r" % (old, new)
        n = b.count(old)
        if n:
            b = b.replace(old, new)
            cnt[old.decode()] = n

    for g, masked in holes.items():
        assert masked in b, "占位串丢失: %r" % g
        b = b.replace(masked, g)

    assert len(b) == len(raw), "二进制长度变了"
    return b, cnt


def main():
    for t in TARGETS:
        print("=" * 70)
        print("=== %s ===" % t["tag"])
        src = os.path.join(HERE, t["src"])
        out = os.path.join(HERE, t["out"])

        z = zipfile.ZipFile(src)
        names = z.namelist()
        bin_old = z.read(t["bin"])
        comm_old = z.read(t["community"])
        others = {n: hashlib.sha256(z.read(n)).hexdigest()
                  for n in names if n not in (t["bin"], t["community"])}
        z.close()

        bin_new, cnt = patch_bin(bin_old, t["tag"])
        comm_new = patch_community(comm_old)

        total = 0
        for k, v in sorted(cnt.items(), key=lambda x: -x[1]):
            print("  %-56s x%d" % (k[:56], v))
            total += v
        print("  合计替换 %d 处；binary %d -> %d" % (total, len(bin_old), len(bin_new)))

        left = bin_new.count(b"ccch1mneyyy")
        print("  残留 ccch1mneyyy %d 处（应为 1，即 Android 遗留包名）" % left)

        zipraw.rebuild(src, out, {t["bin"]: bin_new, t["community"]: comm_new})

        # 校验
        v = zipfile.ZipFile(out)
        assert v.testzip() is None, "CRC 错"
        assert v.namelist() == names, "条目顺序/数量变了"
        assert v.read(t["bin"]) == bin_new
        d = json.loads(v.read(t["community"]).decode())
        cop = [g["copy"] for g in d["groups"] if g["kind"] == "qq"]
        assert cop == ["1108636855"], cop
        gh = [g["url"] for g in d["groups"] if g["kind"] == "github"]
        assert gh == ["https://github.com/leizhicheng00000/g/issues"], gh
        diff = [n for n in names
                if n not in (t["bin"], t["community"])
                and hashlib.sha256(v.read(n)).hexdigest() != others[n]]
        assert not diff, "非预期差异: %s" % diff[:5]
        v.close()

        h = hashlib.sha256(open(out, "rb").read()).hexdigest()
        print("  OK  %s  %d B  sha256 %s" % (t["out"], os.path.getsize(out), h))


if __name__ == "__main__":
    main()

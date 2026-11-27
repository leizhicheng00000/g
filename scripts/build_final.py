# -*- coding: utf-8 -*-
"""DSH Go 1.4.1 最终版：系统破甲 + 品牌替换 + 无障碍盲点，一次出包。

替换条目（其余 738 个条目逐字节原样复制）：
  1. assets/runtime/manifest.json           system 破甲层（--patch 注入）
  2. assets/flutter_assets/assets/community/community.json   作者/群号
  3. lib/arm64-v8a/libapp.so                作者串等长替换
  4. res/7K.xml + res/6h.xml                isAccessibilityTool = true
  5. classes.dex                            盲点补丁（如存在）

出的两个包：
  DSH-Go-1.4.1-旗舰版.apk        全部五项
  DSH-Go-1.4.1-旗舰版-无盲点.apk  1~3（不改无障碍，保留系统限制）
"""
import base64
import json
import os
import re
import struct
import sys
import zipfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import build_141 as B
import build_v2 as V2
import brand_v2 as BR

HERE = B.HERE
SRC_APK = B.SRC_APK
DEX = B.DEX
MANIFEST_PATH = B.MANIFEST_PATH
MARKER = B.MARKER

OUT_FULL = os.path.join(HERE, "DSH-Go-1.4.1-旗舰版.apk")
OUT_LITE = os.path.join(HERE, "DSH-Go-1.4.1-旗舰版-无盲点.apk")


def make_manifest(patch_text, agents_bytes):
    with zipfile.ZipFile(SRC_APK) as z:
        d = json.loads(z.read(MANIFEST_PATH).decode("utf-8"))
    argv = d["launch"]["argv"]
    idx = next((i for i, a in enumerate(argv) if MARKER in a), None)
    if idx is None:
        raise RuntimeError("未找到引擎启动命令")
    original = argv[idx]
    assert original.startswith("echo $$ > /tmp/dsh-web.pid; "), "启动命令前缀变了"
    OLD_ARGS = ("exec /usr/local/bin/dsh web --patch /etc/dsh-app/dsh-web.patch.yml "
                "--host 127.0.0.1 --port {PORT} --no-open")
    assert OLD_ARGS in original, "启动参数结构变了"

    b64_patch = base64.b64encode(patch_text.encode("utf-8")).decode("ascii")
    b64_agents = base64.b64encode(agents_bytes).decode("ascii")
    assert "'" not in b64_patch and "'" not in b64_agents

    inject = (
        "mkdir -p /root/.dsh /root/.agents && "
        "printf '%s' '" + b64_agents + "' | base64 -d > /root/.dsh/AGENTS.md && "
        "cp /root/.dsh/AGENTS.md /root/.agents/AGENTS.md; "
        "printf '%s' '" + b64_patch + "' | base64 -d > /root/.dsh/pojia.patch.yml.tmp "
        "&& mv /root/.dsh/pojia.patch.yml.tmp /root/.dsh/pojia.patch.yml; "
        'P=/root/.dsh/pojia.patch.yml; [ -f "$P" ] || P=/etc/dsh-app/dsh-web.patch.yml; '
    )
    NEW_ARGS = ('exec /usr/local/bin/dsh web --patch /etc/dsh-app/dsh-web.patch.yml '
                '--patch "$P" --host 127.0.0.1 --port {PORT} --no-open')
    new_cmd = original.replace(OLD_ARGS, inject + NEW_ARGS, 1)
    if len(new_cmd) > 120000:
        raise RuntimeError("单参数超过内核上限 (131072)，当前 %d" % len(new_cmd))
    argv[idx] = new_cmd

    old_ver = d["runtimeVersion"]
    d["runtimeVersion"] = re.sub(r"-pojia\d*$", "", old_ver) + "-pojia2"
    blob = json.dumps(d, ensure_ascii=False, separators=(",", ":")).encode("utf-8")

    # 只允许 argv / runtimeVersion 变化
    d2 = json.loads(blob.decode("utf-8"))
    for k in d:
        if k in ("launch", "runtimeVersion"):
            continue
        assert d2[k] == d[k], "字段 %s 被动" % k
    for k in d["launch"]:
        if k != "argv":
            assert d2["launch"][k] == d["launch"][k], "launch.%s 被动" % k
    return blob, len(new_cmd), old_ver, d["runtimeVersion"], d["rootfsSha256"]


def main():
    text = open(V2.PERSONA_MD, encoding="utf-8").read().rstrip("\n")
    patch_text = V2.build_patch(text)
    agents_bytes = open(V2.AGENTS_MD, "rb").read()
    print("persona %d 字 / patch %d 字节 / AGENTS %d 字节"
          % (len(text), len(patch_text.encode()), len(agents_bytes)), flush=True)

    manifest, cmd_len, old_ver, new_ver, rootfs_sha = make_manifest(patch_text, agents_bytes)
    print("启动命令 %d 字符 / runtimeVersion %s -> %s" % (cmd_len, old_ver, new_ver), flush=True)

    with zipfile.ZipFile(SRC_APK) as z:
        names = z.namelist()
        comm_new = BR.patch_community(z.read(BR.COMMUNITY))
        so_new, cnt = BR.patch_so(z.read(BR.SO))
        print("so 替换 %d 类 / %d 处" % (len(cnt), sum(cnt.values())), flush=True)

    base = {MANIFEST_PATH: manifest, BR.COMMUNITY: comm_new, BR.SO: so_new}

    # 盲点资源
    extra = {}
    axml_hits = {}
    with zipfile.ZipFile(SRC_APK) as z:
        for name in B.AXML_NAMES:
            r = B.patch_axml(z.read(name))
            if r is None:
                raise RuntimeError("AXML 补丁失败: " + name)
            new, hits = r
            assert len(new) == z.getinfo(name).file_size
            assert len(hits) == 1, "%s 命中 %d 处" % (name, len(hits))
            extra[name] = new
            axml_hits[name] = hits[0][0] + 16
    if os.path.exists(DEX):
        dex = open(DEX, "rb").read()
        assert dex[:4] == b"dex\n"
        extra["classes.dex"] = dex
        print("classes.dex %d B" % len(dex), flush=True)

    full = dict(base)
    full.update(extra)
    B.build(base, OUT_LITE, "旗舰版-无盲点")
    B.build(full, OUT_FULL, "旗舰版")

    # ---------- 自检 ----------
    with zipfile.ZipFile(SRC_APK) as zs:
        for out_apk, rp in ((OUT_LITE, base), (OUT_FULL, full)):
            with zipfile.ZipFile(out_apk) as zo:
                assert len(zo.namelist()) == len(names), "条目数变了"
                m = json.loads(zo.read(MANIFEST_PATH).decode())
                hit = [a for a in m["launch"]["argv"] if "base64 -d" in a]
                assert len(hit) == 1
                assert '--patch /etc/dsh-app/dsh-web.patch.yml --patch "$P"' in hit[0]
                assert "/root/.dsh/pojia.patch.yml" in hit[0]
                b64s = re.findall(r"printf '%s' '([A-Za-z0-9+/=]+)'", hit[0])
                assert len(b64s) == 2
                assert base64.b64decode(b64s[0]) == agents_bytes
                p = base64.b64decode(b64s[1]).decode("utf-8")
                assert "complete: true" in p and "prefix: |-" in p
                assert text.split("\n")[0] in p
                assert zo.read(BR.SO) == so_new
                assert zo.read(BR.SO).count(b"ccch1mneyyy") == 1
                d = json.loads(zo.read(BR.COMMUNITY).decode())
                assert d["groups"][0]["copy"] == "1108636855"
                diff = [n for n in names
                        if n not in rp
                        and not (n.startswith("META-INF/") and n.rsplit(".", 1)[-1] in ("SF", "RSA", "MF"))
                        and zs.read(n) != zo.read(n)]
                assert not diff, "非预期差异: %s" % diff
                if B.AXML_NAMES[0] in rp:
                    for name in B.AXML_NAMES:
                        v = struct.unpack_from("<I", zo.read(name), axml_hits[name])[0]
                        assert v == 0xFFFFFFFF, "%s 未打上" % name
                print("[OK] %-32s 条目 %d / 差异 0 / %d bytes"
                      % (os.path.basename(out_apk), len(zo.namelist()), os.path.getsize(out_apk)),
                      flush=True)

    print("=" * 62, flush=True)
    print("rootfs 校验未动: %s" % rootfs_sha, flush=True)


if __name__ == "__main__":
    sys.exit(main())

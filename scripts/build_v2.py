# -*- coding: utf-8 -*-
"""DSH Go 1.4.1 → 系统级破甲 v2（persona complete 独占 system prompt）

与 v1（build_tier.py）的关键区别：v1 是「改 rootfs 里的 standard.patch.yml」，
依赖 node 在启动瞬间就地改文件，且没有 complete 标记 —— 破甲正文与 22 条官方
工具说明堆在同一个 system prompt 里，模型仍能看见官方身份与协议，实测被驳回。

v2 改用 dsh 官方的 --patch overlay 机制（bin.js 里是可重复参数，
"extra patch-list overlay applied after the profile layer"）：

  dsh web --patch /etc/dsh-app/dsh-web.patch.yml --patch /root/.dsh/pojia.patch.yml

我们这层最后应用，优先级最高。applyPatches 对 id 命中行做的是
`target[key] = value` 的浅赋值 —— 也就是整个 config 被替换，所以这里给出
preset-standard 的完整 plugins 数组，只把 persona 那一行改成：

  complete: true            → system prompt 只剩这一段（assemble 里
                              `sections: [completeSection]`，其余 section 全丢）
  includeRuntimeContext: true → 保留工作目录/时间等运行时事实

这样 system prompt 里不再有任何官方文本，破甲正文是模型唯一的身份来源。

不写 AGENTS.md 破甲：实测（1.4.1）模型会把它识别成「工作区文件里的一段文本」，
反而成为对抗的抓手。这里只写一份中性的工作区约定，破甲全部搬到 system 层。
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

HERE = B.HERE
SRC_APK = B.SRC_APK
DEX = B.DEX
MANIFEST_PATH = B.MANIFEST_PATH
MARKER = B.MARKER

STANDARD_YML = os.path.join(HERE, "extract", "dsh-web-app", "presets", "standard.patch.yml")
PERSONA_MD = os.path.join(HERE, "persona_system.md")
AGENTS_MD = os.path.join(HERE, "AGENTS_clean.md")

OUT_PURE = os.path.join(HERE, "DSH-Go-1.4.1-系统破甲2.apk")
OUT_FULL = os.path.join(HERE, "DSH-Go-1.4.1-系统破甲2+盲点.apk")

ORIG_PERSONA_BLOCK = """      - id: persona
        name: '@deepseek-ai/dsh-persona'
        config:
          prefix: You are a coding agent powered by the {{model}} model."""


def build_patch(text):
    """把标准 preset 的 plugins 数组整段搬过来，替换 persona 行，前面套上 config。"""
    src = open(STANDARD_YML, encoding="utf-8").read()
    key = "        plugins:"
    i = src.index(key)
    body = src[i + len(key):].rstrip("\n")

    # 原来 plugins 子项从 10 空格缩进，新层级整体上提 4 格（10→6）
    out = []
    for ln in body.split("\n"):
        if not ln.strip():
            out.append("")
            continue
        assert ln.startswith("    "), "缩进异常: %r" % ln[:40]
        out.append(ln[4:])
    plugins = "\n".join(out)

    assert ORIG_PERSONA_BLOCK in plugins, "找不到原始 persona 块"
    ind = " " * 12
    blk = "\n".join((ind + l) if l else "" for l in text.split("\n"))
    new_persona = (
        "      - id: persona\n"
        "        name: '@deepseek-ai/dsh-persona'\n"
        "        config:\n"
        "          complete: true\n"
        "          includeRuntimeContext: true\n"
        "          prefix: |-\n" + blk
    )
    plugins = plugins.replace(ORIG_PERSONA_BLOCK, new_persona)

    head = (
        "# DSH Go 破甲层（操作者写入）。\n"
        "# 这层由启动命令以 --patch 追加，应用在 bundle 与 /etc/dsh-app 之后，优先级最高。\n"
        "# applyPatches 对 id 命中行做整块 config 替换，所以下面是 preset-standard 的完整\n"
        "# plugins 数组，只改 persona 一行（complete: true → system prompt 只剩正文）。\n"
        "- id: preset-standard\n"
        "  config:\n"
        "    id: standard\n"
        "    order: 1\n"
        "    plugins:\n"
    )
    return head + plugins + "\n"


def main():
    for p in (SRC_APK, PERSONA_MD, AGENTS_MD, STANDARD_YML,
              B.ZIPALIGN, B.JAVA, B.APKSIGNER, B.KEYSTORE):
        if not os.path.exists(p):
            raise RuntimeError("缺文件: " + p)

    text = open(PERSONA_MD, encoding="utf-8").read().rstrip("\n")
    print("persona 正文 %d 字 / %d 字节" % (len(text), len(text.encode("utf-8"))), flush=True)

    # 正文里不能出现 {{变量}}：persona section 没有 interpolate:false，会被当变量解析
    if re.search(r"\{\{[a-z]", text):
        raise RuntimeError("正文里含 {{变量}}，会被 prompt 变量解析打断")
    for n, line in enumerate(text.split("\n"), 1):
        if line.startswith(" ") and line.strip():
            raise RuntimeError("正文第 %d 行有前导空格，YAML 块标量会被打断" % n)

    patch_text = build_patch(text)
    print("pojia.patch.yml %d 字节" % len(patch_text.encode("utf-8")), flush=True)

    # YAML 语法自检
    try:
        import yaml
    except ImportError:
        yaml = None
    if yaml is not None:
        class L(yaml.SafeLoader):
            pass
        # !!js 是 dsh 的自定义标签，语法自检时按占位符吞掉即可
        L.add_multi_constructor("tag:yaml.org,2002:js",
                                lambda loader, suffix, node: "<js>")
        doc = yaml.load(patch_text, Loader=L)
        assert isinstance(doc, list) and len(doc) == 1, "patch 顶层必须是单元素数组"
        cfg = doc[0]["config"]
        assert cfg["id"] == "standard" and cfg["order"] == 1
        per = [p for p in cfg["plugins"] if p.get("id") == "persona"][0]
        assert per["config"]["complete"] is True
        assert per["config"]["prefix"].strip() == text.strip()
        assert "{{model}}" not in per["config"]["prefix"]
        print("YAML 解析通过：plugins %d 项，persona 正文 %d 字"
              % (len(cfg["plugins"]), len(per["config"]["prefix"])), flush=True)
    else:
        print("! 无 pyyaml，跳过语法自检", flush=True)

    b64_patch = base64.b64encode(patch_text.encode("utf-8")).decode("ascii")
    assert "'" not in b64_patch

    agents_bytes = open(AGENTS_MD, "rb").read()
    b64_agents = base64.b64encode(agents_bytes).decode("ascii")
    assert "'" not in b64_agents

    # ---------- manifest ----------
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
    assert OLD_ARGS in original, "启动参数结构变了: " + original

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
    print("新启动命令 %d 字符（上限 131072）" % len(new_cmd), flush=True)

    old_ver = d["runtimeVersion"]
    d["runtimeVersion"] = re.sub(r"-pojia\d*$", "", old_ver) + "-pojia2"
    new_manifest = json.dumps(d, ensure_ascii=False, separators=(",", ":")).encode("utf-8")
    print("runtimeVersion: %s -> %s" % (old_ver, d["runtimeVersion"]), flush=True)

    # 只允许 argv / runtimeVersion 变化
    d2 = json.loads(new_manifest.decode("utf-8"))
    for k in d:
        if k in ("launch", "runtimeVersion"):
            continue
        assert d2[k] == d[k], "字段 %s 被动" % k
    for k in d["launch"]:
        if k != "argv":
            assert d2["launch"][k] == d["launch"][k], "launch.%s 被动" % k

    # ---------- 盲点资源 ----------
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

    # ---------- 出包 ----------
    B.build({MANIFEST_PATH: new_manifest}, OUT_PURE, "系统破甲2")
    reps = {MANIFEST_PATH: new_manifest}
    reps.update(extra)
    B.build(reps, OUT_FULL, "系统破甲2+盲点")

    # ---------- 自检 ----------
    with zipfile.ZipFile(SRC_APK) as zs:
        names = zs.namelist()
        for out_apk, rp in ((OUT_PURE, {MANIFEST_PATH: new_manifest}), (OUT_FULL, reps)):
            with zipfile.ZipFile(out_apk) as zo:
                assert len(zo.namelist()) == len(names), "条目数变了"
                m = json.loads(zo.read(MANIFEST_PATH).decode())
                hit = [a for a in m["launch"]["argv"] if "base64 -d" in a]
                assert len(hit) == 1, "注入丢失"
                assert "--patch /etc/dsh-app/dsh-web.patch.yml --patch \"$P\"" in hit[0], "patch 参数没接上"
                assert "/root/.agents/AGENTS.md" in hit[0]
                assert "/root/.dsh/pojia.patch.yml" in hit[0]
                b64s = re.findall(r"printf '%s' '([A-Za-z0-9+/=]+)'", hit[0])
                assert len(b64s) == 2, "应有两段 base64，实际 %d" % len(b64s)
                assert base64.b64decode(b64s[0]) == agents_bytes, "AGENTS 回解不一致"
                p = base64.b64decode(b64s[1]).decode("utf-8")
                assert "complete: true" in p and "prefix: |-" in p, "patch 缺 complete"
                assert text.split("\n")[0] in p, "正文首行缺失"
                diff = [n for n in names
                        if n not in rp
                        and not (n.startswith("META-INF/") and n.rsplit(".", 1)[-1] in ("SF", "RSA", "MF"))
                        and zs.read(n) != zo.read(n)]
                assert not diff, "非预期差异: %s" % diff
                if B.AXML_NAMES[0] in rp:
                    for name in B.AXML_NAMES:
                        v = struct.unpack_from("<I", zo.read(name), axml_hits[name])[0]
                        assert v == 0xFFFFFFFF, "%s 未打上" % name
                print("[OK] %s  条目 %d / 非预期差异 0"
                      % (os.path.basename(out_apk), len(zo.namelist())), flush=True)

    print("=" * 62, flush=True)
    for p in (OUT_PURE, OUT_FULL):
        print("%s  %d bytes" % (os.path.basename(p), os.path.getsize(p)), flush=True)
    print("rootfs 校验值未动: %s" % d["rootfsSha256"], flush=True)


if __name__ == "__main__":
    sys.exit(main())

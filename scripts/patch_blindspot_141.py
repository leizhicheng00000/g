# -*- coding: utf-8 -*-
"""DSH Go 1.4.1 盲点改造：拆掉「读不到内容就拒绝操作」这道墙。

1.1.0 里核心判定类被 R8 混淆成 sv0；1.4.1 的同名类保留为 a31
（io.github.ccch1mneyyy.dsh_app.phone.a11y 包内的 A11y 工具类），
判定方法与指令结构逐指令一致，仅寄存器号与行号注解不同。

改动：
  A1  static O(Lso;)Z 里把 k 字段（Lso;->k:Ljava/lang/String;）的存在性判定
      强制为 false（move v3, v2 → move v3, v1）。
      这是唯一汇聚点：文件内 9 处 invoke-static La31;->O(Lso;)Z
      （点按/长按/滑动/滚动/观察/取屏…）一并生效。
  A3  5 条（共 6 处）提示文案改成与行为一致，避免模型以为「点不了」而不敢动手。

保留：j 字段判定、空节点判定、hidden / protectedPage / hasSecretFields /
密码支付框全部原样拒绝。

用法：
  python patch_blindspot_141.py          # 就地改 dec/smali/a31.smali
"""
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
SMALI = os.path.join(HERE, "dec", "smali", "a31.smali")
ORIGINAL_LINES = 27518


def esc(s):
    """把中文串转成 smali 里的 \\uXXXX 形式（非 ASCII 转义，ASCII 原样）"""
    out = []
    for ch in s:
        if ord(ch) < 128:
            out.append(ch)
        else:
            out.append("\\u%04x" % ord(ch))
    return "".join(out)


def one(text, old, new, label):
    n = text.count(old)
    if n != 1:
        raise RuntimeError("[%s] 期望唯一匹配，实际 %d 处；拒绝改动" % (label, n))
    print("  OK  " + label, flush=True)
    return text.replace(old, new, 1)


def find_const_lines(lines, text):
    """找出解码后「整串等于」text 的 const-string 行号（1-based）"""
    hits = []
    pat = re.compile(r'^\s*const-string\s+\S+,\s*"(.*)"\s*$')
    for i, l in enumerate(lines):
        m = pat.match(l)
        if not m:
            continue
        dec = re.sub(r"\\u([0-9a-fA-F]{4})", lambda x: chr(int(x.group(1), 16)), m.group(1))
        if dec == text:
            hits.append(i + 1)
    return hits


def main():
    lines = open(SMALI, encoding="utf-8").read().split("\n")
    print("原始行数:", len(lines), flush=True)
    assert len(lines) == ORIGINAL_LINES, "基准行数不符，拒绝改动"

    # ---------- A1：O(Lso;)Z 里忽略 k 字段 ----------
    old_a1 = """    iget-object v3, p0, Lso;->k:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz v3, :cond_1

    .line 13
    .line 14
    move v3, v2
"""
    new_a1 = old_a1.replace("move v3, v2", "move v3, v1")
    text = "\n".join(lines)
    text = one(text, old_a1, new_a1, "A1 O(Lso): k 字段不再判为读不到（9 个调用点放行）")
    lines = text.split("\n")

    # ---------- A3：文案 ----------
    plans = [
        ("这一屏读不到内容（可能受敏感视图策略限制），不盲点。请 handoff。",
         "这一屏读不到内容（可能受敏感视图策略限制），按截图坐标直接点。", 2),
        ("这一屏读不到内容（可能受敏感视图策略限制），不盲滑。请 handoff。",
         "这一屏读不到内容（可能受敏感视图策略限制），按截图坐标直接滑。", 1),
        ("（可能受敏感视图策略限制）。读不到也点不了，需要就 handoff。",
         "（可能受敏感视图策略限制）。但可以按截图坐标直接点击。", 1),
        ("的有效内容，可能受敏感视图策略限制（Android 14 起密码、支付、验证页会被系统过滤）。读不到也点不了；能看图的模型可以 screen 加 image，否则请 handoff。",
         "的有效内容，可能受敏感视图策略限制（Android 14 起密码、支付、验证页会被系统过滤）。可直接按截图坐标点击；也可以 screen 加 image 查看细节。", 1),
        ("这一屏读不到内容（可能受敏感视图策略限制）",
         "这一屏读不到内容（可能受敏感视图策略限制），截图仍可用于坐标操作", 1),
    ]
    for old_t, new_t, expect in plans:
        hits = find_const_lines(lines, old_t)
        if len(hits) != expect:
            raise RuntimeError("文案 %r 期望 %d 处，实际 %d 处（行 %s）"
                               % (old_t[:20], expect, len(hits), hits))
        for ln in hits:
            m = re.match(r'^(\s*const-string\s+)(\S+)(,\s*")', lines[ln - 1])
            if not m:
                raise RuntimeError("第 %d 行格式异常: %r" % (ln, lines[ln - 1]))
            lines[ln - 1] = '%s%s%s%s"' % (m.group(1), m.group(2), m.group(3), esc(new_t))
            print("  OK  文案 @%d → %s" % (ln, new_t[:26]), flush=True)

    open(SMALI, "w", encoding="utf-8", newline="\n").write("\n".join(lines))
    print("改造完成，行数:", len(lines), flush=True)

    # ---------- 自检 ----------
    t = open(SMALI, encoding="utf-8").read()
    assert "move v3, v1" in t
    assert len(t.split("\n")) == ORIGINAL_LINES, "行数异常"
    bad_fmt = [i + 1 for i, l in enumerate(t.split("\n"))
               if re.match(r'^\s*const-string\s+\S+"', l)]
    assert not bad_fmt, "const-string 缺逗号，行号 %s" % bad_fmt
    # 9 个调用点仍在
    assert t.count("La31;->O(Lso;)Z") == 9, "调用点数变了"
    print("自检通过：unreadable 已放行，文案已更新，9 个调用点完好", flush=True)


if __name__ == "__main__":
    sys.exit(main())

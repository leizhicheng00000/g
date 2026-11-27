# -*- coding: utf-8 -*-
"""步骤 2：反编译后打 smali 补丁（盲点方案 A，仓库版）。

对 apktool 反编译产物 apk_dec/smali/yx.smali（R8 混淆后的 MainScreenDriver）
做四处精确改动，让「截图里看得见的按钮就能点」：
  - 第一道墙：unreadable 不再跳拒绝（hidden 仍拒绝）
  - 第二道墙：unavailable(cap) 改为只拦 hiddenWindowTitle
  - 第三道墙：unreadable 时跳过树一致校验
  - 提示文案同步改为与行为一致

用法（在步骤 1 之后）：
  java -jar apktool.jar d dsh-go-1.0.13-pojia.apk -o apk_dec -f
  python patch_blindspot.py
  java -jar apktool.jar b apk_dec --no-apk -f   # 产出 apk_dec/build/apk/classes.dex
"""
import os

HERE = os.path.dirname(os.path.abspath(__file__))
SMALI = os.path.join(HERE, "apk_dec", "smali", "yx.smali")


def main():
    assert os.path.exists(SMALI), "找不到 %s，请先 apktool d 反编译" % SMALI
    t = open(SMALI, encoding="utf-8").read()

    checks = 0

    # A1 第一道墙
    old1 = """    iget-boolean v2, v3, Lxx;->h:Z

    .line 192
    .line 193
    if-eqz v2, :cond_7

    .line 194
    .line 195
    goto/16 :goto_3

    .line 196
    .line 197
    :cond_7
"""
    assert t.count(old1) == 1, "A1 锚点不唯一或不存在"
    new1 = old1.replace("goto/16 :goto_3", "goto/16 :cond_7")
    t = t.replace(old1, new1)
    checks += 1

    # A2 第二道墙
    old2 = """    :try_start_0
    invoke-static {v2}, Lyx;->w(Lo7;)Z

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    if-eqz v5, :cond_8
"""
    assert t.count(old2) == 1, "A2 锚点不唯一或不存在"
    new2 = """    :try_start_0
    iget-object v5, v2, Lo7;->i:Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    .line 205
    if-eqz v5, :cond_8
"""
    t = t.replace(old2, new2)
    checks += 1

    # A3 第三道墙
    old3 = """    :cond_8
    :try_start_1
    invoke-static {v2}, Lyx;->h(Lo7;)Ljg0;
"""
    assert t.count(old3) == 1, "A3 锚点不唯一或不存在"
    new3 = """    :cond_8
    iget-boolean v4, v3, Lxx;->h:Z

    .line 227
    if-nez v4, :cond_9

    :try_start_1
    invoke-static {v2}, Lyx;->h(Lo7;)Ljg0;
"""
    t = t.replace(old3, new3)
    checks += 1

    # A4 提示文案（等长 unicode 转义替换，2 处）
    c_old = r"\u8bfb\u4e0d\u5230\u4e5f\u70b9\u4e0d\u4e86"
    c_new = r"\u53ef\u6309\u622a\u56fe\u5750\u6807\u70b9\u51fb"
    assert t.count(c_old) == 2, "A4 文案出现次数不是 2"
    t = t.replace(c_old, c_new)
    checks += 1

    open(SMALI, "w", encoding="utf-8").write(t)
    print("已应用 %d 处补丁，写入 %s" % (checks, SMALI), flush=True)


if __name__ == "__main__":
    main()

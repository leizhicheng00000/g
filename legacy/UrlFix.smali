.class public final Lio/github/leizhicheng00000/dsh_app/links/UrlFix;
.super Ljava/lang/Object;


# direct methods
# Dart 快照里的 URL 常量是定长槽位，只能存缩写；
# 跳转前在这里整串相等匹配，还原成完整主页地址（幂等，重复调用不会二次展开）。
.method public static fix(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    # 空值直接返回，避免空指针
    if-nez p0, :not_x

    # GitHub 主页：缩写 -> 完整
    const-string v0, "https://github.com/leizhicheng"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :not_gh

    const-string p0, "https://github.com/leizhicheng00000"

    :not_gh
    # X 主页：缩写 -> 完整
    const-string v0, "https://x.com/leizhicheng00"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :not_x

    const-string p0, "https://x.com/leizhicheng0000"

    :not_x
    return-object p0
.end method

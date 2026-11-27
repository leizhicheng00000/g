.class public final La31;
.super Ljava/lang/Object;
.source "r8-map-id-cf2ad5fad1dbd800c2f4865dd8fd280da193137c66a0b3fa6c351a1bf5973e83"

# interfaces
.implements Lzj1;


# static fields
.field public static final w:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field public final a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

.field public final b:Lwy;

.field public final c:Lel1;

.field public final d:Ljava/lang/String;

.field public final e:Lr3;

.field public final f:Lo71;

.field public final g:Lli1;

.field public h:J

.field public i:Luq0;

.field public final j:Landroid/os/PowerManager;

.field public final k:Landroid/app/KeyguardManager;

.field public final l:Landroid/hardware/display/DisplayManager;

.field public final m:Ljava/util/concurrent/ConcurrentHashMap;

.field public final n:Ljava/text/SimpleDateFormat;

.field public final o:Ljava/lang/Object;

.field public volatile p:Ly21;

.field public final q:Ly10;

.field public final r:Ljava/lang/Object;

.field public s:Li50;

.field public volatile t:J

.field public final u:Landroid/os/Handler;

.field public volatile v:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, La31;->w:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;Lwy;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 5
    .line 6
    iput-object p2, p0, La31;->b:Lwy;

    .line 7
    .line 8
    sget-object v0, Lel1;->MAIN:Lel1;

    .line 9
    .line 10
    iput-object v0, p0, La31;->c:Lel1;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, La31;->d:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v0, Lr3;

    .line 22
    .line 23
    invoke-direct {v0, p1, p2}, Lr3;-><init>(Landroid/accessibilityservice/AccessibilityService;Lwy;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, La31;->e:Lr3;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    sget-object v1, Lo71;->h:Ll71;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ll71;->f(Landroid/content/Context;)Lo71;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, La31;->f:Lo71;

    .line 42
    .line 43
    new-instance v1, Lli1;

    .line 44
    .line 45
    invoke-direct {v1, p1, p2, v0}, Lli1;-><init>(Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;Lwy;Lo71;)V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, La31;->g:Lli1;

    .line 49
    .line 50
    const-class p2, Landroid/os/PowerManager;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Landroid/os/PowerManager;

    .line 57
    .line 58
    iput-object p2, p0, La31;->j:Landroid/os/PowerManager;

    .line 59
    .line 60
    const-class p2, Landroid/app/KeyguardManager;

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    check-cast p2, Landroid/app/KeyguardManager;

    .line 67
    .line 68
    iput-object p2, p0, La31;->k:Landroid/app/KeyguardManager;

    .line 69
    .line 70
    const-class p2, Landroid/hardware/display/DisplayManager;

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Landroid/hardware/display/DisplayManager;

    .line 77
    .line 78
    iput-object p1, p0, La31;->l:Landroid/hardware/display/DisplayManager;

    .line 79
    .line 80
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 81
    .line 82
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, La31;->m:Ljava/util/concurrent/ConcurrentHashMap;

    .line 86
    .line 87
    new-instance p1, Ljava/text/SimpleDateFormat;

    .line 88
    .line 89
    const-string p2, "HH:mm:ss"

    .line 90
    .line 91
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-direct {p1, p2, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 96
    .line 97
    .line 98
    iput-object p1, p0, La31;->n:Ljava/text/SimpleDateFormat;

    .line 99
    .line 100
    new-instance p1, Ljava/lang/Object;

    .line 101
    .line 102
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 103
    .line 104
    .line 105
    iput-object p1, p0, La31;->o:Ljava/lang/Object;

    .line 106
    .line 107
    new-instance p1, Ly10;

    .line 108
    .line 109
    new-instance p2, Ljava/lang/Object;

    .line 110
    .line 111
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-direct {p1, p2}, Ly10;-><init>(Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    iput-object p1, p0, La31;->q:Ly10;

    .line 118
    .line 119
    new-instance p1, Ljava/lang/Object;

    .line 120
    .line 121
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 122
    .line 123
    .line 124
    iput-object p1, p0, La31;->r:Ljava/lang/Object;

    .line 125
    .line 126
    new-instance p1, Landroid/os/Handler;

    .line 127
    .line 128
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 133
    .line 134
    .line 135
    iput-object p1, p0, La31;->u:Landroid/os/Handler;

    .line 136
    .line 137
    return-void
.end method

.method public static final A(Ljava/util/Set;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lue1;

    .line 8
    .line 9
    invoke-direct {p0, p2, p3}, Lue1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static E(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x21

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->recycle()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static L(Ly21;)Lh22;
    .locals 15

    .line 1
    iget-object v0, p0, Ly21;->b:Ldk0;

    .line 2
    .line 3
    iget-object v1, v0, Ldk0;->c:Ljava/lang/Object;

    .line 4
    .line 5
    move-object v4, v1

    .line 6
    check-cast v4, Ljava/lang/String;

    .line 7
    .line 8
    new-instance v2, Lh22;

    .line 9
    .line 10
    iget-object v3, p0, Ly21;->a:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v5, p0, Ly21;->d:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v6, p0, Ly21;->c:Ljava/lang/String;

    .line 15
    .line 16
    iget-boolean v7, p0, Ly21;->g:Z

    .line 17
    .line 18
    iget-boolean v8, v0, Ldk0;->b:Z

    .line 19
    .line 20
    iget-object v11, p0, Ly21;->l:Ljava/util/Set;

    .line 21
    .line 22
    iget-object v12, p0, Ly21;->m:Lb20;

    .line 23
    .line 24
    const/4 v13, 0x0

    .line 25
    const/16 v14, 0x4c0

    .line 26
    .line 27
    const/4 v9, 0x0

    .line 28
    const/4 v10, 0x0

    .line 29
    invoke-direct/range {v2 .. v14}, Lh22;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ[BLjava/lang/String;Ljava/util/Set;Lb20;Ljava/util/Set;I)V

    .line 30
    .line 31
    .line 32
    return-object v2
.end method

.method public static O(Lso;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lso;->j:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move v0, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    iget-object v3, p0, Lso;->k:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz v3, :cond_1

    .line 13
    .line 14
    move v3, v1

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    move v3, v1

    .line 17
    :goto_1
    iget-object p0, p0, Lso;->a:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    if-nez v0, :cond_3

    .line 23
    .line 24
    if-nez v3, :cond_3

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :cond_2
    return v1

    .line 34
    :cond_3
    :goto_2
    return v2
.end method

.method public static final b(La31;Landroid/view/accessibility/AccessibilityNodeInfo;)Lij0;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isShowingHintText()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move-object p0, v0

    .line 23
    :goto_0
    if-nez p0, :cond_2

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    move-object v1, p0

    .line 27
    :goto_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/16 v2, 0x1000

    .line 32
    .line 33
    if-le p0, v2, :cond_3

    .line 34
    .line 35
    return-object v0

    .line 36
    :cond_3
    new-instance p0, Lij0;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getTextSelectionStart()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getTextSelectionEnd()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-direct {p0, v1, v0, p1, v2}, Lij0;-><init>(Ljava/lang/String;III)V

    .line 48
    .line 49
    .line 50
    return-object p0
.end method

.method public static c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;
    .locals 45

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-wide/from16 v3, p4

    .line 6
    .line 7
    move/from16 v2, p10

    .line 8
    .line 9
    and-int/lit8 v5, v2, 0x10

    .line 10
    .line 11
    const/4 v9, 0x1

    .line 12
    const/4 v10, 0x0

    .line 13
    if-eqz v5, :cond_0

    .line 14
    .line 15
    move v5, v10

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v5, v9

    .line 18
    :goto_0
    and-int/lit8 v6, v2, 0x20

    .line 19
    .line 20
    if-eqz v6, :cond_1

    .line 21
    .line 22
    iget-object v6, v0, La31;->i:Luq0;

    .line 23
    .line 24
    move-object v11, v6

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move-object/from16 v11, p7

    .line 27
    .line 28
    :goto_1
    and-int/lit8 v6, v2, 0x40

    .line 29
    .line 30
    if-eqz v6, :cond_2

    .line 31
    .line 32
    move v12, v9

    .line 33
    goto :goto_2

    .line 34
    :cond_2
    move/from16 v12, p8

    .line 35
    .line 36
    :goto_2
    and-int/lit16 v2, v2, 0x80

    .line 37
    .line 38
    if-eqz v2, :cond_3

    .line 39
    .line 40
    const/4 v14, 0x0

    .line 41
    goto :goto_3

    .line 42
    :cond_3
    move-object/from16 v14, p9

    .line 43
    .line 44
    :goto_3
    const-string v15, "nav_more"

    .line 45
    .line 46
    invoke-virtual {v0, v3, v4}, La31;->f(J)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_4d

    .line 51
    .line 52
    iget-object v2, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 53
    .line 54
    iget-object v2, v2, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 55
    .line 56
    new-instance v7, Lp21;

    .line 57
    .line 58
    const/16 p7, 0x0

    .line 59
    .line 60
    const/4 v6, 0x6

    .line 61
    invoke-direct {v7, v0, v3, v4, v6}, Lp21;-><init>(La31;JI)V

    .line 62
    .line 63
    .line 64
    const-wide/16 v19, 0x5dc

    .line 65
    .line 66
    const-wide/16 v21, 0x12c

    .line 67
    .line 68
    move-wide/from16 v17, p1

    .line 69
    .line 70
    move-object/from16 v16, v2

    .line 71
    .line 72
    move-object/from16 v23, v7

    .line 73
    .line 74
    invoke-virtual/range {v16 .. v23}, Lfb0;->b(JJJLzk0;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v3, v4}, La31;->f(J)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-nez v2, :cond_4c

    .line 82
    .line 83
    if-nez v11, :cond_5

    .line 84
    .line 85
    if-eqz v14, :cond_4

    .line 86
    .line 87
    move v2, v9

    .line 88
    goto :goto_4

    .line 89
    :cond_4
    move v2, v10

    .line 90
    :goto_4
    :try_start_0
    invoke-virtual {v0, v1, v3, v4, v2}, La31;->I(Ly21;JZ)Lso;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    goto :goto_6

    .line 95
    :catch_0
    move-exception v0

    .line 96
    move-object/from16 v8, p6

    .line 97
    .line 98
    move v9, v12

    .line 99
    goto/16 :goto_3e

    .line 100
    .line 101
    :cond_5
    if-eqz v14, :cond_6

    .line 102
    .line 103
    move v2, v9

    .line 104
    goto :goto_5

    .line 105
    :cond_6
    move v2, v10

    .line 106
    :goto_5
    const-wide/16 v6, 0x0

    .line 107
    .line 108
    invoke-static {v0, v6, v7, v2, v9}, La31;->h(La31;JZI)Lso;

    .line 109
    .line 110
    .line 111
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    :goto_6
    :try_start_1
    invoke-virtual {v0, v2, v10}, La31;->y(Lso;Z)Ly21;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    if-eqz v1, :cond_7

    .line 117
    .line 118
    iget-object v7, v1, Ly21;->i:Lc12;

    .line 119
    .line 120
    goto :goto_7

    .line 121
    :catchall_0
    move-exception v0

    .line 122
    move-object v1, v2

    .line 123
    goto/16 :goto_3d

    .line 124
    .line 125
    :cond_7
    const/4 v7, 0x0

    .line 126
    :goto_7
    iget-object v10, v6, Ly21;->i:Lc12;

    .line 127
    .line 128
    if-eqz v7, :cond_8

    .line 129
    .line 130
    iget-boolean v13, v10, Lc12;->a:Z

    .line 131
    .line 132
    if-nez v13, :cond_8

    .line 133
    .line 134
    iget-boolean v13, v7, Lc12;->a:Z

    .line 135
    .line 136
    if-nez v13, :cond_8

    .line 137
    .line 138
    iget-boolean v13, v10, Lc12;->b:Z

    .line 139
    .line 140
    if-nez v13, :cond_8

    .line 141
    .line 142
    iget-boolean v13, v7, Lc12;->b:Z

    .line 143
    .line 144
    if-nez v13, :cond_8

    .line 145
    .line 146
    iget-object v13, v10, Lc12;->g:Ljava/lang/Object;

    .line 147
    .line 148
    check-cast v13, Ljava/util/ArrayList;

    .line 149
    .line 150
    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    .line 151
    .line 152
    .line 153
    move-result v13

    .line 154
    if-nez v13, :cond_8

    .line 155
    .line 156
    iget-object v13, v7, Lc12;->g:Ljava/lang/Object;

    .line 157
    .line 158
    check-cast v13, Ljava/util/ArrayList;

    .line 159
    .line 160
    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    .line 161
    .line 162
    .line 163
    move-result v13

    .line 164
    if-nez v13, :cond_8

    .line 165
    .line 166
    move/from16 v25, v9

    .line 167
    .line 168
    goto :goto_8

    .line 169
    :cond_8
    const/16 v25, 0x0

    .line 170
    .line 171
    :goto_8
    if-eqz v7, :cond_a

    .line 172
    .line 173
    invoke-virtual {v10, v7}, Lc12;->d(Lc12;)Z

    .line 174
    .line 175
    .line 176
    move-result v13

    .line 177
    if-eqz v13, :cond_9

    .line 178
    .line 179
    iget-object v13, v10, Lc12;->g:Ljava/lang/Object;

    .line 180
    .line 181
    check-cast v13, Ljava/util/ArrayList;

    .line 182
    .line 183
    iget-object v9, v7, Lc12;->g:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast v9, Ljava/util/ArrayList;

    .line 186
    .line 187
    invoke-virtual {v13, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v9

    .line 191
    if-eqz v9, :cond_9

    .line 192
    .line 193
    iget-object v9, v10, Lc12;->f:Ljava/lang/Object;

    .line 194
    .line 195
    check-cast v9, Ljava/lang/Boolean;

    .line 196
    .line 197
    iget-object v13, v7, Lc12;->f:Ljava/lang/Object;

    .line 198
    .line 199
    check-cast v13, Ljava/lang/Boolean;

    .line 200
    .line 201
    invoke-static {v9, v13}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v9

    .line 205
    if-nez v9, :cond_a

    .line 206
    .line 207
    :cond_9
    const/16 v31, 0x1

    .line 208
    .line 209
    goto :goto_9

    .line 210
    :cond_a
    const/16 v31, 0x0

    .line 211
    .line 212
    :goto_9
    if-eqz v7, :cond_b

    .line 213
    .line 214
    invoke-virtual {v10, v7}, Lc12;->a(Lc12;)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v9

    .line 218
    goto :goto_a

    .line 219
    :cond_b
    const/4 v9, 0x0

    .line 220
    :goto_a
    iget-object v13, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 221
    .line 222
    iget-object v13, v13, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 223
    .line 224
    move/from16 v18, v5

    .line 225
    .line 226
    iget-object v5, v10, Lc12;->d:Ljava/lang/Object;

    .line 227
    .line 228
    check-cast v5, Ljava/lang/String;

    .line 229
    .line 230
    if-eqz v5, :cond_d

    .line 231
    .line 232
    iget-object v13, v13, Lfb0;->d:Ljava/util/concurrent/ConcurrentHashMap;

    .line 233
    .line 234
    invoke-virtual {v13, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v5

    .line 238
    check-cast v5, Ljava/lang/Long;

    .line 239
    .line 240
    if-eqz v5, :cond_c

    .line 241
    .line 242
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 243
    .line 244
    .line 245
    move-result-wide v21

    .line 246
    goto :goto_b

    .line 247
    :cond_c
    const-wide/high16 v21, -0x8000000000000000L

    .line 248
    .line 249
    :goto_b
    cmp-long v5, v21, p1

    .line 250
    .line 251
    if-lez v5, :cond_e

    .line 252
    .line 253
    const/16 v32, 0x1

    .line 254
    .line 255
    goto :goto_c

    .line 256
    :cond_d
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 257
    .line 258
    .line 259
    :cond_e
    const/16 v32, 0x0

    .line 260
    .line 261
    :goto_c
    const-string v13, ""

    .line 262
    .line 263
    if-eqz v12, :cond_13

    .line 264
    .line 265
    if-nez v25, :cond_f

    .line 266
    .line 267
    :try_start_2
    const-string v5, "\uff08\u52a8\u4f5c\u5df2\u63d0\u4ea4\uff0c\u4f46\u65e0\u6cd5\u9a8c\u8bc1\u7ed3\u679c\uff1a\u7f3a\u5c11\u8db3\u591f\u7684\u53ef\u8bfb\u5185\u5bb9\uff0c\u53ef\u80fd\u53d7\u654f\u611f\u89c6\u56fe\u7b56\u7565\u9650\u5236\u3002\uff09"

    .line 268
    .line 269
    filled-new-array {v9, v5}, [Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v5

    .line 273
    invoke-static {v5}, Lg8;->l([Ljava/lang/Object;)Ljava/util/List;

    .line 274
    .line 275
    .line 276
    move-result-object v33

    .line 277
    const-string v34, ""

    .line 278
    .line 279
    const/16 v37, 0x0

    .line 280
    .line 281
    const/16 v38, 0x3e

    .line 282
    .line 283
    const/16 v35, 0x0

    .line 284
    .line 285
    const/16 v36, 0x0

    .line 286
    .line 287
    invoke-static/range {v33 .. v38}, Lzr;->C(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lbl0;I)Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v9

    .line 291
    goto :goto_e

    .line 292
    :cond_f
    if-nez v9, :cond_15

    .line 293
    .line 294
    if-eqz v31, :cond_10

    .line 295
    .line 296
    :goto_d
    move-object v9, v13

    .line 297
    goto :goto_e

    .line 298
    :cond_10
    if-eqz v18, :cond_11

    .line 299
    .line 300
    const-string v9, "\u5185\u5bb9\u6ca1\u6709\u53d8\u5316\uff0c\u53ef\u80fd\u5df2\u7ecf\u5230\u5934\u4e86\u3002"

    .line 301
    .line 302
    goto :goto_e

    .line 303
    :cond_11
    if-eqz v32, :cond_12

    .line 304
    .line 305
    const-string v9, "\uff08\u8bfb\u5230\u7684\u6587\u5b57\u6ca1\u53d8\uff0c\u4f46\u8fd9\u4e2a\u5e94\u7528\u521a\u62a5\u544a\u4e86\u754c\u9762\u66f4\u65b0\uff1a\u6709\u4e9b\u663e\u793a\uff08\u6bd4\u5982\u8ba1\u7b97\u5668\u7684\u6570\u5b57\u5c4f\uff09\u8bfb\u5c4f\u8bfb\u4e0d\u5230\uff0c\u4e0d\u80fd\u636e\u6b64\u8ba4\u4e3a\u6ca1\u751f\u6548\u3002\u80fd\u622a\u56fe\u5c31\u622a\u56fe\u6838\u5bf9\uff1b\u4e0d\u80fd\u5c31\u6309\u8ba1\u5212\u7ee7\u7eed\uff0c\u6700\u540e\u8bf7\u7528\u6237\u6838\u5bf9\u3002\u4e0d\u8981\u76f4\u63a5\u91cd\u590d\u8fd9\u4e00\u6b65\u3002\uff09"

    .line 306
    .line 307
    goto :goto_e

    .line 308
    :cond_12
    const-string v9, "\u754c\u9762\u6ca1\u6709\u660e\u663e\u53d8\u5316\u3002"

    .line 309
    .line 310
    goto :goto_e

    .line 311
    :cond_13
    if-nez v9, :cond_15

    .line 312
    .line 313
    if-eqz v25, :cond_14

    .line 314
    .line 315
    if-eqz v31, :cond_14

    .line 316
    .line 317
    goto :goto_d

    .line 318
    :cond_14
    const-string v9, "\uff08\u672c\u6b21\u7ed3\u679c\u4ecd\u672a\u786e\u8ba4\uff0c\u8bf7\u5148\u6838\u5bf9\u5c4f\u5e55\uff0c\u4e0d\u8981\u81ea\u52a8\u91cd\u8bd5\u3002\uff09"

    .line 319
    .line 320
    :cond_15
    :goto_e
    if-eqz v25, :cond_16

    .line 321
    .line 322
    invoke-virtual {v10, v7}, Lc12;->d(Lc12;)Z

    .line 323
    .line 324
    .line 325
    move-result v5

    .line 326
    if-eqz v5, :cond_16

    .line 327
    .line 328
    iget-object v5, v10, Lc12;->f:Ljava/lang/Object;

    .line 329
    .line 330
    check-cast v5, Ljava/lang/Boolean;

    .line 331
    .line 332
    move/from16 p8, v12

    .line 333
    .line 334
    iget-object v12, v7, Lc12;->f:Ljava/lang/Object;

    .line 335
    .line 336
    check-cast v12, Ljava/lang/Boolean;

    .line 337
    .line 338
    invoke-static {v5, v12}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    move-result v5

    .line 342
    if-eqz v5, :cond_17

    .line 343
    .line 344
    const/16 v30, 0x1

    .line 345
    .line 346
    goto :goto_f

    .line 347
    :cond_16
    move/from16 p8, v12

    .line 348
    .line 349
    :cond_17
    const/16 v30, 0x0

    .line 350
    .line 351
    :goto_f
    iget-object v5, v6, Ly21;->m:Lb20;

    .line 352
    .line 353
    if-eqz v5, :cond_18

    .line 354
    .line 355
    iget-object v1, v6, Ly21;->b:Ldk0;

    .line 356
    .line 357
    iget-object v1, v1, Ldk0;->c:Ljava/lang/Object;

    .line 358
    .line 359
    check-cast v1, Ljava/lang/String;

    .line 360
    .line 361
    :goto_10
    move-object v12, v1

    .line 362
    goto :goto_13

    .line 363
    :cond_18
    sget-object v5, Lk12;->a:Ljava/util/Set;

    .line 364
    .line 365
    if-eqz v1, :cond_19

    .line 366
    .line 367
    iget-object v5, v1, Ly21;->a:Ljava/lang/String;

    .line 368
    .line 369
    move-object/from16 v26, v5

    .line 370
    .line 371
    goto :goto_11

    .line 372
    :cond_19
    const/16 v26, 0x0

    .line 373
    .line 374
    :goto_11
    if-eqz v1, :cond_1a

    .line 375
    .line 376
    iget-object v1, v1, Ly21;->b:Ldk0;

    .line 377
    .line 378
    move-object/from16 v27, v1

    .line 379
    .line 380
    goto :goto_12

    .line 381
    :cond_1a
    const/16 v27, 0x0

    .line 382
    .line 383
    :goto_12
    iget-object v1, v6, Ly21;->a:Ljava/lang/String;

    .line 384
    .line 385
    iget-object v5, v6, Ly21;->b:Ldk0;

    .line 386
    .line 387
    move-object/from16 v28, v1

    .line 388
    .line 389
    move-object/from16 v29, v5

    .line 390
    .line 391
    invoke-static/range {v26 .. v31}, Lk12;->a(Ljava/lang/String;Ldk0;Ljava/lang/String;Ldk0;ZZ)Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    goto :goto_10

    .line 396
    :goto_13
    iget-object v1, v6, Ly21;->b:Ldk0;

    .line 397
    .line 398
    iget-boolean v1, v1, Ldk0;->b:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 399
    .line 400
    const-string v5, "\n"

    .line 401
    .line 402
    const-string v18, "\u672c\u673a\u6587\u5b57\u8bc6\u522b\u5df2\u5173\u95ed"

    .line 403
    .line 404
    const-string v19, "\u672c\u673a\u6587\u5b57\u8bc6\u522b\u540e\u7aef\u5c1a\u672a\u5b89\u88c5\uff0c\u672a\u63d0\u4f9b\u89c6\u89c9\u5143\u7d20\uff1b\u4e0d\u80fd\u636e\u6b64\u731c\u5750\u6807\uff0c\u8bf7 handoff\u3002"

    .line 405
    .line 406
    const-string v21, "\u65e0\u6cd5\u786e\u8ba4\u672c\u5c4f\u7684\u672c\u673a\u8bc6\u522b\u9690\u79c1\u8fb9\u754c\uff0c\u672a\u8bc6\u522b\u6587\u5b57\uff1b\u8bf7 handoff\u3002"

    .line 407
    .line 408
    const-string v22, "\u672c\u6b21\u672c\u673a\u6587\u5b57\u8bc6\u522b\u4e0d\u53ef\u7528\uff0c\u672a\u63d0\u4f9b\u89c6\u89c9\u5143\u7d20\uff1b\u8bf7 handoff\u3002"

    .line 409
    .line 410
    move-object/from16 p2, v13

    .line 411
    .line 412
    const-string v13, "\u672c\u673a\u6587\u5b57\u8bc6\u522b\u5931\u8d25\u6216\u7ed3\u679c\u4e0d\u5b8c\u6574\uff0c\u672a\u63d0\u4f9b\u89c6\u89c9\u5143\u7d20\uff1b\u8bf7 handoff\u3002"

    .line 413
    .line 414
    if-eqz v1, :cond_1e

    .line 415
    .line 416
    :try_start_3
    iget-object v1, v0, La31;->g:Lli1;

    .line 417
    .line 418
    invoke-virtual {v1}, Lli1;->d()Ll11;

    .line 419
    .line 420
    .line 421
    move-result-object v1

    .line 422
    iget-object v1, v1, Ll11;->a:Lj11;

    .line 423
    .line 424
    sget-object v23, Lf11;->a:[I

    .line 425
    .line 426
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 427
    .line 428
    .line 429
    move-result v1

    .line 430
    aget v1, v23, v1

    .line 431
    .line 432
    move-object/from16 v23, v12

    .line 433
    .line 434
    const/4 v12, 0x1

    .line 435
    if-eq v1, v12, :cond_1d

    .line 436
    .line 437
    const/4 v12, 0x2

    .line 438
    if-eq v1, v12, :cond_1c

    .line 439
    .line 440
    const/4 v12, 0x3

    .line 441
    if-eq v1, v12, :cond_1b

    .line 442
    .line 443
    move-object/from16 v1, v22

    .line 444
    .line 445
    goto :goto_14

    .line 446
    :cond_1b
    move-object/from16 v1, v21

    .line 447
    .line 448
    goto :goto_14

    .line 449
    :cond_1c
    move-object/from16 v1, v19

    .line 450
    .line 451
    goto :goto_14

    .line 452
    :cond_1d
    move-object/from16 v1, v18

    .line 453
    .line 454
    :goto_14
    invoke-virtual {v5, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v1

    .line 458
    goto :goto_15

    .line 459
    :cond_1e
    move-object/from16 v23, v12

    .line 460
    .line 461
    move-object/from16 v1, p2

    .line 462
    .line 463
    :goto_15
    iget-object v12, v0, La31;->f:Lo71;

    .line 464
    .line 465
    invoke-virtual {v12}, Lo71;->e()Ljava/lang/Long;

    .line 466
    .line 467
    .line 468
    move-result-object v12

    .line 469
    move-object/from16 v24, v9

    .line 470
    .line 471
    iget-wide v8, v0, La31;->h:J

    .line 472
    .line 473
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 474
    .line 475
    .line 476
    move-result-wide v26

    .line 477
    sub-long v8, v8, v26

    .line 478
    .line 479
    move-object/from16 p7, v1

    .line 480
    .line 481
    iget-object v1, v6, Ly21;->b:Ldk0;

    .line 482
    .line 483
    iget-boolean v1, v1, Ldk0;->b:Z

    .line 484
    .line 485
    if-eqz v1, :cond_1f

    .line 486
    .line 487
    if-eqz v12, :cond_1f

    .line 488
    .line 489
    invoke-virtual {v0, v2, v6, v3, v4}, La31;->w(Lso;Ly21;J)Z

    .line 490
    .line 491
    .line 492
    move-result v1

    .line 493
    if-eqz v1, :cond_1f

    .line 494
    .line 495
    const/16 v41, 0x1

    .line 496
    .line 497
    goto :goto_16

    .line 498
    :cond_1f
    const/16 v41, 0x0

    .line 499
    .line 500
    :goto_16
    iget-object v1, v6, Ly21;->b:Ldk0;

    .line 501
    .line 502
    iget-boolean v1, v1, Ldk0;->b:Z

    .line 503
    .line 504
    if-eqz v1, :cond_23

    .line 505
    .line 506
    if-eqz v12, :cond_23

    .line 507
    .line 508
    if-nez v41, :cond_23

    .line 509
    .line 510
    new-instance v1, Ll11;

    .line 511
    .line 512
    sget-object v3, Lj11;->PRIVACY_UNVERIFIED:Lj11;

    .line 513
    .line 514
    invoke-direct {v1, v3}, Ll11;-><init>(Lj11;)V

    .line 515
    .line 516
    .line 517
    sget-object v1, Lf11;->a:[I

    .line 518
    .line 519
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 520
    .line 521
    .line 522
    move-result v3

    .line 523
    aget v1, v1, v3

    .line 524
    .line 525
    const/4 v3, 0x1

    .line 526
    if-eq v1, v3, :cond_22

    .line 527
    .line 528
    const/4 v3, 0x2

    .line 529
    if-eq v1, v3, :cond_21

    .line 530
    .line 531
    const/4 v4, 0x3

    .line 532
    if-eq v1, v4, :cond_20

    .line 533
    .line 534
    move-object/from16 v1, v22

    .line 535
    .line 536
    goto :goto_17

    .line 537
    :cond_20
    move-object/from16 v1, v21

    .line 538
    .line 539
    goto :goto_17

    .line 540
    :cond_21
    move-object/from16 v1, v19

    .line 541
    .line 542
    goto :goto_17

    .line 543
    :cond_22
    const/4 v3, 0x2

    .line 544
    move-object/from16 v1, v18

    .line 545
    .line 546
    :goto_17
    invoke-virtual {v5, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 547
    .line 548
    .line 549
    move-result-object v1

    .line 550
    move-object/from16 v18, v1

    .line 551
    .line 552
    goto :goto_18

    .line 553
    :cond_23
    const/4 v3, 0x2

    .line 554
    move-object/from16 v18, p7

    .line 555
    .line 556
    :goto_18
    if-eqz v11, :cond_24

    .line 557
    .line 558
    invoke-static {v2}, La31;->O(Lso;)Z

    .line 559
    .line 560
    .line 561
    move-result v1

    .line 562
    if-nez v1, :cond_24

    .line 563
    .line 564
    iget-boolean v1, v6, Ly21;->f:Z

    .line 565
    .line 566
    if-nez v1, :cond_24

    .line 567
    .line 568
    iget-boolean v1, v6, Ly21;->e:Z

    .line 569
    .line 570
    if-nez v1, :cond_24

    .line 571
    .line 572
    if-eqz v7, :cond_24

    .line 573
    .line 574
    invoke-virtual {v10, v7}, Lc12;->d(Lc12;)Z

    .line 575
    .line 576
    .line 577
    move-result v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 578
    if-eqz v1, :cond_24

    .line 579
    .line 580
    const/4 v10, 0x1

    .line 581
    goto :goto_19

    .line 582
    :cond_24
    const/4 v10, 0x0

    .line 583
    :goto_19
    if-nez v10, :cond_26

    .line 584
    .line 585
    if-eqz v41, :cond_25

    .line 586
    .line 587
    goto :goto_1a

    .line 588
    :cond_25
    move-wide/from16 v3, p4

    .line 589
    .line 590
    move-object v1, v2

    .line 591
    move-object v2, v6

    .line 592
    move-object/from16 v21, v11

    .line 593
    .line 594
    move-object/from16 p10, v14

    .line 595
    .line 596
    move-object/from16 p9, v15

    .line 597
    .line 598
    goto/16 :goto_28

    .line 599
    .line 600
    :cond_26
    :goto_1a
    const-wide/16 v21, 0x12c

    .line 601
    .line 602
    cmp-long v1, v8, v21

    .line 603
    .line 604
    if-lez v1, :cond_25

    .line 605
    .line 606
    :try_start_4
    iget-object v1, v0, La31;->q:Ly10;

    .line 607
    .line 608
    move-wide/from16 p9, v8

    .line 609
    .line 610
    invoke-virtual {v1}, Ly10;->g()J

    .line 611
    .line 612
    .line 613
    move-result-wide v7

    .line 614
    iget-object v9, v0, La31;->g:Lli1;

    .line 615
    .line 616
    iget-object v1, v2, Lso;->a:Ljava/util/ArrayList;

    .line 617
    .line 618
    invoke-static {v1}, Lzr;->L(Ljava/util/List;)Ljava/lang/Object;

    .line 619
    .line 620
    .line 621
    move-result-object v1

    .line 622
    move-object/from16 v34, v1

    .line 623
    .line 624
    check-cast v34, Lck2;

    .line 625
    .line 626
    iget-object v1, v2, Lso;->d:Lqe;

    .line 627
    .line 628
    sget-object v36, Lca0;->m:Lca0;
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_c
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_e
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 629
    .line 630
    const-wide/16 v3, 0x9c4

    .line 631
    .line 632
    move-object/from16 v35, v1

    .line 633
    .line 634
    sub-long v0, p9, v21

    .line 635
    .line 636
    :try_start_5
    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 637
    .line 638
    .line 639
    move-result-wide v38

    .line 640
    new-instance v43, Lr21;
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_c
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_d
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 641
    .line 642
    move-wide v0, v7

    .line 643
    const/4 v7, 0x1

    .line 644
    move-object v3, v6

    .line 645
    move-object/from16 v33, v9

    .line 646
    .line 647
    move-object v6, v12

    .line 648
    move-wide v8, v0

    .line 649
    move-object v12, v5

    .line 650
    move-object/from16 v0, v43

    .line 651
    .line 652
    move-object/from16 v1, p0

    .line 653
    .line 654
    move-wide/from16 v4, p4

    .line 655
    .line 656
    :try_start_6
    invoke-direct/range {v0 .. v7}, Lr21;-><init>(La31;Lso;Ly21;JLjava/lang/Long;I)V
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_c
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_b
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 657
    .line 658
    .line 659
    move-object v0, v1

    .line 660
    move-object v1, v2

    .line 661
    move-object v2, v3

    .line 662
    move-wide v3, v4

    .line 663
    move-object v7, v6

    .line 664
    const/16 v44, 0x600

    .line 665
    .line 666
    const/16 v40, 0x0

    .line 667
    .line 668
    move-object/from16 v37, v36

    .line 669
    .line 670
    move/from16 v42, v41

    .line 671
    .line 672
    :try_start_7
    invoke-static/range {v33 .. v44}, Lli1;->h(Lli1;Lck2;Lqe;Ljava/util/List;Ljava/util/List;JZZZLzk0;I)Lb92;

    .line 673
    .line 674
    .line 675
    move-result-object v5

    .line 676
    iget-boolean v6, v5, Lb92;->d:Z
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_a
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 677
    .line 678
    if-eqz v6, :cond_27

    .line 679
    .line 680
    move-object/from16 p7, v1

    .line 681
    .line 682
    :try_start_8
    iget-object v1, v0, La31;->q:Ly10;
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 683
    .line 684
    move-object/from16 p9, v2

    .line 685
    .line 686
    const/4 v2, 0x0

    .line 687
    :try_start_9
    invoke-virtual {v1, v2, v2}, Ly10;->e(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 688
    .line 689
    .line 690
    move-object/from16 v18, p2

    .line 691
    .line 692
    goto :goto_1c

    .line 693
    :catchall_1
    move-exception v0

    .line 694
    move-object/from16 v1, p7

    .line 695
    .line 696
    goto/16 :goto_3d

    .line 697
    .line 698
    :catch_1
    move-object/from16 v1, p7

    .line 699
    .line 700
    move-object/from16 v2, p9

    .line 701
    .line 702
    :goto_1b
    move-object/from16 v21, v11

    .line 703
    .line 704
    move-object/from16 p10, v14

    .line 705
    .line 706
    move-object/from16 p9, v15

    .line 707
    .line 708
    goto/16 :goto_25

    .line 709
    .line 710
    :catch_2
    move-exception v0

    .line 711
    move-object/from16 v1, p7

    .line 712
    .line 713
    goto/16 :goto_27

    .line 714
    .line 715
    :catch_3
    move-object/from16 v1, p7

    .line 716
    .line 717
    goto :goto_1b

    .line 718
    :cond_27
    move-object/from16 p7, v1

    .line 719
    .line 720
    move-object/from16 p9, v2

    .line 721
    .line 722
    :goto_1c
    if-eqz v10, :cond_28

    .line 723
    .line 724
    iget-boolean v1, v5, Lb92;->d:Z

    .line 725
    .line 726
    if-nez v1, :cond_28

    .line 727
    .line 728
    invoke-virtual {v0, v3, v4}, La31;->f(J)Z

    .line 729
    .line 730
    .line 731
    move-result v1

    .line 732
    if-nez v1, :cond_28

    .line 733
    .line 734
    invoke-virtual {v0}, La31;->availability()Lsb;

    .line 735
    .line 736
    .line 737
    move-result-object v1

    .line 738
    iget-boolean v1, v1, Lsb;->a:Z

    .line 739
    .line 740
    if-eqz v1, :cond_28

    .line 741
    .line 742
    iget-object v2, v5, Lb92;->g:Luq0;
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 743
    .line 744
    move-object v10, v2

    .line 745
    goto :goto_1d

    .line 746
    :cond_28
    const/4 v10, 0x0

    .line 747
    :goto_1d
    if-nez v6, :cond_2f

    .line 748
    .line 749
    if-eqz v41, :cond_2f

    .line 750
    .line 751
    move-object v1, v5

    .line 752
    move v2, v6

    .line 753
    :try_start_a
    iget-wide v5, v0, La31;->h:J
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_9
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 754
    .line 755
    move-object/from16 v19, v1

    .line 756
    .line 757
    move-object/from16 v1, p7

    .line 758
    .line 759
    move-object/from16 p7, v10

    .line 760
    .line 761
    move-object/from16 v10, v19

    .line 762
    .line 763
    move/from16 v19, v2

    .line 764
    .line 765
    move-object/from16 v2, p9

    .line 766
    .line 767
    :try_start_b
    invoke-virtual/range {v0 .. v6}, La31;->Q(Lso;Ly21;JJ)Z

    .line 768
    .line 769
    .line 770
    move-result v5

    .line 771
    if-eqz v5, :cond_29

    .line 772
    .line 773
    if-eqz v7, :cond_29

    .line 774
    .line 775
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 776
    .line 777
    .line 778
    move-result-wide v5

    .line 779
    move-wide/from16 p9, v5

    .line 780
    .line 781
    iget-object v5, v0, La31;->f:Lo71;

    .line 782
    .line 783
    invoke-virtual {v5}, Lo71;->e()Ljava/lang/Long;

    .line 784
    .line 785
    .line 786
    move-result-object v5

    .line 787
    if-nez v5, :cond_2a

    .line 788
    .line 789
    :cond_29
    :goto_1e
    move-object/from16 v21, v11

    .line 790
    .line 791
    move-object/from16 p10, v14

    .line 792
    .line 793
    move-object/from16 p9, v15

    .line 794
    .line 795
    goto/16 :goto_22

    .line 796
    .line 797
    :cond_2a
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 798
    .line 799
    .line 800
    move-result-wide v5

    .line 801
    cmp-long v5, p9, v5

    .line 802
    .line 803
    if-nez v5, :cond_29

    .line 804
    .line 805
    iget-object v5, v2, Ly21;->b:Ldk0;

    .line 806
    .line 807
    iget-boolean v5, v5, Ldk0;->b:Z

    .line 808
    .line 809
    if-eqz v5, :cond_29

    .line 810
    .line 811
    iget-object v5, v10, Lb92;->c:Lrq0;

    .line 812
    .line 813
    if-eqz v5, :cond_29

    .line 814
    .line 815
    iget-object v6, v10, Lb92;->k:Lap2;
    :try_end_b
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_b} :catch_5
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_8
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 816
    .line 817
    if-eqz v6, :cond_29

    .line 818
    .line 819
    if-nez v5, :cond_2b

    .line 820
    .line 821
    goto :goto_1f

    .line 822
    :cond_2b
    if-nez v6, :cond_2c

    .line 823
    .line 824
    :goto_1f
    move-object/from16 v21, v11

    .line 825
    .line 826
    move-object/from16 p10, v14

    .line 827
    .line 828
    move-object/from16 p9, v15

    .line 829
    .line 830
    const/4 v5, 0x0

    .line 831
    goto :goto_20

    .line 832
    :cond_2c
    move-object/from16 p9, v15

    .line 833
    .line 834
    :try_start_c
    iget-object v15, v10, Lb92;->h:Lm11;
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_5
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_7
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 835
    .line 836
    move-object/from16 p10, v14

    .line 837
    .line 838
    :try_start_d
    iget v14, v10, Lb92;->i:I
    :try_end_d
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_d} :catch_5
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_6
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 839
    .line 840
    move-object/from16 v21, v11

    .line 841
    .line 842
    :try_start_e
    iget v11, v10, Lb92;->j:I

    .line 843
    .line 844
    invoke-static {v15, v14, v11, v6, v5}, Ljb4;->a(Lm11;IILap2;Lrq0;)Lo11;

    .line 845
    .line 846
    .line 847
    move-result-object v5

    .line 848
    :goto_20
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 849
    .line 850
    .line 851
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 852
    .line 853
    .line 854
    move-result-wide v14

    .line 855
    move-wide/from16 v26, v14

    .line 856
    .line 857
    iget-wide v14, v0, La31;->h:J

    .line 858
    .line 859
    cmp-long v6, v26, v14

    .line 860
    .line 861
    if-gez v6, :cond_2e

    .line 862
    .line 863
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 864
    .line 865
    .line 866
    move-result-wide v14

    .line 867
    iget-object v6, v0, La31;->f:Lo71;

    .line 868
    .line 869
    invoke-virtual {v6}, Lo71;->e()Ljava/lang/Long;

    .line 870
    .line 871
    .line 872
    move-result-object v6

    .line 873
    if-nez v6, :cond_2d

    .line 874
    .line 875
    goto :goto_22

    .line 876
    :cond_2d
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 877
    .line 878
    .line 879
    move-result-wide v26

    .line 880
    cmp-long v6, v14, v26

    .line 881
    .line 882
    if-nez v6, :cond_2e

    .line 883
    .line 884
    invoke-virtual {v0, v1, v2, v3, v4}, La31;->w(Lso;Ly21;J)Z

    .line 885
    .line 886
    .line 887
    move-result v6

    .line 888
    if-eqz v6, :cond_2e

    .line 889
    .line 890
    iget-object v6, v5, Lo11;->a:Ljava/lang/String;

    .line 891
    .line 892
    invoke-virtual {v12, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 893
    .line 894
    .line 895
    move-result-object v18

    .line 896
    iget-boolean v6, v5, Lo11;->b:Z

    .line 897
    .line 898
    if-nez v6, :cond_2e

    .line 899
    .line 900
    iget-boolean v5, v5, Lo11;->c:Z

    .line 901
    .line 902
    if-eqz v5, :cond_2e

    .line 903
    .line 904
    iget-object v5, v10, Lb92;->g:Luq0;

    .line 905
    .line 906
    if-eqz v5, :cond_2e

    .line 907
    .line 908
    iput-object v5, v2, Ly21;->n:Luq0;

    .line 909
    .line 910
    iput-object v7, v2, Ly21;->o:Ljava/lang/Long;

    .line 911
    .line 912
    iget-object v5, v0, La31;->q:Ly10;

    .line 913
    .line 914
    iget-object v6, v2, Ly21;->a:Ljava/lang/String;

    .line 915
    .line 916
    invoke-virtual {v5, v8, v9, v6}, Ly10;->a(JLjava/lang/String;)Z
    :try_end_e
    .catch Ljava/lang/InterruptedException; {:try_start_e .. :try_end_e} :catch_5
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_4
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 917
    .line 918
    .line 919
    goto :goto_22

    .line 920
    :catchall_2
    move-exception v0

    .line 921
    goto/16 :goto_3d

    .line 922
    .line 923
    :catch_4
    :goto_21
    move/from16 v6, v19

    .line 924
    .line 925
    goto/16 :goto_25

    .line 926
    .line 927
    :catch_5
    move-exception v0

    .line 928
    goto/16 :goto_27

    .line 929
    .line 930
    :cond_2e
    :goto_22
    move-object/from16 v5, p7

    .line 931
    .line 932
    move-object/from16 v7, v18

    .line 933
    .line 934
    move/from16 v6, v19

    .line 935
    .line 936
    goto/16 :goto_29

    .line 937
    .line 938
    :catch_6
    move-object/from16 v21, v11

    .line 939
    .line 940
    goto :goto_21

    .line 941
    :catch_7
    move-object/from16 v21, v11

    .line 942
    .line 943
    move-object/from16 p10, v14

    .line 944
    .line 945
    goto :goto_21

    .line 946
    :catch_8
    move-object/from16 v21, v11

    .line 947
    .line 948
    move-object/from16 p10, v14

    .line 949
    .line 950
    :goto_23
    move-object/from16 p9, v15

    .line 951
    .line 952
    goto :goto_21

    .line 953
    :catch_9
    move-object/from16 v1, p7

    .line 954
    .line 955
    move/from16 v19, v2

    .line 956
    .line 957
    move-object/from16 v21, v11

    .line 958
    .line 959
    move-object/from16 p10, v14

    .line 960
    .line 961
    move-object/from16 v2, p9

    .line 962
    .line 963
    goto :goto_23

    .line 964
    :cond_2f
    move-object/from16 v1, p7

    .line 965
    .line 966
    move-object/from16 v2, p9

    .line 967
    .line 968
    move/from16 v19, v6

    .line 969
    .line 970
    move-object/from16 p7, v10

    .line 971
    .line 972
    goto/16 :goto_1e

    .line 973
    .line 974
    :catch_a
    :goto_24
    move-object/from16 v21, v11

    .line 975
    .line 976
    move-object/from16 p10, v14

    .line 977
    .line 978
    move-object/from16 p9, v15

    .line 979
    .line 980
    const/4 v6, 0x0

    .line 981
    goto :goto_25

    .line 982
    :catch_b
    move-object v0, v1

    .line 983
    move-object v1, v2

    .line 984
    move-object v2, v3

    .line 985
    move-wide v3, v4

    .line 986
    goto :goto_24

    .line 987
    :catch_c
    move-exception v0

    .line 988
    move-object v1, v2

    .line 989
    goto :goto_27

    .line 990
    :catch_d
    move-object/from16 v0, p0

    .line 991
    .line 992
    :catch_e
    move-wide/from16 v3, p4

    .line 993
    .line 994
    move-object v1, v2

    .line 995
    move-object v12, v5

    .line 996
    move-object v2, v6

    .line 997
    goto :goto_24

    .line 998
    :goto_25
    :try_start_f
    iget-object v5, v2, Ly21;->b:Ldk0;

    .line 999
    .line 1000
    iget-boolean v5, v5, Ldk0;->b:Z

    .line 1001
    .line 1002
    if-eqz v5, :cond_30

    .line 1003
    .line 1004
    new-instance v5, Lg11;

    .line 1005
    .line 1006
    sget-object v7, Lh11;->ENGINE:Lh11;

    .line 1007
    .line 1008
    invoke-direct {v5, v7}, Lg11;-><init>(Lh11;)V

    .line 1009
    .line 1010
    .line 1011
    invoke-virtual {v12, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1012
    .line 1013
    .line 1014
    move-result-object v5

    .line 1015
    move-object/from16 v18, v5

    .line 1016
    .line 1017
    goto :goto_26

    .line 1018
    :cond_30
    move-object/from16 v18, p2

    .line 1019
    .line 1020
    :goto_26
    move-object/from16 v7, v18

    .line 1021
    .line 1022
    const/4 v5, 0x0

    .line 1023
    goto :goto_29

    .line 1024
    :goto_27
    throw v0

    .line 1025
    :goto_28
    move-object/from16 v7, v18

    .line 1026
    .line 1027
    const/4 v5, 0x0

    .line 1028
    const/4 v6, 0x0

    .line 1029
    :goto_29
    if-nez v21, :cond_31

    .line 1030
    .line 1031
    move-object/from16 v13, p2

    .line 1032
    .line 1033
    const/4 v12, 0x1

    .line 1034
    goto :goto_2a

    .line 1035
    :cond_31
    if-eqz v5, :cond_32

    .line 1036
    .line 1037
    move-object/from16 v8, v21

    .line 1038
    .line 1039
    invoke-virtual {v5, v8}, Luq0;->a(Luq0;)Lbp2;

    .line 1040
    .line 1041
    .line 1042
    move-result-object v5

    .line 1043
    if-nez v5, :cond_33

    .line 1044
    .line 1045
    :cond_32
    sget-object v5, Lbp2;->UNAVAILABLE:Lbp2;

    .line 1046
    .line 1047
    :cond_33
    sget-object v8, Lz21;->d:[I

    .line 1048
    .line 1049
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    .line 1050
    .line 1051
    .line 1052
    move-result v5

    .line 1053
    aget v5, v8, v5

    .line 1054
    .line 1055
    const/4 v12, 0x1

    .line 1056
    if-eq v5, v12, :cond_36

    .line 1057
    .line 1058
    const/4 v8, 0x2

    .line 1059
    if-eq v5, v8, :cond_35

    .line 1060
    .line 1061
    const/4 v8, 0x3

    .line 1062
    if-ne v5, v8, :cond_34

    .line 1063
    .line 1064
    const-string v13, "\uff08\u622a\u56fe\u65e0\u6cd5\u6bd4\u8f83\uff0c\u4e0d\u80fd\u9a8c\u8bc1\u8fd9\u6b21\u64cd\u4f5c\uff1b\u4e0d\u8981\u81ea\u52a8\u91cd\u590d\u64cd\u4f5c\u3002\uff09"

    .line 1065
    .line 1066
    goto :goto_2a

    .line 1067
    :cond_34
    new-instance v0, Lgw;

    .line 1068
    .line 1069
    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    .line 1070
    .line 1071
    .line 1072
    throw v0

    .line 1073
    :cond_35
    const-string v13, "\uff08\u622a\u56fe\u672a\u89c1\u660e\u663e\u753b\u9762\u53d8\u5316\uff0c\u65e0\u6cd5\u9a8c\u8bc1\u8fd9\u6b21\u64cd\u4f5c\uff1b\u4e0d\u8981\u81ea\u52a8\u91cd\u590d\u64cd\u4f5c\u3002\uff09"

    .line 1074
    .line 1075
    goto :goto_2a

    .line 1076
    :cond_36
    const-string v13, "\uff08\u622a\u56fe\u4e2d\u6709\u660e\u663e\u753b\u9762\u53d8\u5316\uff1b\u8fd9\u4e0d\u4ee3\u8868\u76ee\u6807\u64cd\u4f5c\u5df2\u6210\u529f\u3002\uff09"

    .line 1077
    .line 1078
    :goto_2a
    if-eqz p8, :cond_3c

    .line 1079
    .line 1080
    iget-boolean v5, v2, Ly21;->g:Z

    .line 1081
    .line 1082
    if-nez v5, :cond_3c

    .line 1083
    .line 1084
    if-nez v6, :cond_3c

    .line 1085
    .line 1086
    invoke-virtual {v0, v3, v4}, La31;->f(J)Z

    .line 1087
    .line 1088
    .line 1089
    move-result v3

    .line 1090
    if-nez v3, :cond_3c

    .line 1091
    .line 1092
    if-eqz p10, :cond_3c

    .line 1093
    .line 1094
    sget-object v3, Lk41;->a:Ljava/util/List;

    .line 1095
    .line 1096
    iget-object v3, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 1097
    .line 1098
    invoke-static {v1}, Lk41;->g(Lso;)Z

    .line 1099
    .line 1100
    .line 1101
    move-result v4

    .line 1102
    if-nez v4, :cond_37

    .line 1103
    .line 1104
    :goto_2b
    move-object/from16 v5, p10

    .line 1105
    .line 1106
    goto :goto_2c

    .line 1107
    :cond_37
    invoke-static {v3}, Lk41;->f(Landroid/content/Context;)Lue1;

    .line 1108
    .line 1109
    .line 1110
    move-result-object v3

    .line 1111
    if-nez v3, :cond_38

    .line 1112
    .line 1113
    goto :goto_2b

    .line 1114
    :cond_38
    iget-object v4, v3, Lue1;->m:Ljava/lang/Object;

    .line 1115
    .line 1116
    check-cast v4, Lh41;

    .line 1117
    .line 1118
    iget-object v3, v3, Lue1;->U:Ljava/lang/Object;

    .line 1119
    .line 1120
    check-cast v3, Ljava/util/Map;

    .line 1121
    .line 1122
    move-object/from16 v5, p10

    .line 1123
    .line 1124
    iget-object v8, v5, Li41;->a:Lh41;

    .line 1125
    .line 1126
    invoke-static {v4, v8}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 1127
    .line 1128
    .line 1129
    move-result v4

    .line 1130
    if-nez v4, :cond_39

    .line 1131
    .line 1132
    goto :goto_2c

    .line 1133
    :cond_39
    iget-object v4, v1, Lso;->a:Ljava/util/ArrayList;

    .line 1134
    .line 1135
    invoke-static {v4, v3}, Lk41;->b(Ljava/util/List;Ljava/util/Map;)Lj41;

    .line 1136
    .line 1137
    .line 1138
    move-result-object v3

    .line 1139
    if-eqz v3, :cond_3a

    .line 1140
    .line 1141
    iget v4, v3, Lj41;->a:I

    .line 1142
    .line 1143
    iget-object v8, v5, Li41;->b:Lj41;

    .line 1144
    .line 1145
    iget v8, v8, Lj41;->a:I

    .line 1146
    .line 1147
    if-ne v4, v8, :cond_3a

    .line 1148
    .line 1149
    goto :goto_2d

    .line 1150
    :cond_3a
    :goto_2c
    const/4 v3, 0x0

    .line 1151
    :goto_2d
    if-eqz v3, :cond_3b

    .line 1152
    .line 1153
    invoke-virtual {v0, v1}, La31;->N(Lso;)Z

    .line 1154
    .line 1155
    .line 1156
    move-result v0

    .line 1157
    if-eqz v0, :cond_3b

    .line 1158
    .line 1159
    goto :goto_2f

    .line 1160
    :cond_3b
    :goto_2e
    const/4 v3, 0x0

    .line 1161
    goto :goto_2f

    .line 1162
    :cond_3c
    move-object/from16 v5, p10

    .line 1163
    .line 1164
    goto :goto_2e

    .line 1165
    :goto_2f
    if-eqz v3, :cond_3d

    .line 1166
    .line 1167
    iget-object v0, v3, Lj41;->b:Ljava/lang/String;

    .line 1168
    .line 1169
    :goto_30
    move-object/from16 v3, p9

    .line 1170
    .line 1171
    goto :goto_31

    .line 1172
    :cond_3d
    const/4 v0, 0x0

    .line 1173
    goto :goto_30

    .line 1174
    :goto_31
    invoke-static {v0, v3}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 1175
    .line 1176
    .line 1177
    move-result v0

    .line 1178
    if-eqz v0, :cond_3e

    .line 1179
    .line 1180
    if-eqz v5, :cond_3e

    .line 1181
    .line 1182
    iget-object v0, v5, Li41;->a:Lh41;

    .line 1183
    .line 1184
    if-eqz v0, :cond_3e

    .line 1185
    .line 1186
    new-instance v0, Lr61;

    .line 1187
    .line 1188
    const/4 v8, 0x2

    .line 1189
    invoke-direct {v0, v8}, Lr61;-><init>(I)V

    .line 1190
    .line 1191
    .line 1192
    goto :goto_32

    .line 1193
    :cond_3e
    const/4 v0, 0x0

    .line 1194
    :goto_32
    new-instance v3, Lv2;

    .line 1195
    .line 1196
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1197
    .line 1198
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1199
    .line 1200
    .line 1201
    move-object/from16 v8, p6

    .line 1202
    .line 1203
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1204
    .line 1205
    .line 1206
    move-object/from16 v9, v24

    .line 1207
    .line 1208
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1209
    .line 1210
    .line 1211
    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1212
    .line 1213
    .line 1214
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1215
    .line 1216
    .line 1217
    move-result-object v4

    .line 1218
    move-object/from16 v5, v23

    .line 1219
    .line 1220
    invoke-virtual {v5, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1221
    .line 1222
    .line 1223
    move-result-object v5

    .line 1224
    iget-object v14, v2, Ly21;->a:Ljava/lang/String;

    .line 1225
    .line 1226
    iget-object v7, v2, Ly21;->d:Ljava/lang/String;

    .line 1227
    .line 1228
    iget-object v8, v2, Ly21;->c:Ljava/lang/String;

    .line 1229
    .line 1230
    iget-boolean v9, v2, Ly21;->g:Z

    .line 1231
    .line 1232
    iget-object v10, v2, Ly21;->b:Ldk0;

    .line 1233
    .line 1234
    iget-boolean v10, v10, Ldk0;->b:Z

    .line 1235
    .line 1236
    iget-object v11, v2, Ly21;->l:Ljava/util/Set;

    .line 1237
    .line 1238
    iget-object v13, v2, Ly21;->m:Lb20;

    .line 1239
    .line 1240
    sget-object v15, Lea0;->m:Lea0;

    .line 1241
    .line 1242
    const/16 v17, 0x4c0

    .line 1243
    .line 1244
    and-int/lit8 v17, v17, 0x10

    .line 1245
    .line 1246
    if-eqz v17, :cond_3f

    .line 1247
    .line 1248
    const/4 v9, 0x0

    .line 1249
    :cond_3f
    const/16 v12, 0x4c0

    .line 1250
    .line 1251
    and-int/lit8 v18, v12, 0x20

    .line 1252
    .line 1253
    if-eqz v18, :cond_40

    .line 1254
    .line 1255
    const/16 v19, 0x0

    .line 1256
    .line 1257
    goto :goto_33

    .line 1258
    :cond_40
    move/from16 v19, v10

    .line 1259
    .line 1260
    :goto_33
    and-int/lit16 v10, v12, 0x100

    .line 1261
    .line 1262
    if-eqz v10, :cond_41

    .line 1263
    .line 1264
    move-object/from16 v22, v15

    .line 1265
    .line 1266
    goto :goto_34

    .line 1267
    :cond_41
    move-object/from16 v22, v11

    .line 1268
    .line 1269
    :goto_34
    const/16 v10, 0x4c0

    .line 1270
    .line 1271
    and-int/lit16 v10, v10, 0x200

    .line 1272
    .line 1273
    if-eqz v10, :cond_42

    .line 1274
    .line 1275
    const/4 v13, 0x0

    .line 1276
    :cond_42
    and-int/lit16 v10, v12, 0x400

    .line 1277
    .line 1278
    if-eqz v10, :cond_43

    .line 1279
    .line 1280
    move-object/from16 v24, v15

    .line 1281
    .line 1282
    goto :goto_35

    .line 1283
    :cond_43
    const/16 v24, 0x0

    .line 1284
    .line 1285
    :goto_35
    invoke-virtual/range {v24 .. v24}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1286
    .line 1287
    .line 1288
    iget-boolean v2, v2, Ly21;->g:Z

    .line 1289
    .line 1290
    if-nez v2, :cond_45

    .line 1291
    .line 1292
    if-eqz v6, :cond_44

    .line 1293
    .line 1294
    goto :goto_36

    .line 1295
    :cond_44
    const/16 v16, 0x0

    .line 1296
    .line 1297
    goto :goto_37

    .line 1298
    :cond_45
    :goto_36
    const/16 v16, 0x1

    .line 1299
    .line 1300
    :goto_37
    const/16 v2, 0x7ef

    .line 1301
    .line 1302
    const/4 v12, 0x2

    .line 1303
    and-int/lit8 v6, v2, 0x2

    .line 1304
    .line 1305
    if-eqz v6, :cond_46

    .line 1306
    .line 1307
    move-object v15, v5

    .line 1308
    goto :goto_38

    .line 1309
    :cond_46
    const/4 v15, 0x0

    .line 1310
    :goto_38
    and-int/lit8 v5, v2, 0x10

    .line 1311
    .line 1312
    if-eqz v5, :cond_47

    .line 1313
    .line 1314
    move/from16 v18, v9

    .line 1315
    .line 1316
    goto :goto_39

    .line 1317
    :cond_47
    move/from16 v18, v16

    .line 1318
    .line 1319
    :goto_39
    and-int/lit16 v2, v2, 0x200

    .line 1320
    .line 1321
    if-eqz v2, :cond_48

    .line 1322
    .line 1323
    move-object/from16 v23, v13

    .line 1324
    .line 1325
    goto :goto_3a

    .line 1326
    :cond_48
    const/16 v23, 0x0

    .line 1327
    .line 1328
    :goto_3a
    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1329
    .line 1330
    .line 1331
    new-instance v13, Lh22;

    .line 1332
    .line 1333
    const/16 v20, 0x0

    .line 1334
    .line 1335
    move-object/from16 v21, v20

    .line 1336
    .line 1337
    move-object/from16 v16, v7

    .line 1338
    .line 1339
    move-object/from16 v17, v8

    .line 1340
    .line 1341
    invoke-direct/range {v13 .. v24}, Lh22;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ[BLjava/lang/String;Ljava/util/Set;Lb20;Ljava/util/Set;)V

    .line 1342
    .line 1343
    .line 1344
    if-nez v25, :cond_49

    .line 1345
    .line 1346
    :goto_3b
    move-object/from16 v2, v20

    .line 1347
    .line 1348
    goto :goto_3c

    .line 1349
    :cond_49
    if-eqz v31, :cond_4a

    .line 1350
    .line 1351
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1352
    .line 1353
    goto :goto_3c

    .line 1354
    :cond_4a
    if-eqz v32, :cond_4b

    .line 1355
    .line 1356
    goto :goto_3b

    .line 1357
    :cond_4b
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 1358
    .line 1359
    :goto_3c
    const/16 v5, 0x18

    .line 1360
    .line 1361
    move/from16 p1, p8

    .line 1362
    .line 1363
    move-object/from16 p4, v0

    .line 1364
    .line 1365
    move-object/from16 p5, v2

    .line 1366
    .line 1367
    move-object/from16 p0, v3

    .line 1368
    .line 1369
    move-object/from16 p2, v4

    .line 1370
    .line 1371
    move/from16 p6, v5

    .line 1372
    .line 1373
    move-object/from16 p3, v13

    .line 1374
    .line 1375
    invoke-direct/range {p0 .. p6}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .line 1376
    .line 1377
    .line 1378
    invoke-virtual {v1}, Lso;->b()V

    .line 1379
    .line 1380
    .line 1381
    goto :goto_3f

    .line 1382
    :goto_3d
    invoke-virtual {v1}, Lso;->b()V

    .line 1383
    .line 1384
    .line 1385
    throw v0

    .line 1386
    :goto_3e
    const-string v1, "DshA11y"

    .line 1387
    .line 1388
    const-string v2, "observation after an accepted action failed"

    .line 1389
    .line 1390
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1391
    .line 1392
    .line 1393
    new-instance v0, Lv2;

    .line 1394
    .line 1395
    const-string v1, "\uff08\u6ca1\u80fd\u8bfb\u5230\u65b0\u5c4f\u5e55\uff0c\u65e0\u6cd5\u8ffd\u52a0\u9a8c\u8bc1\uff1b\u4e0d\u8981\u81ea\u52a8\u91cd\u8bd5\u3002\uff09"

    .line 1396
    .line 1397
    invoke-virtual {v8, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1398
    .line 1399
    .line 1400
    move-result-object v1

    .line 1401
    const/4 v2, 0x0

    .line 1402
    const/16 v3, 0x7c

    .line 1403
    .line 1404
    const/4 v4, 0x0

    .line 1405
    const/4 v5, 0x0

    .line 1406
    move-object/from16 p0, v0

    .line 1407
    .line 1408
    move-object/from16 p2, v1

    .line 1409
    .line 1410
    move-object/from16 p5, v2

    .line 1411
    .line 1412
    move/from16 p6, v3

    .line 1413
    .line 1414
    move-object/from16 p3, v4

    .line 1415
    .line 1416
    move-object/from16 p4, v5

    .line 1417
    .line 1418
    move/from16 p1, v9

    .line 1419
    .line 1420
    invoke-direct/range {p0 .. p6}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 1421
    .line 1422
    .line 1423
    move-object/from16 v3, p0

    .line 1424
    .line 1425
    :goto_3f
    return-object v3

    .line 1426
    :catch_f
    move-exception v0

    .line 1427
    throw v0

    .line 1428
    :cond_4c
    invoke-static {}, Lr31;->o()V

    .line 1429
    .line 1430
    .line 1431
    return-object p7

    .line 1432
    :cond_4d
    const/16 p7, 0x0

    .line 1433
    .line 1434
    invoke-static {}, Lr31;->o()V

    .line 1435
    .line 1436
    .line 1437
    return-object p7
.end method

.method public static synthetic h(La31;JZI)Lso;
    .locals 1

    .line 1
    and-int/lit8 v0, p4, 0x1

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-wide/16 p1, 0x7d0

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p4, p4, 0x2

    .line 8
    .line 9
    if-eqz p4, :cond_1

    .line 10
    .line 11
    const/4 p3, 0x0

    .line 12
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, La31;->g(JZ)Lso;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static m(Lso;Ll12;Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 5

    .line 1
    iget v0, p1, Ll12;->b:I

    .line 2
    .line 3
    iget-boolean v1, p0, Lso;->i:Z

    .line 4
    .line 5
    iget-object v2, p0, Lso;->a:Ljava/util/ArrayList;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v1, :cond_5

    .line 9
    .line 10
    iget-boolean v1, p0, Lso;->h:Z

    .line 11
    .line 12
    if-nez v1, :cond_5

    .line 13
    .line 14
    invoke-static {p0}, La31;->O(Lso;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_5

    .line 19
    .line 20
    invoke-static {v2}, Lzr;->x(Ljava/util/List;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lck2;

    .line 25
    .line 26
    if-eqz v1, :cond_5

    .line 27
    .line 28
    iget v1, v1, Lck2;->a:I

    .line 29
    .line 30
    if-ne v1, v0, :cond_5

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocused()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_5

    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_5

    .line 43
    .line 44
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_5

    .line 49
    .line 50
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isVisibleToUser()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_5

    .line 55
    .line 56
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_5

    .line 61
    .line 62
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getWindowId()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-ne v1, v0, :cond_5

    .line 67
    .line 68
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    if-eqz v1, :cond_0

    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    goto :goto_0

    .line 79
    :cond_0
    const/4 v1, 0x0

    .line 80
    :goto_0
    iget-object v4, p1, Ll12;->c:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v1, v4}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_5

    .line 87
    .line 88
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object p1, p1, Ll12;->n:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {v1, p1}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_1

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_1
    invoke-static {v2}, Lzr;->x(Ljava/util/List;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    check-cast p1, Lck2;

    .line 112
    .line 113
    if-eqz p1, :cond_5

    .line 114
    .line 115
    iget-object p1, p1, Lck2;->f:Lbk2;

    .line 116
    .line 117
    if-eqz p1, :cond_5

    .line 118
    .line 119
    iget p1, p1, Lbk2;->a:I

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Lso;->a(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    if-nez p0, :cond_2

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_2
    const/4 p1, 0x1

    .line 129
    invoke-virtual {p0, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->findFocus(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    if-nez p0, :cond_3

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_3
    :try_start_0
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p2

    .line 140
    if-eqz p2, :cond_4

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getWindowId()I

    .line 143
    .line 144
    .line 145
    move-result p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    if-ne p2, v0, :cond_4

    .line 147
    .line 148
    move v3, p1

    .line 149
    goto :goto_1

    .line 150
    :catchall_0
    move-exception p1

    .line 151
    goto :goto_2

    .line 152
    :cond_4
    :goto_1
    invoke-static {p0}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 153
    .line 154
    .line 155
    return v3

    .line 156
    :goto_2
    invoke-static {p0}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 157
    .line 158
    .line 159
    throw p1

    .line 160
    :cond_5
    :goto_3
    return v3
.end method

.method public static o()Lhp1;
    .locals 1

    .line 1
    sget-object v0, Luf3;->f:Lzk0;

    .line 2
    .line 3
    invoke-interface {v0}, Lzk0;->invoke()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lhp1;

    .line 8
    .line 9
    return-object v0
.end method

.method public static q(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 3

    .line 1
    sget-object v0, Lv12;->a:Lqv1;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getHintText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object v0, v1

    .line 16
    :goto_0
    invoke-static {v0}, Lv12;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_3

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isShowingHintText()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move-object v0, v1

    .line 40
    :goto_1
    invoke-static {v0}, Lv12;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    move-object v0, v1

    .line 46
    :cond_3
    :goto_2
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_6

    .line 51
    .line 52
    sget-object v2, Lw32;->a:Ljava/util/List;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getContentDescription()Ljava/lang/CharSequence;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    if-eqz v2, :cond_4

    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    :cond_4
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getViewIdResourceName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {v0, v1, p0}, Lw32;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    if-eqz p0, :cond_5

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :cond_5
    const/4 p0, 0x0

    .line 76
    return p0

    .line 77
    :cond_6
    :goto_3
    const/4 p0, 0x1

    .line 78
    return p0
.end method

.method public static t(Lso;Ll12;)Lus0;
    .locals 8

    .line 1
    sget-object v0, Lv12;->a:Lqv1;

    .line 2
    .line 3
    iget-object p0, p0, Lso;->a:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-static {p0}, Lv12;->l(Ljava/util/List;)Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    move-object v4, v1

    .line 16
    move v3, v2

    .line 17
    :cond_0
    :goto_0
    if-ge v3, v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    add-int/lit8 v3, v3, 0x1

    .line 24
    .line 25
    move-object v6, v5

    .line 26
    check-cast v6, Lus0;

    .line 27
    .line 28
    iget-object v6, v6, Lus0;->a:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v7, p1, Ll12;->p:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    if-eqz v6, :cond_0

    .line 37
    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    const/4 v2, 0x1

    .line 42
    move-object v4, v5

    .line 43
    goto :goto_0

    .line 44
    :cond_2
    if-nez v2, :cond_3

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_3
    move-object v1, v4

    .line 48
    :goto_1
    check-cast v1, Lus0;

    .line 49
    .line 50
    return-object v1
.end method

.method public static u(Lso;)Lc12;
    .locals 12

    .line 1
    new-instance v0, Lc12;

    .line 2
    .line 3
    iget-object v1, p0, Lso;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lso;->a:Ljava/util/ArrayList;

    .line 6
    .line 7
    iget-object v3, p0, Lso;->d:Lqe;

    .line 8
    .line 9
    iget-object v4, p0, Lso;->c:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {p0}, La31;->O(Lso;)Z

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    iget-boolean v6, p0, Lso;->h:Z

    .line 16
    .line 17
    const/4 v7, 0x0

    .line 18
    if-nez v6, :cond_1

    .line 19
    .line 20
    iget-boolean p0, p0, Lso;->i:Z

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v6, v7

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 28
    move v6, p0

    .line 29
    :goto_1
    sget-object p0, Lv12;->a:Lqv1;

    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    move p0, v7

    .line 35
    new-instance v7, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v8

    .line 44
    :cond_2
    :goto_2
    if-ge p0, v8, :cond_3

    .line 45
    .line 46
    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v9

    .line 50
    add-int/lit8 p0, p0, 0x1

    .line 51
    .line 52
    check-cast v9, Lck2;

    .line 53
    .line 54
    iget-object v10, v9, Lck2;->f:Lbk2;

    .line 55
    .line 56
    if-eqz v10, :cond_2

    .line 57
    .line 58
    const/4 v11, 0x0

    .line 59
    invoke-static {v10, v9, v11}, Lv12;->h(Lbk2;Lck2;Ljava/lang/String;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v9

    .line 63
    invoke-static {v7, v9}, Lv12;->q(Ljava/util/ArrayList;Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_3
    invoke-direct/range {v0 .. v7}, Lc12;-><init>(Ljava/lang/String;Ljava/util/ArrayList;Lqe;Ljava/lang/Boolean;ZZLjava/util/ArrayList;)V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method

.method public static x(Landroid/view/accessibility/AccessibilityNodeInfo;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->getActionList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getId()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const v1, 0x8000

    .line 36
    .line 37
    .line 38
    if-ne v0, v1, :cond_1

    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public static final z(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lso;ZLjava/util/Set;Ljava/util/ArrayList;)Ldk0;
    .locals 15

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    sget-object v1, Lv12;->a:Lqv1;

    .line 4
    .line 5
    iget-object v1, v0, Lso;->d:Lqe;

    .line 6
    .line 7
    invoke-virtual {v1}, Lqe;->d()I

    .line 8
    .line 9
    .line 10
    move-result v6

    .line 11
    invoke-virtual {v1}, Lqe;->c()I

    .line 12
    .line 13
    .line 14
    move-result v7

    .line 15
    iget-object v8, v0, Lso;->c:Ljava/lang/Boolean;

    .line 16
    .line 17
    iget-object v9, v0, Lso;->a:Ljava/util/ArrayList;

    .line 18
    .line 19
    new-instance v12, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-static/range {p6 .. p6}, Lbs;->k(Ljava/lang/Iterable;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-direct {v12, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual/range {p6 .. p6}, Ljava/util/ArrayList;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/4 v2, 0x0

    .line 33
    move v3, v2

    .line 34
    :goto_0
    if-ge v3, v1, :cond_0

    .line 35
    .line 36
    move-object/from16 v4, p6

    .line 37
    .line 38
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    add-int/lit8 v3, v3, 0x1

    .line 43
    .line 44
    check-cast v5, Lue1;

    .line 45
    .line 46
    iget-object v5, v5, Lue1;->U:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v5, Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object v0, v0, Lso;->k:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    const/4 v2, 0x1

    .line 59
    :cond_1
    move v13, v2

    .line 60
    new-instance v2, Lw12;

    .line 61
    .line 62
    const/16 v14, 0x800

    .line 63
    .line 64
    move-object v3, p0

    .line 65
    move-object/from16 v4, p1

    .line 66
    .line 67
    move-object/from16 v5, p2

    .line 68
    .line 69
    move/from16 v10, p4

    .line 70
    .line 71
    move-object/from16 v11, p5

    .line 72
    .line 73
    invoke-direct/range {v2 .. v14}, Lw12;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/Boolean;Ljava/util/List;ZLjava/util/Set;Ljava/util/ArrayList;ZI)V

    .line 74
    .line 75
    .line 76
    invoke-static {v2}, Lv12;->k(Lw12;)Ldk0;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method


# virtual methods
.method public final B()Z
    .locals 2

    .line 1
    sget-object v0, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->h0:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 2
    .line 3
    sget-object v0, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->h0:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 4
    .line 5
    iget-object v1, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    sget-object v0, Luf3;->a:La31;

    .line 10
    .line 11
    if-ne v0, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final C(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;JZ)Ljava/lang/String;
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x5dc

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    :goto_0
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->refresh()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/4 v3, 0x0

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    return-object v3

    .line 16
    :cond_0
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isShowingHintText()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object v4, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 21
    .line 22
    const-string v5, ""

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getText()Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    :cond_2
    if-nez v3, :cond_3

    .line 38
    .line 39
    move-object v3, v5

    .line 40
    :cond_3
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_5

    .line 45
    .line 46
    iget-object v2, v4, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->U:Lb20;

    .line 47
    .line 48
    invoke-virtual {v2, p1}, Lb20;->o(Landroid/view/accessibility/AccessibilityNodeInfo;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    if-nez v2, :cond_4

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_4
    move-object v5, v2

    .line 56
    goto :goto_1

    .line 57
    :cond_5
    move-object v5, v3

    .line 58
    :goto_1
    invoke-static {v5, p2, p5}, Lyb4;->c(Ljava/lang/String;Ljava/lang/String;Z)Lav1;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    sget-object v3, Lav1;->SAME:Lav1;

    .line 63
    .line 64
    if-eq v2, v3, :cond_7

    .line 65
    .line 66
    sget-object v3, Lav1;->FORMATTED:Lav1;

    .line 67
    .line 68
    if-eq v2, v3, :cond_7

    .line 69
    .line 70
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    cmp-long v2, v2, v0

    .line 75
    .line 76
    if-gtz v2, :cond_7

    .line 77
    .line 78
    invoke-virtual {p0, p3, p4}, La31;->f(J)Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_6

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_6
    iget-object v2, v4, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 86
    .line 87
    new-instance v3, Lp21;

    .line 88
    .line 89
    const/4 v4, 0x0

    .line 90
    invoke-direct {v3, p0, p3, p4, v4}, Lp21;-><init>(La31;JI)V

    .line 91
    .line 92
    .line 93
    const-wide/16 v4, 0x64

    .line 94
    .line 95
    invoke-virtual {v2, v4, v5, v3}, Lfb0;->a(JLzk0;)V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_7
    :goto_2
    return-object v5
.end method

.method public final D(Lx21;)Lv2;
    .locals 9

    .line 1
    invoke-static {}, La31;->o()Lhp1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lx21;->b:Ll12;

    .line 6
    .line 7
    iget-object p1, p1, Lx21;->a:Ly21;

    .line 8
    .line 9
    iget-object v2, v1, Ll12;->c:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, La31;->d:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v2, p0}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    iget-boolean p0, p1, Ly21;->f:Z

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    :cond_0
    iget-boolean p0, v0, Lhp1;->c:Z

    .line 24
    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    new-instance v2, Lv2;

    .line 28
    .line 29
    const/4 v7, 0x0

    .line 30
    const/16 v8, 0x7c

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    const-string v4, "\u8fd9\u662f DSH \u81ea\u5df1\u7684\u754c\u9762\uff0c\u4e0d\u64cd\u4f5c\u3002"

    .line 34
    .line 35
    const/4 v5, 0x0

    .line 36
    const/4 v6, 0x0

    .line 37
    invoke-direct/range {v2 .. v8}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 38
    .line 39
    .line 40
    return-object v2

    .line 41
    :cond_1
    iget-boolean p0, p1, Ly21;->e:Z

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    iget-boolean p0, v0, Lhp1;->a:Z

    .line 46
    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    new-instance v2, Lv2;

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    const/16 v8, 0x7c

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    const-string v4, "\u8fd9\u662f\u7cfb\u7edf\u6743\u9650 / \u5b89\u5168\u76f8\u5173\u9875\u9762\uff0cDSH \u4e0d\u5728\u8fd9\u91cc\u70b9\u51fb\u6216\u8f93\u5165\u3002\u9700\u8981\u7684\u8bdd\u8bf7\u7528 handoff \u4ea4\u7ed9\u7528\u6237\u3002"

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    const/4 v6, 0x0

    .line 59
    invoke-direct/range {v2 .. v8}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 60
    .line 61
    .line 62
    return-object v2

    .line 63
    :cond_2
    iget-boolean p0, v1, Ll12;->j:Z

    .line 64
    .line 65
    if-nez p0, :cond_3

    .line 66
    .line 67
    iget-boolean p0, v1, Ll12;->k:Z

    .line 68
    .line 69
    if-eqz p0, :cond_4

    .line 70
    .line 71
    :cond_3
    iget-boolean p0, v0, Lhp1;->b:Z

    .line 72
    .line 73
    if-nez p0, :cond_4

    .line 74
    .line 75
    new-instance v0, Lv2;

    .line 76
    .line 77
    const/4 v5, 0x0

    .line 78
    const/16 v6, 0x7c

    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    const-string v2, "\u8fd9\u662f\u5bc6\u7801 / \u9a8c\u8bc1\u7801\u4e00\u7c7b\u7684\u8f93\u5165\u6846\uff0cDSH \u4e0d\u66ff\u7528\u6237\u70b9\u6216\u586b\u3002\u8bf7\u7528 handoff \u8ba9\u7528\u6237\u81ea\u5df1\u6765\u3002"

    .line 82
    .line 83
    const/4 v3, 0x0

    .line 84
    const/4 v4, 0x0

    .line 85
    invoke-direct/range {v0 .. v6}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 86
    .line 87
    .line 88
    return-object v0

    .line 89
    :cond_4
    const/4 p0, 0x0

    .line 90
    return-object p0
.end method

.method public final F(ILjava/lang/String;Z)Ljava/lang/Object;
    .locals 11

    .line 1
    iget-object v1, p0, La31;->p:Ly21;

    .line 2
    .line 3
    if-eqz v1, :cond_7

    .line 4
    .line 5
    iget-object v0, v1, Ly21;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_4

    .line 14
    .line 15
    :cond_0
    iget-object v0, v1, Ly21;->b:Ldk0;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ldk0;->a(I)Ll12;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    new-instance v3, Lv2;

    .line 24
    .line 25
    iget-object p0, v1, Ly21;->b:Ldk0;

    .line 26
    .line 27
    iget-object p0, p0, Ldk0;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const-string p3, " \u91cc\u6ca1\u6709\u7f16\u53f7 "

    .line 36
    .line 37
    const-string v0, "\uff08\u5171 "

    .line 38
    .line 39
    const-string v1, "\u5c4f\u5e55 "

    .line 40
    .line 41
    invoke-static {p1, v1, p2, p3, v0}, Lez;->q(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string p2, " \u9879\uff09\u3002"

    .line 46
    .line 47
    invoke-static {p1, p0, p2}, Lez;->o(Ljava/lang/StringBuilder;ILjava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    const/4 v8, 0x0

    .line 52
    const/16 v9, 0x7c

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    const/4 v6, 0x0

    .line 56
    const/4 v7, 0x0

    .line 57
    invoke-direct/range {v3 .. v9}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 58
    .line 59
    .line 60
    return-object v3

    .line 61
    :cond_1
    const/4 p2, 0x1

    .line 62
    const/4 v0, 0x0

    .line 63
    if-eqz p3, :cond_2

    .line 64
    .line 65
    iget-object p3, v2, Ll12;->c:Ljava/lang/String;

    .line 66
    .line 67
    const-string v3, "net.gsantner.markor"

    .line 68
    .line 69
    invoke-static {p3, v3}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-eqz p3, :cond_2

    .line 74
    .line 75
    move p3, p2

    .line 76
    goto :goto_0

    .line 77
    :cond_2
    move p3, v0

    .line 78
    :goto_0
    const-wide/16 v3, 0x0

    .line 79
    .line 80
    invoke-static {p0, v3, v4, p3, p2}, La31;->h(La31;JZI)Lso;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-static {v3, v2}, La31;->t(Lso;Ll12;)Lus0;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    if-eqz v5, :cond_3

    .line 89
    .line 90
    iget p2, v5, Lus0;->b:I

    .line 91
    .line 92
    invoke-virtual {v3, p2}, Lso;->a(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    :goto_1
    move-object v4, p2

    .line 97
    goto :goto_2

    .line 98
    :cond_3
    const/4 p2, 0x0

    .line 99
    goto :goto_1

    .line 100
    :goto_2
    if-eqz v5, :cond_5

    .line 101
    .line 102
    if-nez v4, :cond_4

    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_4
    new-instance v0, Lx21;

    .line 106
    .line 107
    invoke-direct/range {v0 .. v5}, Lx21;-><init>(Ly21;Ll12;Lso;Landroid/view/accessibility/AccessibilityNodeInfo;Lus0;)V

    .line 108
    .line 109
    .line 110
    return-object v0

    .line 111
    :cond_5
    :goto_3
    :try_start_0
    invoke-virtual {p0, v3, v0}, La31;->y(Lso;Z)Ly21;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-static {p0}, La31;->L(Ly21;)Lh22;

    .line 116
    .line 117
    .line 118
    move-result-object v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    invoke-virtual {v3}, Lso;->b()V

    .line 120
    .line 121
    .line 122
    iget-object p0, v2, Ll12;->g:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    if-nez p2, :cond_6

    .line 129
    .line 130
    iget-object p0, v2, Ll12;->f:Ljava/lang/String;

    .line 131
    .line 132
    :cond_6
    const/16 p2, 0x18

    .line 133
    .line 134
    invoke-static {p2, p0}, Lv12;->e(ILjava/lang/String;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    new-instance p2, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string p3, "\u76ee\u6807 ["

    .line 141
    .line 142
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    const-string p1, "]\u300c"

    .line 149
    .line 150
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string p0, "\u300d\u53d8\u4e86\uff0c\u6ca1\u6709\u6267\u884c\uff1b\u770b\u65b0\u5c4f\u5e55\u518d\u9009\u3002"

    .line 157
    .line 158
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v6

    .line 165
    new-instance v4, Lv2;

    .line 166
    .line 167
    const/4 v5, 0x0

    .line 168
    const/4 v8, 0x0

    .line 169
    const/4 v9, 0x0

    .line 170
    const/16 v10, 0x78

    .line 171
    .line 172
    invoke-direct/range {v4 .. v10}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 173
    .line 174
    .line 175
    return-object v4

    .line 176
    :catchall_0
    move-exception v0

    .line 177
    move-object p0, v0

    .line 178
    invoke-virtual {v3}, Lso;->b()V

    .line 179
    .line 180
    .line 181
    throw p0

    .line 182
    :cond_7
    :goto_4
    invoke-virtual {p0}, La31;->v()Lh22;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    if-nez v1, :cond_8

    .line 187
    .line 188
    const-string p0, "\u8fd8\u6ca1\u6709\u8bfb\u8fc7\u5c4f\u5e55\uff0c\u5148\u7528 screen \u770b\u4e00\u4e0b\u3002"

    .line 189
    .line 190
    :goto_5
    move-object v4, p0

    .line 191
    goto :goto_6

    .line 192
    :cond_8
    if-eqz v5, :cond_9

    .line 193
    .line 194
    iget-object p0, v5, Lh22;->a:Ljava/lang/String;

    .line 195
    .line 196
    if-nez p0, :cond_a

    .line 197
    .line 198
    :cond_9
    iget-object p0, v1, Ly21;->a:Ljava/lang/String;

    .line 199
    .line 200
    :cond_a
    const-string p1, " \u8fc7\u671f\u4e86\uff08\u6700\u65b0 "

    .line 201
    .line 202
    const-string p3, "\uff09\uff0c\u6ca1\u6709\u6267\u884c\u3002\u6309\u65b0\u5c4f\u5e55\u7684\u7f16\u53f7\u6765\u3002"

    .line 203
    .line 204
    const-string v0, "\u5c4f\u5e55\u7f16\u53f7 "

    .line 205
    .line 206
    invoke-static {v0, p2, p1, p0, p3}, Lez;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    goto :goto_5

    .line 211
    :goto_6
    new-instance v2, Lv2;

    .line 212
    .line 213
    const/4 v7, 0x0

    .line 214
    const/16 v8, 0x78

    .line 215
    .line 216
    const/4 v3, 0x0

    .line 217
    const/4 v6, 0x0

    .line 218
    invoke-direct/range {v2 .. v8}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 219
    .line 220
    .line 221
    return-object v2
.end method

.method public final G()Lqe;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, La31;->l:Landroid/hardware/display/DisplayManager;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v1}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    new-instance p0, Lqe;

    .line 19
    .line 20
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    if-ge v2, v3, :cond_1

    .line 24
    .line 25
    move v2, v3

    .line 26
    :cond_1
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 27
    .line 28
    if-ge v0, v3, :cond_2

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    move v3, v0

    .line 32
    :goto_0
    invoke-direct {p0, v1, v1, v2, v3}, Lqe;-><init>(IIII)V

    .line 33
    .line 34
    .line 35
    return-object p0
.end method

.method public final H(Lzh1;JLzk0;Lbl0;)Lv2;
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v5, p5

    .line 6
    .line 7
    iget-object v8, v0, La31;->p:Ly21;

    .line 8
    .line 9
    iget-object v2, v1, Lzh1;->c:Lwh1;

    .line 10
    .line 11
    sget-object v3, Lz21;->a:[I

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    aget v2, v3, v2

    .line 18
    .line 19
    const/4 v3, 0x3

    .line 20
    const/4 v4, 0x0

    .line 21
    const/4 v6, 0x1

    .line 22
    if-eq v2, v6, :cond_3

    .line 23
    .line 24
    const/4 v7, 0x2

    .line 25
    if-eq v2, v7, :cond_2

    .line 26
    .line 27
    if-eq v2, v3, :cond_1

    .line 28
    .line 29
    const/4 v7, 0x4

    .line 30
    if-ne v2, v7, :cond_0

    .line 31
    .line 32
    const-string v2, "\u5411\u53f3"

    .line 33
    .line 34
    :goto_0
    move-object v9, v2

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-static {}, Ll;->r()V

    .line 37
    .line 38
    .line 39
    return-object v4

    .line 40
    :cond_1
    const-string v2, "\u5411\u5de6"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    const-string v2, "\u5411\u4e0a"

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_3
    const-string v2, "\u5411\u4e0b"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :goto_1
    iget-object v2, v1, Lzh1;->b:Ljava/lang/Integer;

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    if-eqz v2, :cond_5

    .line 53
    .line 54
    if-eqz v8, :cond_5

    .line 55
    .line 56
    iget-object v10, v8, Ly21;->a:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v11, v1, Lzh1;->a:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v10

    .line 64
    if-eqz v10, :cond_5

    .line 65
    .line 66
    iget-object v10, v8, Ly21;->b:Ldk0;

    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v11

    .line 72
    invoke-virtual {v10, v11}, Ldk0;->a(I)Ll12;

    .line 73
    .line 74
    .line 75
    move-result-object v10

    .line 76
    if-eqz v10, :cond_d

    .line 77
    .line 78
    iget-object v11, v10, Ll12;->e:Lj90;

    .line 79
    .line 80
    sget-object v12, Lj90;->LIST:Lj90;

    .line 81
    .line 82
    if-eq v11, v12, :cond_d

    .line 83
    .line 84
    iget-object v10, v10, Ll12;->o:Ljava/lang/Integer;

    .line 85
    .line 86
    if-nez v10, :cond_4

    .line 87
    .line 88
    goto/16 :goto_4

    .line 89
    .line 90
    :cond_4
    move-object v2, v10

    .line 91
    goto/16 :goto_4

    .line 92
    .line 93
    :cond_5
    if-nez v2, :cond_d

    .line 94
    .line 95
    if-eqz v8, :cond_d

    .line 96
    .line 97
    iget-object v10, v8, Ly21;->a:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v11, v1, Lzh1;->a:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v10, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v10

    .line 105
    if-eqz v10, :cond_d

    .line 106
    .line 107
    iget-object v2, v8, Ly21;->b:Ldk0;

    .line 108
    .line 109
    iget-object v2, v2, Ldk0;->a:Ljava/lang/Object;

    .line 110
    .line 111
    check-cast v2, Ljava/util/ArrayList;

    .line 112
    .line 113
    new-instance v10, Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 119
    .line 120
    .line 121
    move-result v11

    .line 122
    move v12, v7

    .line 123
    :cond_6
    :goto_2
    if-ge v12, v11, :cond_7

    .line 124
    .line 125
    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v13

    .line 129
    add-int/lit8 v12, v12, 0x1

    .line 130
    .line 131
    move-object v14, v13

    .line 132
    check-cast v14, Ll12;

    .line 133
    .line 134
    iget-object v14, v14, Ll12;->e:Lj90;

    .line 135
    .line 136
    sget-object v15, Lj90;->LIST:Lj90;

    .line 137
    .line 138
    if-ne v14, v15, :cond_6

    .line 139
    .line 140
    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_7
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 145
    .line 146
    .line 147
    move-result-object v10

    .line 148
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-nez v2, :cond_8

    .line 153
    .line 154
    move-object v2, v4

    .line 155
    goto :goto_3

    .line 156
    :cond_8
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 161
    .line 162
    .line 163
    move-result v11

    .line 164
    if-nez v11, :cond_9

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_9
    move-object v11, v2

    .line 168
    check-cast v11, Ll12;

    .line 169
    .line 170
    iget-object v11, v11, Ll12;->h:Lqe;

    .line 171
    .line 172
    invoke-virtual {v11}, Lqe;->a()J

    .line 173
    .line 174
    .line 175
    move-result-wide v11

    .line 176
    :cond_a
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v13

    .line 180
    move-object v14, v13

    .line 181
    check-cast v14, Ll12;

    .line 182
    .line 183
    iget-object v14, v14, Ll12;->h:Lqe;

    .line 184
    .line 185
    invoke-virtual {v14}, Lqe;->a()J

    .line 186
    .line 187
    .line 188
    move-result-wide v14

    .line 189
    cmp-long v16, v11, v14

    .line 190
    .line 191
    if-gez v16, :cond_b

    .line 192
    .line 193
    move-object v2, v13

    .line 194
    move-wide v11, v14

    .line 195
    :cond_b
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 196
    .line 197
    .line 198
    move-result v13

    .line 199
    if-nez v13, :cond_a

    .line 200
    .line 201
    :goto_3
    check-cast v2, Ll12;

    .line 202
    .line 203
    if-eqz v2, :cond_c

    .line 204
    .line 205
    iget v2, v2, Ll12;->a:I

    .line 206
    .line 207
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    goto :goto_4

    .line 212
    :cond_c
    move-object v2, v4

    .line 213
    :cond_d
    :goto_4
    const-string v10, "\u5df2\u63d0\u4ea4"

    .line 214
    .line 215
    if-nez v2, :cond_1c

    .line 216
    .line 217
    if-eqz v8, :cond_1b

    .line 218
    .line 219
    iget-object v2, v8, Ly21;->a:Ljava/lang/String;

    .line 220
    .line 221
    iget-object v11, v1, Lzh1;->a:Ljava/lang/String;

    .line 222
    .line 223
    invoke-virtual {v2, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    if-nez v2, :cond_e

    .line 228
    .line 229
    move-object v3, v0

    .line 230
    goto/16 :goto_d

    .line 231
    .line 232
    :cond_e
    const-wide/16 v11, 0x0

    .line 233
    .line 234
    invoke-static {v0, v11, v12, v7, v3}, La31;->h(La31;JZI)Lso;

    .line 235
    .line 236
    .line 237
    move-result-object v11

    .line 238
    :try_start_0
    iget-boolean v2, v11, Lso;->f:Z

    .line 239
    .line 240
    if-eqz v2, :cond_f

    .line 241
    .line 242
    invoke-static {}, La31;->o()Lhp1;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    iget-boolean v2, v2, Lhp1;->c:Z

    .line 247
    .line 248
    if-nez v2, :cond_f

    .line 249
    .line 250
    new-instance v12, Lv2;

    .line 251
    .line 252
    const-string v14, "\u8fd9\u662f DSH \u81ea\u5df1\u7684\u754c\u9762\uff0c\u4e0d\u64cd\u4f5c\u3002"

    .line 253
    .line 254
    const/16 v17, 0x0

    .line 255
    .line 256
    const/16 v18, 0x7c

    .line 257
    .line 258
    const/4 v13, 0x0

    .line 259
    const/4 v15, 0x0

    .line 260
    const/16 v16, 0x0

    .line 261
    .line 262
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    .line 264
    .line 265
    invoke-virtual {v11}, Lso;->b()V

    .line 266
    .line 267
    .line 268
    return-object v12

    .line 269
    :catchall_0
    move-exception v0

    .line 270
    goto/16 :goto_c

    .line 271
    .line 272
    :cond_f
    :try_start_1
    invoke-static {v11}, La31;->O(Lso;)Z

    .line 273
    .line 274
    .line 275
    move-result v2

    .line 276
    if-eqz v2, :cond_10

    .line 277
    .line 278
    new-instance v12, Lv2;

    .line 279
    .line 280
    const-string v14, "\u8fd9\u4e00\u5c4f\u8bfb\u4e0d\u5230\u5185\u5bb9\uff08\u53ef\u80fd\u53d7\u654f\u611f\u89c6\u56fe\u7b56\u7565\u9650\u5236\uff09\uff0c\u6309\u622a\u56fe\u5750\u6807\u76f4\u63a5\u6ed1\u3002"

    .line 281
    .line 282
    invoke-virtual {v0, v11, v7}, La31;->y(Lso;Z)Ly21;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-static {v0}, La31;->L(Ly21;)Lh22;

    .line 287
    .line 288
    .line 289
    move-result-object v15

    .line 290
    const/16 v17, 0x0

    .line 291
    .line 292
    const/16 v18, 0x78

    .line 293
    .line 294
    const/4 v13, 0x0

    .line 295
    const/16 v16, 0x0

    .line 296
    .line 297
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 298
    .line 299
    .line 300
    invoke-virtual {v11}, Lso;->b()V

    .line 301
    .line 302
    .line 303
    return-object v12

    .line 304
    :cond_10
    :try_start_2
    invoke-static {v11}, La31;->u(Lso;)Lc12;

    .line 305
    .line 306
    .line 307
    move-result-object v2

    .line 308
    iget-object v3, v8, Ly21;->i:Lc12;

    .line 309
    .line 310
    invoke-virtual {v2, v3}, Lc12;->c(Lc12;)Z

    .line 311
    .line 312
    .line 313
    move-result v3

    .line 314
    if-nez v3, :cond_13

    .line 315
    .line 316
    iget-boolean v1, v2, Lc12;->c:Z

    .line 317
    .line 318
    if-nez v1, :cond_12

    .line 319
    .line 320
    iget-object v1, v8, Ly21;->i:Lc12;

    .line 321
    .line 322
    iget-boolean v1, v1, Lc12;->c:Z

    .line 323
    .line 324
    if-eqz v1, :cond_11

    .line 325
    .line 326
    goto :goto_6

    .line 327
    :cond_11
    const-string v1, "\u65e0\u6cd5\u786e\u8ba4\u5f53\u524d\u754c\u9762\u4ecd\u4e0e\u4e0a\u4e00\u5c4f\u4e00\u81f4\uff0c\u6ca1\u6709\u6eda\u52a8\u3002\u8bf7\u5148\u770b\u65b0\u5c4f\u5e55\u3002"

    .line 328
    .line 329
    :goto_5
    move-object v14, v1

    .line 330
    goto :goto_7

    .line 331
    :cond_12
    :goto_6
    const-string v1, "\u5f53\u524d\u6216\u4e0a\u6b21\u89c2\u5bdf\u542b\u5bc6\u7801 / \u9a8c\u8bc1\u7801 / \u652f\u4ed8\u6846\uff0c\u4e0d\u6309\u5750\u6807\u6ed1\u52a8\u3002\u8bf7 handoff \u4ea4\u7ed9\u7528\u6237\u3002"

    .line 332
    .line 333
    goto :goto_5

    .line 334
    :goto_7
    new-instance v12, Lv2;

    .line 335
    .line 336
    invoke-virtual {v0, v11, v7}, La31;->y(Lso;Z)Ly21;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    invoke-static {v0}, La31;->L(Ly21;)Lh22;

    .line 341
    .line 342
    .line 343
    move-result-object v15

    .line 344
    const/16 v17, 0x0

    .line 345
    .line 346
    const/16 v18, 0x78

    .line 347
    .line 348
    const/4 v13, 0x0

    .line 349
    const/16 v16, 0x0

    .line 350
    .line 351
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 352
    .line 353
    .line 354
    invoke-virtual {v11}, Lso;->b()V

    .line 355
    .line 356
    .line 357
    return-object v12

    .line 358
    :cond_13
    :try_start_3
    iget-object v2, v11, Lso;->a:Ljava/util/ArrayList;

    .line 359
    .line 360
    new-instance v3, Ljava/util/ArrayList;

    .line 361
    .line 362
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 363
    .line 364
    .line 365
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 366
    .line 367
    .line 368
    move-result v12

    .line 369
    move v13, v7

    .line 370
    :cond_14
    :goto_8
    if-ge v13, v12, :cond_15

    .line 371
    .line 372
    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v14

    .line 376
    add-int/lit8 v13, v13, 0x1

    .line 377
    .line 378
    check-cast v14, Lck2;

    .line 379
    .line 380
    iget-object v14, v14, Lck2;->c:Ljava/lang/String;

    .line 381
    .line 382
    if-eqz v14, :cond_14

    .line 383
    .line 384
    invoke-virtual {v3, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    goto :goto_8

    .line 388
    :cond_15
    invoke-static {v3}, Lzr;->X(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 389
    .line 390
    .line 391
    move-result-object v2

    .line 392
    invoke-interface/range {p4 .. p4}, Lzk0;->invoke()Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    move-result-object v3

    .line 396
    check-cast v3, Ljava/lang/Boolean;

    .line 397
    .line 398
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 399
    .line 400
    .line 401
    move-result v3

    .line 402
    if-eqz v3, :cond_16

    .line 403
    .line 404
    invoke-interface {v5, v2}, Lbl0;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    .line 406
    .line 407
    move-result-object v3

    .line 408
    check-cast v3, Ljava/lang/Boolean;

    .line 409
    .line 410
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 411
    .line 412
    .line 413
    move-result v3

    .line 414
    if-eqz v3, :cond_16

    .line 415
    .line 416
    goto :goto_9

    .line 417
    :cond_16
    new-instance v12, Lv2;

    .line 418
    .line 419
    const-string v14, "\u672c\u4efb\u52a1\u5df2\u6682\u505c\u6216\u505c\u6b62\uff0c\u6ca1\u6709\u7ee7\u7eed\u64cd\u4f5c\u3002"

    .line 420
    .line 421
    const/16 v17, 0x0

    .line 422
    .line 423
    const/16 v18, 0x7c

    .line 424
    .line 425
    const/4 v13, 0x0

    .line 426
    const/4 v15, 0x0

    .line 427
    const/16 v16, 0x0

    .line 428
    .line 429
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 430
    .line 431
    .line 432
    move-object v4, v12

    .line 433
    :goto_9
    if-eqz v4, :cond_17

    .line 434
    .line 435
    invoke-virtual {v11}, Lso;->b()V

    .line 436
    .line 437
    .line 438
    return-object v4

    .line 439
    :cond_17
    :try_start_4
    iget-object v12, v11, Lso;->d:Lqe;

    .line 440
    .line 441
    iget-object v3, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 442
    .line 443
    iget-object v3, v3, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 444
    .line 445
    iget-wide v13, v3, Lfb0;->b:J

    .line 446
    .line 447
    iget-object v15, v0, La31;->e:Lr3;

    .line 448
    .line 449
    iget-object v3, v1, Lzh1;->c:Lwh1;

    .line 450
    .line 451
    sget-object v4, Lwh1;->LEFT:Lwh1;

    .line 452
    .line 453
    if-eq v3, v4, :cond_19

    .line 454
    .line 455
    sget-object v4, Lwh1;->RIGHT:Lwh1;

    .line 456
    .line 457
    if-ne v3, v4, :cond_18

    .line 458
    .line 459
    goto :goto_a

    .line 460
    :cond_18
    move/from16 v16, v7

    .line 461
    .line 462
    goto :goto_b

    .line 463
    :cond_19
    :goto_a
    move/from16 v16, v6

    .line 464
    .line 465
    :goto_b
    new-instance v3, Lqe;

    .line 466
    .line 467
    iget v4, v12, Lqe;->a:I

    .line 468
    .line 469
    iget v6, v12, Lqe;->b:I

    .line 470
    .line 471
    invoke-virtual {v12}, Lqe;->c()I

    .line 472
    .line 473
    .line 474
    move-result v7

    .line 475
    div-int/lit8 v7, v7, 0x5

    .line 476
    .line 477
    add-int/2addr v6, v7

    .line 478
    iget v7, v12, Lqe;->c:I

    .line 479
    .line 480
    iget v0, v12, Lqe;->d:I

    .line 481
    .line 482
    invoke-virtual {v12}, Lqe;->c()I

    .line 483
    .line 484
    .line 485
    move-result v17

    .line 486
    div-int/lit8 v17, v17, 0x6

    .line 487
    .line 488
    sub-int v0, v0, v17

    .line 489
    .line 490
    invoke-direct {v3, v4, v6, v7, v0}, Lqe;-><init>(IIII)V

    .line 491
    .line 492
    .line 493
    iget-object v0, v1, Lzh1;->c:Lwh1;

    .line 494
    .line 495
    new-instance v19, Lo21;

    .line 496
    .line 497
    const/4 v7, 0x0

    .line 498
    move-object/from16 v1, p0

    .line 499
    .line 500
    move-object/from16 v4, p4

    .line 501
    .line 502
    move-object/from16 v18, v0

    .line 503
    .line 504
    move-object v6, v2

    .line 505
    move-object/from16 v17, v3

    .line 506
    .line 507
    move-object/from16 v0, v19

    .line 508
    .line 509
    move-wide/from16 v2, p2

    .line 510
    .line 511
    invoke-direct/range {v0 .. v7}, Lo21;-><init>(La31;JLzk0;Lbl0;Ljava/util/Set;I)V

    .line 512
    .line 513
    .line 514
    move-wide v1, v13

    .line 515
    const/4 v13, 0x0

    .line 516
    const/4 v14, 0x0

    .line 517
    move-object/from16 v19, v17

    .line 518
    .line 519
    move-object/from16 v17, v12

    .line 520
    .line 521
    move-object v12, v15

    .line 522
    move/from16 v15, v16

    .line 523
    .line 524
    move-object/from16 v16, v19

    .line 525
    .line 526
    move-object/from16 v19, v0

    .line 527
    .line 528
    invoke-virtual/range {v12 .. v19}, Lr3;->K(Landroid/view/accessibility/AccessibilityNodeInfo;IZLqe;Lqe;Lwh1;Lzk0;)Ln3;

    .line 529
    .line 530
    .line 531
    move-result-object v0

    .line 532
    iget-boolean v0, v0, Ln3;->a:Z

    .line 533
    .line 534
    if-nez v0, :cond_1a

    .line 535
    .line 536
    const-string v6, "\u7cfb\u7edf\u672a\u786e\u8ba4\u6ed1\u52a8\u5b8c\u6210\uff0c\u53ef\u80fd\u5df2\u6709\u90e8\u5206\u6548\u679c\uff1b\u8bf7\u5148\u6838\u5bf9\u65b0\u5c4f\u5e55\uff0c\u4e0d\u8981\u76f4\u63a5\u91cd\u8bd5\u3002"

    .line 537
    .line 538
    const/4 v9, 0x0

    .line 539
    const/16 v10, 0x1a0

    .line 540
    .line 541
    const/4 v7, 0x0

    .line 542
    move-object v3, v8

    .line 543
    const/4 v8, 0x0

    .line 544
    move-object/from16 v0, p0

    .line 545
    .line 546
    move-wide/from16 v4, p2

    .line 547
    .line 548
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 549
    .line 550
    .line 551
    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 552
    invoke-virtual {v11}, Lso;->b()V

    .line 553
    .line 554
    .line 555
    return-object v0

    .line 556
    :cond_1a
    move-object v3, v8

    .line 557
    :try_start_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 558
    .line 559
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 560
    .line 561
    .line 562
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    .line 564
    .line 565
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 566
    .line 567
    .line 568
    const-string v4, "\u6ed1\u52a8\u5c4f\u5e55\u3002"

    .line 569
    .line 570
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    .line 572
    .line 573
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 574
    .line 575
    .line 576
    move-result-object v6

    .line 577
    const/4 v9, 0x0

    .line 578
    const/16 v10, 0x1e0

    .line 579
    .line 580
    const/4 v7, 0x0

    .line 581
    const/4 v8, 0x0

    .line 582
    move-object/from16 v0, p0

    .line 583
    .line 584
    move-wide/from16 v4, p2

    .line 585
    .line 586
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 587
    .line 588
    .line 589
    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 590
    invoke-virtual {v11}, Lso;->b()V

    .line 591
    .line 592
    .line 593
    return-object v0

    .line 594
    :goto_c
    invoke-virtual {v11}, Lso;->b()V

    .line 595
    .line 596
    .line 597
    throw v0

    .line 598
    :cond_1b
    move-object/from16 v3, p0

    .line 599
    .line 600
    :goto_d
    new-instance v0, Lv2;

    .line 601
    .line 602
    iget-object v1, v1, Lzh1;->a:Ljava/lang/String;

    .line 603
    .line 604
    const-string v2, "\u5c4f\u5e55\u7f16\u53f7 "

    .line 605
    .line 606
    const-string v4, " \u5df2\u8fc7\u671f\uff0c\u8bf7\u5148\u770b\u65b0\u5c4f\u5e55\u518d\u6eda\u52a8\u3002"

    .line 607
    .line 608
    invoke-static {v2, v1, v4}, Lmo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 609
    .line 610
    .line 611
    move-result-object v2

    .line 612
    invoke-virtual {v3}, La31;->v()Lh22;

    .line 613
    .line 614
    .line 615
    move-result-object v3

    .line 616
    const/4 v5, 0x0

    .line 617
    const/16 v6, 0x78

    .line 618
    .line 619
    const/4 v1, 0x0

    .line 620
    const/4 v4, 0x0

    .line 621
    invoke-direct/range {v0 .. v6}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 622
    .line 623
    .line 624
    return-object v0

    .line 625
    :cond_1c
    move-object v3, v0

    .line 626
    iget-object v0, v1, Lzh1;->a:Ljava/lang/String;

    .line 627
    .line 628
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 629
    .line 630
    .line 631
    move-result v2

    .line 632
    invoke-virtual {v3, v2, v0, v7}, La31;->F(ILjava/lang/String;Z)Ljava/lang/Object;

    .line 633
    .line 634
    .line 635
    move-result-object v0

    .line 636
    instance-of v2, v0, Lx21;

    .line 637
    .line 638
    if-eqz v2, :cond_1d

    .line 639
    .line 640
    move-object v2, v0

    .line 641
    check-cast v2, Lx21;

    .line 642
    .line 643
    move-object v11, v2

    .line 644
    goto :goto_e

    .line 645
    :cond_1d
    move-object v11, v4

    .line 646
    :goto_e
    if-nez v11, :cond_1e

    .line 647
    .line 648
    check-cast v0, Lv2;

    .line 649
    .line 650
    return-object v0

    .line 651
    :cond_1e
    :try_start_6
    iget-object v0, v11, Lx21;->b:Ll12;

    .line 652
    .line 653
    iget-object v0, v0, Ll12;->c:Ljava/lang/String;

    .line 654
    .line 655
    iget-object v2, v3, La31;->d:Ljava/lang/String;

    .line 656
    .line 657
    invoke-static {v0, v2}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 658
    .line 659
    .line 660
    move-result v0

    .line 661
    if-nez v0, :cond_1f

    .line 662
    .line 663
    iget-object v0, v11, Lx21;->a:Ly21;

    .line 664
    .line 665
    iget-boolean v0, v0, Ly21;->f:Z

    .line 666
    .line 667
    if-eqz v0, :cond_20

    .line 668
    .line 669
    goto :goto_f

    .line 670
    :catchall_1
    move-exception v0

    .line 671
    goto/16 :goto_13

    .line 672
    .line 673
    :cond_1f
    :goto_f
    invoke-static {}, La31;->o()Lhp1;

    .line 674
    .line 675
    .line 676
    move-result-object v0

    .line 677
    iget-boolean v0, v0, Lhp1;->c:Z

    .line 678
    .line 679
    if-nez v0, :cond_20

    .line 680
    .line 681
    new-instance v12, Lv2;

    .line 682
    .line 683
    const-string v14, "\u8fd9\u662f DSH \u81ea\u5df1\u7684\u754c\u9762\uff0c\u4e0d\u64cd\u4f5c\u3002"

    .line 684
    .line 685
    const/16 v17, 0x0

    .line 686
    .line 687
    const/16 v18, 0x7c

    .line 688
    .line 689
    const/4 v13, 0x0

    .line 690
    const/4 v15, 0x0

    .line 691
    const/16 v16, 0x0

    .line 692
    .line 693
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 694
    .line 695
    .line 696
    iget-object v0, v11, Lx21;->c:Lso;

    .line 697
    .line 698
    invoke-virtual {v0}, Lso;->b()V

    .line 699
    .line 700
    .line 701
    return-object v12

    .line 702
    :cond_20
    :try_start_7
    iget-object v0, v11, Lx21;->c:Lso;

    .line 703
    .line 704
    iget-object v0, v0, Lso;->a:Ljava/util/ArrayList;

    .line 705
    .line 706
    new-instance v2, Ljava/util/ArrayList;

    .line 707
    .line 708
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 709
    .line 710
    .line 711
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 712
    .line 713
    .line 714
    move-result v6

    .line 715
    :cond_21
    :goto_10
    if-ge v7, v6, :cond_22

    .line 716
    .line 717
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 718
    .line 719
    .line 720
    move-result-object v8

    .line 721
    add-int/lit8 v7, v7, 0x1

    .line 722
    .line 723
    check-cast v8, Lck2;

    .line 724
    .line 725
    iget-object v8, v8, Lck2;->c:Ljava/lang/String;

    .line 726
    .line 727
    if-eqz v8, :cond_21

    .line 728
    .line 729
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 730
    .line 731
    .line 732
    goto :goto_10

    .line 733
    :cond_22
    invoke-static {v2}, Lzr;->X(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 734
    .line 735
    .line 736
    move-result-object v6

    .line 737
    invoke-interface/range {p4 .. p4}, Lzk0;->invoke()Ljava/lang/Object;

    .line 738
    .line 739
    .line 740
    move-result-object v0

    .line 741
    check-cast v0, Ljava/lang/Boolean;

    .line 742
    .line 743
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 744
    .line 745
    .line 746
    move-result v0

    .line 747
    if-eqz v0, :cond_23

    .line 748
    .line 749
    invoke-interface {v5, v6}, Lbl0;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 750
    .line 751
    .line 752
    move-result-object v0

    .line 753
    check-cast v0, Ljava/lang/Boolean;

    .line 754
    .line 755
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 756
    .line 757
    .line 758
    move-result v0

    .line 759
    if-eqz v0, :cond_23

    .line 760
    .line 761
    goto :goto_11

    .line 762
    :cond_23
    new-instance v12, Lv2;

    .line 763
    .line 764
    const-string v14, "\u672c\u4efb\u52a1\u5df2\u6682\u505c\u6216\u505c\u6b62\uff0c\u6ca1\u6709\u7ee7\u7eed\u64cd\u4f5c\u3002"

    .line 765
    .line 766
    const/16 v17, 0x0

    .line 767
    .line 768
    const/16 v18, 0x7c

    .line 769
    .line 770
    const/4 v13, 0x0

    .line 771
    const/4 v15, 0x0

    .line 772
    const/16 v16, 0x0

    .line 773
    .line 774
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 775
    .line 776
    .line 777
    move-object v4, v12

    .line 778
    :goto_11
    if-eqz v4, :cond_24

    .line 779
    .line 780
    iget-object v0, v11, Lx21;->c:Lso;

    .line 781
    .line 782
    invoke-virtual {v0}, Lso;->b()V

    .line 783
    .line 784
    .line 785
    return-object v4

    .line 786
    :cond_24
    :try_start_8
    iget-object v0, v3, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 787
    .line 788
    iget-object v0, v0, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 789
    .line 790
    iget-wide v12, v0, Lfb0;->b:J

    .line 791
    .line 792
    iget-object v14, v3, La31;->e:Lr3;

    .line 793
    .line 794
    iget-object v15, v11, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 795
    .line 796
    iget-object v0, v11, Lx21;->b:Ll12;

    .line 797
    .line 798
    iget v8, v0, Ll12;->l:I

    .line 799
    .line 800
    iget-boolean v2, v0, Ll12;->m:Z

    .line 801
    .line 802
    iget-object v0, v0, Ll12;->h:Lqe;

    .line 803
    .line 804
    iget-object v4, v11, Lx21;->c:Lso;

    .line 805
    .line 806
    iget-object v4, v4, Lso;->d:Lqe;

    .line 807
    .line 808
    iget-object v1, v1, Lzh1;->c:Lwh1;

    .line 809
    .line 810
    new-instance v21, Lo21;

    .line 811
    .line 812
    const/4 v7, 0x1

    .line 813
    move-object/from16 v18, v0

    .line 814
    .line 815
    move-object/from16 v20, v1

    .line 816
    .line 817
    move/from16 v17, v2

    .line 818
    .line 819
    move-object v1, v3

    .line 820
    move-object/from16 v19, v4

    .line 821
    .line 822
    move-object/from16 v0, v21

    .line 823
    .line 824
    move-wide/from16 v2, p2

    .line 825
    .line 826
    move-object/from16 v4, p4

    .line 827
    .line 828
    invoke-direct/range {v0 .. v7}, Lo21;-><init>(La31;JLzk0;Lbl0;Ljava/util/Set;I)V

    .line 829
    .line 830
    .line 831
    move/from16 v16, v8

    .line 832
    .line 833
    invoke-virtual/range {v14 .. v21}, Lr3;->K(Landroid/view/accessibility/AccessibilityNodeInfo;IZLqe;Lqe;Lwh1;Lzk0;)Ln3;

    .line 834
    .line 835
    .line 836
    move-result-object v0

    .line 837
    iget-boolean v0, v0, Ln3;->a:Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 838
    .line 839
    iget-object v3, v11, Lx21;->a:Ly21;

    .line 840
    .line 841
    if-nez v0, :cond_25

    .line 842
    .line 843
    :try_start_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 844
    .line 845
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 846
    .line 847
    .line 848
    const-string v1, "\u7cfb\u7edf\u672a\u786e\u8ba4"

    .line 849
    .line 850
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 851
    .line 852
    .line 853
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 854
    .line 855
    .line 856
    const-string v1, "\u6eda\u52a8\u5b8c\u6210\uff0c\u65e0\u6cd5\u786e\u8ba4\u662f\u5426\u5230\u5e95\uff1b\u53ef\u80fd\u5df2\u6709\u90e8\u5206\u6548\u679c\uff0c\u4e0d\u8981\u76f4\u63a5\u91cd\u8bd5\u3002"

    .line 857
    .line 858
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 859
    .line 860
    .line 861
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 862
    .line 863
    .line 864
    move-result-object v6

    .line 865
    const/4 v9, 0x0

    .line 866
    const/16 v10, 0x1a0

    .line 867
    .line 868
    const/4 v7, 0x0

    .line 869
    const/4 v8, 0x0

    .line 870
    move-object/from16 v0, p0

    .line 871
    .line 872
    move-wide/from16 v4, p2

    .line 873
    .line 874
    move-wide v1, v12

    .line 875
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 876
    .line 877
    .line 878
    move-result-object v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 879
    iget-object v1, v11, Lx21;->c:Lso;

    .line 880
    .line 881
    invoke-virtual {v1}, Lso;->b()V

    .line 882
    .line 883
    .line 884
    return-object v0

    .line 885
    :cond_25
    move-wide v1, v12

    .line 886
    :try_start_a
    iget-object v0, v11, Lx21;->b:Ll12;

    .line 887
    .line 888
    iget-object v4, v0, Ll12;->e:Lj90;

    .line 889
    .line 890
    sget-object v5, Lj90;->LIST:Lj90;

    .line 891
    .line 892
    if-ne v4, v5, :cond_26

    .line 893
    .line 894
    iget v0, v0, Ll12;->a:I

    .line 895
    .line 896
    new-instance v4, Ljava/lang/StringBuilder;

    .line 897
    .line 898
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 899
    .line 900
    .line 901
    const-string v5, "\u5217\u8868 ["

    .line 902
    .line 903
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 904
    .line 905
    .line 906
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 907
    .line 908
    .line 909
    const-string v0, "]"

    .line 910
    .line 911
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 912
    .line 913
    .line 914
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 915
    .line 916
    .line 917
    move-result-object v0

    .line 918
    goto :goto_12

    .line 919
    :cond_26
    const-string v0, ""

    .line 920
    .line 921
    :goto_12
    new-instance v4, Ljava/lang/StringBuilder;

    .line 922
    .line 923
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 924
    .line 925
    .line 926
    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 927
    .line 928
    .line 929
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 930
    .line 931
    .line 932
    const-string v5, "\u6eda\u52a8"

    .line 933
    .line 934
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 935
    .line 936
    .line 937
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 938
    .line 939
    .line 940
    const-string v0, "\u3002"

    .line 941
    .line 942
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 943
    .line 944
    .line 945
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 946
    .line 947
    .line 948
    move-result-object v6

    .line 949
    const/4 v9, 0x0

    .line 950
    const/16 v10, 0x1e0

    .line 951
    .line 952
    const/4 v7, 0x0

    .line 953
    const/4 v8, 0x0

    .line 954
    move-object/from16 v0, p0

    .line 955
    .line 956
    move-wide/from16 v4, p2

    .line 957
    .line 958
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 959
    .line 960
    .line 961
    move-result-object v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 962
    iget-object v1, v11, Lx21;->c:Lso;

    .line 963
    .line 964
    invoke-virtual {v1}, Lso;->b()V

    .line 965
    .line 966
    .line 967
    return-object v0

    .line 968
    :goto_13
    iget-object v1, v11, Lx21;->c:Lso;

    .line 969
    .line 970
    invoke-virtual {v1}, Lso;->b()V

    .line 971
    .line 972
    .line 973
    throw v0
.end method

.method public final I(Ly21;JZ)Lso;
    .locals 11

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x1

    .line 4
    invoke-static {p0, v0, v1, p4, v2}, La31;->h(La31;JZI)Lso;

    .line 5
    .line 6
    .line 7
    move-result-object v3

    .line 8
    const/4 v4, 0x0

    .line 9
    move v5, v4

    .line 10
    :goto_0
    add-int/lit8 v6, v5, 0x1

    .line 11
    .line 12
    const/4 v7, 0x4

    .line 13
    if-ge v5, v7, :cond_3

    .line 14
    .line 15
    invoke-virtual {p0, p2, p3}, La31;->f(J)Z

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    if-nez v5, :cond_3

    .line 20
    .line 21
    iget-object v5, v3, Lso;->j:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v7, v3, Lso;->a:Ljava/util/ArrayList;

    .line 24
    .line 25
    if-nez v5, :cond_3

    .line 26
    .line 27
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    if-nez v5, :cond_2

    .line 32
    .line 33
    sget-object v5, Lv12;->a:Lqv1;

    .line 34
    .line 35
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    move v8, v4

    .line 40
    move v9, v8

    .line 41
    :goto_1
    if-ge v9, v5, :cond_1

    .line 42
    .line 43
    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v10

    .line 47
    add-int/lit8 v9, v9, 0x1

    .line 48
    .line 49
    check-cast v10, Lck2;

    .line 50
    .line 51
    iget-object v10, v10, Lck2;->f:Lbk2;

    .line 52
    .line 53
    if-eqz v10, :cond_0

    .line 54
    .line 55
    invoke-static {v10}, Lv12;->f(Lbk2;)I

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    goto :goto_2

    .line 60
    :cond_0
    move v10, v4

    .line 61
    :goto_2
    add-int/2addr v8, v10

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    const/4 v5, 0x5

    .line 64
    if-ge v8, v5, :cond_3

    .line 65
    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    iget-object v5, p1, Ly21;->b:Ldk0;

    .line 69
    .line 70
    iget-boolean v5, v5, Ldk0;->b:Z

    .line 71
    .line 72
    if-ne v5, v2, :cond_2

    .line 73
    .line 74
    goto :goto_3

    .line 75
    :cond_2
    invoke-virtual {v3}, Lso;->b()V

    .line 76
    .line 77
    .line 78
    iget-object v3, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 79
    .line 80
    iget-object v3, v3, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 81
    .line 82
    new-instance v5, Lp21;

    .line 83
    .line 84
    invoke-direct {v5, p0, p2, p3, v2}, Lp21;-><init>(La31;JI)V

    .line 85
    .line 86
    .line 87
    const-wide/16 v7, 0x190

    .line 88
    .line 89
    invoke-virtual {v3, v7, v8, v5}, Lfb0;->a(JLzk0;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0, v0, v1, p4, v2}, La31;->h(La31;JZI)Lso;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    move v5, v6

    .line 97
    goto :goto_0

    .line 98
    :cond_3
    :goto_3
    return-object v3
.end method

.method public final J(Lai1;JLzk0;Lbl0;)Lv2;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v9, p1

    .line 4
    .line 5
    const-string v1, "\u76ee\u6807 ["

    .line 6
    .line 7
    const-string v2, "["

    .line 8
    .line 9
    iget-object v3, v9, Lai1;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget v4, v9, Lai1;->b:I

    .line 12
    .line 13
    iget-boolean v5, v9, Lai1;->c:Z

    .line 14
    .line 15
    xor-int/lit8 v5, v5, 0x1

    .line 16
    .line 17
    invoke-virtual {v0, v4, v3, v5}, La31;->F(ILjava/lang/String;Z)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    instance-of v4, v3, Lx21;

    .line 22
    .line 23
    const/4 v10, 0x0

    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    move-object v4, v3

    .line 27
    check-cast v4, Lx21;

    .line 28
    .line 29
    move-object v7, v4

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move-object v7, v10

    .line 32
    :goto_0
    if-nez v7, :cond_1

    .line 33
    .line 34
    check-cast v3, Lv2;

    .line 35
    .line 36
    return-object v3

    .line 37
    :cond_1
    :try_start_0
    invoke-virtual {v0, v7}, La31;->D(Lx21;)Lv2;

    .line 38
    .line 39
    .line 40
    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    if-eqz v3, :cond_2

    .line 42
    .line 43
    iget-object v0, v7, Lx21;->c:Lso;

    .line 44
    .line 45
    invoke-virtual {v0}, Lso;->b()V

    .line 46
    .line 47
    .line 48
    return-object v3

    .line 49
    :cond_2
    :try_start_1
    iget-object v3, v7, Lx21;->b:Ll12;

    .line 50
    .line 51
    iget-object v3, v3, Ll12;->e:Lj90;

    .line 52
    .line 53
    sget-object v4, Lj90;->LIST:Lj90;

    .line 54
    .line 55
    if-ne v3, v4, :cond_3

    .line 56
    .line 57
    new-instance v11, Lv2;

    .line 58
    .line 59
    iget v0, v9, Lai1;->b:I

    .line 60
    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v0, "] \u662f\u5217\u8868\u672c\u8eab\uff0c\u4e0d\u80fd\u70b9\u3002\u770b\u66f4\u591a\u7528 scroll\uff0c\u6574\u7406\u5168\u90e8\u6761\u76ee\u7528 collect\u3002"

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v13

    .line 78
    const/16 v16, 0x0

    .line 79
    .line 80
    const/16 v17, 0x7c

    .line 81
    .line 82
    const/4 v12, 0x0

    .line 83
    const/4 v14, 0x0

    .line 84
    const/4 v15, 0x0

    .line 85
    invoke-direct/range {v11 .. v17}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    .line 87
    .line 88
    :goto_1
    iget-object v0, v7, Lx21;->c:Lso;

    .line 89
    .line 90
    invoke-virtual {v0}, Lso;->b()V

    .line 91
    .line 92
    .line 93
    return-object v11

    .line 94
    :catchall_0
    move-exception v0

    .line 95
    move-object v11, v7

    .line 96
    goto/16 :goto_7

    .line 97
    .line 98
    :cond_3
    :try_start_2
    iget-object v2, v7, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 99
    .line 100
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEnabled()Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-nez v2, :cond_4

    .line 105
    .line 106
    new-instance v11, Lv2;

    .line 107
    .line 108
    iget v0, v9, Lai1;->b:I

    .line 109
    .line 110
    new-instance v2, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v0, "] \u5f53\u524d\u4e0d\u53ef\u7528\uff0c\u6ca1\u6709\u53d1\u8d77\u70b9\u51fb\uff1b\u8bf7\u91cd\u65b0\u67e5\u770b\u5c4f\u5e55\u3002"

    .line 119
    .line 120
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v13

    .line 127
    const/16 v16, 0x0

    .line 128
    .line 129
    const/16 v17, 0x7c

    .line 130
    .line 131
    const/4 v12, 0x0

    .line 132
    const/4 v14, 0x0

    .line 133
    const/4 v15, 0x0

    .line 134
    invoke-direct/range {v11 .. v17}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_4
    iget-object v1, v7, Lx21;->c:Lso;

    .line 139
    .line 140
    iget-object v1, v1, Lso;->a:Ljava/util/ArrayList;

    .line 141
    .line 142
    new-instance v2, Ljava/util/ArrayList;

    .line 143
    .line 144
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    const/4 v4, 0x0

    .line 152
    :cond_5
    :goto_2
    if-ge v4, v3, :cond_6

    .line 153
    .line 154
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    add-int/lit8 v4, v4, 0x1

    .line 159
    .line 160
    check-cast v5, Lck2;

    .line 161
    .line 162
    iget-object v5, v5, Lck2;->c:Ljava/lang/String;

    .line 163
    .line 164
    if-eqz v5, :cond_5

    .line 165
    .line 166
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_6
    invoke-static {v2}, Lzr;->X(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    invoke-interface/range {p4 .. p4}, Lzk0;->invoke()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    check-cast v1, Ljava/lang/Boolean;

    .line 179
    .line 180
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    if-eqz v1, :cond_7

    .line 185
    .line 186
    move-object/from16 v5, p5

    .line 187
    .line 188
    invoke-interface {v5, v6}, Lbl0;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    check-cast v1, Ljava/lang/Boolean;

    .line 193
    .line 194
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    if-eqz v1, :cond_8

    .line 199
    .line 200
    move-object v11, v10

    .line 201
    goto :goto_3

    .line 202
    :cond_7
    move-object/from16 v5, p5

    .line 203
    .line 204
    :cond_8
    new-instance v11, Lv2;

    .line 205
    .line 206
    const-string v13, "\u672c\u4efb\u52a1\u5df2\u6682\u505c\u6216\u505c\u6b62\uff0c\u6ca1\u6709\u7ee7\u7eed\u64cd\u4f5c\u3002"

    .line 207
    .line 208
    const/16 v16, 0x0

    .line 209
    .line 210
    const/16 v17, 0x7c

    .line 211
    .line 212
    const/4 v12, 0x0

    .line 213
    const/4 v14, 0x0

    .line 214
    const/4 v15, 0x0

    .line 215
    invoke-direct/range {v11 .. v17}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 216
    .line 217
    .line 218
    :goto_3
    if-eqz v11, :cond_9

    .line 219
    .line 220
    goto/16 :goto_1

    .line 221
    .line 222
    :cond_9
    new-instance v8, Lmv1;

    .line 223
    .line 224
    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    .line 225
    .line 226
    .line 227
    iget-boolean v1, v9, Lai1;->c:Z

    .line 228
    .line 229
    if-nez v1, :cond_a

    .line 230
    .line 231
    sget-object v1, Lk41;->a:Ljava/util/List;

    .line 232
    .line 233
    iget-object v1, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 234
    .line 235
    iget-object v2, v7, Lx21;->c:Lso;

    .line 236
    .line 237
    iget-object v3, v7, Lx21;->e:Lus0;

    .line 238
    .line 239
    iget v3, v3, Lus0;->b:I

    .line 240
    .line 241
    invoke-static {v1, v2, v3}, Lk41;->a(Landroid/content/Context;Lso;I)Li41;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    if-eqz v1, :cond_a

    .line 246
    .line 247
    iget-object v2, v7, Lx21;->c:Lso;

    .line 248
    .line 249
    invoke-virtual {v0, v2}, La31;->N(Lso;)Z

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    if-eqz v2, :cond_a

    .line 254
    .line 255
    goto :goto_4

    .line 256
    :cond_a
    move-object v1, v10

    .line 257
    :goto_4
    iput-object v1, v8, Lmv1;->m:Ljava/lang/Object;

    .line 258
    .line 259
    iget-object v1, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 260
    .line 261
    iget-object v1, v1, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 262
    .line 263
    iget-wide v11, v1, Lfb0;->b:J

    .line 264
    .line 265
    iget-object v13, v0, La31;->e:Lr3;

    .line 266
    .line 267
    iget-object v14, v7, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 268
    .line 269
    iget-object v1, v7, Lx21;->b:Ll12;

    .line 270
    .line 271
    iget-object v15, v1, Ll12;->h:Lqe;

    .line 272
    .line 273
    iget-object v1, v7, Lx21;->c:Lso;

    .line 274
    .line 275
    iget-object v1, v1, Lso;->d:Lqe;

    .line 276
    .line 277
    iget-boolean v2, v9, Lai1;->c:Z

    .line 278
    .line 279
    new-instance v0, Lxu;

    .line 280
    .line 281
    move-object/from16 v4, p4

    .line 282
    .line 283
    move-object/from16 v16, v1

    .line 284
    .line 285
    move/from16 v17, v2

    .line 286
    .line 287
    move-object/from16 v1, p0

    .line 288
    .line 289
    move-wide/from16 v2, p2

    .line 290
    .line 291
    invoke-direct/range {v0 .. v8}, Lxu;-><init>(La31;JLzk0;Lbl0;Ljava/util/Set;Lx21;Lmv1;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 292
    .line 293
    .line 294
    move-object v6, v7

    .line 295
    move-object v5, v0

    .line 296
    move-object v0, v13

    .line 297
    move-object v1, v14

    .line 298
    move-object v2, v15

    .line 299
    move-object/from16 v3, v16

    .line 300
    .line 301
    move/from16 v4, v17

    .line 302
    .line 303
    :try_start_3
    invoke-virtual/range {v0 .. v5}, Lr3;->n(Landroid/view/accessibility/AccessibilityNodeInfo;Lqe;Lqe;ZLxu;)Ln3;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    iget-object v1, v6, Lx21;->b:Ll12;

    .line 308
    .line 309
    iget-object v1, v1, Ll12;->g:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 312
    .line 313
    .line 314
    move-result v2

    .line 315
    if-nez v2, :cond_b

    .line 316
    .line 317
    iget-object v1, v6, Lx21;->b:Ll12;

    .line 318
    .line 319
    iget-object v1, v1, Ll12;->f:Ljava/lang/String;

    .line 320
    .line 321
    goto :goto_5

    .line 322
    :catchall_1
    move-exception v0

    .line 323
    move-object v11, v6

    .line 324
    goto/16 :goto_7

    .line 325
    .line 326
    :cond_b
    :goto_5
    const/16 v2, 0x18

    .line 327
    .line 328
    invoke-static {v2, v1}, Lv12;->e(ILjava/lang/String;)Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v1

    .line 332
    iget-boolean v2, v0, Ln3;->a:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 333
    .line 334
    iget-object v3, v6, Lx21;->a:Ly21;

    .line 335
    .line 336
    iget-boolean v4, v9, Lai1;->c:Z

    .line 337
    .line 338
    const-string v5, "\u300c"

    .line 339
    .line 340
    const-string v7, "\u70b9\u51fb"

    .line 341
    .line 342
    const-string v9, "\u957f\u6309"

    .line 343
    .line 344
    if-nez v2, :cond_d

    .line 345
    .line 346
    if-eqz v4, :cond_c

    .line 347
    .line 348
    move-object v7, v9

    .line 349
    :cond_c
    :try_start_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 350
    .line 351
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 352
    .line 353
    .line 354
    const-string v2, "\u7cfb\u7edf\u672a\u786e\u8ba4\u8fd9\u6b21"

    .line 355
    .line 356
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    const-string v1, "\u300d\u5b8c\u6210\uff0c\u53ef\u80fd\u5df2\u6709\u90e8\u5206\u6548\u679c\uff1b\u8bf7\u5148\u6838\u5bf9\u65b0\u5c4f\u5e55\uff0c\u4e0d\u8981\u76f4\u63a5\u91cd\u8bd5\u3002"

    .line 369
    .line 370
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 377
    const/4 v9, 0x0

    .line 378
    const/16 v10, 0x1b0

    .line 379
    .line 380
    const/4 v7, 0x0

    .line 381
    const/4 v8, 0x0

    .line 382
    move-wide/from16 v4, p2

    .line 383
    .line 384
    move-wide v1, v11

    .line 385
    move-object v11, v6

    .line 386
    move-object v6, v0

    .line 387
    move-object/from16 v0, p0

    .line 388
    .line 389
    :try_start_5
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 390
    .line 391
    .line 392
    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 393
    :goto_6
    iget-object v1, v11, Lx21;->c:Lso;

    .line 394
    .line 395
    invoke-virtual {v1}, Lso;->b()V

    .line 396
    .line 397
    .line 398
    return-object v0

    .line 399
    :catchall_2
    move-exception v0

    .line 400
    goto :goto_7

    .line 401
    :cond_d
    move-object/from16 v18, v6

    .line 402
    .line 403
    move-object v6, v3

    .line 404
    move-wide v2, v11

    .line 405
    move-object/from16 v11, v18

    .line 406
    .line 407
    if-eqz v4, :cond_e

    .line 408
    .line 409
    move-object v7, v9

    .line 410
    :cond_e
    :try_start_6
    new-instance v4, Ljava/lang/StringBuilder;

    .line 411
    .line 412
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 413
    .line 414
    .line 415
    const-string v9, "\u5df2\u63d0\u4ea4"

    .line 416
    .line 417
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    .line 419
    .line 420
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 421
    .line 422
    .line 423
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    .line 425
    .line 426
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    const-string v1, "\u300d\u3002"

    .line 430
    .line 431
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v1

    .line 438
    iget-object v4, v8, Lmv1;->m:Ljava/lang/Object;

    .line 439
    .line 440
    move-object v5, v4

    .line 441
    check-cast v5, Li41;

    .line 442
    .line 443
    iget-object v0, v0, Ln3;->b:Ljava/lang/Object;

    .line 444
    .line 445
    check-cast v0, Lo3;

    .line 446
    .line 447
    sget-object v5, Lo3;->NODE:Lo3;

    .line 448
    .line 449
    if-ne v0, v5, :cond_f

    .line 450
    .line 451
    move-object v10, v4

    .line 452
    :cond_f
    move-object v9, v10

    .line 453
    check-cast v9, Li41;

    .line 454
    .line 455
    const/16 v10, 0x170

    .line 456
    .line 457
    const/4 v7, 0x0

    .line 458
    const/4 v8, 0x0

    .line 459
    move-object v0, v6

    .line 460
    move-object v6, v1

    .line 461
    move-wide v1, v2

    .line 462
    move-object v3, v0

    .line 463
    move-object/from16 v0, p0

    .line 464
    .line 465
    move-wide/from16 v4, p2

    .line 466
    .line 467
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 468
    .line 469
    .line 470
    move-result-object v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 471
    goto :goto_6

    .line 472
    :goto_7
    iget-object v1, v11, Lx21;->c:Lso;

    .line 473
    .line 474
    invoke-virtual {v1}, Lso;->b()V

    .line 475
    .line 476
    .line 477
    throw v0
.end method

.method public final K(Lbi1;JLzk0;Lbl0;)Lv2;
    .locals 31

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v9, p1

    .line 4
    .line 5
    move-wide/from16 v4, p2

    .line 6
    .line 7
    iget-object v3, v0, La31;->p:Ly21;

    .line 8
    .line 9
    if-eqz v3, :cond_2c

    .line 10
    .line 11
    iget-object v1, v3, Ly21;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v2, v9, Lbi1;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto/16 :goto_16

    .line 22
    .line 23
    :cond_0
    iget-object v1, v3, Ly21;->n:Luq0;

    .line 24
    .line 25
    if-eqz v1, :cond_2b

    .line 26
    .line 27
    iget-object v2, v0, La31;->q:Ly10;

    .line 28
    .line 29
    iget-object v6, v3, Ly21;->a:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v2, v6}, Ly10;->c(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0, v3}, La31;->k(Ly21;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 v1, 0x0

    .line 45
    :goto_0
    if-nez v1, :cond_2

    .line 46
    .line 47
    goto/16 :goto_15

    .line 48
    .line 49
    :cond_2
    iget-object v2, v1, Luq0;->a:Lrq0;

    .line 50
    .line 51
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 52
    .line 53
    .line 54
    move-result-wide v6

    .line 55
    invoke-virtual {v1, v6, v7}, Luq0;->b(J)Z

    .line 56
    .line 57
    .line 58
    move-result v6

    .line 59
    if-nez v6, :cond_3

    .line 60
    .line 61
    new-instance v11, Lv2;

    .line 62
    .line 63
    const-string v13, "\u622a\u56fe\u5df2\u8d85\u8fc7 30 \u79d2\uff0c\u6ca1\u6709\u70b9\u51fb\u3002\u8bf7\u91cd\u65b0 screen \u52a0 image \u518d\u70b9\u3002"

    .line 64
    .line 65
    invoke-virtual {v0}, La31;->v()Lh22;

    .line 66
    .line 67
    .line 68
    move-result-object v14

    .line 69
    const/16 v16, 0x0

    .line 70
    .line 71
    const/16 v17, 0x78

    .line 72
    .line 73
    const/4 v12, 0x0

    .line 74
    const/4 v15, 0x0

    .line 75
    invoke-direct/range {v11 .. v17}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 76
    .line 77
    .line 78
    return-object v11

    .line 79
    :cond_3
    iget v6, v9, Lbi1;->b:I

    .line 80
    .line 81
    iget v7, v9, Lbi1;->c:I

    .line 82
    .line 83
    invoke-virtual {v2, v6, v7}, Lrq0;->a(II)Lue1;

    .line 84
    .line 85
    .line 86
    move-result-object v11

    .line 87
    if-nez v11, :cond_4

    .line 88
    .line 89
    new-instance v12, Lv2;

    .line 90
    .line 91
    iget v0, v9, Lbi1;->b:I

    .line 92
    .line 93
    iget v1, v9, Lbi1;->c:I

    .line 94
    .line 95
    iget v3, v2, Lrq0;->e:I

    .line 96
    .line 97
    iget v2, v2, Lrq0;->f:I

    .line 98
    .line 99
    const-string v4, "\u5750\u6807 ("

    .line 100
    .line 101
    const-string v5, ", "

    .line 102
    .line 103
    const-string v6, ") \u4e0d\u5728\u8fd9\u5f20\u622a\u56fe\u91cc\uff08"

    .line 104
    .line 105
    invoke-static {v4, v0, v5, v1, v6}, Lez;->s(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v1, "\u00d7"

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v1, "\uff09\u3002"

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v14

    .line 129
    const/16 v17, 0x0

    .line 130
    .line 131
    const/16 v18, 0x7c

    .line 132
    .line 133
    const/4 v13, 0x0

    .line 134
    const/4 v15, 0x0

    .line 135
    const/16 v16, 0x0

    .line 136
    .line 137
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 138
    .line 139
    .line 140
    return-object v12

    .line 141
    :cond_4
    iget-boolean v6, v3, Ly21;->f:Z

    .line 142
    .line 143
    if-eqz v6, :cond_5

    .line 144
    .line 145
    invoke-static {}, La31;->o()Lhp1;

    .line 146
    .line 147
    .line 148
    move-result-object v6

    .line 149
    iget-boolean v6, v6, Lhp1;->c:Z

    .line 150
    .line 151
    if-nez v6, :cond_5

    .line 152
    .line 153
    new-instance v12, Lv2;

    .line 154
    .line 155
    const-string v14, "\u8fd9\u662f DSH \u81ea\u5df1\u7684\u754c\u9762\uff0c\u4e0d\u64cd\u4f5c\u3002"

    .line 156
    .line 157
    const/16 v17, 0x0

    .line 158
    .line 159
    const/16 v18, 0x7c

    .line 160
    .line 161
    const/4 v13, 0x0

    .line 162
    const/4 v15, 0x0

    .line 163
    const/16 v16, 0x0

    .line 164
    .line 165
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 166
    .line 167
    .line 168
    return-object v12

    .line 169
    :cond_5
    iget-boolean v6, v3, Ly21;->e:Z

    .line 170
    .line 171
    if-eqz v6, :cond_6

    .line 172
    .line 173
    invoke-static {}, La31;->o()Lhp1;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    iget-boolean v6, v6, Lhp1;->a:Z

    .line 178
    .line 179
    if-nez v6, :cond_6

    .line 180
    .line 181
    new-instance v12, Lv2;

    .line 182
    .line 183
    const-string v14, "\u8fd9\u662f\u7cfb\u7edf\u6743\u9650 / \u5b89\u5168\u76f8\u5173\u9875\u9762\uff0cDSH \u4e0d\u5728\u8fd9\u91cc\u70b9\u51fb\u3002\u9700\u8981\u7684\u8bdd\u8bf7\u7528 handoff \u4ea4\u7ed9\u7528\u6237\u3002"

    .line 184
    .line 185
    const/16 v17, 0x0

    .line 186
    .line 187
    const/16 v18, 0x7c

    .line 188
    .line 189
    const/4 v13, 0x0

    .line 190
    const/4 v15, 0x0

    .line 191
    const/16 v16, 0x0

    .line 192
    .line 193
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 194
    .line 195
    .line 196
    return-object v12

    .line 197
    :cond_6
    iget-boolean v6, v3, Ly21;->g:Z

    .line 198
    .line 199
    if-nez v6, :cond_2a

    .line 200
    .line 201
    iget-boolean v6, v3, Ly21;->h:Z

    .line 202
    .line 203
    if-eqz v6, :cond_7

    .line 204
    .line 205
    goto/16 :goto_14

    .line 206
    .line 207
    :cond_7
    iget-object v6, v9, Lbi1;->d:Lvh1;

    .line 208
    .line 209
    sget-object v7, Lvh1;->SWIPE:Lvh1;

    .line 210
    .line 211
    if-ne v6, v7, :cond_c

    .line 212
    .line 213
    iget-wide v6, v9, Lbi1;->g:J

    .line 214
    .line 215
    const-wide/16 v12, 0x64

    .line 216
    .line 217
    cmp-long v8, v12, v6

    .line 218
    .line 219
    if-gtz v8, :cond_b

    .line 220
    .line 221
    const-wide/16 v12, 0x7d1

    .line 222
    .line 223
    cmp-long v6, v6, v12

    .line 224
    .line 225
    if-gez v6, :cond_b

    .line 226
    .line 227
    iget-object v6, v9, Lbi1;->e:Ljava/lang/Integer;

    .line 228
    .line 229
    const/4 v7, -0x1

    .line 230
    if-eqz v6, :cond_8

    .line 231
    .line 232
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 233
    .line 234
    .line 235
    move-result v6

    .line 236
    goto :goto_1

    .line 237
    :cond_8
    move v6, v7

    .line 238
    :goto_1
    iget-object v8, v9, Lbi1;->f:Ljava/lang/Integer;

    .line 239
    .line 240
    if-eqz v8, :cond_9

    .line 241
    .line 242
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 243
    .line 244
    .line 245
    move-result v7

    .line 246
    :cond_9
    invoke-virtual {v2, v6, v7}, Lrq0;->a(II)Lue1;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    if-nez v2, :cond_a

    .line 251
    .line 252
    new-instance v12, Lv2;

    .line 253
    .line 254
    const-string v14, "\u6ed1\u52a8\u7ec8\u70b9\u4e0d\u5728\u622a\u56fe\u5185\u3002"

    .line 255
    .line 256
    const/16 v17, 0x0

    .line 257
    .line 258
    const/16 v18, 0x7c

    .line 259
    .line 260
    const/4 v13, 0x0

    .line 261
    const/4 v15, 0x0

    .line 262
    const/16 v16, 0x0

    .line 263
    .line 264
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 265
    .line 266
    .line 267
    return-object v12

    .line 268
    :cond_a
    move-object v12, v2

    .line 269
    goto :goto_2

    .line 270
    :cond_b
    new-instance v0, Lv2;

    .line 271
    .line 272
    const-string v2, "\u6ed1\u52a8\u65f6\u957f\u987b\u4e3a 100\u20132000 \u6beb\u79d2\u3002"

    .line 273
    .line 274
    const/4 v5, 0x0

    .line 275
    const/16 v6, 0x7c

    .line 276
    .line 277
    const/4 v1, 0x0

    .line 278
    const/4 v3, 0x0

    .line 279
    const/4 v4, 0x0

    .line 280
    invoke-direct/range {v0 .. v6}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 281
    .line 282
    .line 283
    return-object v0

    .line 284
    :cond_c
    const/4 v12, 0x0

    .line 285
    :goto_2
    iget-object v2, v0, La31;->q:Ly10;

    .line 286
    .line 287
    iget-object v6, v3, Ly21;->a:Ljava/lang/String;

    .line 288
    .line 289
    invoke-virtual {v2, v6}, Ly10;->f(Ljava/lang/String;)Lfp2;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    iget-object v6, v0, La31;->q:Ly10;

    .line 294
    .line 295
    invoke-virtual {v6}, Ly10;->g()J

    .line 296
    .line 297
    .line 298
    move-result-wide v7

    .line 299
    iget-object v6, v9, Lbi1;->d:Lvh1;

    .line 300
    .line 301
    sget-object v13, Lvh1;->TAP:Lvh1;

    .line 302
    .line 303
    if-ne v6, v13, :cond_d

    .line 304
    .line 305
    iget-object v6, v3, Ly21;->k:Lkr0;

    .line 306
    .line 307
    if-eqz v6, :cond_d

    .line 308
    .line 309
    iget-object v13, v11, Lue1;->m:Ljava/lang/Object;

    .line 310
    .line 311
    check-cast v13, Ljava/lang/Number;

    .line 312
    .line 313
    invoke-virtual {v13}, Ljava/lang/Number;->intValue()I

    .line 314
    .line 315
    .line 316
    move-result v13

    .line 317
    iget-object v14, v11, Lue1;->U:Ljava/lang/Object;

    .line 318
    .line 319
    check-cast v14, Ljava/lang/Number;

    .line 320
    .line 321
    invoke-virtual {v14}, Ljava/lang/Number;->intValue()I

    .line 322
    .line 323
    .line 324
    move-result v14

    .line 325
    invoke-virtual {v6, v13, v14}, Lkr0;->N(II)Ldp2;

    .line 326
    .line 327
    .line 328
    move-result-object v6

    .line 329
    goto :goto_3

    .line 330
    :cond_d
    const/4 v6, 0x0

    .line 331
    :goto_3
    const-wide/16 v13, 0x0

    .line 332
    .line 333
    const/4 v15, 0x0

    .line 334
    const/4 v10, 0x3

    .line 335
    invoke-static {v0, v13, v14, v15, v10}, La31;->h(La31;JZI)Lso;

    .line 336
    .line 337
    .line 338
    move-result-object v13

    .line 339
    :try_start_0
    invoke-static {v13}, La31;->O(Lso;)Z

    .line 340
    .line 341
    .line 342
    move-result v14

    .line 343
    if-eqz v14, :cond_e

    .line 344
    .line 345
    new-instance v17, Lv2;

    .line 346
    .line 347
    const-string v19, "\u8fd9\u4e00\u5c4f\u8bfb\u4e0d\u5230\u5185\u5bb9\uff08\u53ef\u80fd\u53d7\u654f\u611f\u89c6\u56fe\u7b56\u7565\u9650\u5236\uff09\uff0c\u6309\u622a\u56fe\u5750\u6807\u76f4\u63a5\u70b9\u3002"

    .line 348
    .line 349
    invoke-virtual {v0, v13, v15}, La31;->y(Lso;Z)Ly21;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    invoke-static {v0}, La31;->L(Ly21;)Lh22;

    .line 354
    .line 355
    .line 356
    move-result-object v20

    .line 357
    const/16 v22, 0x0

    .line 358
    .line 359
    const/16 v23, 0x78

    .line 360
    .line 361
    const/16 v18, 0x0

    .line 362
    .line 363
    const/16 v21, 0x0

    .line 364
    .line 365
    invoke-direct/range {v17 .. v23}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 366
    .line 367
    .line 368
    invoke-virtual {v13}, Lso;->b()V

    .line 369
    .line 370
    .line 371
    return-object v17

    .line 372
    :catchall_0
    move-exception v0

    .line 373
    goto/16 :goto_13

    .line 374
    .line 375
    :cond_e
    :try_start_1
    invoke-static {v13}, La31;->u(Lso;)Lc12;

    .line 376
    .line 377
    .line 378
    move-result-object v14

    .line 379
    iget-object v10, v3, Ly21;->i:Lc12;

    .line 380
    .line 381
    invoke-virtual {v14, v10}, Lc12;->c(Lc12;)Z

    .line 382
    .line 383
    .line 384
    move-result v10

    .line 385
    if-nez v10, :cond_11

    .line 386
    .line 387
    iget-boolean v1, v14, Lc12;->c:Z

    .line 388
    .line 389
    if-nez v1, :cond_10

    .line 390
    .line 391
    iget-object v1, v3, Ly21;->i:Lc12;

    .line 392
    .line 393
    iget-boolean v1, v1, Lc12;->c:Z

    .line 394
    .line 395
    if-eqz v1, :cond_f

    .line 396
    .line 397
    goto :goto_5

    .line 398
    :cond_f
    const-string v1, "\u65e0\u6cd5\u786e\u8ba4\u5f53\u524d\u754c\u9762\u4ecd\u4e0e\u622a\u56fe\u4e00\u81f4\uff0c\u6ca1\u6709\u70b9\u51fb\u3002\u8bf7\u91cd\u65b0\u770b\u5c4f\u5e55\u3002"

    .line 399
    .line 400
    :goto_4
    move-object v4, v1

    .line 401
    goto :goto_6

    .line 402
    :cond_10
    :goto_5
    const-string v1, "\u5f53\u524d\u6216\u4e0a\u6b21\u89c2\u5bdf\u542b\u5bc6\u7801 / \u9a8c\u8bc1\u7801 / \u652f\u4ed8\u6846\uff0c\u4e0d\u6267\u884c\u5750\u6807\u624b\u52bf\u3002\u8bf7 handoff \u4ea4\u7ed9\u7528\u6237\u3002"

    .line 403
    .line 404
    goto :goto_4

    .line 405
    :goto_6
    new-instance v2, Lv2;

    .line 406
    .line 407
    invoke-virtual {v0, v13, v15}, La31;->y(Lso;Z)Ly21;

    .line 408
    .line 409
    .line 410
    move-result-object v0

    .line 411
    invoke-static {v0}, La31;->L(Ly21;)Lh22;

    .line 412
    .line 413
    .line 414
    move-result-object v5

    .line 415
    const/4 v7, 0x0

    .line 416
    const/16 v8, 0x78

    .line 417
    .line 418
    const/4 v3, 0x0

    .line 419
    const/4 v6, 0x0

    .line 420
    invoke-direct/range {v2 .. v8}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 421
    .line 422
    .line 423
    invoke-virtual {v13}, Lso;->b()V

    .line 424
    .line 425
    .line 426
    return-object v2

    .line 427
    :cond_11
    if-eqz v6, :cond_15

    .line 428
    .line 429
    :try_start_2
    iget-object v10, v0, La31;->q:Ly10;

    .line 430
    .line 431
    iget-object v14, v3, Ly21;->a:Ljava/lang/String;

    .line 432
    .line 433
    invoke-virtual {v10, v14}, Ly10;->f(Ljava/lang/String;)Lfp2;

    .line 434
    .line 435
    .line 436
    move-result-object v10

    .line 437
    if-ne v10, v2, :cond_14

    .line 438
    .line 439
    iget-object v2, v13, Lso;->a:Ljava/util/ArrayList;

    .line 440
    .line 441
    invoke-static {v2}, Lzr;->L(Ljava/util/List;)Ljava/lang/Object;

    .line 442
    .line 443
    .line 444
    move-result-object v2

    .line 445
    check-cast v2, Lck2;

    .line 446
    .line 447
    if-eqz v2, :cond_12

    .line 448
    .line 449
    new-instance v10, Lkr0;

    .line 450
    .line 451
    iget-object v14, v13, Lso;->d:Lqe;

    .line 452
    .line 453
    iget-boolean v15, v13, Lso;->m:Z

    .line 454
    .line 455
    move-wide/from16 v19, v7

    .line 456
    .line 457
    iget-object v7, v13, Lso;->n:Ljava/util/List;

    .line 458
    .line 459
    invoke-direct {v10, v2, v14, v15, v7}, Lkr0;-><init>(Lck2;Lqe;ZLjava/util/List;)V

    .line 460
    .line 461
    .line 462
    goto :goto_7

    .line 463
    :cond_12
    move-wide/from16 v19, v7

    .line 464
    .line 465
    const/4 v10, 0x0

    .line 466
    :goto_7
    if-eqz v10, :cond_13

    .line 467
    .line 468
    iget-object v2, v11, Lue1;->m:Ljava/lang/Object;

    .line 469
    .line 470
    check-cast v2, Ljava/lang/Number;

    .line 471
    .line 472
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 473
    .line 474
    .line 475
    move-result v2

    .line 476
    iget-object v7, v11, Lue1;->U:Ljava/lang/Object;

    .line 477
    .line 478
    check-cast v7, Ljava/lang/Number;

    .line 479
    .line 480
    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    .line 481
    .line 482
    .line 483
    move-result v7

    .line 484
    invoke-virtual {v10, v2, v7}, Lkr0;->N(II)Ldp2;

    .line 485
    .line 486
    .line 487
    move-result-object v2

    .line 488
    goto :goto_8

    .line 489
    :cond_13
    const/4 v2, 0x0

    .line 490
    :goto_8
    invoke-static {v2, v6}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 491
    .line 492
    .line 493
    move-result v2

    .line 494
    if-nez v2, :cond_16

    .line 495
    .line 496
    :cond_14
    new-instance v1, Lv2;

    .line 497
    .line 498
    const-string v3, "\u622a\u56fe\u4e2d\u7684\u76ee\u6807\u6216\u53ef\u786e\u8ba4\u8303\u56f4\u5df2\u53d8\u5316\uff0c\u6ca1\u6709\u6267\u884c\u3002\u8bf7\u91cd\u65b0\u8bfb\u5c4f\u3002"

    .line 499
    .line 500
    const/4 v2, 0x0

    .line 501
    invoke-virtual {v0, v13, v2}, La31;->y(Lso;Z)Ly21;

    .line 502
    .line 503
    .line 504
    move-result-object v0

    .line 505
    invoke-static {v0}, La31;->L(Ly21;)Lh22;

    .line 506
    .line 507
    .line 508
    move-result-object v4

    .line 509
    const/4 v6, 0x0

    .line 510
    const/16 v7, 0x78

    .line 511
    .line 512
    const/4 v2, 0x0

    .line 513
    const/4 v5, 0x0

    .line 514
    invoke-direct/range {v1 .. v7}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 515
    .line 516
    .line 517
    invoke-virtual {v13}, Lso;->b()V

    .line 518
    .line 519
    .line 520
    return-object v1

    .line 521
    :cond_15
    move-wide/from16 v19, v7

    .line 522
    .line 523
    :cond_16
    :try_start_3
    invoke-virtual {v0, v13}, La31;->i(Lso;)Lb92;

    .line 524
    .line 525
    .line 526
    move-result-object v2

    .line 527
    if-eqz v2, :cond_17

    .line 528
    .line 529
    iget-object v6, v2, Lb92;->g:Luq0;

    .line 530
    .line 531
    move-object v10, v6

    .line 532
    goto :goto_9

    .line 533
    :cond_17
    const/4 v10, 0x0

    .line 534
    :goto_9
    invoke-virtual {v0, v4, v5}, La31;->f(J)Z

    .line 535
    .line 536
    .line 537
    move-result v6

    .line 538
    if-nez v6, :cond_29

    .line 539
    .line 540
    const/4 v14, 0x1

    .line 541
    if-eqz v10, :cond_18

    .line 542
    .line 543
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 544
    .line 545
    .line 546
    move-result-wide v6

    .line 547
    invoke-virtual {v1, v10, v6, v7}, Luq0;->c(Luq0;J)Z

    .line 548
    .line 549
    .line 550
    move-result v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 551
    if-nez v1, :cond_19

    .line 552
    .line 553
    :cond_18
    const/4 v12, 0x0

    .line 554
    goto/16 :goto_f

    .line 555
    .line 556
    :cond_19
    invoke-virtual {v13}, Lso;->b()V

    .line 557
    .line 558
    .line 559
    invoke-virtual {v0, v4, v5}, La31;->f(J)Z

    .line 560
    .line 561
    .line 562
    move-result v1

    .line 563
    if-nez v1, :cond_25

    .line 564
    .line 565
    invoke-virtual {v0, v3}, La31;->k(Ly21;)Z

    .line 566
    .line 567
    .line 568
    move-result v1

    .line 569
    if-eqz v1, :cond_24

    .line 570
    .line 571
    iget-object v1, v0, La31;->q:Ly10;

    .line 572
    .line 573
    iget-object v2, v3, Ly21;->a:Ljava/lang/String;

    .line 574
    .line 575
    monitor-enter v1

    .line 576
    :try_start_4
    invoke-virtual {v1, v2}, Ly10;->c(Ljava/lang/String;)Z

    .line 577
    .line 578
    .line 579
    move-result v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 580
    if-nez v2, :cond_1a

    .line 581
    .line 582
    monitor-exit v1

    .line 583
    goto/16 :goto_e

    .line 584
    .line 585
    :cond_1a
    const/4 v2, 0x0

    .line 586
    :try_start_5
    iput-object v2, v1, Ly10;->Y:Ljava/lang/Object;

    .line 587
    .line 588
    const/4 v6, 0x0

    .line 589
    iput-boolean v6, v1, Ly10;->m:Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 590
    .line 591
    monitor-exit v1

    .line 592
    iput-object v2, v3, Ly21;->n:Luq0;

    .line 593
    .line 594
    iget-object v1, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 595
    .line 596
    iget-object v1, v1, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 597
    .line 598
    iget-wide v1, v1, Lfb0;->b:J

    .line 599
    .line 600
    iget-object v6, v0, La31;->q:Ly10;

    .line 601
    .line 602
    iget-object v7, v3, Ly21;->a:Ljava/lang/String;

    .line 603
    .line 604
    invoke-virtual {v6, v7}, Ly10;->f(Ljava/lang/String;)Lfp2;

    .line 605
    .line 606
    .line 607
    move-result-object v6

    .line 608
    if-nez p5, :cond_1b

    .line 609
    .line 610
    new-instance v7, Ll3;

    .line 611
    .line 612
    move-object/from16 v8, p4

    .line 613
    .line 614
    invoke-direct {v7, v14, v8}, Ll3;-><init>(ILzk0;)V

    .line 615
    .line 616
    .line 617
    goto :goto_a

    .line 618
    :cond_1b
    move-object/from16 v7, p5

    .line 619
    .line 620
    :goto_a
    new-instance v28, Ln21;

    .line 621
    .line 622
    move-wide/from16 v29, v1

    .line 623
    .line 624
    move-object v2, v7

    .line 625
    move-wide/from16 v7, v19

    .line 626
    .line 627
    move-wide/from16 v19, v29

    .line 628
    .line 629
    move-wide/from16 v29, v4

    .line 630
    .line 631
    move-object v5, v3

    .line 632
    move-wide/from16 v3, v29

    .line 633
    .line 634
    move-object v1, v0

    .line 635
    move-object/from16 v0, v28

    .line 636
    .line 637
    invoke-direct/range {v0 .. v8}, Ln21;-><init>(La31;Lbl0;JLy21;Lfp2;J)V

    .line 638
    .line 639
    .line 640
    move-object v3, v5

    .line 641
    move-wide/from16 v4, v29

    .line 642
    .line 643
    move-object v0, v1

    .line 644
    iget-object v1, v9, Lbi1;->d:Lvh1;

    .line 645
    .line 646
    sget-object v2, Lz21;->c:[I

    .line 647
    .line 648
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 649
    .line 650
    .line 651
    move-result v1

    .line 652
    aget v1, v2, v1

    .line 653
    .line 654
    const/4 v6, 0x2

    .line 655
    if-eq v1, v14, :cond_1e

    .line 656
    .line 657
    if-eq v1, v6, :cond_1d

    .line 658
    .line 659
    const/4 v7, 0x3

    .line 660
    if-ne v1, v7, :cond_1c

    .line 661
    .line 662
    iget-object v1, v0, La31;->e:Lr3;

    .line 663
    .line 664
    iget-object v7, v11, Lue1;->m:Ljava/lang/Object;

    .line 665
    .line 666
    check-cast v7, Ljava/lang/Number;

    .line 667
    .line 668
    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    .line 669
    .line 670
    .line 671
    move-result v22

    .line 672
    iget-object v7, v11, Lue1;->U:Ljava/lang/Object;

    .line 673
    .line 674
    check-cast v7, Ljava/lang/Number;

    .line 675
    .line 676
    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    .line 677
    .line 678
    .line 679
    move-result v23

    .line 680
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 681
    .line 682
    .line 683
    iget-object v7, v12, Lue1;->m:Ljava/lang/Object;

    .line 684
    .line 685
    check-cast v7, Ljava/lang/Number;

    .line 686
    .line 687
    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    .line 688
    .line 689
    .line 690
    move-result v24

    .line 691
    iget-object v7, v12, Lue1;->U:Ljava/lang/Object;

    .line 692
    .line 693
    check-cast v7, Ljava/lang/Number;

    .line 694
    .line 695
    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    .line 696
    .line 697
    .line 698
    move-result v25

    .line 699
    iget-wide v7, v9, Lbi1;->g:J

    .line 700
    .line 701
    move-object/from16 v21, v1

    .line 702
    .line 703
    move-wide/from16 v26, v7

    .line 704
    .line 705
    invoke-virtual/range {v21 .. v28}, Lr3;->M(IIIIJLbl0;)Z

    .line 706
    .line 707
    .line 708
    move-result v1

    .line 709
    goto :goto_c

    .line 710
    :cond_1c
    invoke-static {}, Ll;->r()V

    .line 711
    .line 712
    .line 713
    :goto_b
    const/16 v16, 0x0

    .line 714
    .line 715
    return-object v16

    .line 716
    :cond_1d
    move-object/from16 v1, v28

    .line 717
    .line 718
    iget-object v7, v0, La31;->e:Lr3;

    .line 719
    .line 720
    iget-object v8, v11, Lue1;->m:Ljava/lang/Object;

    .line 721
    .line 722
    check-cast v8, Ljava/lang/Number;

    .line 723
    .line 724
    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    .line 725
    .line 726
    .line 727
    move-result v8

    .line 728
    iget-object v11, v11, Lue1;->U:Ljava/lang/Object;

    .line 729
    .line 730
    check-cast v11, Ljava/lang/Number;

    .line 731
    .line 732
    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    .line 733
    .line 734
    .line 735
    move-result v11

    .line 736
    invoke-virtual {v7, v8, v11, v14, v1}, Lr3;->N(IIZLbl0;)Z

    .line 737
    .line 738
    .line 739
    move-result v1

    .line 740
    goto :goto_c

    .line 741
    :cond_1e
    move-object/from16 v1, v28

    .line 742
    .line 743
    iget-object v7, v0, La31;->e:Lr3;

    .line 744
    .line 745
    iget-object v8, v11, Lue1;->m:Ljava/lang/Object;

    .line 746
    .line 747
    check-cast v8, Ljava/lang/Number;

    .line 748
    .line 749
    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    .line 750
    .line 751
    .line 752
    move-result v8

    .line 753
    iget-object v11, v11, Lue1;->U:Ljava/lang/Object;

    .line 754
    .line 755
    check-cast v11, Ljava/lang/Number;

    .line 756
    .line 757
    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    .line 758
    .line 759
    .line 760
    move-result v11

    .line 761
    const/4 v12, 0x0

    .line 762
    invoke-virtual {v7, v8, v11, v12, v1}, Lr3;->N(IIZLbl0;)Z

    .line 763
    .line 764
    .line 765
    move-result v1

    .line 766
    :goto_c
    if-nez v1, :cond_20

    .line 767
    .line 768
    const-string v6, "\u7cfb\u7edf\u672a\u786e\u8ba4\u624b\u52bf\u5b8c\u6210\uff1b\u53ef\u80fd\u5df2\u4ea7\u751f\u90e8\u5206\u6548\u679c\uff0c\u8bf7\u5148\u8bfb\u5c4f\uff0c\u4e0d\u8981\u76f4\u63a5\u91cd\u8bd5\u3002"

    .line 769
    .line 770
    invoke-virtual {v0, v4, v5}, La31;->f(J)Z

    .line 771
    .line 772
    .line 773
    move-result v1

    .line 774
    if-eqz v1, :cond_1f

    .line 775
    .line 776
    new-instance v21, Lv2;

    .line 777
    .line 778
    const/16 v26, 0x0

    .line 779
    .line 780
    const/16 v27, 0x7c

    .line 781
    .line 782
    const/16 v22, 0x0

    .line 783
    .line 784
    const/16 v24, 0x0

    .line 785
    .line 786
    const/16 v25, 0x0

    .line 787
    .line 788
    move-object/from16 v23, v6

    .line 789
    .line 790
    invoke-direct/range {v21 .. v27}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 791
    .line 792
    .line 793
    return-object v21

    .line 794
    :cond_1f
    const/4 v9, 0x0

    .line 795
    move-object v7, v10

    .line 796
    const/16 v10, 0x190

    .line 797
    .line 798
    const/4 v8, 0x0

    .line 799
    move-wide/from16 v1, v19

    .line 800
    .line 801
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 802
    .line 803
    .line 804
    move-result-object v0

    .line 805
    return-object v0

    .line 806
    :cond_20
    move-object v7, v10

    .line 807
    iget-object v0, v9, Lbi1;->d:Lvh1;

    .line 808
    .line 809
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 810
    .line 811
    .line 812
    move-result v0

    .line 813
    aget v0, v2, v0

    .line 814
    .line 815
    if-eq v0, v14, :cond_23

    .line 816
    .line 817
    if-eq v0, v6, :cond_22

    .line 818
    .line 819
    const/4 v1, 0x3

    .line 820
    if-ne v0, v1, :cond_21

    .line 821
    .line 822
    const-string v0, "\u6ed1\u52a8"

    .line 823
    .line 824
    goto :goto_d

    .line 825
    :cond_21
    invoke-static {}, Ll;->r()V

    .line 826
    .line 827
    .line 828
    goto :goto_b

    .line 829
    :cond_22
    const-string v0, "\u957f\u6309"

    .line 830
    .line 831
    goto :goto_d

    .line 832
    :cond_23
    const-string v0, "\u70b9\u51fb"

    .line 833
    .line 834
    :goto_d
    iget v1, v9, Lbi1;->b:I

    .line 835
    .line 836
    iget v2, v9, Lbi1;->c:I

    .line 837
    .line 838
    const-string v4, "\u5df2\u63d0\u4ea4"

    .line 839
    .line 840
    const-string v5, "\u622a\u56fe\u4e0a\u7684 ("

    .line 841
    .line 842
    const-string v6, ", "

    .line 843
    .line 844
    invoke-static {v1, v4, v0, v5, v6}, Lez;->q(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 845
    .line 846
    .line 847
    move-result-object v0

    .line 848
    const-string v1, ")\u3002"

    .line 849
    .line 850
    invoke-static {v0, v2, v1}, Lez;->o(Ljava/lang/StringBuilder;ILjava/lang/String;)Ljava/lang/String;

    .line 851
    .line 852
    .line 853
    move-result-object v6

    .line 854
    const/4 v9, 0x0

    .line 855
    const/16 v10, 0x1d0

    .line 856
    .line 857
    const/4 v8, 0x0

    .line 858
    move-object/from16 v0, p0

    .line 859
    .line 860
    move-wide/from16 v4, p2

    .line 861
    .line 862
    move-wide/from16 v1, v19

    .line 863
    .line 864
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 865
    .line 866
    .line 867
    move-result-object v0

    .line 868
    return-object v0

    .line 869
    :catchall_1
    move-exception v0

    .line 870
    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 871
    throw v0

    .line 872
    :cond_24
    :goto_e
    new-instance v2, Lv2;

    .line 873
    .line 874
    const-string v4, "\u672c\u6b21\u622a\u56fe\u5df2\u5931\u6548\uff0c\u6ca1\u6709\u6267\u884c\u3002\u8bf7\u91cd\u65b0\u8bfb\u5c4f\u3002"

    .line 875
    .line 876
    const/4 v7, 0x0

    .line 877
    const/16 v8, 0x7c

    .line 878
    .line 879
    const/4 v3, 0x0

    .line 880
    const/4 v5, 0x0

    .line 881
    const/4 v6, 0x0

    .line 882
    invoke-direct/range {v2 .. v8}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 883
    .line 884
    .line 885
    return-object v2

    .line 886
    :cond_25
    invoke-static {}, Lr31;->o()V

    .line 887
    .line 888
    .line 889
    goto/16 :goto_b

    .line 890
    .line 891
    :goto_f
    :try_start_7
    invoke-virtual {v0, v13, v12}, La31;->y(Lso;Z)Ly21;

    .line 892
    .line 893
    .line 894
    move-result-object v0

    .line 895
    new-instance v3, Lv2;

    .line 896
    .line 897
    const-string v5, "\u622a\u56fe\u5df2\u8fc7\u671f\u3001\u7a97\u53e3\u51e0\u4f55\u5df2\u53d8\u5316\u6216\u65e0\u6cd5\u91cd\u65b0\u622a\u56fe\uff0c\u6ca1\u6709\u70b9\u51fb\u3002\u8bf7\u91cd\u65b0 screen \u52a0 image \u518d\u70b9\u3002"

    .line 898
    .line 899
    invoke-static {v0}, La31;->L(Ly21;)Lh22;

    .line 900
    .line 901
    .line 902
    move-result-object v1

    .line 903
    iget-boolean v0, v0, Ly21;->g:Z

    .line 904
    .line 905
    if-nez v0, :cond_28

    .line 906
    .line 907
    if-eqz v2, :cond_26

    .line 908
    .line 909
    iget-boolean v0, v2, Lb92;->d:Z

    .line 910
    .line 911
    if-ne v0, v14, :cond_26

    .line 912
    .line 913
    move v2, v14

    .line 914
    goto :goto_10

    .line 915
    :cond_26
    move v2, v12

    .line 916
    :goto_10
    if-eqz v2, :cond_27

    .line 917
    .line 918
    goto :goto_11

    .line 919
    :cond_27
    move v15, v12

    .line 920
    goto :goto_12

    .line 921
    :cond_28
    :goto_11
    move v15, v14

    .line 922
    :goto_12
    const/16 v0, 0x7ef

    .line 923
    .line 924
    const/4 v2, 0x0

    .line 925
    invoke-static {v1, v2, v15, v0}, Lh22;->a(Lh22;Ljava/lang/String;ZI)Lh22;

    .line 926
    .line 927
    .line 928
    move-result-object v6

    .line 929
    const/4 v8, 0x0

    .line 930
    const/16 v9, 0x78

    .line 931
    .line 932
    const/4 v4, 0x0

    .line 933
    const/4 v7, 0x0

    .line 934
    invoke-direct/range {v3 .. v9}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 935
    .line 936
    .line 937
    invoke-virtual {v13}, Lso;->b()V

    .line 938
    .line 939
    .line 940
    return-object v3

    .line 941
    :cond_29
    :try_start_8
    new-instance v0, Ljava/lang/InterruptedException;

    .line 942
    .line 943
    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    .line 944
    .line 945
    .line 946
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 947
    :goto_13
    invoke-virtual {v13}, Lso;->b()V

    .line 948
    .line 949
    .line 950
    throw v0

    .line 951
    :cond_2a
    :goto_14
    new-instance v1, Lv2;

    .line 952
    .line 953
    const-string v3, "\u8fd9\u4e00\u5c4f\u8bfb\u4e0d\u5230\u5185\u5bb9\uff08\u53ef\u80fd\u53d7\u654f\u611f\u89c6\u56fe\u7b56\u7565\u9650\u5236\uff09\uff0c\u6309\u622a\u56fe\u5750\u6807\u76f4\u63a5\u70b9\u3002"

    .line 954
    .line 955
    invoke-virtual {v0}, La31;->v()Lh22;

    .line 956
    .line 957
    .line 958
    move-result-object v4

    .line 959
    const/4 v6, 0x0

    .line 960
    const/16 v7, 0x78

    .line 961
    .line 962
    const/4 v2, 0x0

    .line 963
    const/4 v5, 0x0

    .line 964
    invoke-direct/range {v1 .. v7}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 965
    .line 966
    .line 967
    return-object v1

    .line 968
    :cond_2b
    :goto_15
    new-instance v2, Lv2;

    .line 969
    .line 970
    iget-object v0, v9, Lbi1;->a:Ljava/lang/String;

    .line 971
    .line 972
    const-string v1, "\u5c4f\u5e55 "

    .line 973
    .line 974
    const-string v3, " \u6ca1\u6709\u5df2\u901a\u8fc7\u672c\u6b21\u8fc7\u6ee4\u7684\u622a\u56fe\u3002\u5750\u6807\u64cd\u4f5c\u8981\u5148\u7528 screen \u52a0 image \u62ff\u4e00\u5f20\u5b9e\u9645\u4fdd\u7559\u7684\u622a\u56fe\u3002"

    .line 975
    .line 976
    invoke-static {v1, v0, v3}, Lmo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 977
    .line 978
    .line 979
    move-result-object v4

    .line 980
    const/4 v7, 0x0

    .line 981
    const/16 v8, 0x7c

    .line 982
    .line 983
    const/4 v3, 0x0

    .line 984
    const/4 v5, 0x0

    .line 985
    const/4 v6, 0x0

    .line 986
    invoke-direct/range {v2 .. v8}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 987
    .line 988
    .line 989
    return-object v2

    .line 990
    :cond_2c
    :goto_16
    invoke-virtual {v0}, La31;->v()Lh22;

    .line 991
    .line 992
    .line 993
    move-result-object v6

    .line 994
    new-instance v3, Lv2;

    .line 995
    .line 996
    iget-object v0, v9, Lbi1;->a:Ljava/lang/String;

    .line 997
    .line 998
    const-string v1, "\u5c4f\u5e55\u7f16\u53f7 "

    .line 999
    .line 1000
    const-string v2, " \u5df2\u8fc7\u671f\uff0c\u5750\u6807\u5bf9\u4e0d\u4e0a\u4e86\u3002\u8bf7\u91cd\u65b0 screen \u52a0 image \u518d\u70b9\u3002"

    .line 1001
    .line 1002
    invoke-static {v1, v0, v2}, Lmo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1003
    .line 1004
    .line 1005
    move-result-object v5

    .line 1006
    const/4 v8, 0x0

    .line 1007
    const/16 v9, 0x78

    .line 1008
    .line 1009
    const/4 v4, 0x0

    .line 1010
    const/4 v7, 0x0

    .line 1011
    invoke-direct/range {v3 .. v9}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 1012
    .line 1013
    .line 1014
    return-object v3
.end method

.method public final M(Lci1;JLzk0;)Lv2;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    move-wide/from16 v4, p2

    .line 6
    .line 7
    const-string v1, "["

    .line 8
    .line 9
    const-string v7, " \u4f46\u672c\u4efb\u52a1\u5df2\u6682\u505c\u6216\u505c\u6b62\uff0c\u6ca1\u6709\u63d0\u4ea4\u3002"

    .line 10
    .line 11
    iget-object v2, v6, Lci1;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget v3, v6, Lci1;->b:I

    .line 14
    .line 15
    const/4 v8, 0x0

    .line 16
    invoke-virtual {v0, v3, v2, v8}, La31;->F(ILjava/lang/String;Z)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    instance-of v3, v2, Lx21;

    .line 21
    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    move-object v3, v2

    .line 25
    check-cast v3, Lx21;

    .line 26
    .line 27
    :goto_0
    move-object v11, v3

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    const/4 v3, 0x0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    if-nez v11, :cond_1

    .line 32
    .line 33
    check-cast v2, Lv2;

    .line 34
    .line 35
    return-object v2

    .line 36
    :cond_1
    :try_start_0
    invoke-virtual {v0, v11}, La31;->D(Lx21;)Lv2;

    .line 37
    .line 38
    .line 39
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    iget-object v0, v11, Lx21;->c:Lso;

    .line 43
    .line 44
    invoke-virtual {v0}, Lso;->b()V

    .line 45
    .line 46
    .line 47
    return-object v2

    .line 48
    :cond_2
    :try_start_1
    iget-object v2, v11, Lx21;->b:Ll12;

    .line 49
    .line 50
    iget-object v2, v2, Ll12;->e:Lj90;

    .line 51
    .line 52
    sget-object v3, Lj90;->INPUT:Lj90;

    .line 53
    .line 54
    const/16 v9, 0x18

    .line 55
    .line 56
    if-ne v2, v3, :cond_1d

    .line 57
    .line 58
    iget-object v2, v11, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 59
    .line 60
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isEditable()Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-nez v2, :cond_3

    .line 65
    .line 66
    goto/16 :goto_f

    .line 67
    .line 68
    :cond_3
    iget-object v1, v11, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 69
    .line 70
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->isPassword()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    invoke-static {}, La31;->o()Lhp1;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-boolean v1, v1, Lhp1;->b:Z

    .line 81
    .line 82
    if-nez v1, :cond_4

    .line 83
    .line 84
    new-instance v12, Lv2;

    .line 85
    .line 86
    const-string v14, "\u8fd9\u662f\u5bc6\u7801\u6846\uff0cDSH \u4e0d\u4ee3\u586b\u3002\u8bf7\u7528 handoff \u8ba9\u7528\u6237\u81ea\u5df1\u8f93\u5165\u3002"

    .line 87
    .line 88
    const/16 v17, 0x0

    .line 89
    .line 90
    const/16 v18, 0x7c

    .line 91
    .line 92
    const/4 v13, 0x0

    .line 93
    const/4 v15, 0x0

    .line 94
    const/16 v16, 0x0

    .line 95
    .line 96
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    .line 98
    .line 99
    :goto_2
    iget-object v0, v11, Lx21;->c:Lso;

    .line 100
    .line 101
    invoke-virtual {v0}, Lso;->b()V

    .line 102
    .line 103
    .line 104
    return-object v12

    .line 105
    :catchall_0
    move-exception v0

    .line 106
    goto/16 :goto_10

    .line 107
    .line 108
    :cond_4
    :try_start_2
    iget-object v1, v6, Lci1;->c:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    const/16 v2, 0x7d0

    .line 115
    .line 116
    if-le v1, v2, :cond_5

    .line 117
    .line 118
    new-instance v12, Lv2;

    .line 119
    .line 120
    const-string v14, "\u4e00\u6b21\u6700\u591a\u8f93\u5165 2000 \u5b57\u3002"

    .line 121
    .line 122
    const/16 v17, 0x0

    .line 123
    .line 124
    const/16 v18, 0x7c

    .line 125
    .line 126
    const/4 v13, 0x0

    .line 127
    const/4 v15, 0x0

    .line 128
    const/16 v16, 0x0

    .line 129
    .line 130
    invoke-direct/range {v12 .. v18}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_5
    invoke-static/range {p4 .. p4}, Lvb4;->b(Lzk0;)Lv2;

    .line 135
    .line 136
    .line 137
    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 138
    if-eqz v1, :cond_6

    .line 139
    .line 140
    :goto_3
    iget-object v0, v11, Lx21;->c:Lso;

    .line 141
    .line 142
    invoke-virtual {v0}, Lso;->b()V

    .line 143
    .line 144
    .line 145
    return-object v1

    .line 146
    :cond_6
    :try_start_3
    iget-object v1, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 147
    .line 148
    iget-object v1, v1, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 149
    .line 150
    iget-wide v1, v1, Lfb0;->b:J

    .line 151
    .line 152
    iget-object v3, v0, La31;->e:Lr3;

    .line 153
    .line 154
    iget-object v10, v11, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 155
    .line 156
    iget-object v12, v6, Lci1;->c:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    .line 163
    .line 164
    new-instance v3, Landroid/os/Bundle;

    .line 165
    .line 166
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 167
    .line 168
    .line 169
    const-string v13, "ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE"

    .line 170
    .line 171
    invoke-virtual {v3, v13, v12}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocused()Z

    .line 175
    .line 176
    .line 177
    move-result v12

    .line 178
    const/4 v13, 0x1

    .line 179
    if-nez v12, :cond_9

    .line 180
    .line 181
    invoke-virtual {v0, v4, v5}, La31;->f(J)Z

    .line 182
    .line 183
    .line 184
    move-result v12

    .line 185
    if-nez v12, :cond_7

    .line 186
    .line 187
    invoke-interface/range {p4 .. p4}, Lzk0;->invoke()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v12

    .line 191
    check-cast v12, Ljava/lang/Boolean;

    .line 192
    .line 193
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    .line 194
    .line 195
    .line 196
    move-result v12

    .line 197
    if-eqz v12, :cond_7

    .line 198
    .line 199
    move v12, v13

    .line 200
    goto :goto_4

    .line 201
    :cond_7
    move v12, v8

    .line 202
    :goto_4
    if-nez v12, :cond_8

    .line 203
    .line 204
    goto :goto_6

    .line 205
    :cond_8
    invoke-virtual {v10, v13}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    .line 206
    .line 207
    .line 208
    :cond_9
    invoke-virtual {v0, v4, v5}, La31;->f(J)Z

    .line 209
    .line 210
    .line 211
    move-result v12

    .line 212
    if-nez v12, :cond_a

    .line 213
    .line 214
    invoke-interface/range {p4 .. p4}, Lzk0;->invoke()Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v12

    .line 218
    check-cast v12, Ljava/lang/Boolean;

    .line 219
    .line 220
    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    .line 221
    .line 222
    .line 223
    move-result v12

    .line 224
    if-eqz v12, :cond_a

    .line 225
    .line 226
    move v12, v13

    .line 227
    goto :goto_5

    .line 228
    :cond_a
    move v12, v8

    .line 229
    :goto_5
    if-nez v12, :cond_b

    .line 230
    .line 231
    :goto_6
    move v3, v8

    .line 232
    goto :goto_7

    .line 233
    :cond_b
    const/high16 v12, 0x200000

    .line 234
    .line 235
    invoke-virtual {v10, v12, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(ILandroid/os/Bundle;)Z

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    :goto_7
    if-nez v3, :cond_c

    .line 240
    .line 241
    iget-object v3, v11, Lx21;->a:Ly21;

    .line 242
    .line 243
    const-string v6, "\u8f93\u5165\u672a\u83b7\u7cfb\u7edf\u786e\u8ba4\uff0c\u8f93\u5165\u3001\u7126\u70b9\u6216\u70b9\u51fb\u53ef\u80fd\u5df2\u4ea7\u751f\u90e8\u5206\u6548\u679c\uff1b\u8bf7\u5148\u6838\u5bf9\u65b0\u5c4f\u5e55\uff0c\u4e0d\u8981\u91cd\u590d\u8f93\u5165\u3002"

    .line 244
    .line 245
    const/4 v9, 0x0

    .line 246
    const/16 v10, 0x1b0

    .line 247
    .line 248
    const/4 v7, 0x0

    .line 249
    const/4 v8, 0x0

    .line 250
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 251
    .line 252
    .line 253
    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 254
    :goto_8
    iget-object v1, v11, Lx21;->c:Lso;

    .line 255
    .line 256
    invoke-virtual {v1}, Lso;->b()V

    .line 257
    .line 258
    .line 259
    return-object v0

    .line 260
    :cond_c
    move-wide v14, v1

    .line 261
    :try_start_4
    iget-object v1, v11, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 262
    .line 263
    iget-object v2, v6, Lci1;->c:Ljava/lang/String;

    .line 264
    .line 265
    iget-boolean v0, v6, Lci1;->d:Z

    .line 266
    .line 267
    xor-int/lit8 v5, v0, 0x1

    .line 268
    .line 269
    move-object/from16 v0, p0

    .line 270
    .line 271
    move-wide/from16 v3, p2

    .line 272
    .line 273
    invoke-virtual/range {v0 .. v5}, La31;->C(Landroid/view/accessibility/AccessibilityNodeInfo;Ljava/lang/String;JZ)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    iget-object v0, v11, Lx21;->b:Ll12;

    .line 278
    .line 279
    iget-object v0, v0, Ll12;->g:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    if-nez v2, :cond_d

    .line 286
    .line 287
    const-string v0, "\u8f93\u5165\u6846"

    .line 288
    .line 289
    :cond_d
    invoke-static {v9, v0}, Lv12;->e(ILjava/lang/String;)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    iget-object v2, v6, Lci1;->c:Ljava/lang/String;

    .line 294
    .line 295
    iget-boolean v3, v6, Lci1;->d:Z

    .line 296
    .line 297
    xor-int/2addr v3, v13

    .line 298
    invoke-static {v1, v2, v3}, Lyb4;->c(Ljava/lang/String;Ljava/lang/String;Z)Lav1;

    .line 299
    .line 300
    .line 301
    move-result-object v2

    .line 302
    sget-object v3, Lav1;->DIFFERENT:Lav1;

    .line 303
    .line 304
    if-eq v2, v3, :cond_e

    .line 305
    .line 306
    sget-object v3, Lav1;->UNKNOWN:Lav1;

    .line 307
    .line 308
    if-ne v2, v3, :cond_f

    .line 309
    .line 310
    :cond_e
    move-object/from16 v0, p0

    .line 311
    .line 312
    goto/16 :goto_e

    .line 313
    .line 314
    :cond_f
    const-string v1, "\u5df2\u5728\u300c"

    .line 315
    .line 316
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 317
    .line 318
    .line 319
    sget-object v3, Lb31;->a:[I

    .line 320
    .line 321
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 322
    .line 323
    .line 324
    move-result v2

    .line 325
    aget v2, v3, v2

    .line 326
    .line 327
    if-eq v2, v13, :cond_11

    .line 328
    .line 329
    const/4 v3, 0x2

    .line 330
    if-eq v2, v3, :cond_10

    .line 331
    .line 332
    const-string v2, "\u300d\u8f93\u5165\uff0c\u4f46\u8bfb\u56de\u6765\u662f\u7a7a\u7684\uff1a\u8fd9\u4e2a\u5e94\u7528\u53ef\u80fd\u4e0d\u628a\u6846\u91cc\u7684\u5b57\u4ea4\u7ed9\u8bfb\u5c4f\uff08\u6bd4\u5982\u8ba1\u7b97\u5668\u7684\u663e\u793a\u5c4f\uff09\uff0c\u65e0\u6cd5\u786e\u8ba4\u5185\u5bb9\u3002\u4e0d\u8981\u91cd\u590d\u8f93\u5165\uff0c\u80fd\u622a\u56fe\u5c31\u622a\u56fe\u6838\u5bf9\u3002"

    .line 333
    .line 334
    invoke-static {v1, v0, v2}, Lmo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    goto :goto_9

    .line 339
    :cond_10
    const-string v2, "\u300d\u8f93\u5165\uff0c\u56de\u8bfb\u4e00\u81f4\uff08\u5e94\u7528\u8c03\u6574\u4e86\u5199\u6cd5\uff09\u3002"

    .line 340
    .line 341
    invoke-static {v1, v0, v2}, Lmo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    goto :goto_9

    .line 346
    :cond_11
    const-string v2, "\u300d\u8f93\u5165\uff0c\u56de\u8bfb\u4e00\u81f4\u3002"

    .line 347
    .line 348
    invoke-static {v1, v0, v2}, Lmo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    :goto_9
    iget-boolean v1, v6, Lci1;->d:Z

    .line 353
    .line 354
    if-eqz v1, :cond_1b

    .line 355
    .line 356
    invoke-interface/range {p4 .. p4}, Lzk0;->invoke()Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    check-cast v1, Ljava/lang/Boolean;

    .line 361
    .line 362
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 363
    .line 364
    .line 365
    move-result v1

    .line 366
    if-nez v1, :cond_12

    .line 367
    .line 368
    new-instance v16, Lv2;

    .line 369
    .line 370
    invoke-virtual {v0, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v18

    .line 374
    const/16 v21, 0x0

    .line 375
    .line 376
    const/16 v22, 0x7c

    .line 377
    .line 378
    const/16 v17, 0x0

    .line 379
    .line 380
    const/16 v19, 0x0

    .line 381
    .line 382
    const/16 v20, 0x0

    .line 383
    .line 384
    invoke-direct/range {v16 .. v22}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 385
    .line 386
    .line 387
    iget-object v0, v11, Lx21;->c:Lso;

    .line 388
    .line 389
    invoke-virtual {v0}, Lso;->b()V

    .line 390
    .line 391
    .line 392
    return-object v16

    .line 393
    :cond_12
    :try_start_5
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 394
    .line 395
    const/16 v2, 0x1e

    .line 396
    .line 397
    if-lt v1, v2, :cond_14

    .line 398
    .line 399
    iget-object v1, v11, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 400
    .line 401
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->refresh()Z

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    if-nez v1, :cond_13

    .line 406
    .line 407
    goto :goto_a

    .line 408
    :cond_13
    invoke-static {}, Lli0;->o()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 409
    .line 410
    .line 411
    move-result-object v1

    .line 412
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getId()I

    .line 413
    .line 414
    .line 415
    move-result v1

    .line 416
    iget-object v2, v11, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 417
    .line 418
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->getActionList()Ljava/util/List;

    .line 419
    .line 420
    .line 421
    move-result-object v2

    .line 422
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 423
    .line 424
    .line 425
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 426
    .line 427
    .line 428
    move-result v3

    .line 429
    if-eqz v3, :cond_15

    .line 430
    .line 431
    :cond_14
    :goto_a
    move-object/from16 v3, p0

    .line 432
    .line 433
    move-wide/from16 v4, p2

    .line 434
    .line 435
    goto :goto_c

    .line 436
    :cond_15
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 441
    .line 442
    .line 443
    move-result v3

    .line 444
    if-eqz v3, :cond_14

    .line 445
    .line 446
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    move-result-object v3

    .line 450
    check-cast v3, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 451
    .line 452
    invoke-virtual {v3}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;->getId()I

    .line 453
    .line 454
    .line 455
    move-result v3

    .line 456
    if-ne v3, v1, :cond_18

    .line 457
    .line 458
    iget-object v2, v11, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 459
    .line 460
    invoke-static {v2}, La31;->q(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    .line 461
    .line 462
    .line 463
    move-result v2

    .line 464
    if-eqz v2, :cond_16

    .line 465
    .line 466
    invoke-static {}, La31;->o()Lhp1;

    .line 467
    .line 468
    .line 469
    move-result-object v2

    .line 470
    iget-boolean v2, v2, Lhp1;->b:Z

    .line 471
    .line 472
    if-nez v2, :cond_16

    .line 473
    .line 474
    iget-object v3, v11, Lx21;->a:Ly21;

    .line 475
    .line 476
    const-string v6, "\u5df2\u8f93\u5165\uff0c\u4f46\u8f93\u5165\u6846\u73b0\u5728\u5c5e\u4e8e\u5bc6\u7801\u6216\u9a8c\u8bc1\u7801\u7b49\u654f\u611f\u5b57\u6bb5\uff0c\u672a\u53d1\u8d77\u952e\u76d8\u63d0\u4ea4\u3002\u8bf7\u4ea4\u7ed9\u7528\u6237\u6838\u5bf9\uff1b\u4e0d\u8981\u91cd\u590d\u8f93\u5165\u3002"

    .line 477
    .line 478
    const/4 v9, 0x0

    .line 479
    const/16 v10, 0x1b0

    .line 480
    .line 481
    const/4 v7, 0x0

    .line 482
    const/4 v8, 0x0

    .line 483
    move-object/from16 v0, p0

    .line 484
    .line 485
    move-wide/from16 v4, p2

    .line 486
    .line 487
    move-wide v1, v14

    .line 488
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    goto/16 :goto_8

    .line 493
    .line 494
    :cond_16
    move-object/from16 v3, p0

    .line 495
    .line 496
    move-wide/from16 v4, p2

    .line 497
    .line 498
    invoke-virtual {v3, v4, v5}, La31;->f(J)Z

    .line 499
    .line 500
    .line 501
    move-result v2

    .line 502
    if-nez v2, :cond_19

    .line 503
    .line 504
    invoke-interface/range {p4 .. p4}, Lzk0;->invoke()Ljava/lang/Object;

    .line 505
    .line 506
    .line 507
    move-result-object v2

    .line 508
    check-cast v2, Ljava/lang/Boolean;

    .line 509
    .line 510
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 511
    .line 512
    .line 513
    move-result v2

    .line 514
    if-nez v2, :cond_17

    .line 515
    .line 516
    goto :goto_c

    .line 517
    :cond_17
    iget-object v2, v11, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 518
    .line 519
    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->performAction(I)Z

    .line 520
    .line 521
    .line 522
    move-result v8

    .line 523
    goto :goto_c

    .line 524
    :cond_18
    move-object/from16 v3, p0

    .line 525
    .line 526
    move-wide/from16 v4, p2

    .line 527
    .line 528
    goto :goto_b

    .line 529
    :cond_19
    :goto_c
    if-eqz v8, :cond_1a

    .line 530
    .line 531
    new-instance v1, Ljava/lang/StringBuilder;

    .line 532
    .line 533
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 534
    .line 535
    .line 536
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    const-string v0, "\u5df2\u63d0\u4ea4\u952e\u76d8\u4e0a\u7684\u53d1\u9001 / \u641c\u7d22\u64cd\u4f5c\u3002"

    .line 540
    .line 541
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object v0

    .line 548
    move-object v6, v0

    .line 549
    move-wide v1, v14

    .line 550
    goto :goto_d

    .line 551
    :cond_1a
    iget-object v3, v11, Lx21;->a:Ly21;

    .line 552
    .line 553
    new-instance v1, Ljava/lang/StringBuilder;

    .line 554
    .line 555
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 556
    .line 557
    .line 558
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 559
    .line 560
    .line 561
    const-string v0, " \u4f46\u952e\u76d8\u63d0\u4ea4\u672a\u83b7\u7cfb\u7edf\u786e\u8ba4\uff1b\u4e0d\u8981\u91cd\u590d\u8f93\u5165\u6216\u63d0\u4ea4\uff0c\u8bf7\u5148\u6838\u5bf9\u65b0\u5c4f\u5e55\u3002"

    .line 562
    .line 563
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 564
    .line 565
    .line 566
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 567
    .line 568
    .line 569
    move-result-object v6

    .line 570
    const/4 v9, 0x0

    .line 571
    const/16 v10, 0x1b0

    .line 572
    .line 573
    const/4 v7, 0x0

    .line 574
    const/4 v8, 0x0

    .line 575
    move-object/from16 v0, p0

    .line 576
    .line 577
    move-wide v1, v14

    .line 578
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 579
    .line 580
    .line 581
    move-result-object v0

    .line 582
    goto/16 :goto_8

    .line 583
    .line 584
    :cond_1b
    move-wide v1, v14

    .line 585
    move-object v6, v0

    .line 586
    :goto_d
    iget-object v3, v11, Lx21;->a:Ly21;

    .line 587
    .line 588
    const/4 v9, 0x0

    .line 589
    const/16 v10, 0x1f0

    .line 590
    .line 591
    const/4 v7, 0x0

    .line 592
    const/4 v8, 0x0

    .line 593
    move-object/from16 v0, p0

    .line 594
    .line 595
    move-wide/from16 v4, p2

    .line 596
    .line 597
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 598
    .line 599
    .line 600
    move-result-object v0

    .line 601
    goto/16 :goto_8

    .line 602
    .line 603
    :goto_e
    iget-object v3, v11, Lx21;->a:Ly21;

    .line 604
    .line 605
    iget-object v2, v3, Ly21;->a:Ljava/lang/String;

    .line 606
    .line 607
    iget-object v4, v11, Lx21;->b:Ll12;

    .line 608
    .line 609
    invoke-virtual {v0, v2, v4}, La31;->p(Ljava/lang/String;Ll12;)Lsg2;

    .line 610
    .line 611
    .line 612
    move-result-object v2

    .line 613
    if-eqz v1, :cond_1c

    .line 614
    .line 615
    iget-object v4, v11, Lx21;->d:Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 616
    .line 617
    invoke-static {v4}, La31;->q(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    .line 618
    .line 619
    .line 620
    move-result v4

    .line 621
    if-eqz v4, :cond_1c

    .line 622
    .line 623
    move v8, v13

    .line 624
    :cond_1c
    invoke-static {v1, v2, v8}, Lvb4;->a(Ljava/lang/String;Lsg2;Z)Ljava/lang/String;

    .line 625
    .line 626
    .line 627
    move-result-object v6

    .line 628
    const/4 v9, 0x0

    .line 629
    const/16 v10, 0x1b0

    .line 630
    .line 631
    const/4 v7, 0x0

    .line 632
    const/4 v8, 0x0

    .line 633
    move-wide/from16 v4, p2

    .line 634
    .line 635
    move-wide v1, v14

    .line 636
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 637
    .line 638
    .line 639
    move-result-object v0

    .line 640
    goto/16 :goto_8

    .line 641
    .line 642
    :cond_1d
    :goto_f
    new-instance v0, Lv2;

    .line 643
    .line 644
    iget v2, v6, Lci1;->b:I

    .line 645
    .line 646
    iget-object v3, v11, Lx21;->b:Ll12;

    .line 647
    .line 648
    iget-object v3, v3, Ll12;->g:Ljava/lang/String;

    .line 649
    .line 650
    invoke-static {v9, v3}, Lv12;->e(ILjava/lang/String;)Ljava/lang/String;

    .line 651
    .line 652
    .line 653
    move-result-object v3

    .line 654
    new-instance v4, Ljava/lang/StringBuilder;

    .line 655
    .line 656
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 657
    .line 658
    .line 659
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 660
    .line 661
    .line 662
    const-string v1, "]\u300c"

    .line 663
    .line 664
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 665
    .line 666
    .line 667
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 668
    .line 669
    .line 670
    const-string v1, "\u300d\u4e0d\u662f\u8f93\u5165\u6846\uff1a\u5148\u70b9\u5b83\uff0c\u7b49\u8f93\u5165\u6846\u51fa\u73b0\u518d\u8f93\u5165\u3002"

    .line 671
    .line 672
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 673
    .line 674
    .line 675
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 676
    .line 677
    .line 678
    move-result-object v3

    .line 679
    const/4 v6, 0x0

    .line 680
    const/16 v7, 0x7c

    .line 681
    .line 682
    const/4 v2, 0x0

    .line 683
    const/4 v4, 0x0

    .line 684
    const/4 v5, 0x0

    .line 685
    move-object v1, v0

    .line 686
    invoke-direct/range {v1 .. v7}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 687
    .line 688
    .line 689
    goto/16 :goto_3

    .line 690
    .line 691
    :goto_10
    iget-object v1, v11, Lx21;->c:Lso;

    .line 692
    .line 693
    invoke-virtual {v1}, Lso;->b()V

    .line 694
    .line 695
    .line 696
    throw v0
.end method

.method public final N(Lso;)Z
    .locals 4

    .line 1
    iget-object v0, p1, Lso;->p:Ljava/lang/Long;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-virtual {p0}, La31;->B()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, La31;->q:Ly10;

    .line 16
    .line 17
    invoke-virtual {v2}, Ly10;->g()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object p1, p1, Lso;->q:Ljava/lang/Long;

    .line 26
    .line 27
    iget-object p0, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 28
    .line 29
    iget-object p0, p0, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 30
    .line 31
    iget-wide v0, p0, Lfb0;->b:J

    .line 32
    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    cmp-long p0, p0, v0

    .line 41
    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 47
    return p0
.end method

.method public final P(Li50;Lvi0;)Z
    .locals 7

    .line 1
    invoke-virtual {p0, p1}, La31;->l(Li50;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_7

    .line 7
    .line 8
    invoke-virtual {p2}, Lvi0;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_7

    .line 13
    .line 14
    invoke-virtual {p0}, La31;->availability()Lsb;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-boolean v0, v0, Lsb;->a:Z

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto/16 :goto_2

    .line 23
    .line 24
    :cond_0
    invoke-static {}, La31;->o()Lhp1;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v2, p1, Li50;->g:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v2, Ll12;

    .line 31
    .line 32
    iget-object v3, p1, Li50;->f:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v3, Ly21;

    .line 35
    .line 36
    iget-object v4, v2, Ll12;->c:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v5, p0, La31;->d:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v4, v5}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-nez v4, :cond_1

    .line 45
    .line 46
    iget-boolean v4, v3, Ly21;->f:Z

    .line 47
    .line 48
    if-eqz v4, :cond_2

    .line 49
    .line 50
    :cond_1
    iget-boolean v4, v0, Lhp1;->c:Z

    .line 51
    .line 52
    if-eqz v4, :cond_7

    .line 53
    .line 54
    :cond_2
    iget-boolean v3, v3, Ly21;->e:Z

    .line 55
    .line 56
    if-eqz v3, :cond_3

    .line 57
    .line 58
    iget-boolean v0, v0, Lhp1;->a:Z

    .line 59
    .line 60
    if-nez v0, :cond_3

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_3
    iget-object v0, p2, Lvi0;->d:Lbj0;

    .line 64
    .line 65
    iget-object v3, v0, Lbj0;->c:Laj0;

    .line 66
    .line 67
    iget v4, v3, Laj0;->b:I

    .line 68
    .line 69
    iget-object v5, v3, Laj0;->a:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v6, v2, Ll12;->c:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v5, v6}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    if-eqz v5, :cond_7

    .line 78
    .line 79
    iget v5, v3, Laj0;->c:I

    .line 80
    .line 81
    iget v6, p1, Li50;->e:I

    .line 82
    .line 83
    if-ne v5, v6, :cond_7

    .line 84
    .line 85
    iget v5, v0, Lbj0;->d:I

    .line 86
    .line 87
    iget v6, p1, Li50;->c:I

    .line 88
    .line 89
    if-ne v5, v6, :cond_7

    .line 90
    .line 91
    iget v0, v0, Lbj0;->e:I

    .line 92
    .line 93
    iget v5, p1, Li50;->d:I

    .line 94
    .line 95
    if-ne v0, v5, :cond_7

    .line 96
    .line 97
    if-eqz v4, :cond_7

    .line 98
    .line 99
    const/4 v0, -0x1

    .line 100
    if-ne v4, v0, :cond_4

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_4
    :try_start_0
    iget-object v0, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 104
    .line 105
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v3, v3, Laj0;->a:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v3}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    iget-object v2, v2, Ll12;->n:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {v0, v2}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_5

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_5
    const-wide/16 v2, 0x0

    .line 132
    .line 133
    const/4 v0, 0x3

    .line 134
    invoke-static {p0, v2, v3, v1, v0}, La31;->h(La31;JZI)Lso;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    const/4 v2, 0x1

    .line 139
    :try_start_1
    invoke-virtual {p0, v0, p1, v2}, La31;->n(Lso;Li50;Z)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    if-eqz p0, :cond_6

    .line 144
    .line 145
    invoke-virtual {p2}, Lvi0;->a()Z

    .line 146
    .line 147
    .line 148
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    if-eqz p0, :cond_6

    .line 150
    .line 151
    move v1, v2

    .line 152
    goto :goto_0

    .line 153
    :catchall_0
    move-exception p0

    .line 154
    goto :goto_1

    .line 155
    :cond_6
    :goto_0
    invoke-virtual {v0}, Lso;->b()V

    .line 156
    .line 157
    .line 158
    return v1

    .line 159
    :goto_1
    invoke-virtual {v0}, Lso;->b()V

    .line 160
    .line 161
    .line 162
    throw p0

    .line 163
    :catch_0
    :cond_7
    :goto_2
    return v1
.end method

.method public final Q(Lso;Ly21;JJ)Z
    .locals 5

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, La31;->w(Lso;Ly21;J)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    sub-long v1, p5, v1

    .line 14
    .line 15
    const-wide/16 v3, 0x0

    .line 16
    .line 17
    cmp-long p1, v1, v3

    .line 18
    .line 19
    if-gtz p1, :cond_1

    .line 20
    .line 21
    :goto_0
    return v0

    .line 22
    :cond_1
    const-wide/16 v3, 0x7d0

    .line 23
    .line 24
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    const/4 p1, 0x2

    .line 29
    invoke-static {p0, v1, v2, v0, p1}, La31;->h(La31;JZI)Lso;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    cmp-long p5, v1, p5

    .line 38
    .line 39
    if-gez p5, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0, p1, p2, p3, p4}, La31;->w(Lso;Ly21;J)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    invoke-static {p1}, La31;->u(Lso;)Lc12;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    iget-object p2, p2, Ly21;->i:Lc12;

    .line 52
    .line 53
    invoke-virtual {p0, p2}, Lc12;->c(Lc12;)Z

    .line 54
    .line 55
    .line 56
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    const/4 v0, 0x1

    .line 60
    goto :goto_1

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    :goto_1
    invoke-virtual {p1}, Lso;->b()V

    .line 64
    .line 65
    .line 66
    return v0

    .line 67
    :goto_2
    invoke-virtual {p1}, Lso;->b()V

    .line 68
    .line 69
    .line 70
    throw p0
.end method

.method public final a()V
    .locals 4

    .line 1
    iget-wide v0, p0, La31;->v:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, La31;->v:J

    .line 7
    .line 8
    iget-object v0, p0, La31;->q:Ly10;

    .line 9
    .line 10
    invoke-virtual {v0}, Ly10;->d()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, La31;->j()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final acceptVisualObservation(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, La31;->p:Ly21;

    .line 5
    .line 6
    invoke-virtual {p0}, La31;->B()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v2, v0, Ly21;->a:Ljava/lang/String;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move-object v2, v1

    .line 19
    :goto_0
    invoke-static {v2, p1}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_3

    .line 24
    .line 25
    invoke-virtual {p0, v0}, La31;->k(Ly21;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    iget-object p0, p0, La31;->q:Ly10;

    .line 32
    .line 33
    monitor-enter p0

    .line 34
    :try_start_0
    iget-object v0, p0, Ly10;->Y:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0, p1}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-object v0, p0, Ly10;->X:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v0, Lue1;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, v0, Lue1;->m:Ljava/lang/Object;

    .line 51
    .line 52
    move-object v1, v0

    .line 53
    check-cast v1, Ljava/lang/String;

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :catchall_0
    move-exception p1

    .line 57
    goto :goto_2

    .line 58
    :cond_1
    :goto_1
    invoke-static {v1, p1}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    const/4 p1, 0x1

    .line 65
    iput-boolean p1, p0, Ly10;->m:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    :cond_2
    monitor-exit p0

    .line 68
    return-void

    .line 69
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    throw p1

    .line 71
    :cond_3
    return-void
.end method

.method public final availability()Lsb;
    .locals 4

    .line 1
    invoke-virtual {p0}, La31;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lsb;

    .line 11
    .line 12
    const v3, 0x7f0e0121

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v3}, Lki3;->b(Landroid/content/Context;I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v3, "DSH \u7684\u65e0\u969c\u788d\u670d\u52a1\u6ca1\u6709\u8fde\u63a5\u3002\u8bf7\u7528\u6237\u5230 \u7cfb\u7edf\u8bbe\u7f6e \u2192 \u65e0\u969c\u788d \u91cc\u91cd\u65b0\u6253\u5f00\u300cDSH \u624b\u673a\u64cd\u63a7\u300d\u3002"

    .line 20
    .line 21
    invoke-direct {v0, v3, v1, v2}, Lsb;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, La31;->j:Landroid/os/PowerManager;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/os/PowerManager;->isInteractive()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    new-instance v0, Lsb;

    .line 34
    .line 35
    const v3, 0x7f0e0123

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v3}, Lki3;->b(Landroid/content/Context;I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v3, "\u5c4f\u5e55\u5df2\u5173\u95ed\u3002DSH \u53ea\u5728\u4eae\u5c4f\u3001\u89e3\u9501\u65f6\u64cd\u4f5c\u624b\u673a\uff0c\u8bf7\u7528\u6237\u70b9\u4eae\u5e76\u89e3\u9501\u3002"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lsb;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object v0, p0, La31;->k:Landroid/app/KeyguardManager;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    new-instance v0, Lsb;

    .line 57
    .line 58
    const v3, 0x7f0e0122

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v3}, Lki3;->b(Landroid/content/Context;I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v3, "\u624b\u673a\u5df2\u9501\u5c4f\u3002\u8bf7\u7528\u6237\u89e3\u9501\u540e\u518d\u7ee7\u7eed\u3002"

    .line 66
    .line 67
    invoke-direct {v0, v3, v1, v2}, Lsb;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    new-instance v0, Lsb;

    .line 72
    .line 73
    const/4 v1, 0x0

    .line 74
    const/4 v2, 0x6

    .line 75
    const/4 v3, 0x1

    .line 76
    invoke-direct {v0, v2, v1, v3}, Lsb;-><init>(ILjava/lang/String;Z)V

    .line 77
    .line 78
    .line 79
    :goto_0
    iget-boolean v1, v0, Lsb;->a:Z

    .line 80
    .line 81
    if-nez v1, :cond_3

    .line 82
    .line 83
    iget-object v1, p0, La31;->q:Ly10;

    .line 84
    .line 85
    invoke-virtual {v1}, Ly10;->d()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, La31;->j()V

    .line 89
    .line 90
    .line 91
    :cond_3
    return-object v0
.end method

.method public final collect(Ljava/lang/String;IILjava/lang/String;Lzk0;Lbl0;)Lxr;
    .locals 8

    .line 1109
    new-instance v7, Lqb0;

    const/4 v0, 0x7

    invoke-direct {v7, v0}, Lqb0;-><init>(I)V

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v7}, La31;->collect(Ljava/lang/String;IILjava/lang/String;Lzk0;Lbl0;Lbl0;)Lxr;

    move-result-object p0

    return-object p0
.end method

.method public final collect(Ljava/lang/String;IILjava/lang/String;Lzk0;Lbl0;Lbl0;)Lxr;
    .locals 42

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v5, p6

    .line 8
    .line 9
    const-string v3, "\u5c4f\u5e55\u7f16\u53f7 "

    .line 10
    .line 11
    const-string v4, "["

    .line 12
    .line 13
    const-string v6, "\u5c4f\u5e55 "

    .line 14
    .line 15
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 20
    .line 21
    .line 22
    move-result-object v8

    .line 23
    invoke-static {v7, v8}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    if-eqz v7, :cond_0

    .line 28
    .line 29
    new-instance v0, Lxr;

    .line 30
    .line 31
    sget-object v1, Lca0;->m:Lca0;

    .line 32
    .line 33
    const-string v2, "\u5185\u90e8\u9519\u8bef\uff1a\u4e0d\u80fd\u5728\u4e3b\u7ebf\u7a0b\u6267\u884c"

    .line 34
    .line 35
    sget-object v3, Lwr;->UNAVAILABLE:Lwr;

    .line 36
    .line 37
    const/16 v4, 0x10

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    const/4 v6, 0x0

    .line 41
    const/4 v7, 0x0

    .line 42
    move-object/from16 p0, v0

    .line 43
    .line 44
    move-object/from16 p1, v1

    .line 45
    .line 46
    move-object/from16 p3, v2

    .line 47
    .line 48
    move-object/from16 p6, v3

    .line 49
    .line 50
    move/from16 p7, v4

    .line 51
    .line 52
    move/from16 p2, v5

    .line 53
    .line 54
    move-object/from16 p4, v6

    .line 55
    .line 56
    move-object/from16 p5, v7

    .line 57
    .line 58
    invoke-direct/range {p0 .. p7}, Lxr;-><init>(Ljava/util/List;ILjava/lang/String;Lh22;Ljava/util/Set;Lwr;I)V

    .line 59
    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_0
    iget-object v10, v1, La31;->o:Ljava/lang/Object;

    .line 63
    .line 64
    monitor-enter v10

    .line 65
    :try_start_0
    invoke-virtual {v1}, La31;->availability()Lsb;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    iget-boolean v8, v7, Lsb;->a:Z

    .line 70
    .line 71
    if-nez v8, :cond_1

    .line 72
    .line 73
    new-instance v0, Lxr;

    .line 74
    .line 75
    sget-object v1, Lca0;->m:Lca0;

    .line 76
    .line 77
    iget-object v2, v7, Lsb;->b:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    sget-object v3, Lwr;->UNAVAILABLE:Lwr;

    .line 83
    .line 84
    const/16 v4, 0x10

    .line 85
    .line 86
    const/4 v5, 0x0

    .line 87
    const/4 v6, 0x0

    .line 88
    const/4 v7, 0x0

    .line 89
    move-object/from16 p0, v0

    .line 90
    .line 91
    move-object/from16 p1, v1

    .line 92
    .line 93
    move-object/from16 p3, v2

    .line 94
    .line 95
    move-object/from16 p6, v3

    .line 96
    .line 97
    move/from16 p7, v4

    .line 98
    .line 99
    move/from16 p2, v5

    .line 100
    .line 101
    move-object/from16 p4, v6

    .line 102
    .line 103
    move-object/from16 p5, v7

    .line 104
    .line 105
    invoke-direct/range {p0 .. p7}, Lxr;-><init>(Ljava/util/List;ILjava/lang/String;Lh22;Ljava/util/Set;Lwr;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    .line 107
    .line 108
    monitor-exit v10

    .line 109
    return-object v0

    .line 110
    :catchall_0
    move-exception v0

    .line 111
    goto/16 :goto_1d

    .line 112
    .line 113
    :cond_1
    :try_start_1
    sget-object v7, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 114
    .line 115
    iget-object v7, v1, La31;->p:Ly21;

    .line 116
    .line 117
    if-eqz v7, :cond_29

    .line 118
    .line 119
    iget-object v8, v7, Ly21;->a:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {v8, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v8

    .line 125
    if-nez v8, :cond_2

    .line 126
    .line 127
    goto/16 :goto_1c

    .line 128
    .line 129
    :cond_2
    iget-boolean v3, v7, Ly21;->f:Z

    .line 130
    .line 131
    if-eqz v3, :cond_3

    .line 132
    .line 133
    invoke-static {}, La31;->o()Lhp1;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    iget-boolean v3, v3, Lhp1;->c:Z

    .line 138
    .line 139
    if-nez v3, :cond_3

    .line 140
    .line 141
    new-instance v0, Lxr;

    .line 142
    .line 143
    sget-object v1, Lca0;->m:Lca0;

    .line 144
    .line 145
    const-string v2, "\u8fd9\u662f DSH \u81ea\u5df1\u7684\u754c\u9762\uff0c\u4e0d\u8bfb\u53d6"

    .line 146
    .line 147
    sget-object v3, Lwr;->READ_REFUSED:Lwr;

    .line 148
    .line 149
    const/16 v4, 0x10

    .line 150
    .line 151
    const/4 v5, 0x0

    .line 152
    const/4 v6, 0x0

    .line 153
    const/4 v7, 0x0

    .line 154
    move-object/from16 p0, v0

    .line 155
    .line 156
    move-object/from16 p1, v1

    .line 157
    .line 158
    move-object/from16 p3, v2

    .line 159
    .line 160
    move-object/from16 p6, v3

    .line 161
    .line 162
    move/from16 p7, v4

    .line 163
    .line 164
    move/from16 p2, v5

    .line 165
    .line 166
    move-object/from16 p4, v6

    .line 167
    .line 168
    move-object/from16 p5, v7

    .line 169
    .line 170
    invoke-direct/range {p0 .. p7}, Lxr;-><init>(Ljava/util/List;ILjava/lang/String;Lh22;Ljava/util/Set;Lwr;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 171
    .line 172
    .line 173
    monitor-exit v10

    .line 174
    return-object v0

    .line 175
    :cond_3
    :try_start_2
    iget-object v3, v7, Ly21;->b:Ldk0;

    .line 176
    .line 177
    invoke-virtual {v3, v2}, Ldk0;->a(I)Ll12;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    if-nez v3, :cond_4

    .line 182
    .line 183
    new-instance v1, Lxr;

    .line 184
    .line 185
    sget-object v3, Lca0;->m:Lca0;

    .line 186
    .line 187
    new-instance v4, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    const-string v0, " \u91cc\u6ca1\u6709\u7f16\u53f7 "

    .line 196
    .line 197
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    sget-object v2, Lwr;->INVALID_TARGET:Lwr;

    .line 208
    .line 209
    const/16 v4, 0x10

    .line 210
    .line 211
    const/4 v5, 0x0

    .line 212
    const/4 v6, 0x0

    .line 213
    const/4 v7, 0x0

    .line 214
    move-object/from16 p3, v0

    .line 215
    .line 216
    move-object/from16 p0, v1

    .line 217
    .line 218
    move-object/from16 p6, v2

    .line 219
    .line 220
    move-object/from16 p1, v3

    .line 221
    .line 222
    move/from16 p7, v4

    .line 223
    .line 224
    move/from16 p2, v5

    .line 225
    .line 226
    move-object/from16 p4, v6

    .line 227
    .line 228
    move-object/from16 p5, v7

    .line 229
    .line 230
    invoke-direct/range {p0 .. p7}, Lxr;-><init>(Ljava/util/List;ILjava/lang/String;Lh22;Ljava/util/Set;Lwr;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 231
    .line 232
    .line 233
    move-object/from16 v0, p0

    .line 234
    .line 235
    monitor-exit v10

    .line 236
    return-object v0

    .line 237
    :cond_4
    :try_start_3
    iget-object v0, v3, Ll12;->e:Lj90;

    .line 238
    .line 239
    sget-object v6, Lj90;->LIST:Lj90;

    .line 240
    .line 241
    if-eq v0, v6, :cond_5

    .line 242
    .line 243
    iget-object v0, v3, Ll12;->o:Ljava/lang/Integer;

    .line 244
    .line 245
    if-eqz v0, :cond_6

    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    iget-object v3, v7, Ly21;->b:Ldk0;

    .line 252
    .line 253
    invoke-virtual {v3, v0}, Ldk0;->a(I)Ll12;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    if-nez v3, :cond_5

    .line 258
    .line 259
    goto :goto_0

    .line 260
    :cond_5
    move-object v11, v3

    .line 261
    goto :goto_1

    .line 262
    :cond_6
    :goto_0
    new-instance v0, Lxr;

    .line 263
    .line 264
    sget-object v1, Lca0;->m:Lca0;

    .line 265
    .line 266
    new-instance v3, Ljava/lang/StringBuilder;

    .line 267
    .line 268
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    const-string v2, "] \u4e0d\u662f\u5217\u8868\uff0c\u4e5f\u4e0d\u5728\u5217\u8868\u91cc"

    .line 275
    .line 276
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    sget-object v3, Lwr;->INVALID_TARGET:Lwr;

    .line 284
    .line 285
    const/16 v4, 0x10

    .line 286
    .line 287
    const/4 v5, 0x0

    .line 288
    const/4 v6, 0x0

    .line 289
    const/4 v7, 0x0

    .line 290
    move-object/from16 p0, v0

    .line 291
    .line 292
    move-object/from16 p1, v1

    .line 293
    .line 294
    move-object/from16 p3, v2

    .line 295
    .line 296
    move-object/from16 p6, v3

    .line 297
    .line 298
    move/from16 p7, v4

    .line 299
    .line 300
    move/from16 p2, v5

    .line 301
    .line 302
    move-object/from16 p4, v6

    .line 303
    .line 304
    move-object/from16 p5, v7

    .line 305
    .line 306
    invoke-direct/range {p0 .. p7}, Lxr;-><init>(Ljava/util/List;ILjava/lang/String;Lh22;Ljava/util/Set;Lwr;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 307
    .line 308
    .line 309
    monitor-exit v10

    .line 310
    return-object v0

    .line 311
    :goto_1
    const/16 v0, 0x1e

    .line 312
    .line 313
    const/4 v12, 0x1

    .line 314
    move/from16 v2, p3

    .line 315
    .line 316
    :try_start_4
    invoke-static {v2, v12, v0}, Lmg4;->c(III)I

    .line 317
    .line 318
    .line 319
    move-result v13

    .line 320
    if-eqz p4, :cond_7

    .line 321
    .line 322
    invoke-static/range {p4 .. p4}, Lhd2;->U(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    if-eqz v0, :cond_7

    .line 331
    .line 332
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 333
    .line 334
    .line 335
    move-result v2

    .line 336
    if-lez v2, :cond_7

    .line 337
    .line 338
    move-object v15, v0

    .line 339
    goto :goto_2

    .line 340
    :cond_7
    const/4 v15, 0x0

    .line 341
    :goto_2
    iget-wide v2, v1, La31;->v:J

    .line 342
    .line 343
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 344
    .line 345
    .line 346
    move-result-wide v6

    .line 347
    const-wide/32 v8, 0x186a0

    .line 348
    .line 349
    .line 350
    add-long v16, v6, v8

    .line 351
    .line 352
    new-instance v0, Ljk;

    .line 353
    .line 354
    const/4 v4, 0x0

    .line 355
    invoke-direct {v0, v12, v4}, Ljk;-><init>(IZ)V

    .line 356
    .line 357
    .line 358
    new-instance v6, Ljava/util/LinkedHashSet;

    .line 359
    .line 360
    invoke-direct {v6}, Ljava/util/LinkedHashSet;-><init>()V

    .line 361
    .line 362
    .line 363
    new-instance v9, Liv1;

    .line 364
    .line 365
    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    .line 366
    .line 367
    .line 368
    iget-boolean v7, v11, Ll12;->m:Z

    .line 369
    .line 370
    if-eqz v7, :cond_8

    .line 371
    .line 372
    sget-object v7, Lwh1;->RIGHT:Lwh1;

    .line 373
    .line 374
    :goto_3
    move-object/from16 v24, v7

    .line 375
    .line 376
    goto :goto_4

    .line 377
    :cond_8
    sget-object v7, Lwh1;->DOWN:Lwh1;

    .line 378
    .line 379
    goto :goto_3

    .line 380
    :goto_4
    iget-object v7, v11, Ll12;->h:Lqe;

    .line 381
    .line 382
    move v8, v4

    .line 383
    move/from16 v18, v8

    .line 384
    .line 385
    :goto_5
    invoke-virtual {v1, v2, v3}, La31;->f(J)Z

    .line 386
    .line 387
    .line 388
    move-result v19

    .line 389
    if-nez v19, :cond_9

    .line 390
    .line 391
    invoke-interface/range {p5 .. p5}, Lzk0;->invoke()Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v19

    .line 395
    check-cast v19, Ljava/lang/Boolean;

    .line 396
    .line 397
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Boolean;->booleanValue()Z

    .line 398
    .line 399
    .line 400
    move-result v19

    .line 401
    if-nez v19, :cond_a

    .line 402
    .line 403
    :cond_9
    move-object v11, v0

    .line 404
    move-object/from16 v38, v6

    .line 405
    .line 406
    move/from16 v20, v8

    .line 407
    .line 408
    goto/16 :goto_19

    .line 409
    .line 410
    :cond_a
    move-object/from16 p2, v15

    .line 411
    .line 412
    const-wide/16 v14, 0x0

    .line 413
    .line 414
    const/4 v12, 0x3

    .line 415
    invoke-static {v1, v14, v15, v4, v12}, La31;->h(La31;JZI)Lso;

    .line 416
    .line 417
    .line 418
    move-result-object v12
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 419
    :try_start_5
    invoke-static {v12}, La31;->O(Lso;)Z

    .line 420
    .line 421
    .line 422
    move-result v14

    .line 423
    if-eqz v14, :cond_b

    .line 424
    .line 425
    const-string v4, "\u8fd9\u4e00\u5c4f\u8bfb\u4e0d\u5230\u5185\u5bb9\uff08\u53ef\u80fd\u53d7\u654f\u611f\u89c6\u56fe\u7b56\u7565\u9650\u5236\uff09\uff0c\u622a\u56fe\u4ecd\u53ef\u7528\u4e8e\u5750\u6807\u64cd\u4f5c"

    .line 426
    .line 427
    goto :goto_8

    .line 428
    :goto_6
    move-object v11, v0

    .line 429
    move-object v15, v4

    .line 430
    move-object/from16 v38, v6

    .line 431
    .line 432
    move v14, v8

    .line 433
    goto/16 :goto_1a

    .line 434
    .line 435
    :catchall_1
    move-exception v0

    .line 436
    goto/16 :goto_18

    .line 437
    .line 438
    :cond_b
    sget-object v14, Lv12;->a:Lqv1;

    .line 439
    .line 440
    iget-object v14, v12, Lso;->a:Ljava/util/ArrayList;

    .line 441
    .line 442
    invoke-static {v14}, Lv12;->l(Ljava/util/List;)Ljava/util/ArrayList;

    .line 443
    .line 444
    .line 445
    move-result-object v14

    .line 446
    iget-object v15, v11, Ll12;->p:Ljava/lang/String;

    .line 447
    .line 448
    invoke-static {v14, v15, v7}, Lv12;->j(Ljava/util/ArrayList;Ljava/lang/String;Lqe;)Lus0;

    .line 449
    .line 450
    .line 451
    move-result-object v7

    .line 452
    if-nez v7, :cond_e

    .line 453
    .line 454
    iget-boolean v4, v12, Lso;->h:Z

    .line 455
    .line 456
    if-nez v4, :cond_d

    .line 457
    .line 458
    iget-boolean v4, v12, Lso;->i:Z

    .line 459
    .line 460
    if-eqz v4, :cond_c

    .line 461
    .line 462
    goto :goto_7

    .line 463
    :cond_c
    const-string v4, "\u5217\u8868\u4e0d\u89c1\u4e86\uff08\u754c\u9762\u53d8\u4e86\uff09"

    .line 464
    .line 465
    goto :goto_8

    .line 466
    :cond_d
    :goto_7
    const-string v4, "\u9875\u9762\u53ea\u8bfb\u4e86\u4e00\u90e8\u5206\uff0c\u65e0\u6cd5\u786e\u8ba4\u5217\u8868\u662f\u5426\u5230\u5e95"
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 467
    .line 468
    :goto_8
    :try_start_6
    invoke-virtual {v12}, Lso;->b()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 469
    .line 470
    .line 471
    goto :goto_6

    .line 472
    :cond_e
    :try_start_7
    iget-object v14, v12, Lso;->a:Ljava/util/ArrayList;

    .line 473
    .line 474
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    .line 475
    .line 476
    .line 477
    move-result v15

    .line 478
    :goto_9
    if-ge v4, v15, :cond_10

    .line 479
    .line 480
    invoke-virtual {v14, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 481
    .line 482
    .line 483
    move-result-object v19

    .line 484
    add-int/lit8 v4, v4, 0x1

    .line 485
    .line 486
    move/from16 p4, v4

    .line 487
    .line 488
    move-object/from16 v4, v19

    .line 489
    .line 490
    check-cast v4, Lck2;

    .line 491
    .line 492
    iget v4, v4, Lck2;->a:I

    .line 493
    .line 494
    move/from16 v20, v8

    .line 495
    .line 496
    iget v8, v7, Lus0;->c:I

    .line 497
    .line 498
    if-ne v4, v8, :cond_f

    .line 499
    .line 500
    goto :goto_a

    .line 501
    :cond_f
    move/from16 v4, p4

    .line 502
    .line 503
    move/from16 v8, v20

    .line 504
    .line 505
    goto :goto_9

    .line 506
    :cond_10
    move/from16 v20, v8

    .line 507
    .line 508
    const/16 v19, 0x0

    .line 509
    .line 510
    :goto_a
    move-object/from16 v4, v19

    .line 511
    .line 512
    check-cast v4, Lck2;

    .line 513
    .line 514
    if-eqz v4, :cond_11

    .line 515
    .line 516
    iget-object v4, v4, Lck2;->c:Ljava/lang/String;

    .line 517
    .line 518
    goto :goto_b

    .line 519
    :cond_11
    const/4 v4, 0x0

    .line 520
    :goto_b
    invoke-interface {v5, v4}, Lbl0;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    .line 522
    .line 523
    move-result-object v8

    .line 524
    check-cast v8, Ljava/lang/Boolean;

    .line 525
    .line 526
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 527
    .line 528
    .line 529
    move-result v8

    .line 530
    if-nez v8, :cond_12

    .line 531
    .line 532
    const/4 v8, 0x1

    .line 533
    iput-boolean v8, v9, Liv1;->m:Z

    .line 534
    .line 535
    const-string v4, "\u672c\u9875\u5185\u5bb9\u4e0d\u5141\u8bb8\u8bfb\u53d6"
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 536
    .line 537
    :try_start_8
    invoke-virtual {v12}, Lso;->b()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 538
    .line 539
    .line 540
    move-object v11, v0

    .line 541
    move-object v15, v4

    .line 542
    move-object/from16 v38, v6

    .line 543
    .line 544
    :goto_c
    move/from16 v14, v20

    .line 545
    .line 546
    goto/16 :goto_1a

    .line 547
    .line 548
    :cond_12
    if-eqz v4, :cond_13

    .line 549
    .line 550
    :try_start_9
    invoke-virtual {v6, v4}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 551
    .line 552
    .line 553
    :cond_13
    iget-object v8, v7, Lus0;->g:Ljava/util/List;

    .line 554
    .line 555
    iget-boolean v14, v12, Lso;->h:Z

    .line 556
    .line 557
    if-nez v14, :cond_15

    .line 558
    .line 559
    iget-boolean v14, v12, Lso;->i:Z

    .line 560
    .line 561
    if-eqz v14, :cond_14

    .line 562
    .line 563
    goto :goto_e

    .line 564
    :cond_14
    const/4 v14, 0x0

    .line 565
    :goto_d
    move-object/from16 v15, p2

    .line 566
    .line 567
    goto :goto_f

    .line 568
    :cond_15
    :goto_e
    const/4 v14, 0x1

    .line 569
    goto :goto_d

    .line 570
    :goto_f
    invoke-virtual {v0, v8, v15, v14}, Ljk;->b(Ljava/util/List;Ljava/lang/String;Z)Lyr;

    .line 571
    .line 572
    .line 573
    move-result-object v8

    .line 574
    iget-object v14, v7, Lus0;->g:Ljava/util/List;

    .line 575
    .line 576
    invoke-interface {v14}, Ljava/util/Collection;->isEmpty()Z

    .line 577
    .line 578
    .line 579
    move-result v14

    .line 580
    if-nez v14, :cond_16

    .line 581
    .line 582
    add-int/lit8 v14, v20, 0x1

    .line 583
    .line 584
    :goto_10
    move-object/from16 p2, v6

    .line 585
    .line 586
    goto :goto_11

    .line 587
    :cond_16
    move/from16 v14, v20

    .line 588
    .line 589
    goto :goto_10

    .line 590
    :goto_11
    iget-object v6, v8, Lyr;->c:Ljava/lang/String;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 591
    .line 592
    if-eqz v6, :cond_17

    .line 593
    .line 594
    :try_start_a
    invoke-virtual {v12}, Lso;->b()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 595
    .line 596
    .line 597
    move-object/from16 v38, p2

    .line 598
    .line 599
    move-object v11, v0

    .line 600
    move-object v15, v6

    .line 601
    goto/16 :goto_1a

    .line 602
    .line 603
    :cond_17
    :try_start_b
    iget-object v6, v7, Lus0;->g:Ljava/util/List;

    .line 604
    .line 605
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    .line 606
    .line 607
    .line 608
    move-result v6

    .line 609
    if-eqz v6, :cond_18

    .line 610
    .line 611
    const-string v4, "\u5217\u8868\u6ca1\u6709\u53ef\u8bfb\u6761\u76ee\uff0c\u65e0\u6cd5\u786e\u8ba4\u662f\u5426\u5230\u5e95"
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 612
    .line 613
    :goto_12
    :try_start_c
    invoke-virtual {v12}, Lso;->b()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 614
    .line 615
    .line 616
    move-object/from16 v38, p2

    .line 617
    .line 618
    move-object v11, v0

    .line 619
    :goto_13
    move-object v15, v4

    .line 620
    goto/16 :goto_1a

    .line 621
    .line 622
    :cond_18
    :try_start_d
    iget-object v6, v7, Lus0;->e:Lqe;

    .line 623
    .line 624
    move-object/from16 v19, v6

    .line 625
    .line 626
    iget-boolean v6, v8, Lyr;->b:Z

    .line 627
    .line 628
    if-eqz v6, :cond_19

    .line 629
    .line 630
    new-instance v4, Ljava/lang/StringBuilder;

    .line 631
    .line 632
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 633
    .line 634
    .line 635
    const-string v5, "\u627e\u5230\u4e86\u300c"

    .line 636
    .line 637
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 638
    .line 639
    .line 640
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 641
    .line 642
    .line 643
    const-string v5, "\u300d"

    .line 644
    .line 645
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 646
    .line 647
    .line 648
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 649
    .line 650
    .line 651
    move-result-object v4

    .line 652
    goto :goto_12

    .line 653
    :cond_19
    iget v6, v0, Ljk;->m:I

    .line 654
    .line 655
    move-object/from16 p4, v0

    .line 656
    .line 657
    const v0, 0xea60

    .line 658
    .line 659
    .line 660
    if-le v6, v0, :cond_1a

    .line 661
    .line 662
    const-string v4, "\u5185\u5bb9\u592a\u591a\uff0c\u5148\u505c\u5728\u8fd9\u91cc"

    .line 663
    .line 664
    goto :goto_15

    .line 665
    :goto_14
    move-object/from16 v38, p2

    .line 666
    .line 667
    move-object/from16 v11, p4

    .line 668
    .line 669
    goto :goto_13

    .line 670
    :cond_1a
    const/4 v0, 0x1

    .line 671
    if-le v14, v0, :cond_1c

    .line 672
    .line 673
    iget v6, v8, Lyr;->a:I

    .line 674
    .line 675
    if-nez v6, :cond_1c

    .line 676
    .line 677
    add-int/lit8 v6, v18, 0x1

    .line 678
    .line 679
    const/4 v0, 0x2

    .line 680
    if-lt v6, v0, :cond_1b

    .line 681
    .line 682
    const-string v4, "\u6ca1\u6709\u8bfb\u5230\u66f4\u591a\u6761\u76ee\uff0c\u53ef\u80fd\u5df2\u7ecf\u5230\u5e95"
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 683
    .line 684
    :goto_15
    :try_start_e
    invoke-virtual {v12}, Lso;->b()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .line 685
    .line 686
    .line 687
    goto :goto_14

    .line 688
    :cond_1b
    move/from16 v27, v6

    .line 689
    .line 690
    goto :goto_16

    .line 691
    :cond_1c
    const/16 v27, 0x0

    .line 692
    .line 693
    :goto_16
    if-lt v14, v13, :cond_1d

    .line 694
    .line 695
    :try_start_f
    new-instance v0, Ljava/lang/StringBuilder;

    .line 696
    .line 697
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 698
    .line 699
    .line 700
    const-string v4, "\u8fbe\u5230\u9875\u6570\u4e0a\u9650\uff08"

    .line 701
    .line 702
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 703
    .line 704
    .line 705
    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 706
    .line 707
    .line 708
    const-string v4, " \u9875\uff09"

    .line 709
    .line 710
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 711
    .line 712
    .line 713
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 714
    .line 715
    .line 716
    move-result-object v4

    .line 717
    goto :goto_15

    .line 718
    :cond_1d
    invoke-virtual {v1, v2, v3}, La31;->f(J)Z

    .line 719
    .line 720
    .line 721
    move-result v0

    .line 722
    if-eqz v0, :cond_1e

    .line 723
    .line 724
    const-string v4, "\u5df2\u505c\u6b62"

    .line 725
    .line 726
    goto :goto_15

    .line 727
    :cond_1e
    invoke-interface/range {p5 .. p5}, Lzk0;->invoke()Ljava/lang/Object;

    .line 728
    .line 729
    .line 730
    move-result-object v0

    .line 731
    check-cast v0, Ljava/lang/Boolean;

    .line 732
    .line 733
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 734
    .line 735
    .line 736
    move-result v0

    .line 737
    if-nez v0, :cond_1f

    .line 738
    .line 739
    const-string v4, "\u672c\u4efb\u52a1\u5df2\u6682\u505c\u6216\u505c\u6b62"

    .line 740
    .line 741
    goto :goto_15

    .line 742
    :cond_1f
    invoke-interface {v5, v4}, Lbl0;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 743
    .line 744
    .line 745
    move-result-object v0

    .line 746
    check-cast v0, Ljava/lang/Boolean;

    .line 747
    .line 748
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 749
    .line 750
    .line 751
    move-result v0

    .line 752
    if-nez v0, :cond_20

    .line 753
    .line 754
    const/4 v8, 0x1

    .line 755
    iput-boolean v8, v9, Liv1;->m:Z

    .line 756
    .line 757
    const-string v4, "\u672c\u9875\u5185\u5bb9\u4e0d\u5141\u8bb8\u8bfb\u53d6"

    .line 758
    .line 759
    goto :goto_15

    .line 760
    :cond_20
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 761
    .line 762
    .line 763
    move-result-wide v20

    .line 764
    cmp-long v0, v20, v16

    .line 765
    .line 766
    if-lez v0, :cond_21

    .line 767
    .line 768
    const-string v4, "\u8d85\u65f6"

    .line 769
    .line 770
    goto :goto_15

    .line 771
    :cond_21
    iget v0, v7, Lus0;->b:I

    .line 772
    .line 773
    invoke-virtual {v12, v0}, Lso;->a(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 774
    .line 775
    .line 776
    move-result-object v18

    .line 777
    if-nez v18, :cond_22

    .line 778
    .line 779
    const-string v4, "\u5217\u8868\u4e0d\u89c1\u4e86\uff08\u754c\u9762\u53d8\u4e86\uff09"

    .line 780
    .line 781
    goto :goto_15

    .line 782
    :cond_22
    iget-object v0, v12, Lso;->a:Ljava/util/ArrayList;

    .line 783
    .line 784
    new-instance v6, Ljava/util/ArrayList;

    .line 785
    .line 786
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 787
    .line 788
    .line 789
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 790
    .line 791
    .line 792
    move-result v8

    .line 793
    move-wide/from16 v21, v2

    .line 794
    .line 795
    const/4 v2, 0x0

    .line 796
    :cond_23
    :goto_17
    if-ge v2, v8, :cond_24

    .line 797
    .line 798
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 799
    .line 800
    .line 801
    move-result-object v3

    .line 802
    add-int/lit8 v2, v2, 0x1

    .line 803
    .line 804
    check-cast v3, Lck2;

    .line 805
    .line 806
    iget-object v3, v3, Lck2;->c:Ljava/lang/String;

    .line 807
    .line 808
    if-eqz v3, :cond_23

    .line 809
    .line 810
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 811
    .line 812
    .line 813
    goto :goto_17

    .line 814
    :cond_24
    invoke-static {v6}, Lzr;->X(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 815
    .line 816
    .line 817
    move-result-object v8

    .line 818
    move-object/from16 v0, p7

    .line 819
    .line 820
    invoke-interface {v0, v8}, Lbl0;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 821
    .line 822
    .line 823
    move-result-object v2

    .line 824
    check-cast v2, Ljava/lang/Boolean;

    .line 825
    .line 826
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 827
    .line 828
    .line 829
    move-result v2

    .line 830
    if-nez v2, :cond_25

    .line 831
    .line 832
    const/4 v2, 0x1

    .line 833
    iput-boolean v2, v9, Liv1;->m:Z

    .line 834
    .line 835
    const-string v4, "\u5f53\u524d\u9875\u9762\u6765\u6e90\u4e0d\u5141\u8bb8\u6eda\u52a8"
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .line 836
    .line 837
    :try_start_10
    invoke-virtual {v12}, Lso;->b()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 838
    .line 839
    .line 840
    move-object/from16 v38, p2

    .line 841
    .line 842
    move-object/from16 v11, p4

    .line 843
    .line 844
    move-object v15, v4

    .line 845
    move-wide/from16 v2, v21

    .line 846
    .line 847
    goto/16 :goto_1a

    .line 848
    .line 849
    :cond_25
    const/4 v2, 0x1

    .line 850
    :try_start_11
    iget-object v3, v1, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 851
    .line 852
    iget-object v3, v3, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 853
    .line 854
    move/from16 v26, v13

    .line 855
    .line 856
    move/from16 v36, v14

    .line 857
    .line 858
    iget-wide v13, v3, Lfb0;->b:J

    .line 859
    .line 860
    iget-object v3, v1, La31;->e:Lr3;

    .line 861
    .line 862
    iget v6, v11, Ll12;->l:I

    .line 863
    .line 864
    move-wide/from16 v29, v13

    .line 865
    .line 866
    iget-boolean v13, v11, Ll12;->m:Z

    .line 867
    .line 868
    iget-object v14, v7, Lus0;->e:Lqe;

    .line 869
    .line 870
    iget-object v7, v12, Lso;->d:Lqe;

    .line 871
    .line 872
    new-instance v25, Luu;

    .line 873
    .line 874
    move-object/from16 v38, p2

    .line 875
    .line 876
    move/from16 v41, v2

    .line 877
    .line 878
    move/from16 v20, v6

    .line 879
    .line 880
    move-object/from16 v23, v7

    .line 881
    .line 882
    move-object/from16 v37, v11

    .line 883
    .line 884
    move-object/from16 v39, v19

    .line 885
    .line 886
    const/16 v40, 0x0

    .line 887
    .line 888
    move-object/from16 v11, p4

    .line 889
    .line 890
    move-object v7, v0

    .line 891
    move-object v6, v4

    .line 892
    move-object/from16 v19, v18

    .line 893
    .line 894
    move-object/from16 v0, v25

    .line 895
    .line 896
    move-object/from16 v4, p5

    .line 897
    .line 898
    move-object/from16 v18, v3

    .line 899
    .line 900
    move-wide/from16 v2, v21

    .line 901
    .line 902
    invoke-direct/range {v0 .. v9}, Luu;-><init>(La31;JLzk0;Lbl0;Ljava/lang/String;Lbl0;Ljava/util/Set;Liv1;)V

    .line 903
    .line 904
    .line 905
    move-object/from16 v25, v0

    .line 906
    .line 907
    move/from16 v21, v13

    .line 908
    .line 909
    move-object/from16 v22, v14

    .line 910
    .line 911
    invoke-virtual/range {v18 .. v25}, Lr3;->K(Landroid/view/accessibility/AccessibilityNodeInfo;IZLqe;Lqe;Lwh1;Lzk0;)Ln3;

    .line 912
    .line 913
    .line 914
    move-result-object v0

    .line 915
    iget-boolean v0, v0, Ln3;->a:Z

    .line 916
    .line 917
    if-nez v0, :cond_26

    .line 918
    .line 919
    const-string v4, "\u7cfb\u7edf\u6ca1\u6709\u63a5\u53d7\u6eda\u52a8\uff0c\u65e0\u6cd5\u786e\u8ba4\u662f\u5426\u5230\u5e95"
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    .line 920
    .line 921
    :try_start_12
    invoke-virtual {v12}, Lso;->b()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    .line 922
    .line 923
    .line 924
    move-object v15, v4

    .line 925
    move/from16 v14, v36

    .line 926
    .line 927
    goto :goto_1a

    .line 928
    :cond_26
    :try_start_13
    iget-object v0, v1, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 929
    .line 930
    iget-object v0, v0, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 931
    .line 932
    new-instance v4, Lp21;

    .line 933
    .line 934
    const/4 v5, 0x4

    .line 935
    invoke-direct {v4, v1, v2, v3, v5}, Lp21;-><init>(La31;JI)V

    .line 936
    .line 937
    .line 938
    const-wide/16 v31, 0x4b0

    .line 939
    .line 940
    const-wide/16 v33, 0x15e

    .line 941
    .line 942
    move-object/from16 v28, v0

    .line 943
    .line 944
    move-object/from16 v35, v4

    .line 945
    .line 946
    invoke-virtual/range {v28 .. v35}, Lfb0;->b(JJJLzk0;)V

    .line 947
    .line 948
    .line 949
    if-lez v27, :cond_27

    .line 950
    .line 951
    iget-object v0, v1, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 952
    .line 953
    iget-object v0, v0, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 954
    .line 955
    new-instance v4, Lp21;

    .line 956
    .line 957
    const/4 v5, 0x5

    .line 958
    invoke-direct {v4, v1, v2, v3, v5}, Lp21;-><init>(La31;JI)V

    .line 959
    .line 960
    .line 961
    const-wide/16 v5, 0x320

    .line 962
    .line 963
    invoke-virtual {v0, v5, v6, v4}, Lfb0;->a(JLzk0;)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_1

    .line 964
    .line 965
    .line 966
    :cond_27
    :try_start_14
    invoke-virtual {v12}, Lso;->b()V

    .line 967
    .line 968
    .line 969
    move-object/from16 v5, p6

    .line 970
    .line 971
    move-object v0, v11

    .line 972
    move/from16 v13, v26

    .line 973
    .line 974
    move/from16 v18, v27

    .line 975
    .line 976
    move/from16 v8, v36

    .line 977
    .line 978
    move-object/from16 v11, v37

    .line 979
    .line 980
    move-object/from16 v6, v38

    .line 981
    .line 982
    move-object/from16 v7, v39

    .line 983
    .line 984
    move/from16 v4, v40

    .line 985
    .line 986
    move/from16 v12, v41

    .line 987
    .line 988
    goto/16 :goto_5

    .line 989
    .line 990
    :goto_18
    invoke-virtual {v12}, Lso;->b()V

    .line 991
    .line 992
    .line 993
    throw v0

    .line 994
    :goto_19
    const-string v4, "\u672c\u4efb\u52a1\u5df2\u6682\u505c\u6216\u505c\u6b62"

    .line 995
    .line 996
    move-object v15, v4

    .line 997
    goto/16 :goto_c

    .line 998
    .line 999
    :goto_1a
    new-instance v12, Lxr;

    .line 1000
    .line 1001
    iget-object v0, v11, Ljk;->U:Ljava/lang/Object;

    .line 1002
    .line 1003
    check-cast v0, Ljava/util/ArrayList;

    .line 1004
    .line 1005
    invoke-static {v0}, Lzr;->S(Ljava/lang/Iterable;)Ljava/util/List;

    .line 1006
    .line 1007
    .line 1008
    move-result-object v13

    .line 1009
    iget-boolean v0, v9, Liv1;->m:Z

    .line 1010
    .line 1011
    if-nez v0, :cond_28

    .line 1012
    .line 1013
    invoke-virtual {v1, v2, v3}, La31;->f(J)Z

    .line 1014
    .line 1015
    .line 1016
    move-result v0

    .line 1017
    if-nez v0, :cond_28

    .line 1018
    .line 1019
    invoke-interface/range {p5 .. p5}, Lzk0;->invoke()Ljava/lang/Object;

    .line 1020
    .line 1021
    .line 1022
    move-result-object v0

    .line 1023
    check-cast v0, Ljava/lang/Boolean;

    .line 1024
    .line 1025
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 1026
    .line 1027
    .line 1028
    move-result v0

    .line 1029
    if-eqz v0, :cond_28

    .line 1030
    .line 1031
    invoke-virtual {v1}, La31;->v()Lh22;

    .line 1032
    .line 1033
    .line 1034
    move-result-object v0

    .line 1035
    move-object/from16 v16, v0

    .line 1036
    .line 1037
    goto :goto_1b

    .line 1038
    :cond_28
    const/16 v16, 0x0

    .line 1039
    .line 1040
    :goto_1b
    invoke-static/range {v38 .. v38}, Lzr;->X(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 1041
    .line 1042
    .line 1043
    move-result-object v17

    .line 1044
    const/16 v18, 0x0

    .line 1045
    .line 1046
    const/16 v19, 0x20

    .line 1047
    .line 1048
    invoke-direct/range {v12 .. v19}, Lxr;-><init>(Ljava/util/List;ILjava/lang/String;Lh22;Ljava/util/Set;Lwr;I)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    .line 1049
    .line 1050
    .line 1051
    monitor-exit v10

    .line 1052
    return-object v12

    .line 1053
    :cond_29
    :goto_1c
    :try_start_15
    new-instance v2, Lxr;

    .line 1054
    .line 1055
    sget-object v4, Lca0;->m:Lca0;

    .line 1056
    .line 1057
    new-instance v5, Ljava/lang/StringBuilder;

    .line 1058
    .line 1059
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1060
    .line 1061
    .line 1062
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1063
    .line 1064
    .line 1065
    const-string v0, " \u5df2\u8fc7\u671f\uff0c\u8bf7\u5148\u770b\u65b0\u5c4f\u5e55\u518d collect"

    .line 1066
    .line 1067
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1068
    .line 1069
    .line 1070
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1071
    .line 1072
    .line 1073
    move-result-object v0

    .line 1074
    invoke-virtual {v1}, La31;->v()Lh22;

    .line 1075
    .line 1076
    .line 1077
    move-result-object v1

    .line 1078
    sget-object v3, Lwr;->INVALID_TARGET:Lwr;

    .line 1079
    .line 1080
    const/16 v5, 0x10

    .line 1081
    .line 1082
    const/4 v6, 0x0

    .line 1083
    const/4 v7, 0x0

    .line 1084
    move-object/from16 p3, v0

    .line 1085
    .line 1086
    move-object/from16 p4, v1

    .line 1087
    .line 1088
    move-object/from16 p0, v2

    .line 1089
    .line 1090
    move-object/from16 p6, v3

    .line 1091
    .line 1092
    move-object/from16 p1, v4

    .line 1093
    .line 1094
    move/from16 p7, v5

    .line 1095
    .line 1096
    move/from16 p2, v6

    .line 1097
    .line 1098
    move-object/from16 p5, v7

    .line 1099
    .line 1100
    invoke-direct/range {p0 .. p7}, Lxr;-><init>(Ljava/util/List;ILjava/lang/String;Lh22;Ljava/util/Set;Lwr;I)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    .line 1101
    .line 1102
    .line 1103
    move-object/from16 v0, p0

    .line 1104
    .line 1105
    monitor-exit v10

    .line 1106
    return-object v0

    .line 1107
    :goto_1d
    monitor-exit v10

    .line 1108
    throw v0
.end method

.method public final coordinateTarget(Lbi1;)Lhp2;
    .locals 14

    .line 1
    iget-object v1, p0, La31;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v0, p0, La31;->p:Ly21;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    monitor-exit v1

    .line 10
    return-object v2

    .line 11
    :cond_0
    :try_start_1
    iget-object v3, v0, Ly21;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v4, p1, Lbi1;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_b

    .line 20
    .line 21
    iget-object v3, p1, Lbi1;->d:Lvh1;

    .line 22
    .line 23
    sget-object v4, Lvh1;->TAP:Lvh1;

    .line 24
    .line 25
    if-ne v3, v4, :cond_b

    .line 26
    .line 27
    iget-object v3, p0, La31;->q:Ly10;

    .line 28
    .line 29
    iget-object v4, v0, Ly21;->a:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Ly10;->c(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_b

    .line 36
    .line 37
    invoke-virtual {p0, v0}, La31;->k(Ly21;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_b

    .line 42
    .line 43
    invoke-virtual {p0}, La31;->availability()Lsb;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iget-boolean v3, v3, Lsb;->a:Z

    .line 48
    .line 49
    if-nez v3, :cond_1

    .line 50
    .line 51
    goto/16 :goto_2

    .line 52
    .line 53
    :cond_1
    iget-object v3, v0, Ly21;->n:Luq0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    .line 55
    if-nez v3, :cond_2

    .line 56
    .line 57
    monitor-exit v1

    .line 58
    return-object v2

    .line 59
    :cond_2
    :try_start_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 60
    .line 61
    .line 62
    move-result-wide v4

    .line 63
    invoke-virtual {v3, v4, v5}, Luq0;->b(J)Z

    .line 64
    .line 65
    .line 66
    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    if-nez v4, :cond_3

    .line 68
    .line 69
    monitor-exit v1

    .line 70
    return-object v2

    .line 71
    :cond_3
    :try_start_3
    iget-object p0, p0, La31;->q:Ly10;

    .line 72
    .line 73
    iget-object v4, v0, Ly21;->a:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p0, v4}, Ly10;->f(Ljava/lang/String;)Lfp2;

    .line 76
    .line 77
    .line 78
    move-result-object p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 79
    if-nez p0, :cond_4

    .line 80
    .line 81
    monitor-exit v1

    .line 82
    return-object v2

    .line 83
    :cond_4
    :try_start_4
    iget-object v3, v3, Luq0;->a:Lrq0;

    .line 84
    .line 85
    iget v4, p1, Lbi1;->b:I

    .line 86
    .line 87
    iget p1, p1, Lbi1;->c:I

    .line 88
    .line 89
    invoke-virtual {v3, v4, p1}, Lrq0;->a(II)Lue1;

    .line 90
    .line 91
    .line 92
    move-result-object p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 93
    if-nez p1, :cond_5

    .line 94
    .line 95
    monitor-exit v1

    .line 96
    return-object v2

    .line 97
    :cond_5
    :try_start_5
    iget-object v3, v0, Ly21;->k:Lkr0;

    .line 98
    .line 99
    if-eqz v3, :cond_a

    .line 100
    .line 101
    iget-object v4, p1, Lue1;->m:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v4, Ljava/lang/Number;

    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    iget-object p1, p1, Lue1;->U:Ljava/lang/Object;

    .line 110
    .line 111
    check-cast p1, Ljava/lang/Number;

    .line 112
    .line 113
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    invoke-virtual {v3, v4, p1}, Lkr0;->N(II)Ldp2;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    if-nez p1, :cond_6

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_6
    iget-object v4, v0, Ly21;->a:Ljava/lang/String;

    .line 125
    .line 126
    const-string v6, "\u6309\u94ae"

    .line 127
    .line 128
    sget-object v3, Lv12;->a:Lqv1;

    .line 129
    .line 130
    sget-object v3, Lx12;->a:Lqv1;

    .line 131
    .line 132
    iget-object v3, p1, Ldp2;->n:Ljava/lang/String;

    .line 133
    .line 134
    if-eqz v3, :cond_8

    .line 135
    .line 136
    invoke-static {v3}, Lhd2;->x(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v5

    .line 140
    if-nez v5, :cond_7

    .line 141
    .line 142
    move-object v2, v3

    .line 143
    :cond_7
    if-nez v2, :cond_9

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :catchall_0
    move-exception v0

    .line 147
    move-object p0, v0

    .line 148
    goto :goto_3

    .line 149
    :cond_8
    :goto_0
    iget-object v2, p1, Ldp2;->o:Ljava/lang/String;

    .line 150
    .line 151
    if-nez v2, :cond_9

    .line 152
    .line 153
    const-string v2, ""

    .line 154
    .line 155
    :cond_9
    invoke-static {v2}, Lx12;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    const/16 v3, 0xa0

    .line 160
    .line 161
    invoke-static {v3, v2}, Lv12;->e(ILjava/lang/String;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v7

    .line 165
    iget-object v8, p0, Lfp2;->d:Ljava/lang/String;

    .line 166
    .line 167
    iget-object v9, v0, Ly21;->d:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v13, p1, Ldp2;->q:Ljava/lang/String;

    .line 170
    .line 171
    new-instance v3, Lsg2;

    .line 172
    .line 173
    const/4 v5, 0x0

    .line 174
    const/4 v10, 0x0

    .line 175
    const/4 v11, 0x0

    .line 176
    const/4 v12, 0x0

    .line 177
    invoke-direct/range {v3 .. v13}, Lsg2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;)V

    .line 178
    .line 179
    .line 180
    new-instance p1, Lhp2;

    .line 181
    .line 182
    invoke-direct {p1, p0, v3}, Lhp2;-><init>(Lgp2;Lsg2;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 183
    .line 184
    .line 185
    monitor-exit v1

    .line 186
    return-object p1

    .line 187
    :cond_a
    :goto_1
    monitor-exit v1

    .line 188
    return-object v2

    .line 189
    :cond_b
    :goto_2
    monitor-exit v1

    .line 190
    return-object v2

    .line 191
    :goto_3
    monitor-exit v1

    .line 192
    throw p0
.end method

.method public final d()Z
    .locals 6

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1f40

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    :goto_0
    iget-object v2, p0, La31;->b:Lwy;

    .line 9
    .line 10
    iget-boolean v2, v2, Lwy;->a0:Z

    .line 11
    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    cmp-long v2, v2, v0

    .line 19
    .line 20
    if-lez v2, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_0
    iget-object v2, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 25
    .line 26
    iget-object v2, v2, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 27
    .line 28
    new-instance v3, Ld4;

    .line 29
    .line 30
    const/16 v4, 0x10

    .line 31
    .line 32
    invoke-direct {v3, v4}, Ld4;-><init>(I)V

    .line 33
    .line 34
    .line 35
    const-wide/16 v4, 0x96

    .line 36
    .line 37
    invoke-virtual {v2, v4, v5, v3}, Lfb0;->a(JLzk0;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public final e(Ljava/lang/String;)Lh22;
    .locals 13

    .line 1
    invoke-virtual {p0}, La31;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, La31;->q:Ly10;

    .line 5
    .line 6
    invoke-virtual {p0}, Ly10;->d()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lh22;

    .line 10
    .line 11
    sget-object p0, Lel1;->MAIN:Lel1;

    .line 12
    .line 13
    invoke-virtual {p0}, Lel1;->b()C

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, "0"

    .line 26
    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string p0, "\u5c4f\u5e55\u8bfb\u4e0d\u5230\uff1a"

    .line 35
    .line 36
    invoke-static {p0, p1}, Lmo0;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const/4 v11, 0x0

    .line 41
    const/16 v12, 0x7f0

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    const/4 v4, 0x0

    .line 45
    const/4 v5, 0x0

    .line 46
    const/4 v6, 0x0

    .line 47
    const/4 v7, 0x0

    .line 48
    const/4 v8, 0x0

    .line 49
    const/4 v9, 0x0

    .line 50
    const/4 v10, 0x0

    .line 51
    invoke-direct/range {v0 .. v12}, Lh22;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ[BLjava/lang/String;Ljava/util/Set;Lb20;Ljava/util/Set;I)V

    .line 52
    .line 53
    .line 54
    return-object v0
.end method

.method public final f(J)Z
    .locals 2

    .line 1
    iget-wide v0, p0, La31;->v:J

    .line 2
    .line 3
    cmp-long p0, v0, p1

    .line 4
    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Thread;->isInterrupted()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public final foregroundPackage()Ljava/lang/String;
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    invoke-virtual {v1}, La31;->availability()Lsb;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Lsb;->a:Z

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-object v2

    .line 13
    :cond_0
    sget-object v0, Llj2;->a:Lif2;

    .line 14
    .line 15
    iget-object v0, v1, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 16
    .line 17
    invoke-virtual {v1}, La31;->G()Lqe;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    :try_start_0
    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getWindows()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 25
    new-instance v5, Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 28
    .line 29
    .line 30
    const/16 v6, 0x21

    .line 31
    .line 32
    :try_start_1
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    new-instance v7, Ltt2;

    .line 36
    .line 37
    const/16 v8, 0x19

    .line 38
    .line 39
    invoke-direct {v7, v8}, Ltt2;-><init>(I)V

    .line 40
    .line 41
    .line 42
    invoke-static {v4, v7}, Lzr;->N(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    :cond_1
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    if-eqz v8, :cond_b

    .line 55
    .line 56
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v8

    .line 60
    check-cast v8, Landroid/view/accessibility/AccessibilityWindowInfo;

    .line 61
    .line 62
    invoke-virtual {v8}, Landroid/view/accessibility/AccessibilityWindowInfo;->getType()I

    .line 63
    .line 64
    .line 65
    move-result v9

    .line 66
    const/4 v10, 0x1

    .line 67
    const/4 v11, 0x3

    .line 68
    if-eq v9, v10, :cond_2

    .line 69
    .line 70
    invoke-virtual {v8}, Landroid/view/accessibility/AccessibilityWindowInfo;->getType()I

    .line 71
    .line 72
    .line 73
    move-result v9

    .line 74
    if-ne v9, v11, :cond_1

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :catchall_0
    move-exception v0

    .line 78
    move-object v1, v0

    .line 79
    goto/16 :goto_a

    .line 80
    .line 81
    :cond_2
    :goto_1
    invoke-virtual {v8, v5}, Landroid/view/accessibility/AccessibilityWindowInfo;->getBoundsInScreen(Landroid/graphics/Rect;)V

    .line 82
    .line 83
    .line 84
    iget v9, v5, Landroid/graphics/Rect;->left:I

    .line 85
    .line 86
    iget v10, v5, Landroid/graphics/Rect;->top:I

    .line 87
    .line 88
    iget v12, v5, Landroid/graphics/Rect;->right:I

    .line 89
    .line 90
    iget v13, v5, Landroid/graphics/Rect;->bottom:I

    .line 91
    .line 92
    new-instance v14, Lqe;

    .line 93
    .line 94
    const/4 v15, 0x0

    .line 95
    invoke-static {v9, v15}, Ljava/lang/Math;->max(II)I

    .line 96
    .line 97
    .line 98
    move-result v9

    .line 99
    invoke-static {v10, v15}, Ljava/lang/Math;->max(II)I

    .line 100
    .line 101
    .line 102
    move-result v10

    .line 103
    iget v15, v3, Lqe;->c:I

    .line 104
    .line 105
    invoke-static {v12, v15}, Ljava/lang/Math;->min(II)I

    .line 106
    .line 107
    .line 108
    move-result v12

    .line 109
    iget v15, v3, Lqe;->d:I

    .line 110
    .line 111
    invoke-static {v13, v15}, Ljava/lang/Math;->min(II)I

    .line 112
    .line 113
    .line 114
    move-result v13

    .line 115
    invoke-direct {v14, v9, v10, v12, v13}, Lqe;-><init>(IIII)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v14}, Lqe;->a()J

    .line 119
    .line 120
    .line 121
    move-result-wide v9

    .line 122
    long-to-double v9, v9

    .line 123
    invoke-virtual {v3}, Lqe;->a()J

    .line 124
    .line 125
    .line 126
    move-result-wide v12

    .line 127
    const-wide/16 v14, 0x1

    .line 128
    .line 129
    cmp-long v16, v12, v14

    .line 130
    .line 131
    if-gez v16, :cond_3

    .line 132
    .line 133
    move-wide v12, v14

    .line 134
    :cond_3
    long-to-double v12, v12

    .line 135
    div-double/2addr v9, v12

    .line 136
    invoke-virtual {v8}, Landroid/view/accessibility/AccessibilityWindowInfo;->getType()I

    .line 137
    .line 138
    .line 139
    move-result v12

    .line 140
    if-ne v12, v11, :cond_4

    .line 141
    .line 142
    const-wide/high16 v11, 0x3fe0000000000000L    # 0.5

    .line 143
    .line 144
    cmpg-double v9, v9, v11

    .line 145
    .line 146
    if-ltz v9, :cond_1

    .line 147
    .line 148
    :cond_4
    invoke-virtual {v8}, Landroid/view/accessibility/AccessibilityWindowInfo;->getRoot()Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 149
    .line 150
    .line 151
    move-result-object v9

    .line 152
    if-nez v9, :cond_9

    .line 153
    .line 154
    invoke-virtual {v8}, Landroid/view/accessibility/AccessibilityWindowInfo;->isActive()Z

    .line 155
    .line 156
    .line 157
    move-result v9

    .line 158
    if-nez v9, :cond_6

    .line 159
    .line 160
    invoke-virtual {v8}, Landroid/view/accessibility/AccessibilityWindowInfo;->isFocused()Z

    .line 161
    .line 162
    .line 163
    move-result v9

    .line 164
    if-eqz v9, :cond_5

    .line 165
    .line 166
    goto :goto_3

    .line 167
    :cond_5
    :goto_2
    move-object v9, v2

    .line 168
    goto :goto_5

    .line 169
    :cond_6
    :goto_3
    invoke-virtual {v8}, Landroid/view/accessibility/AccessibilityWindowInfo;->getId()I

    .line 170
    .line 171
    .line 172
    move-result v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 173
    :try_start_2
    invoke-virtual {v0}, Landroid/accessibilityservice/AccessibilityService;->getRootInActiveWindow()Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 174
    .line 175
    .line 176
    move-result-object v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 177
    goto :goto_4

    .line 178
    :catchall_1
    move-object v9, v2

    .line 179
    :goto_4
    if-nez v9, :cond_7

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :cond_7
    :try_start_3
    invoke-virtual {v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->getWindowId()I

    .line 183
    .line 184
    .line 185
    move-result v10

    .line 186
    if-ne v10, v8, :cond_8

    .line 187
    .line 188
    goto :goto_5

    .line 189
    :cond_8
    invoke-static {v9}, Llj2;->d(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 190
    .line 191
    .line 192
    goto :goto_2

    .line 193
    :goto_5
    if-nez v9, :cond_9

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :cond_9
    :try_start_4
    invoke-virtual {v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->getPackageName()Ljava/lang/CharSequence;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    if-eqz v0, :cond_a

    .line 202
    .line 203
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 207
    move-object v3, v0

    .line 208
    goto :goto_6

    .line 209
    :catchall_2
    move-exception v0

    .line 210
    goto :goto_8

    .line 211
    :cond_a
    move-object v3, v2

    .line 212
    :goto_6
    :try_start_5
    invoke-static {v9}, Llj2;->d(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 213
    .line 214
    .line 215
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 216
    .line 217
    if-ge v0, v6, :cond_e

    .line 218
    .line 219
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 220
    .line 221
    .line 222
    move-result-object v4

    .line 223
    :goto_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    if-eqz v0, :cond_e

    .line 228
    .line 229
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    .line 234
    .line 235
    :try_start_6
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->recycle()V

    .line 236
    .line 237
    .line 238
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 239
    .line 240
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 241
    .line 242
    .line 243
    goto :goto_7

    .line 244
    :catchall_3
    move-exception v0

    .line 245
    invoke-static {v0}, Lez;->B(Ljava/lang/Throwable;)V

    .line 246
    .line 247
    .line 248
    goto :goto_7

    .line 249
    :goto_8
    :try_start_7
    invoke-static {v9}, Llj2;->d(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 250
    .line 251
    .line 252
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 253
    :cond_b
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 254
    .line 255
    if-ge v0, v6, :cond_c

    .line 256
    .line 257
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 258
    .line 259
    .line 260
    move-result-object v3

    .line 261
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-eqz v0, :cond_c

    .line 266
    .line 267
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    .line 272
    .line 273
    :try_start_8
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->recycle()V

    .line 274
    .line 275
    .line 276
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 277
    .line 278
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 279
    .line 280
    .line 281
    goto :goto_9

    .line 282
    :catchall_4
    move-exception v0

    .line 283
    invoke-static {v0}, Lez;->B(Ljava/lang/Throwable;)V

    .line 284
    .line 285
    .line 286
    goto :goto_9

    .line 287
    :catchall_5
    :cond_c
    move-object v3, v2

    .line 288
    goto :goto_c

    .line 289
    :goto_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 290
    .line 291
    if-ge v0, v6, :cond_d

    .line 292
    .line 293
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 294
    .line 295
    .line 296
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 301
    .line 302
    .line 303
    move-result v0

    .line 304
    if-eqz v0, :cond_d

    .line 305
    .line 306
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    check-cast v0, Landroid/view/accessibility/AccessibilityWindowInfo;

    .line 311
    .line 312
    :try_start_9
    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityWindowInfo;->recycle()V

    .line 313
    .line 314
    .line 315
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 316
    .line 317
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    .line 318
    .line 319
    .line 320
    goto :goto_b

    .line 321
    :catchall_6
    move-exception v0

    .line 322
    invoke-static {v0}, Lez;->B(Ljava/lang/Throwable;)V

    .line 323
    .line 324
    .line 325
    goto :goto_b

    .line 326
    :cond_d
    throw v1

    .line 327
    :cond_e
    :goto_c
    iget-object v0, v1, La31;->p:Ly21;

    .line 328
    .line 329
    if-eqz v0, :cond_f

    .line 330
    .line 331
    iget-object v0, v0, Ly21;->a:Ljava/lang/String;

    .line 332
    .line 333
    goto :goto_d

    .line 334
    :cond_f
    move-object v0, v2

    .line 335
    :goto_d
    if-eqz v0, :cond_11

    .line 336
    .line 337
    iget-object v4, v1, La31;->q:Ly10;

    .line 338
    .line 339
    invoke-virtual {v4, v0}, Ly10;->f(Ljava/lang/String;)Lfp2;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    if-eqz v0, :cond_10

    .line 344
    .line 345
    iget-object v0, v0, Lfp2;->d:Ljava/lang/String;

    .line 346
    .line 347
    goto :goto_e

    .line 348
    :cond_10
    move-object v0, v2

    .line 349
    :goto_e
    invoke-static {v0, v3}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    if-nez v0, :cond_12

    .line 354
    .line 355
    :cond_11
    iget-object v0, v1, La31;->q:Ly10;

    .line 356
    .line 357
    invoke-virtual {v0, v2, v2}, Ly10;->e(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 358
    .line 359
    .line 360
    :cond_12
    return-object v3
.end method

.method public final g(JZ)Lso;
    .locals 14

    .line 1
    const/4 v1, 0x0

    .line 2
    if-eqz p3, :cond_0

    .line 3
    .line 4
    iget-object v0, p0, La31;->q:Ly10;

    .line 5
    .line 6
    invoke-virtual {v0}, Ly10;->g()J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    move-object v2, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move-object v2, v1

    .line 17
    :goto_0
    if-eqz p3, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 20
    .line 21
    iget-object v0, v0, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 22
    .line 23
    iget-wide v3, v0, Lfb0;->b:J

    .line 24
    .line 25
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    move-object v3, v0

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move-object v3, v1

    .line 32
    :goto_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 33
    .line 34
    const/16 v4, 0x22

    .line 35
    .line 36
    const/4 v5, 0x0

    .line 37
    const/4 v6, 0x1

    .line 38
    if-gt v4, v0, :cond_3

    .line 39
    .line 40
    const/16 v4, 0x26

    .line 41
    .line 42
    if-ge v0, v4, :cond_3

    .line 43
    .line 44
    :try_start_0
    iget-object v0, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 45
    .line 46
    invoke-static {v0}, Ld3;->q(Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    goto :goto_2

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    invoke-static {v0}, Lmo0;->d(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    :goto_2
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    if-eqz v7, :cond_2

    .line 71
    .line 72
    move-object v0, v4

    .line 73
    :cond_2
    check-cast v0, Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    move v0, v6

    .line 82
    goto :goto_3

    .line 83
    :cond_3
    move v0, v5

    .line 84
    :goto_3
    :try_start_1
    sget-object v4, Llj2;->a:Lif2;

    .line 85
    .line 86
    iget-object v7, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 87
    .line 88
    invoke-virtual {p0}, La31;->G()Lqe;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    iget-object v9, p0, La31;->d:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    move-object v12, v2

    .line 97
    goto :goto_4

    .line 98
    :cond_4
    move-object v12, v1

    .line 99
    :goto_4
    if-eqz v0, :cond_5

    .line 100
    .line 101
    move-object v13, v3

    .line 102
    :goto_5
    move-wide v10, p1

    .line 103
    goto :goto_6

    .line 104
    :cond_5
    move-object v13, v1

    .line 105
    goto :goto_5

    .line 106
    :goto_6
    invoke-static/range {v7 .. v13}, Llj2;->a(Landroid/accessibilityservice/AccessibilityService;Lqe;Ljava/lang/String;JLjava/lang/Long;Ljava/lang/Long;)Lso;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    iget-object v3, v2, Lso;->a:Ljava/util/ArrayList;

    .line 111
    .line 112
    invoke-static {v3}, Lzr;->L(Ljava/util/List;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Lck2;

    .line 117
    .line 118
    iget-object v4, v2, Lso;->a:Ljava/util/ArrayList;

    .line 119
    .line 120
    new-instance v7, Ljava/util/ArrayList;

    .line 121
    .line 122
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 126
    .line 127
    .line 128
    move-result v8

    .line 129
    move v9, v5

    .line 130
    :cond_6
    :goto_7
    if-ge v9, v8, :cond_7

    .line 131
    .line 132
    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v10

    .line 136
    add-int/lit8 v9, v9, 0x1

    .line 137
    .line 138
    check-cast v10, Lck2;

    .line 139
    .line 140
    iget-object v10, v10, Lck2;->d:Ljava/lang/String;

    .line 141
    .line 142
    if-eqz v10, :cond_6

    .line 143
    .line 144
    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    goto :goto_7

    .line 148
    :catchall_1
    move-exception v0

    .line 149
    goto/16 :goto_c

    .line 150
    .line 151
    :cond_7
    sget-object v4, Lmt1;->a:Ljava/util/Set;

    .line 152
    .line 153
    if-eqz v3, :cond_8

    .line 154
    .line 155
    iget-object v4, v3, Lck2;->f:Lbk2;

    .line 156
    .line 157
    goto :goto_8

    .line 158
    :cond_8
    move-object v4, v1

    .line 159
    :goto_8
    iget-object v8, v2, Lso;->d:Lqe;

    .line 160
    .line 161
    invoke-virtual {v8}, Lqe;->c()I

    .line 162
    .line 163
    .line 164
    move-result v8

    .line 165
    invoke-static {v4, v8}, Lmt1;->b(Lbk2;I)Ljava/util/ArrayList;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    invoke-static {v7, v4}, Lzr;->I(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/ArrayList;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    if-eqz v0, :cond_a

    .line 174
    .line 175
    invoke-virtual {p0}, La31;->B()Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-eqz v0, :cond_a

    .line 180
    .line 181
    iget-boolean v0, v2, Lso;->m:Z

    .line 182
    .line 183
    if-eqz v0, :cond_a

    .line 184
    .line 185
    if-eqz v3, :cond_9

    .line 186
    .line 187
    iget-object v0, v3, Lck2;->b:Lfs2;

    .line 188
    .line 189
    goto :goto_9

    .line 190
    :cond_9
    move-object v0, v1

    .line 191
    :goto_9
    sget-object v3, Lfs2;->APP:Lfs2;

    .line 192
    .line 193
    if-ne v0, v3, :cond_a

    .line 194
    .line 195
    iget-boolean v0, v2, Lso;->f:Z

    .line 196
    .line 197
    if-nez v0, :cond_a

    .line 198
    .line 199
    iget-boolean v0, v2, Lso;->g:Z

    .line 200
    .line 201
    if-nez v0, :cond_a

    .line 202
    .line 203
    iget-object v0, v2, Lso;->c:Ljava/lang/Boolean;

    .line 204
    .line 205
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 206
    .line 207
    invoke-static {v0, v3}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-eqz v0, :cond_a

    .line 212
    .line 213
    invoke-static {v2}, La31;->O(Lso;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-nez v0, :cond_a

    .line 218
    .line 219
    iget-object v0, v2, Lso;->a:Ljava/util/ArrayList;

    .line 220
    .line 221
    invoke-static {v0}, Lek4;->a(Ljava/util/List;)Ljava/util/ArrayList;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-eqz v0, :cond_a

    .line 230
    .line 231
    iget-object v0, v2, Lso;->e:Ljava/lang/String;

    .line 232
    .line 233
    invoke-static {v0, v4}, Lmt1;->a(Ljava/lang/String;Ljava/util/List;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_a

    .line 238
    .line 239
    move v5, v6

    .line 240
    :cond_a
    iget-object v0, p0, La31;->q:Ly10;

    .line 241
    .line 242
    if-eqz v5, :cond_b

    .line 243
    .line 244
    iget-object v3, v2, Lso;->l:Ljava/lang/Integer;

    .line 245
    .line 246
    goto :goto_a

    .line 247
    :cond_b
    move-object v3, v1

    .line 248
    :goto_a
    if-eqz v5, :cond_c

    .line 249
    .line 250
    iget-object v4, v2, Lso;->e:Ljava/lang/String;

    .line 251
    .line 252
    goto :goto_b

    .line 253
    :cond_c
    move-object v4, v1

    .line 254
    :goto_b
    invoke-virtual {v0, v4, v3}, Ly10;->e(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 255
    .line 256
    .line 257
    return-object v2

    .line 258
    :goto_c
    iget-object p0, p0, La31;->q:Ly10;

    .line 259
    .line 260
    invoke-virtual {p0, v1, v1}, Ly10;->e(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 261
    .line 262
    .line 263
    throw v0
.end method

.method public final getScreen()Lel1;
    .locals 0

    .line 1
    iget-object p0, p0, La31;->c:Lel1;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(Lso;)Lb92;
    .locals 14

    .line 1
    iget-object v0, p1, Lso;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {v0}, Lzr;->L(Ljava/util/List;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v2, v0

    .line 8
    check-cast v2, Lck2;

    .line 9
    .line 10
    iget-wide v0, p0, La31;->h:J

    .line 11
    .line 12
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    sub-long/2addr v0, v3

    .line 17
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    cmp-long v3, v0, v3

    .line 20
    .line 21
    const/4 v13, 0x0

    .line 22
    if-gtz v3, :cond_0

    .line 23
    .line 24
    return-object v13

    .line 25
    :cond_0
    iget-object v3, p1, Lso;->d:Lqe;

    .line 26
    .line 27
    const-wide/16 v4, 0x9c4

    .line 28
    .line 29
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 30
    .line 31
    .line 32
    move-result-wide v6

    .line 33
    new-instance v11, Ls21;

    .line 34
    .line 35
    const/4 p1, 0x2

    .line 36
    invoke-direct {v11, p0, p1}, Ls21;-><init>(La31;I)V

    .line 37
    .line 38
    .line 39
    const/16 v12, 0x6c0

    .line 40
    .line 41
    iget-object v1, p0, La31;->g:Lli1;

    .line 42
    .line 43
    sget-object v4, Lca0;->m:Lca0;

    .line 44
    .line 45
    const/4 v8, 0x0

    .line 46
    const/4 v9, 0x0

    .line 47
    const/4 v10, 0x0

    .line 48
    move-object v5, v4

    .line 49
    invoke-static/range {v1 .. v12}, Lli1;->h(Lli1;Lck2;Lqe;Ljava/util/List;Ljava/util/List;JZZZLzk0;I)Lb92;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-boolean v0, p1, Lb92;->d:Z

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object p0, p0, La31;->q:Ly10;

    .line 58
    .line 59
    invoke-virtual {p0, v13, v13}, Ly10;->e(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-object p1
.end method

.method public final j()V
    .locals 5

    .line 1
    iget-object v0, p0, La31;->r:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-wide v1, p0, La31;->t:J

    .line 5
    .line 6
    const-wide/16 v3, 0x1

    .line 7
    .line 8
    add-long/2addr v1, v3

    .line 9
    iput-wide v1, p0, La31;->t:J

    .line 10
    .line 11
    iget-object v1, p0, La31;->s:Li50;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    iput-object v2, p0, La31;->s:Li50;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    monitor-exit v0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object p0, v1, Li50;->h:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 22
    .line 23
    invoke-static {p0}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    monitor-exit v0

    .line 29
    throw p0
.end method

.method public final k(Ly21;)Z
    .locals 2

    .line 1
    iget-object p1, p1, Ly21;->o:Ljava/lang/Long;

    .line 2
    .line 3
    iget-object p0, p0, La31;->f:Lo71;

    .line 4
    .line 5
    invoke-virtual {p0}, Lo71;->e()Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p1, :cond_2

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide p0

    .line 22
    cmp-long p0, v0, p0

    .line 23
    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_2
    :goto_1
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public final l(Li50;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, La31;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-wide v0, p1, Li50;->b:J

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, La31;->f(J)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, La31;->p:Ly21;

    .line 16
    .line 17
    iget-object v1, p1, Li50;->f:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Ly21;

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    iget-wide v0, p0, La31;->t:J

    .line 24
    .line 25
    iget-wide p0, p1, Li50;->a:J

    .line 26
    .line 27
    cmp-long p0, v0, p0

    .line 28
    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public final n(Lso;Li50;Z)Landroid/view/accessibility/AccessibilityNodeInfo;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    iget-object v10, v1, Lso;->a:Ljava/util/ArrayList;

    .line 8
    .line 9
    iget-object v3, v2, Li50;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v3, Ll12;

    .line 12
    .line 13
    invoke-virtual {v0, v2}, La31;->l(Li50;)Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    const/16 v16, 0x0

    .line 18
    .line 19
    if-eqz v4, :cond_11

    .line 20
    .line 21
    invoke-virtual {v0}, La31;->availability()Lsb;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    iget-boolean v4, v4, Lsb;->a:Z

    .line 26
    .line 27
    if-nez v4, :cond_0

    .line 28
    .line 29
    goto/16 :goto_6

    .line 30
    .line 31
    :cond_0
    iget-object v4, v1, Lso;->e:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v5, v1, Lso;->d:Lqe;

    .line 34
    .line 35
    new-instance v6, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    const/16 v17, 0x0

    .line 45
    .line 46
    move/from16 v8, v17

    .line 47
    .line 48
    :cond_1
    :goto_0
    if-ge v8, v7, :cond_2

    .line 49
    .line 50
    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v9

    .line 54
    add-int/lit8 v8, v8, 0x1

    .line 55
    .line 56
    check-cast v9, Lck2;

    .line 57
    .line 58
    iget-object v9, v9, Lck2;->d:Ljava/lang/String;

    .line 59
    .line 60
    if-eqz v9, :cond_1

    .line 61
    .line 62
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    sget-object v7, Lmt1;->a:Ljava/util/Set;

    .line 67
    .line 68
    invoke-static {v10}, Lzr;->x(Ljava/util/List;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    check-cast v7, Lck2;

    .line 73
    .line 74
    if-eqz v7, :cond_3

    .line 75
    .line 76
    iget-object v7, v7, Lck2;->f:Lbk2;

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    move-object/from16 v7, v16

    .line 80
    .line 81
    :goto_1
    invoke-virtual {v5}, Lqe;->c()I

    .line 82
    .line 83
    .line 84
    move-result v8

    .line 85
    invoke-static {v7, v8}, Lmt1;->b(Lbk2;I)Ljava/util/ArrayList;

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    invoke-static {v6, v7}, Lzr;->I(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/ArrayList;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    iget-boolean v7, v1, Lso;->f:Z

    .line 94
    .line 95
    if-nez v7, :cond_4

    .line 96
    .line 97
    iget-object v7, v0, La31;->d:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v4, v7}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    if-eqz v7, :cond_5

    .line 104
    .line 105
    :cond_4
    invoke-static {}, La31;->o()Lhp1;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    iget-boolean v7, v7, Lhp1;->c:Z

    .line 110
    .line 111
    if-eqz v7, :cond_11

    .line 112
    .line 113
    :cond_5
    invoke-static {v4, v6}, Lmt1;->a(Ljava/lang/String;Ljava/util/List;)Z

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    if-eqz v4, :cond_6

    .line 118
    .line 119
    invoke-static {}, La31;->o()Lhp1;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    iget-boolean v4, v4, Lhp1;->a:Z

    .line 124
    .line 125
    if-nez v4, :cond_6

    .line 126
    .line 127
    goto/16 :goto_6

    .line 128
    .line 129
    :cond_6
    invoke-static {v10}, Lv12;->l(Ljava/util/List;)Ljava/util/ArrayList;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    new-instance v6, Ljava/util/ArrayList;

    .line 134
    .line 135
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 139
    .line 140
    .line 141
    move-result v7

    .line 142
    move/from16 v8, v17

    .line 143
    .line 144
    :cond_7
    :goto_2
    if-ge v8, v7, :cond_8

    .line 145
    .line 146
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v9

    .line 150
    add-int/lit8 v8, v8, 0x1

    .line 151
    .line 152
    move-object v11, v9

    .line 153
    check-cast v11, Lus0;

    .line 154
    .line 155
    iget-object v12, v11, Lus0;->d:Lj90;

    .line 156
    .line 157
    sget-object v13, Lj90;->INPUT:Lj90;

    .line 158
    .line 159
    if-ne v12, v13, :cond_7

    .line 160
    .line 161
    iget v12, v11, Lus0;->c:I

    .line 162
    .line 163
    iget v13, v3, Ll12;->b:I

    .line 164
    .line 165
    if-ne v12, v13, :cond_7

    .line 166
    .line 167
    iget-object v11, v11, Lus0;->a:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v12, v3, Ll12;->p:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v11, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v11

    .line 175
    if-eqz v11, :cond_7

    .line 176
    .line 177
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    goto :goto_2

    .line 181
    :cond_8
    invoke-static {v6}, Lzr;->L(Ljava/util/List;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    check-cast v4, Lus0;

    .line 186
    .line 187
    if-nez v4, :cond_9

    .line 188
    .line 189
    goto/16 :goto_6

    .line 190
    .line 191
    :cond_9
    iget v4, v4, Lus0;->b:I

    .line 192
    .line 193
    invoke-virtual {v1, v4}, Lso;->a(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 194
    .line 195
    .line 196
    move-result-object v6

    .line 197
    if-nez v6, :cond_a

    .line 198
    .line 199
    goto/16 :goto_6

    .line 200
    .line 201
    :cond_a
    iget-object v7, v2, Li50;->h:Ljava/lang/Object;

    .line 202
    .line 203
    check-cast v7, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 204
    .line 205
    invoke-virtual {v6, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v7

    .line 209
    if-eqz v7, :cond_11

    .line 210
    .line 211
    invoke-static {v1, v3, v6}, La31;->m(Lso;Ll12;Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    if-eqz v3, :cond_11

    .line 216
    .line 217
    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getInputType()I

    .line 218
    .line 219
    .line 220
    move-result v3

    .line 221
    iget v7, v2, Li50;->e:I

    .line 222
    .line 223
    if-ne v3, v7, :cond_11

    .line 224
    .line 225
    if-eqz p3, :cond_b

    .line 226
    .line 227
    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getTextSelectionStart()I

    .line 228
    .line 229
    .line 230
    move-result v3

    .line 231
    iget v7, v2, Li50;->c:I

    .line 232
    .line 233
    if-ne v3, v7, :cond_11

    .line 234
    .line 235
    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getTextSelectionEnd()I

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    iget v7, v2, Li50;->d:I

    .line 240
    .line 241
    if-eq v3, v7, :cond_b

    .line 242
    .line 243
    goto/16 :goto_6

    .line 244
    .line 245
    :cond_b
    sget-object v3, Lv12;->a:Lqv1;

    .line 246
    .line 247
    new-instance v3, Lw12;

    .line 248
    .line 249
    iget-object v7, v2, Li50;->f:Ljava/lang/Object;

    .line 250
    .line 251
    check-cast v7, Ly21;

    .line 252
    .line 253
    iget-object v7, v7, Ly21;->d:Ljava/lang/String;

    .line 254
    .line 255
    move-object v8, v6

    .line 256
    iget-object v6, v1, Lso;->e:Ljava/lang/String;

    .line 257
    .line 258
    move-object v9, v5

    .line 259
    move-object v5, v7

    .line 260
    invoke-virtual {v9}, Lqe;->d()I

    .line 261
    .line 262
    .line 263
    move-result v7

    .line 264
    invoke-virtual {v9}, Lqe;->c()I

    .line 265
    .line 266
    .line 267
    move-result v9

    .line 268
    iget-object v1, v1, Lso;->c:Ljava/lang/Boolean;

    .line 269
    .line 270
    const/4 v14, 0x0

    .line 271
    const/16 v15, 0xf80

    .line 272
    .line 273
    move v11, v4

    .line 274
    const-string v4, "focus-check"

    .line 275
    .line 276
    move v12, v11

    .line 277
    const/4 v11, 0x0

    .line 278
    move v13, v12

    .line 279
    const/4 v12, 0x0

    .line 280
    move/from16 v18, v13

    .line 281
    .line 282
    const/4 v13, 0x0

    .line 283
    move/from16 v19, v9

    .line 284
    .line 285
    move-object v9, v1

    .line 286
    move/from16 v1, v18

    .line 287
    .line 288
    move-object/from16 v18, v8

    .line 289
    .line 290
    move/from16 v8, v19

    .line 291
    .line 292
    invoke-direct/range {v3 .. v15}, Lw12;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/Boolean;Ljava/util/List;ZLjava/util/Set;Ljava/util/ArrayList;ZI)V

    .line 293
    .line 294
    .line 295
    invoke-static {v3}, Lv12;->k(Lw12;)Ldk0;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    iget-object v3, v3, Ldk0;->a:Ljava/lang/Object;

    .line 300
    .line 301
    check-cast v3, Ljava/util/ArrayList;

    .line 302
    .line 303
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 304
    .line 305
    .line 306
    move-result v4

    .line 307
    move-object/from16 v6, v16

    .line 308
    .line 309
    move/from16 v5, v17

    .line 310
    .line 311
    :cond_c
    :goto_3
    if-ge v5, v4, :cond_e

    .line 312
    .line 313
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    move-result-object v7

    .line 317
    add-int/lit8 v5, v5, 0x1

    .line 318
    .line 319
    move-object v8, v7

    .line 320
    check-cast v8, Ll12;

    .line 321
    .line 322
    iget v8, v8, Ll12;->d:I

    .line 323
    .line 324
    if-ne v8, v1, :cond_c

    .line 325
    .line 326
    if-eqz v17, :cond_d

    .line 327
    .line 328
    :goto_4
    move-object/from16 v6, v16

    .line 329
    .line 330
    goto :goto_5

    .line 331
    :cond_d
    const/16 v17, 0x1

    .line 332
    .line 333
    move-object v6, v7

    .line 334
    goto :goto_3

    .line 335
    :cond_e
    if-nez v17, :cond_f

    .line 336
    .line 337
    goto :goto_4

    .line 338
    :cond_f
    :goto_5
    check-cast v6, Ll12;

    .line 339
    .line 340
    if-nez v6, :cond_10

    .line 341
    .line 342
    goto :goto_6

    .line 343
    :cond_10
    iget-boolean v1, v6, Ll12;->j:Z

    .line 344
    .line 345
    if-nez v1, :cond_11

    .line 346
    .line 347
    iget-boolean v1, v6, Ll12;->k:Z

    .line 348
    .line 349
    if-nez v1, :cond_11

    .line 350
    .line 351
    invoke-virtual {v0, v2}, La31;->l(Li50;)Z

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    if-eqz v1, :cond_11

    .line 356
    .line 357
    invoke-virtual {v0}, La31;->availability()Lsb;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    iget-boolean v0, v0, Lsb;->a:Z

    .line 362
    .line 363
    if-eqz v0, :cond_11

    .line 364
    .line 365
    return-object v18

    .line 366
    :cond_11
    :goto_6
    return-object v16
.end method

.method public final observe(ZZ)Lh22;
    .locals 1

    const/4 v0, 0x0

    .line 905
    invoke-virtual {p0, p1, p2, v0}, La31;->observe(ZZZ)Lh22;

    move-result-object p0

    return-object p0
.end method

.method public final observe(ZZZ)Lh22;
    .locals 33

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v8, v0, La31;->o:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v8

    .line 6
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v9

    .line 10
    iget-wide v3, v0, La31;->v:J

    .line 11
    .line 12
    invoke-virtual {v0}, La31;->availability()Lsb;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-boolean v2, v1, Lsb;->a:Z

    .line 17
    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    iget-object v1, v1, Lsb;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, La31;->e(Ljava/lang/String;)Lh22;

    .line 26
    .line 27
    .line 28
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    monitor-exit v8

    .line 30
    return-object v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto/16 :goto_20

    .line 33
    .line 34
    :cond_0
    const-wide/16 v1, 0x0

    .line 35
    .line 36
    const/4 v11, 0x3

    .line 37
    const/4 v12, 0x0

    .line 38
    :try_start_1
    invoke-static {v0, v1, v2, v12, v11}, La31;->h(La31;JZI)Lso;

    .line 39
    .line 40
    .line 41
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    move/from16 v2, p1

    .line 43
    .line 44
    :try_start_2
    invoke-virtual {v0, v1, v2}, La31;->y(Lso;Z)Ly21;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    if-nez p2, :cond_2

    .line 49
    .line 50
    if-eqz p3, :cond_1

    .line 51
    .line 52
    iget-object v5, v2, Ly21;->b:Ldk0;

    .line 53
    .line 54
    iget-boolean v5, v5, Ldk0;->b:Z

    .line 55
    .line 56
    if-eqz v5, :cond_1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_1
    move-exception v0

    .line 60
    goto/16 :goto_1f

    .line 61
    .line 62
    :cond_1
    move/from16 v21, v12

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    :goto_0
    const/16 v21, 0x1

    .line 66
    .line 67
    :goto_1
    new-instance v14, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    iget-object v5, v2, Ly21;->b:Ldk0;

    .line 70
    .line 71
    iget-object v5, v5, Ldk0;->c:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast v5, Ljava/lang/String;

    .line 74
    .line 75
    invoke-direct {v14, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    sget-object v26, Lea0;->m:Lea0;

    .line 79
    .line 80
    iget-object v5, v0, La31;->g:Lli1;

    .line 81
    .line 82
    invoke-virtual {v5}, Lli1;->d()Ll11;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    iget-object v6, v0, La31;->f:Lo71;

    .line 87
    .line 88
    invoke-virtual {v6}, Lo71;->e()Ljava/lang/Long;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    iget-object v7, v2, Ly21;->b:Ldk0;

    .line 93
    .line 94
    iget-boolean v7, v7, Ldk0;->b:Z

    .line 95
    .line 96
    if-eqz v7, :cond_3

    .line 97
    .line 98
    if-eqz v6, :cond_3

    .line 99
    .line 100
    invoke-virtual {v0, v1, v2, v3, v4}, La31;->w(Lso;Ly21;J)Z

    .line 101
    .line 102
    .line 103
    move-result v7

    .line 104
    if-eqz v7, :cond_3

    .line 105
    .line 106
    const/16 v22, 0x1

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_3
    move/from16 v22, v12

    .line 110
    .line 111
    :goto_2
    iget-object v7, v2, Ly21;->b:Ldk0;

    .line 112
    .line 113
    iget-boolean v7, v7, Ldk0;->b:Z

    .line 114
    .line 115
    if-eqz v7, :cond_4

    .line 116
    .line 117
    if-eqz v6, :cond_4

    .line 118
    .line 119
    if-nez v22, :cond_4

    .line 120
    .line 121
    new-instance v5, Ll11;

    .line 122
    .line 123
    sget-object v7, Lj11;->PRIVACY_UNVERIFIED:Lj11;

    .line 124
    .line 125
    invoke-direct {v5, v7}, Ll11;-><init>(Lj11;)V

    .line 126
    .line 127
    .line 128
    :cond_4
    if-nez v21, :cond_6

    .line 129
    .line 130
    if-eqz v22, :cond_5

    .line 131
    .line 132
    goto :goto_4

    .line 133
    :cond_5
    move v6, v12

    .line 134
    move-object v12, v14

    .line 135
    const/4 v9, 0x0

    .line 136
    const/4 v15, 0x0

    .line 137
    const/16 v23, 0x0

    .line 138
    .line 139
    const/16 v24, 0x0

    .line 140
    .line 141
    :goto_3
    move-object/from16 v27, v26

    .line 142
    .line 143
    goto/16 :goto_18

    .line 144
    .line 145
    :cond_6
    :goto_4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 146
    .line 147
    .line 148
    move-result-wide v16

    .line 149
    sub-long v16, v16, v9

    .line 150
    .line 151
    const-wide/16 v27, 0x12c0

    .line 152
    .line 153
    sub-long v18, v27, v16

    .line 154
    .line 155
    iget-boolean v7, v2, Ly21;->f:Z

    .line 156
    .line 157
    if-eqz v7, :cond_7

    .line 158
    .line 159
    invoke-static {}, La31;->o()Lhp1;

    .line 160
    .line 161
    .line 162
    move-result-object v7

    .line 163
    iget-boolean v7, v7, Lhp1;->c:Z

    .line 164
    .line 165
    if-nez v7, :cond_7

    .line 166
    .line 167
    const-string v3, "\n\u63d0\u793a\uff1aDSH \u81ea\u5df1\u7684\u754c\u9762\u4e0d\u622a\u56fe\u3002"

    .line 168
    .line 169
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    move-object/from16 p2, v5

    .line 173
    .line 174
    goto :goto_8

    .line 175
    :cond_7
    sget-object v7, Lv12;->a:Lqv1;

    .line 176
    .line 177
    iget-object v7, v1, Lso;->a:Ljava/util/ArrayList;

    .line 178
    .line 179
    invoke-static {v7}, Lv12;->l(Ljava/util/List;)Ljava/util/ArrayList;

    .line 180
    .line 181
    .line 182
    move-result-object v7

    .line 183
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    .line 184
    .line 185
    .line 186
    move-result v20

    .line 187
    if-eqz v20, :cond_9

    .line 188
    .line 189
    :cond_8
    move-object/from16 p2, v5

    .line 190
    .line 191
    move-object/from16 p3, v6

    .line 192
    .line 193
    goto :goto_7

    .line 194
    :cond_9
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 195
    .line 196
    .line 197
    move-result v15

    .line 198
    move v11, v12

    .line 199
    :goto_5
    if-ge v11, v15, :cond_8

    .line 200
    .line 201
    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v20

    .line 205
    add-int/lit8 v11, v11, 0x1

    .line 206
    .line 207
    move-object/from16 v13, v20

    .line 208
    .line 209
    check-cast v13, Lus0;

    .line 210
    .line 211
    iget-object v12, v13, Lus0;->f:Ljava/lang/String;

    .line 212
    .line 213
    move-object/from16 p2, v5

    .line 214
    .line 215
    const-string v5, "\u00ab\u94f6\u884c\u5361"

    .line 216
    .line 217
    move-object/from16 p3, v6

    .line 218
    .line 219
    const/4 v6, 0x0

    .line 220
    invoke-static {v12, v5, v6}, Lhd2;->m(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    .line 221
    .line 222
    .line 223
    move-result v5

    .line 224
    if-nez v5, :cond_b

    .line 225
    .line 226
    iget-object v5, v13, Lus0;->f:Ljava/lang/String;

    .line 227
    .line 228
    const-string v12, "\u00ab\u8eab\u4efd\u8bc1"

    .line 229
    .line 230
    invoke-static {v5, v12, v6}, Lhd2;->m(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    .line 231
    .line 232
    .line 233
    move-result v5

    .line 234
    if-eqz v5, :cond_a

    .line 235
    .line 236
    goto :goto_6

    .line 237
    :cond_a
    move-object/from16 v5, p2

    .line 238
    .line 239
    move-object/from16 v6, p3

    .line 240
    .line 241
    const/4 v12, 0x0

    .line 242
    goto :goto_5

    .line 243
    :cond_b
    :goto_6
    const-string v3, "\n\u63d0\u793a\uff1a\u672c\u5c4f\u6709\u94f6\u884c\u5361\u53f7\u6216\u8eab\u4efd\u8bc1\u53f7\uff0c\u8fd9\u6b21\u6ca1\u6709\u9644\u622a\u56fe\u3002"

    .line 244
    .line 245
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    goto :goto_8

    .line 249
    :goto_7
    const-wide/16 v5, 0x384

    .line 250
    .line 251
    cmp-long v5, v18, v5

    .line 252
    .line 253
    if-gez v5, :cond_c

    .line 254
    .line 255
    const-string v3, "\n\u63d0\u793a\uff1a\u8bfb\u5c4f\u7528\u65f6\u8fc7\u957f\uff0c\u8fd9\u6b21\u6ca1\u6709\u9644\u622a\u56fe\u3002"

    .line 256
    .line 257
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    :goto_8
    move-object/from16 v5, p2

    .line 261
    .line 262
    move-object v12, v14

    .line 263
    const/4 v3, 0x0

    .line 264
    const/4 v4, 0x0

    .line 265
    const/4 v6, 0x0

    .line 266
    const/4 v9, 0x0

    .line 267
    const/4 v15, 0x0

    .line 268
    goto/16 :goto_17

    .line 269
    .line 270
    :cond_c
    iget-object v5, v1, Lso;->a:Ljava/util/ArrayList;

    .line 271
    .line 272
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 273
    .line 274
    .line 275
    move-result v5

    .line 276
    const/4 v6, 0x1

    .line 277
    if-ne v5, v6, :cond_d

    .line 278
    .line 279
    iget-object v5, v1, Lso;->a:Ljava/util/ArrayList;

    .line 280
    .line 281
    const/4 v11, 0x0

    .line 282
    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v5

    .line 286
    check-cast v5, Lck2;

    .line 287
    .line 288
    move-object v15, v5

    .line 289
    goto :goto_9

    .line 290
    :cond_d
    const/4 v11, 0x0

    .line 291
    const/4 v15, 0x0

    .line 292
    :goto_9
    iget-object v5, v1, Lso;->a:Ljava/util/ArrayList;

    .line 293
    .line 294
    invoke-static {v5}, Lek4;->a(Ljava/util/List;)Ljava/util/ArrayList;

    .line 295
    .line 296
    .line 297
    move-result-object v18

    .line 298
    iget-object v5, v0, La31;->q:Ly10;

    .line 299
    .line 300
    invoke-virtual {v5}, Ly10;->g()J

    .line 301
    .line 302
    .line 303
    move-result-wide v12

    .line 304
    move-object/from16 v19, v14

    .line 305
    .line 306
    iget-object v14, v0, La31;->g:Lli1;

    .line 307
    .line 308
    iget-object v5, v1, Lso;->d:Lqe;

    .line 309
    .line 310
    iget-object v6, v2, Ly21;->b:Ldk0;

    .line 311
    .line 312
    iget-object v6, v6, Ldk0;->a:Ljava/lang/Object;

    .line 313
    .line 314
    move-object/from16 v20, v6

    .line 315
    .line 316
    check-cast v20, Ljava/util/ArrayList;

    .line 317
    .line 318
    const-wide/16 v6, 0x1194

    .line 319
    .line 320
    sub-long v6, v6, v16

    .line 321
    .line 322
    move-wide/from16 v29, v12

    .line 323
    .line 324
    const-wide/16 v11, 0xbb8

    .line 325
    .line 326
    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->min(JJ)J

    .line 327
    .line 328
    .line 329
    move-result-wide v11

    .line 330
    invoke-virtual {v0, v1, v2, v3, v4}, La31;->w(Lso;Ly21;J)Z

    .line 331
    .line 332
    .line 333
    move-result v23

    .line 334
    new-instance v24, Lr21;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 335
    .line 336
    const/4 v7, 0x0

    .line 337
    move-object/from16 v6, p3

    .line 338
    .line 339
    move-object/from16 v16, v5

    .line 340
    .line 341
    move-wide v4, v3

    .line 342
    move-object v3, v2

    .line 343
    move-object v2, v1

    .line 344
    move-object v1, v0

    .line 345
    move-object/from16 v0, v24

    .line 346
    .line 347
    :try_start_3
    invoke-direct/range {v0 .. v7}, Lr21;-><init>(La31;Lso;Ly21;JLjava/lang/Long;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 348
    .line 349
    .line 350
    move-object v0, v1

    .line 351
    move-object v1, v2

    .line 352
    move-object v2, v3

    .line 353
    move-wide v3, v4

    .line 354
    move-object v7, v6

    .line 355
    const/16 v25, 0x600

    .line 356
    .line 357
    move-object/from16 v17, v20

    .line 358
    .line 359
    move-wide/from16 v31, v11

    .line 360
    .line 361
    move-object/from16 v12, v19

    .line 362
    .line 363
    move-wide/from16 v19, v31

    .line 364
    .line 365
    const/4 v11, 0x0

    .line 366
    :try_start_4
    invoke-static/range {v14 .. v25}, Lli1;->h(Lli1;Lck2;Lqe;Ljava/util/List;Ljava/util/List;JZZZLzk0;I)Lb92;

    .line 367
    .line 368
    .line 369
    move-result-object v13

    .line 370
    iget-object v5, v2, Ly21;->b:Ldk0;

    .line 371
    .line 372
    iget-boolean v5, v5, Ldk0;->b:Z

    .line 373
    .line 374
    if-eqz v5, :cond_e

    .line 375
    .line 376
    if-nez v7, :cond_e

    .line 377
    .line 378
    iget-object v5, v0, La31;->g:Lli1;

    .line 379
    .line 380
    invoke-virtual {v5}, Lli1;->d()Ll11;

    .line 381
    .line 382
    .line 383
    move-result-object v5

    .line 384
    :goto_a
    move-object v14, v5

    .line 385
    goto :goto_b

    .line 386
    :cond_e
    if-eqz v5, :cond_f

    .line 387
    .line 388
    if-nez v22, :cond_f

    .line 389
    .line 390
    new-instance v5, Ll11;

    .line 391
    .line 392
    sget-object v6, Lj11;->PRIVACY_UNVERIFIED:Lj11;

    .line 393
    .line 394
    invoke-direct {v5, v6}, Ll11;-><init>(Lj11;)V

    .line 395
    .line 396
    .line 397
    goto :goto_a

    .line 398
    :cond_f
    iget-object v5, v13, Lb92;->h:Lm11;

    .line 399
    .line 400
    goto :goto_a

    .line 401
    :goto_b
    iget-object v5, v2, Ly21;->b:Ldk0;

    .line 402
    .line 403
    iget-boolean v5, v5, Ldk0;->b:Z

    .line 404
    .line 405
    if-eqz v5, :cond_11

    .line 406
    .line 407
    if-eqz v7, :cond_11

    .line 408
    .line 409
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 410
    .line 411
    .line 412
    move-result-wide v5

    .line 413
    iget-object v15, v0, La31;->f:Lo71;

    .line 414
    .line 415
    invoke-virtual {v15}, Lo71;->e()Ljava/lang/Long;

    .line 416
    .line 417
    .line 418
    move-result-object v15

    .line 419
    if-nez v15, :cond_10

    .line 420
    .line 421
    goto :goto_c

    .line 422
    :cond_10
    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    .line 423
    .line 424
    .line 425
    move-result-wide v15

    .line 426
    cmp-long v5, v5, v15

    .line 427
    .line 428
    if-nez v5, :cond_11

    .line 429
    .line 430
    add-long v5, v9, v27

    .line 431
    .line 432
    invoke-virtual/range {v0 .. v6}, La31;->Q(Lso;Ly21;JJ)Z

    .line 433
    .line 434
    .line 435
    move-result v5

    .line 436
    if-eqz v5, :cond_11

    .line 437
    .line 438
    const/4 v5, 0x1

    .line 439
    goto :goto_d

    .line 440
    :cond_11
    :goto_c
    const/4 v5, 0x0

    .line 441
    :goto_d
    iget-object v6, v2, Ly21;->b:Ldk0;

    .line 442
    .line 443
    iget-boolean v6, v6, Ldk0;->b:Z

    .line 444
    .line 445
    if-eqz v6, :cond_14

    .line 446
    .line 447
    iget-object v6, v13, Lb92;->c:Lrq0;

    .line 448
    .line 449
    if-nez v6, :cond_12

    .line 450
    .line 451
    goto :goto_e

    .line 452
    :cond_12
    iget-object v15, v13, Lb92;->k:Lap2;

    .line 453
    .line 454
    if-nez v15, :cond_13

    .line 455
    .line 456
    :goto_e
    move/from16 p2, v5

    .line 457
    .line 458
    move-wide/from16 v16, v9

    .line 459
    .line 460
    move-object v15, v11

    .line 461
    goto :goto_f

    .line 462
    :cond_13
    iget-object v11, v13, Lb92;->h:Lm11;

    .line 463
    .line 464
    move/from16 p2, v5

    .line 465
    .line 466
    iget v5, v13, Lb92;->i:I

    .line 467
    .line 468
    move-wide/from16 v16, v9

    .line 469
    .line 470
    iget v9, v13, Lb92;->j:I

    .line 471
    .line 472
    invoke-static {v11, v5, v9, v15, v6}, Ljb4;->a(Lm11;IILap2;Lrq0;)Lo11;

    .line 473
    .line 474
    .line 475
    move-result-object v15

    .line 476
    goto :goto_f

    .line 477
    :cond_14
    move/from16 p2, v5

    .line 478
    .line 479
    move-wide/from16 v16, v9

    .line 480
    .line 481
    const/4 v15, 0x0

    .line 482
    :goto_f
    if-eqz p2, :cond_16

    .line 483
    .line 484
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 485
    .line 486
    .line 487
    move-result-wide v5

    .line 488
    add-long v9, v16, v27

    .line 489
    .line 490
    cmp-long v5, v5, v9

    .line 491
    .line 492
    if-gez v5, :cond_16

    .line 493
    .line 494
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 495
    .line 496
    .line 497
    move-result-wide v5

    .line 498
    iget-object v9, v0, La31;->f:Lo71;

    .line 499
    .line 500
    invoke-virtual {v9}, Lo71;->e()Ljava/lang/Long;

    .line 501
    .line 502
    .line 503
    move-result-object v9

    .line 504
    if-nez v9, :cond_15

    .line 505
    .line 506
    goto :goto_10

    .line 507
    :cond_15
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    .line 508
    .line 509
    .line 510
    move-result-wide v9

    .line 511
    cmp-long v5, v5, v9

    .line 512
    .line 513
    if-nez v5, :cond_16

    .line 514
    .line 515
    invoke-virtual {v0, v1, v2, v3, v4}, La31;->w(Lso;Ly21;J)Z

    .line 516
    .line 517
    .line 518
    move-result v3

    .line 519
    if-eqz v3, :cond_16

    .line 520
    .line 521
    move-object v3, v15

    .line 522
    goto :goto_11

    .line 523
    :cond_16
    :goto_10
    const/4 v3, 0x0

    .line 524
    :goto_11
    if-eqz v15, :cond_17

    .line 525
    .line 526
    iget-boolean v4, v15, Lo11;->b:Z

    .line 527
    .line 528
    const/4 v6, 0x1

    .line 529
    if-ne v4, v6, :cond_17

    .line 530
    .line 531
    const/4 v6, 0x1

    .line 532
    goto :goto_12

    .line 533
    :cond_17
    const/4 v6, 0x0

    .line 534
    :goto_12
    iget-boolean v4, v13, Lb92;->d:Z

    .line 535
    .line 536
    if-eqz v4, :cond_18

    .line 537
    .line 538
    iget-object v5, v0, La31;->q:Ly10;

    .line 539
    .line 540
    const/4 v11, 0x0

    .line 541
    invoke-virtual {v5, v11, v11}, Ly10;->e(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 542
    .line 543
    .line 544
    :cond_18
    iget-object v5, v13, Lb92;->a:[B

    .line 545
    .line 546
    if-eqz v5, :cond_1a

    .line 547
    .line 548
    if-nez v6, :cond_1a

    .line 549
    .line 550
    iget-object v5, v0, La31;->q:Ly10;

    .line 551
    .line 552
    iget-object v9, v2, Ly21;->a:Ljava/lang/String;

    .line 553
    .line 554
    move-wide/from16 v10, v29

    .line 555
    .line 556
    invoke-virtual {v5, v10, v11, v9}, Ly10;->a(JLjava/lang/String;)Z

    .line 557
    .line 558
    .line 559
    move-result v5

    .line 560
    if-eqz v5, :cond_19

    .line 561
    .line 562
    iget-object v15, v13, Lb92;->a:[B

    .line 563
    .line 564
    iget-object v5, v13, Lb92;->b:Ljava/lang/String;

    .line 565
    .line 566
    iget-object v6, v0, La31;->d:Ljava/lang/String;

    .line 567
    .line 568
    invoke-static {v1, v13, v6}, Lo74;->a(Lso;Lb92;Ljava/lang/String;)Ljava/util/Set;

    .line 569
    .line 570
    .line 571
    move-result-object v26

    .line 572
    const/4 v9, 0x0

    .line 573
    iput-object v9, v2, Ly21;->o:Ljava/lang/Long;

    .line 574
    .line 575
    iget-object v6, v13, Lb92;->g:Luq0;

    .line 576
    .line 577
    iput-object v6, v2, Ly21;->n:Luq0;

    .line 578
    .line 579
    iget-object v6, v13, Lb92;->c:Lrq0;

    .line 580
    .line 581
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 582
    .line 583
    .line 584
    iget v6, v6, Lrq0;->e:I

    .line 585
    .line 586
    iget-object v7, v13, Lb92;->c:Lrq0;

    .line 587
    .line 588
    iget v7, v7, Lrq0;->f:I

    .line 589
    .line 590
    new-instance v10, Ljava/lang/StringBuilder;

    .line 591
    .line 592
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 593
    .line 594
    .line 595
    const-string v11, "\n\u622a\u56fe\u4e0a\u7684\u6570\u5b57\u662f\u5143\u7d20\u7f16\u53f7\uff1btap_xy \u7528\u622a\u56fe\u50cf\u7d20\uff08"

    .line 596
    .line 597
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 598
    .line 599
    .line 600
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 601
    .line 602
    .line 603
    const-string v6, "\u00d7"

    .line 604
    .line 605
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 606
    .line 607
    .line 608
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 609
    .line 610
    .line 611
    const-string v6, "\uff09\u3002"

    .line 612
    .line 613
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 614
    .line 615
    .line 616
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 617
    .line 618
    .line 619
    move-result-object v6

    .line 620
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    .line 622
    .line 623
    iget-object v6, v13, Lb92;->f:Ljava/lang/Long;

    .line 624
    .line 625
    if-eqz v6, :cond_1e

    .line 626
    .line 627
    invoke-virtual {v6}, Ljava/lang/Number;->longValue()J

    .line 628
    .line 629
    .line 630
    move-result-wide v6

    .line 631
    iget-object v10, v0, La31;->n:Ljava/text/SimpleDateFormat;

    .line 632
    .line 633
    new-instance v11, Ljava/util/Date;

    .line 634
    .line 635
    invoke-direct {v11, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 636
    .line 637
    .line 638
    invoke-virtual {v10, v11}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 639
    .line 640
    .line 641
    move-result-object v6

    .line 642
    new-instance v7, Ljava/lang/StringBuilder;

    .line 643
    .line 644
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 645
    .line 646
    .line 647
    const-string v10, "\n\u622a\u56fe\u65f6\u95f4\uff1a"

    .line 648
    .line 649
    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 650
    .line 651
    .line 652
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 653
    .line 654
    .line 655
    const-string v6, "\uff08\u7cfb\u7edf\u622a\u56fe\u65f6\u95f4\u6233\uff0c\u8bbe\u5907\u65f6\u949f\uff09\u3002"

    .line 656
    .line 657
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 658
    .line 659
    .line 660
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 661
    .line 662
    .line 663
    move-result-object v6

    .line 664
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 665
    .line 666
    .line 667
    goto :goto_16

    .line 668
    :cond_19
    :goto_13
    const/4 v9, 0x0

    .line 669
    goto :goto_14

    .line 670
    :cond_1a
    move-wide/from16 v10, v29

    .line 671
    .line 672
    goto :goto_13

    .line 673
    :goto_14
    if-eqz v3, :cond_1b

    .line 674
    .line 675
    iget-boolean v5, v3, Lo11;->c:Z

    .line 676
    .line 677
    const/4 v15, 0x1

    .line 678
    if-ne v5, v15, :cond_1b

    .line 679
    .line 680
    if-nez v6, :cond_1b

    .line 681
    .line 682
    iget-object v5, v13, Lb92;->g:Luq0;

    .line 683
    .line 684
    if-eqz v5, :cond_1b

    .line 685
    .line 686
    iget-object v5, v0, La31;->q:Ly10;

    .line 687
    .line 688
    iget-object v15, v2, Ly21;->a:Ljava/lang/String;

    .line 689
    .line 690
    invoke-virtual {v5, v10, v11, v15}, Ly10;->a(JLjava/lang/String;)Z

    .line 691
    .line 692
    .line 693
    move-result v5

    .line 694
    if-eqz v5, :cond_1b

    .line 695
    .line 696
    iget-object v5, v13, Lb92;->g:Luq0;

    .line 697
    .line 698
    iput-object v5, v2, Ly21;->n:Luq0;

    .line 699
    .line 700
    iput-object v7, v2, Ly21;->o:Ljava/lang/Long;

    .line 701
    .line 702
    goto :goto_15

    .line 703
    :cond_1b
    if-eqz v21, :cond_1d

    .line 704
    .line 705
    if-nez v6, :cond_1d

    .line 706
    .line 707
    iget-object v5, v13, Lb92;->e:Ljava/lang/String;

    .line 708
    .line 709
    if-nez v5, :cond_1c

    .line 710
    .line 711
    const-string v5, "\u622a\u56fe\u5931\u8d25"

    .line 712
    .line 713
    :cond_1c
    new-instance v6, Ljava/lang/StringBuilder;

    .line 714
    .line 715
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 716
    .line 717
    .line 718
    const-string v7, "\n\u63d0\u793a\uff1a"

    .line 719
    .line 720
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 721
    .line 722
    .line 723
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 724
    .line 725
    .line 726
    const-string v5, "\u3002"

    .line 727
    .line 728
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 729
    .line 730
    .line 731
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 732
    .line 733
    .line 734
    move-result-object v5

    .line 735
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 736
    .line 737
    .line 738
    :cond_1d
    :goto_15
    move-object v5, v9

    .line 739
    move-object v15, v5

    .line 740
    :cond_1e
    :goto_16
    sget-object v6, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 741
    .line 742
    move-object v6, v15

    .line 743
    move-object v15, v3

    .line 744
    move-object v3, v6

    .line 745
    move v6, v4

    .line 746
    move-object v4, v5

    .line 747
    move-object v5, v14

    .line 748
    :goto_17
    move-object/from16 v23, v3

    .line 749
    .line 750
    move-object/from16 v24, v4

    .line 751
    .line 752
    goto/16 :goto_3

    .line 753
    .line 754
    :goto_18
    iget-object v3, v2, Ly21;->b:Ldk0;

    .line 755
    .line 756
    iget-boolean v3, v3, Ldk0;->b:Z

    .line 757
    .line 758
    if-eqz v3, :cond_26

    .line 759
    .line 760
    const-string v3, "\n"

    .line 761
    .line 762
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 763
    .line 764
    .line 765
    if-eqz v15, :cond_1f

    .line 766
    .line 767
    iget-object v3, v15, Lo11;->a:Ljava/lang/String;

    .line 768
    .line 769
    :goto_19
    const/4 v15, 0x1

    .line 770
    goto :goto_1a

    .line 771
    :cond_1f
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 772
    .line 773
    .line 774
    instance-of v3, v5, Lk11;

    .line 775
    .line 776
    if-eqz v3, :cond_20

    .line 777
    .line 778
    const-string v3, "\u672c\u673a\u8bc6\u522b\u7ed3\u679c\u4ec5\u7559\u5728\u672c\u673a\uff0c\u672a\u63d0\u4f9b\u89c6\u89c9\u5143\u7d20\uff1b\u4e0d\u80fd\u636e\u6b64\u731c\u5750\u6807\uff0c\u8bf7 handoff\u3002"

    .line 779
    .line 780
    goto :goto_19

    .line 781
    :cond_20
    instance-of v3, v5, Lg11;

    .line 782
    .line 783
    if-eqz v3, :cond_21

    .line 784
    .line 785
    const-string v3, "\u672c\u673a\u6587\u5b57\u8bc6\u522b\u5931\u8d25\u6216\u7ed3\u679c\u4e0d\u5b8c\u6574\uff0c\u672a\u63d0\u4f9b\u89c6\u89c9\u5143\u7d20\uff1b\u8bf7 handoff\u3002"

    .line 786
    .line 787
    goto :goto_19

    .line 788
    :cond_21
    instance-of v3, v5, Ll11;

    .line 789
    .line 790
    if-eqz v3, :cond_25

    .line 791
    .line 792
    check-cast v5, Ll11;

    .line 793
    .line 794
    iget-object v3, v5, Ll11;->a:Lj11;

    .line 795
    .line 796
    sget-object v4, Lf11;->a:[I

    .line 797
    .line 798
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 799
    .line 800
    .line 801
    move-result v3

    .line 802
    aget v3, v4, v3

    .line 803
    .line 804
    const/4 v15, 0x1

    .line 805
    if-eq v3, v15, :cond_24

    .line 806
    .line 807
    const/4 v4, 0x2

    .line 808
    if-eq v3, v4, :cond_23

    .line 809
    .line 810
    const/4 v4, 0x3

    .line 811
    if-eq v3, v4, :cond_22

    .line 812
    .line 813
    const-string v3, "\u672c\u6b21\u672c\u673a\u6587\u5b57\u8bc6\u522b\u4e0d\u53ef\u7528\uff0c\u672a\u63d0\u4f9b\u89c6\u89c9\u5143\u7d20\uff1b\u8bf7 handoff\u3002"

    .line 814
    .line 815
    goto :goto_1a

    .line 816
    :cond_22
    const-string v3, "\u65e0\u6cd5\u786e\u8ba4\u672c\u5c4f\u7684\u672c\u673a\u8bc6\u522b\u9690\u79c1\u8fb9\u754c\uff0c\u672a\u8bc6\u522b\u6587\u5b57\uff1b\u8bf7 handoff\u3002"

    .line 817
    .line 818
    goto :goto_1a

    .line 819
    :cond_23
    const-string v3, "\u672c\u673a\u6587\u5b57\u8bc6\u522b\u540e\u7aef\u5c1a\u672a\u5b89\u88c5\uff0c\u672a\u63d0\u4f9b\u89c6\u89c9\u5143\u7d20\uff1b\u4e0d\u80fd\u636e\u6b64\u731c\u5750\u6807\uff0c\u8bf7 handoff\u3002"

    .line 820
    .line 821
    goto :goto_1a

    .line 822
    :cond_24
    const-string v3, "\u672c\u673a\u6587\u5b57\u8bc6\u522b\u5df2\u5173\u95ed"

    .line 823
    .line 824
    :goto_1a
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 825
    .line 826
    .line 827
    goto :goto_1b

    .line 828
    :cond_25
    new-instance v0, Lgw;

    .line 829
    .line 830
    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    .line 831
    .line 832
    .line 833
    throw v0

    .line 834
    :cond_26
    const/4 v15, 0x1

    .line 835
    :goto_1b
    if-eqz v6, :cond_27

    .line 836
    .line 837
    invoke-virtual {v0}, La31;->j()V

    .line 838
    .line 839
    .line 840
    :cond_27
    iget-object v0, v2, Ly21;->a:Ljava/lang/String;

    .line 841
    .line 842
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 843
    .line 844
    .line 845
    move-result-object v18

    .line 846
    iget-object v3, v2, Ly21;->d:Ljava/lang/String;

    .line 847
    .line 848
    iget-object v4, v2, Ly21;->c:Ljava/lang/String;

    .line 849
    .line 850
    if-nez v6, :cond_29

    .line 851
    .line 852
    iget-boolean v5, v2, Ly21;->g:Z

    .line 853
    .line 854
    if-eqz v5, :cond_28

    .line 855
    .line 856
    goto :goto_1c

    .line 857
    :cond_28
    const/16 v21, 0x0

    .line 858
    .line 859
    goto :goto_1d

    .line 860
    :cond_29
    :goto_1c
    move/from16 v21, v15

    .line 861
    .line 862
    :goto_1d
    iget-object v5, v2, Ly21;->b:Ldk0;

    .line 863
    .line 864
    iget-boolean v5, v5, Ldk0;->b:Z

    .line 865
    .line 866
    iget-object v7, v2, Ly21;->l:Ljava/util/Set;

    .line 867
    .line 868
    iget-object v15, v2, Ly21;->m:Lb20;

    .line 869
    .line 870
    if-nez v6, :cond_2a

    .line 871
    .line 872
    move-object/from16 v26, v15

    .line 873
    .line 874
    goto :goto_1e

    .line 875
    :cond_2a
    move-object/from16 v26, v9

    .line 876
    .line 877
    :goto_1e
    new-instance v16, Lh22;

    .line 878
    .line 879
    move-object/from16 v17, v0

    .line 880
    .line 881
    move-object/from16 v19, v3

    .line 882
    .line 883
    move-object/from16 v20, v4

    .line 884
    .line 885
    move/from16 v22, v5

    .line 886
    .line 887
    move-object/from16 v25, v7

    .line 888
    .line 889
    invoke-direct/range {v16 .. v27}, Lh22;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ[BLjava/lang/String;Ljava/util/Set;Lb20;Ljava/util/Set;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 890
    .line 891
    .line 892
    :try_start_5
    invoke-virtual {v1}, Lso;->b()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 893
    .line 894
    .line 895
    monitor-exit v8

    .line 896
    return-object v16

    .line 897
    :catchall_2
    move-exception v0

    .line 898
    move-object v1, v2

    .line 899
    :goto_1f
    :try_start_6
    invoke-virtual {v1}, Lso;->b()V

    .line 900
    .line 901
    .line 902
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 903
    :goto_20
    monitor-exit v8

    .line 904
    throw v0
.end method

.method public final open(Lii1;)Lv2;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "\u6253\u5f00\u300c"

    .line 6
    .line 7
    const-string v3, "\u6ca1\u627e\u5230\u300c"

    .line 8
    .line 9
    iget-object v4, v1, Lii1;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object v6

    .line 19
    invoke-static {v5, v6}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-eqz v5, :cond_0

    .line 24
    .line 25
    new-instance v6, Lv2;

    .line 26
    .line 27
    const-string v8, "\u5185\u90e8\u9519\u8bef\uff1a\u624b\u673a\u52a8\u4f5c\u4e0d\u80fd\u5728\u4e3b\u7ebf\u7a0b\u6267\u884c\u3002"

    .line 28
    .line 29
    const/4 v11, 0x0

    .line 30
    const/16 v12, 0x7c

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    const/4 v9, 0x0

    .line 34
    const/4 v10, 0x0

    .line 35
    invoke-direct/range {v6 .. v12}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 36
    .line 37
    .line 38
    return-object v6

    .line 39
    :cond_0
    iget-object v5, v0, La31;->o:Ljava/lang/Object;

    .line 40
    .line 41
    monitor-enter v5

    .line 42
    :try_start_0
    invoke-virtual {v0}, La31;->availability()Lsb;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    iget-boolean v7, v6, Lsb;->a:Z

    .line 47
    .line 48
    if-nez v7, :cond_1

    .line 49
    .line 50
    new-instance v8, Lv2;

    .line 51
    .line 52
    iget-object v10, v6, Lsb;->b:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    const/4 v13, 0x0

    .line 58
    const/16 v14, 0x7c

    .line 59
    .line 60
    const/4 v9, 0x0

    .line 61
    const/4 v11, 0x0

    .line 62
    const/4 v12, 0x0

    .line 63
    invoke-direct/range {v8 .. v14}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    .line 66
    monitor-exit v5

    .line 67
    return-object v8

    .line 68
    :catchall_0
    move-exception v0

    .line 69
    goto/16 :goto_7

    .line 70
    .line 71
    :cond_1
    :try_start_1
    iget-object v6, v0, La31;->d:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v4, v6}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v6

    .line 77
    if-eqz v6, :cond_2

    .line 78
    .line 79
    invoke-static {}, La31;->o()Lhp1;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    iget-boolean v6, v6, Lhp1;->c:Z

    .line 84
    .line 85
    if-nez v6, :cond_2

    .line 86
    .line 87
    new-instance v7, Lv2;

    .line 88
    .line 89
    const-string v9, "DSH \u81ea\u5df1\u4e0d\u9700\u8981\u6253\u5f00\u3002"

    .line 90
    .line 91
    const/4 v12, 0x0

    .line 92
    const/16 v13, 0x7c

    .line 93
    .line 94
    const/4 v8, 0x0

    .line 95
    const/4 v10, 0x0

    .line 96
    const/4 v11, 0x0

    .line 97
    invoke-direct/range {v7 .. v13}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 98
    .line 99
    .line 100
    monitor-exit v5

    .line 101
    return-object v7

    .line 102
    :cond_2
    :try_start_2
    invoke-virtual {v0, v4}, La31;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    if-nez v6, :cond_3

    .line 107
    .line 108
    move-object v6, v4

    .line 109
    :cond_3
    iget-object v7, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 110
    .line 111
    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    invoke-virtual {v7, v4}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    move-result-object v7

    .line 119
    if-nez v7, :cond_4

    .line 120
    .line 121
    new-instance v8, Lv2;

    .line 122
    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v1, "\u300d\uff0c\u6216\u5b83\u6ca1\u6709\u53ef\u4ee5\u6253\u5f00\u7684\u754c\u9762\u3002\u53ef\u4ee5\u5148\u7528 apps \u67e5\u4e00\u4e0b\u5305\u540d\u3002"

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v10

    .line 140
    const/4 v13, 0x0

    .line 141
    const/16 v14, 0x7c

    .line 142
    .line 143
    const/4 v9, 0x0

    .line 144
    const/4 v11, 0x0

    .line 145
    const/4 v12, 0x0

    .line 146
    invoke-direct/range {v8 .. v14}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 147
    .line 148
    .line 149
    monitor-exit v5

    .line 150
    return-object v8

    .line 151
    :cond_4
    const/4 v3, 0x0

    .line 152
    const/4 v8, 0x0

    .line 153
    :try_start_3
    iget-object v9, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 154
    .line 155
    invoke-virtual {v9}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 156
    .line 157
    .line 158
    move-result-object v9

    .line 159
    invoke-virtual {v9, v7, v3}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    .line 160
    .line 161
    .line 162
    move-result-object v9

    .line 163
    if-eqz v9, :cond_5

    .line 164
    .line 165
    iget-object v9, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :catch_0
    :cond_5
    move-object v9, v8

    .line 169
    :goto_0
    if-nez v9, :cond_6

    .line 170
    .line 171
    :try_start_4
    new-instance v10, Lv2;

    .line 172
    .line 173
    sget-object v0, Lio/github/ccch1mneyyy/dsh_app/phone/background/Reasons;->INSTANCE:Lio/github/ccch1mneyyy/dsh_app/phone/background/Reasons;

    .line 174
    .line 175
    const-string v1, "targetIdentityUnavailable"

    .line 176
    .line 177
    invoke-virtual {v0, v1}, Lio/github/ccch1mneyyy/dsh_app/phone/background/Reasons;->of(Ljava/lang/String;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v12

    .line 181
    const/4 v15, 0x0

    .line 182
    const/16 v16, 0x7c

    .line 183
    .line 184
    const/4 v11, 0x0

    .line 185
    const/4 v13, 0x0

    .line 186
    const/4 v14, 0x0

    .line 187
    invoke-direct/range {v10 .. v16}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 188
    .line 189
    .line 190
    monitor-exit v5

    .line 191
    return-object v10

    .line 192
    :cond_6
    :try_start_5
    iget-object v10, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 193
    .line 194
    invoke-static {v10, v4}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result v10

    .line 198
    if-eqz v10, :cond_f

    .line 199
    .line 200
    iget-object v9, v9, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 201
    .line 202
    iget v9, v9, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 203
    .line 204
    iget v1, v1, Lii1;->b:I

    .line 205
    .line 206
    if-eq v9, v1, :cond_7

    .line 207
    .line 208
    goto/16 :goto_6

    .line 209
    .line 210
    :cond_7
    const/high16 v1, 0x10200000

    .line 211
    .line 212
    invoke-virtual {v7, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 213
    .line 214
    .line 215
    iget-wide v9, v0, La31;->v:J
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 216
    .line 217
    :try_start_6
    iget-object v1, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 218
    .line 219
    invoke-virtual {v1, v7}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 220
    .line 221
    .line 222
    :try_start_7
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 223
    .line 224
    .line 225
    move-result-wide v1

    .line 226
    const-wide/16 v11, 0x1770

    .line 227
    .line 228
    add-long/2addr v1, v11

    .line 229
    move-object v7, v8

    .line 230
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 231
    .line 232
    .line 233
    move-result-wide v11

    .line 234
    cmp-long v11, v11, v1

    .line 235
    .line 236
    if-gez v11, :cond_8

    .line 237
    .line 238
    invoke-virtual {v0, v9, v10}, La31;->f(J)Z

    .line 239
    .line 240
    .line 241
    move-result v11

    .line 242
    if-nez v11, :cond_8

    .line 243
    .line 244
    invoke-virtual {v0}, La31;->foregroundPackage()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v7

    .line 248
    invoke-static {v7, v4}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result v11

    .line 252
    if-nez v11, :cond_8

    .line 253
    .line 254
    iget-object v11, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 255
    .line 256
    iget-object v11, v11, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 257
    .line 258
    new-instance v12, Lp21;

    .line 259
    .line 260
    const/4 v13, 0x2

    .line 261
    invoke-direct {v12, v0, v9, v10, v13}, Lp21;-><init>(La31;JI)V

    .line 262
    .line 263
    .line 264
    const-wide/16 v13, 0x96

    .line 265
    .line 266
    invoke-virtual {v11, v13, v14, v12}, Lfb0;->a(JLzk0;)V

    .line 267
    .line 268
    .line 269
    goto :goto_1

    .line 270
    :cond_8
    invoke-static {v7, v4}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-eqz v1, :cond_9

    .line 275
    .line 276
    iget-object v1, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 277
    .line 278
    iget-object v11, v1, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 279
    .line 280
    iget-wide v12, v11, Lfb0;->b:J

    .line 281
    .line 282
    new-instance v1, Lp21;

    .line 283
    .line 284
    const/4 v2, 0x3

    .line 285
    invoke-direct {v1, v0, v9, v10, v2}, Lp21;-><init>(La31;JI)V

    .line 286
    .line 287
    .line 288
    const-wide/16 v14, 0x320

    .line 289
    .line 290
    const-wide/16 v16, 0x190

    .line 291
    .line 292
    move-object/from16 v18, v1

    .line 293
    .line 294
    invoke-virtual/range {v11 .. v18}, Lfb0;->b(JJJLzk0;)V

    .line 295
    .line 296
    .line 297
    :cond_9
    invoke-static {v7, v4}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    if-eqz v1, :cond_a

    .line 302
    .line 303
    invoke-virtual {v0}, La31;->availability()Lsb;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    iget-boolean v1, v1, Lsb;->a:Z

    .line 308
    .line 309
    if-eqz v1, :cond_a

    .line 310
    .line 311
    invoke-virtual {v0, v8, v9, v10, v3}, La31;->I(Ly21;JZ)Lso;

    .line 312
    .line 313
    .line 314
    move-result-object v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 315
    :try_start_8
    invoke-virtual {v0, v1, v3}, La31;->y(Lso;Z)Ly21;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    invoke-static {v2}, La31;->L(Ly21;)Lh22;

    .line 320
    .line 321
    .line 322
    move-result-object v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 323
    :try_start_9
    invoke-virtual {v1}, Lso;->b()V

    .line 324
    .line 325
    .line 326
    :goto_2
    move-object v11, v2

    .line 327
    goto :goto_3

    .line 328
    :catchall_1
    move-exception v0

    .line 329
    invoke-virtual {v1}, Lso;->b()V

    .line 330
    .line 331
    .line 332
    throw v0

    .line 333
    :cond_a
    invoke-virtual {v0}, La31;->v()Lh22;

    .line 334
    .line 335
    .line 336
    move-result-object v2

    .line 337
    goto :goto_2

    .line 338
    :goto_3
    invoke-static {v7, v4}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    if-eqz v1, :cond_b

    .line 343
    .line 344
    new-instance v8, Lv2;

    .line 345
    .line 346
    new-instance v0, Ljava/lang/StringBuilder;

    .line 347
    .line 348
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 349
    .line 350
    .line 351
    const-string v1, "\u5df2\u6253\u5f00\u300c"

    .line 352
    .line 353
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    const-string v1, "\u300d\u3002"

    .line 360
    .line 361
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v10

    .line 368
    const/4 v13, 0x0

    .line 369
    const/16 v14, 0x78

    .line 370
    .line 371
    const/4 v9, 0x1

    .line 372
    const/4 v12, 0x0

    .line 373
    invoke-direct/range {v8 .. v14}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 374
    .line 375
    .line 376
    goto :goto_5

    .line 377
    :cond_b
    new-instance v8, Lv2;

    .line 378
    .line 379
    invoke-virtual {v0, v7}, La31;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    if-nez v0, :cond_c

    .line 384
    .line 385
    if-nez v7, :cond_d

    .line 386
    .line 387
    const-string v7, "\u672a\u77e5"

    .line 388
    .line 389
    goto :goto_4

    .line 390
    :cond_c
    move-object v7, v0

    .line 391
    :cond_d
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 392
    .line 393
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 394
    .line 395
    .line 396
    const-string v1, "\u5df2\u8bf7\u6c42\u6253\u5f00\u300c"

    .line 397
    .line 398
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    .line 403
    .line 404
    const-string v1, "\u300d\uff0c\u4f46 6 \u79d2\u5185\u5b83\u6ca1\u6709\u5230\u524d\u53f0\uff08\u73b0\u5728\u662f\u300c"

    .line 405
    .line 406
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    const-string v1, "\u300d\uff09\u3002"

    .line 413
    .line 414
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v10

    .line 421
    const/4 v13, 0x0

    .line 422
    const/16 v14, 0x78

    .line 423
    .line 424
    const/4 v9, 0x0

    .line 425
    const/4 v12, 0x0

    .line 426
    invoke-direct/range {v8 .. v14}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 427
    .line 428
    .line 429
    :goto_5
    monitor-exit v5

    .line 430
    return-object v8

    .line 431
    :catch_1
    move-exception v0

    .line 432
    :try_start_a
    new-instance v7, Lv2;

    .line 433
    .line 434
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v1

    .line 438
    if-nez v1, :cond_e

    .line 439
    .line 440
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v1

    .line 448
    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    .line 449
    .line 450
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    .line 455
    .line 456
    const-string v2, "\u300d\u5931\u8d25\uff1a"

    .line 457
    .line 458
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 462
    .line 463
    .line 464
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object v9

    .line 468
    const/4 v12, 0x0

    .line 469
    const/16 v13, 0x7c

    .line 470
    .line 471
    const/4 v8, 0x0

    .line 472
    const/4 v10, 0x0

    .line 473
    const/4 v11, 0x0

    .line 474
    invoke-direct/range {v7 .. v13}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 475
    .line 476
    .line 477
    monitor-exit v5

    .line 478
    return-object v7

    .line 479
    :cond_f
    :goto_6
    :try_start_b
    new-instance v6, Lv2;

    .line 480
    .line 481
    sget-object v0, Lio/github/ccch1mneyyy/dsh_app/phone/background/Reasons;->INSTANCE:Lio/github/ccch1mneyyy/dsh_app/phone/background/Reasons;

    .line 482
    .line 483
    const-string v1, "targetIdentityChanged"

    .line 484
    .line 485
    invoke-virtual {v0, v1}, Lio/github/ccch1mneyyy/dsh_app/phone/background/Reasons;->of(Ljava/lang/String;)Ljava/lang/String;

    .line 486
    .line 487
    .line 488
    move-result-object v8

    .line 489
    const/4 v11, 0x0

    .line 490
    const/16 v12, 0x7c

    .line 491
    .line 492
    const/4 v7, 0x0

    .line 493
    const/4 v9, 0x0

    .line 494
    const/4 v10, 0x0

    .line 495
    invoke-direct/range {v6 .. v12}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 496
    .line 497
    .line 498
    monitor-exit v5

    .line 499
    return-object v6

    .line 500
    :goto_7
    monitor-exit v5

    .line 501
    throw v0
.end method

.method public final p(Ljava/lang/String;Ll12;)Lsg2;
    .locals 11

    .line 1
    new-instance v0, Lsg2;

    .line 2
    .line 3
    iget v2, p2, Ll12;->a:I

    .line 4
    .line 5
    iget-object v3, p2, Ll12;->f:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v4, p2, Ll12;->g:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v5, p2, Ll12;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, v5}, La31;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v6

    .line 15
    iget-boolean v7, p2, Ll12;->j:Z

    .line 16
    .line 17
    iget-boolean v8, p2, Ll12;->k:Z

    .line 18
    .line 19
    iget-boolean v9, p2, Ll12;->i:Z

    .line 20
    .line 21
    iget-object v10, p2, Ll12;->n:Ljava/lang/String;

    .line 22
    .line 23
    move-object v1, p1

    .line 24
    invoke-direct/range {v0 .. v10}, Lsg2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public final perform(Ldi1;)Lv2;
    .locals 3

    .line 323
    new-instance v0, Ls21;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ls21;-><init>(La31;I)V

    .line 324
    new-instance v1, Lqb0;

    const/16 v2, 0x9

    invoke-direct {v1, v2}, Lqb0;-><init>(I)V

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v0, v2, v1}, La31;->perform(Ldi1;Lzk0;Lbl0;Lbl0;)Lv2;

    move-result-object p0

    return-object p0
.end method

.method public final perform(Ldi1;Lzk0;)Lv2;
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public final perform(Ldi1;Lzk0;Lbl0;)Lv2;
    .locals 1

    .line 325
    new-instance p3, Lqb0;

    const/16 v0, 0x9

    invoke-direct {p3, v0}, Lqb0;-><init>(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, La31;->perform(Ldi1;Lzk0;Lbl0;Lbl0;)Lv2;

    move-result-object p0

    return-object p0
.end method

.method public final perform(Ldi1;Lzk0;Lbl0;Lbl0;)Lv2;
    .locals 13

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v1, Lv2;

    .line 16
    .line 17
    const-string v3, "\u5185\u90e8\u9519\u8bef\uff1a\u624b\u673a\u52a8\u4f5c\u4e0d\u80fd\u5728\u4e3b\u7ebf\u7a0b\u6267\u884c\u3002"

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    const/16 v7, 0x7c

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v4, 0x0

    .line 24
    const/4 v5, 0x0

    .line 25
    invoke-direct/range {v1 .. v7}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 26
    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_0
    iget-wide v4, p0, La31;->v:J

    .line 30
    .line 31
    iget-object v1, p0, La31;->o:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter v1

    .line 34
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    const-wide/16 v6, 0x7530

    .line 39
    .line 40
    add-long/2addr v2, v6

    .line 41
    iput-wide v2, p0, La31;->h:J

    .line 42
    .line 43
    invoke-virtual {p0}, La31;->availability()Lsb;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-boolean v2, v0, Lsb;->a:Z

    .line 48
    .line 49
    if-nez v2, :cond_1

    .line 50
    .line 51
    new-instance v6, Lv2;

    .line 52
    .line 53
    iget-object v8, v0, Lsb;->b:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    const/4 v11, 0x0

    .line 59
    const/16 v12, 0x7c

    .line 60
    .line 61
    const/4 v7, 0x0

    .line 62
    const/4 v9, 0x0

    .line 63
    const/4 v10, 0x0

    .line 64
    invoke-direct/range {v6 .. v12}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    .line 66
    .line 67
    monitor-exit v1

    .line 68
    return-object v6

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    move-object p0, v0

    .line 71
    goto/16 :goto_4

    .line 72
    .line 73
    :cond_1
    :try_start_1
    invoke-interface {p2}, Lzk0;->invoke()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Ljava/lang/Boolean;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_2

    .line 84
    .line 85
    new-instance v6, Lv2;

    .line 86
    .line 87
    const-string v8, "\u7528\u6237\u5728\u60ac\u6d6e\u6761\u4e0a\u6309\u4e86\u6682\u505c\u3002\u7b49\u7528\u6237\u70b9\u300c\u7ee7\u7eed\u300d\u540e\u518d\u64cd\u4f5c\uff0c\u4e0d\u8981\u6362\u522b\u7684\u65b9\u5f0f\u7ed5\u8fc7\u3002"

    .line 88
    .line 89
    const/4 v11, 0x0

    .line 90
    const/16 v12, 0x7c

    .line 91
    .line 92
    const/4 v7, 0x0

    .line 93
    const/4 v9, 0x0

    .line 94
    const/4 v10, 0x0

    .line 95
    invoke-direct/range {v6 .. v12}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    .line 97
    .line 98
    monitor-exit v1

    .line 99
    return-object v6

    .line 100
    :cond_2
    :try_start_2
    invoke-virtual {p0}, La31;->d()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-nez v0, :cond_3

    .line 105
    .line 106
    new-instance v6, Lv2;

    .line 107
    .line 108
    const-string v8, "\u7528\u6237\u6b63\u5728\u60ac\u6d6e\u6761\u4e0a\u8f93\u5165\u63d2\u8bdd\uff0c\u7a0d\u7b49\u518d\u64cd\u4f5c\u3002"

    .line 109
    .line 110
    const/4 v11, 0x0

    .line 111
    const/16 v12, 0x7c

    .line 112
    .line 113
    const/4 v7, 0x0

    .line 114
    const/4 v9, 0x0

    .line 115
    const/4 v10, 0x0

    .line 116
    invoke-direct/range {v6 .. v12}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 117
    .line 118
    .line 119
    monitor-exit v1

    .line 120
    return-object v6

    .line 121
    :cond_3
    :try_start_3
    invoke-virtual {p0, v4, v5}, La31;->f(J)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_f

    .line 126
    .line 127
    invoke-static {p2}, Lvb4;->b(Lzk0;)Lv2;

    .line 128
    .line 129
    .line 130
    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 131
    if-eqz v0, :cond_4

    .line 132
    .line 133
    monitor-exit v1

    .line 134
    return-object v0

    .line 135
    :cond_4
    const/4 v0, 0x0

    .line 136
    :try_start_4
    iput-object v0, p0, La31;->i:Luq0;

    .line 137
    .line 138
    iget-object v2, p0, La31;->p:Ly21;

    .line 139
    .line 140
    instance-of v3, p1, Lbi1;

    .line 141
    .line 142
    if-nez v3, :cond_7

    .line 143
    .line 144
    if-eqz v2, :cond_7

    .line 145
    .line 146
    iget-object v3, v2, Ly21;->b:Ldk0;

    .line 147
    .line 148
    iget-boolean v3, v3, Ldk0;->b:Z

    .line 149
    .line 150
    const/4 v6, 0x1

    .line 151
    if-ne v3, v6, :cond_7

    .line 152
    .line 153
    iget-wide v6, p0, La31;->h:J

    .line 154
    .line 155
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 156
    .line 157
    .line 158
    move-result-wide v8

    .line 159
    sub-long/2addr v6, v8

    .line 160
    const-wide/16 v8, 0x0

    .line 161
    .line 162
    cmp-long v3, v6, v8

    .line 163
    .line 164
    if-lez v3, :cond_7

    .line 165
    .line 166
    const-wide/16 v8, 0x7d0

    .line 167
    .line 168
    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->min(JJ)J

    .line 169
    .line 170
    .line 171
    move-result-wide v6

    .line 172
    const/4 v3, 0x0

    .line 173
    const/4 v8, 0x2

    .line 174
    invoke-static {p0, v6, v7, v3, v8}, La31;->h(La31;JZI)Lso;

    .line 175
    .line 176
    .line 177
    move-result-object v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 178
    :try_start_5
    invoke-virtual {p0, v3, v2, v4, v5}, La31;->w(Lso;Ly21;J)Z

    .line 179
    .line 180
    .line 181
    move-result v6

    .line 182
    if-eqz v6, :cond_6

    .line 183
    .line 184
    invoke-static {v3}, La31;->u(Lso;)Lc12;

    .line 185
    .line 186
    .line 187
    move-result-object v6

    .line 188
    iget-object v2, v2, Ly21;->i:Lc12;

    .line 189
    .line 190
    invoke-virtual {v6, v2}, Lc12;->d(Lc12;)Z

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    if-eqz v2, :cond_6

    .line 195
    .line 196
    invoke-virtual {p0, v3}, La31;->i(Lso;)Lb92;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    if-eqz v2, :cond_5

    .line 201
    .line 202
    iget-object v0, v2, Lb92;->g:Luq0;

    .line 203
    .line 204
    goto :goto_0

    .line 205
    :catchall_1
    move-exception v0

    .line 206
    move-object p0, v0

    .line 207
    goto :goto_1

    .line 208
    :cond_5
    :goto_0
    iput-object v0, p0, La31;->i:Luq0;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 209
    .line 210
    :cond_6
    :try_start_6
    invoke-virtual {v3}, Lso;->b()V

    .line 211
    .line 212
    .line 213
    goto :goto_2

    .line 214
    :goto_1
    invoke-virtual {v3}, Lso;->b()V

    .line 215
    .line 216
    .line 217
    throw p0

    .line 218
    :cond_7
    :goto_2
    invoke-virtual {p0, v4, v5}, La31;->f(J)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_e

    .line 223
    .line 224
    invoke-static {p2}, Lvb4;->b(Lzk0;)Lv2;

    .line 225
    .line 226
    .line 227
    move-result-object v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 228
    if-eqz v0, :cond_8

    .line 229
    .line 230
    monitor-exit v1

    .line 231
    return-object v0

    .line 232
    :cond_8
    :try_start_7
    instance-of v0, p1, Lyh1;

    .line 233
    .line 234
    if-eqz v0, :cond_9

    .line 235
    .line 236
    check-cast p1, Lyh1;

    .line 237
    .line 238
    invoke-virtual {p0, p1, v4, v5}, La31;->r(Lyh1;J)Lv2;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    goto :goto_3

    .line 243
    :cond_9
    instance-of v0, p1, Lai1;

    .line 244
    .line 245
    if-eqz v0, :cond_a

    .line 246
    .line 247
    move-object v3, p1

    .line 248
    check-cast v3, Lai1;

    .line 249
    .line 250
    move-object v2, p0

    .line 251
    move-object v6, p2

    .line 252
    move-object/from16 v7, p4

    .line 253
    .line 254
    invoke-virtual/range {v2 .. v7}, La31;->J(Lai1;JLzk0;Lbl0;)Lv2;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    goto :goto_3

    .line 259
    :cond_a
    instance-of v0, p1, Lci1;

    .line 260
    .line 261
    if-eqz v0, :cond_b

    .line 262
    .line 263
    check-cast p1, Lci1;

    .line 264
    .line 265
    invoke-virtual {p0, p1, v4, v5, p2}, La31;->M(Lci1;JLzk0;)Lv2;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    goto :goto_3

    .line 270
    :cond_b
    instance-of v0, p1, Lzh1;

    .line 271
    .line 272
    if-eqz v0, :cond_c

    .line 273
    .line 274
    move-object v3, p1

    .line 275
    check-cast v3, Lzh1;

    .line 276
    .line 277
    move-object v2, p0

    .line 278
    move-object v6, p2

    .line 279
    move-object/from16 v7, p4

    .line 280
    .line 281
    invoke-virtual/range {v2 .. v7}, La31;->H(Lzh1;JLzk0;Lbl0;)Lv2;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    goto :goto_3

    .line 286
    :cond_c
    instance-of v0, p1, Lbi1;

    .line 287
    .line 288
    if-eqz v0, :cond_d

    .line 289
    .line 290
    move-object v3, p1

    .line 291
    check-cast v3, Lbi1;

    .line 292
    .line 293
    move-object v2, p0

    .line 294
    move-object v6, p2

    .line 295
    move-object/from16 v7, p3

    .line 296
    .line 297
    invoke-virtual/range {v2 .. v7}, La31;->K(Lbi1;JLzk0;Lbl0;)Lv2;

    .line 298
    .line 299
    .line 300
    move-result-object p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 301
    :goto_3
    monitor-exit v1

    .line 302
    return-object p0

    .line 303
    :cond_d
    :try_start_8
    new-instance p0, Lgw;

    .line 304
    .line 305
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 306
    .line 307
    .line 308
    throw p0

    .line 309
    :cond_e
    new-instance p0, Ljava/lang/InterruptedException;

    .line 310
    .line 311
    invoke-direct {p0}, Ljava/lang/InterruptedException;-><init>()V

    .line 312
    .line 313
    .line 314
    throw p0

    .line 315
    :cond_f
    new-instance p0, Ljava/lang/InterruptedException;

    .line 316
    .line 317
    invoke-direct {p0}, Ljava/lang/InterruptedException;-><init>()V

    .line 318
    .line 319
    .line 320
    throw p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 321
    :goto_4
    monitor-exit v1

    .line 322
    throw p0
.end method

.method public final prepareFocusInput(Ljava/lang/String;)Li90;
    .locals 7

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance p0, Lg90;

    .line 16
    .line 17
    const-string p1, "\u5f53\u524d\u6ca1\u6709\u672c\u4efb\u52a1\u5df2\u8fd4\u56de\u4e14\u53ef\u6838\u5bf9\u7684\u7126\u70b9\u8f93\u5165\u6846\uff0c\u6216\u7cfb\u7edf\u4e0d\u652f\u6301\u539f\u7126\u70b9\u8fde\u63a5\uff1b\u8bf7\u5148\u7531\u7528\u6237\u805a\u7126\u540e\u91cd\u65b0\u8bfb\u5c4f\u3002"

    .line 18
    .line 19
    invoke-direct {p0, p1}, Lg90;-><init>(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    iget-object v0, p0, La31;->r:Ljava/lang/Object;

    .line 24
    .line 25
    monitor-enter v0

    .line 26
    :try_start_0
    iget-object v1, p0, La31;->s:Li50;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    const/4 v3, 0x1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    iget-object v4, v1, Li50;->f:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v4, Ly21;

    .line 35
    .line 36
    iget-object v4, v4, Ly21;->a:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, v1, Li50;->i:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast p1, Lb20;

    .line 47
    .line 48
    iget-object p1, p1, Lb20;->U:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcl1;

    .line 57
    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    iget-boolean p1, p1, Lcl1;->b:Z

    .line 61
    .line 62
    if-ne p1, v3, :cond_1

    .line 63
    .line 64
    iput-object v2, p0, La31;->s:Li50;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    goto/16 :goto_9

    .line 69
    .line 70
    :cond_1
    move-object v1, v2

    .line 71
    :goto_0
    monitor-exit v0

    .line 72
    if-nez v1, :cond_2

    .line 73
    .line 74
    new-instance p0, Lg90;

    .line 75
    .line 76
    const-string p1, "\u5f53\u524d\u6ca1\u6709\u672c\u4efb\u52a1\u5df2\u8fd4\u56de\u4e14\u53ef\u6838\u5bf9\u7684\u7126\u70b9\u8f93\u5165\u6846\uff0c\u6216\u7cfb\u7edf\u4e0d\u652f\u6301\u539f\u7126\u70b9\u8fde\u63a5\uff1b\u8bf7\u5148\u7531\u7528\u6237\u805a\u7126\u540e\u91cd\u65b0\u8bfb\u5c4f\u3002"

    .line 77
    .line 78
    invoke-direct {p0, p1}, Lg90;-><init>(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_2
    const/4 p1, 0x0

    .line 83
    :try_start_1
    iget-object v0, p0, La31;->o:Ljava/lang/Object;

    .line 84
    .line 85
    monitor-enter v0
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 86
    :try_start_2
    invoke-virtual {p0, v1}, La31;->l(Li50;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-eqz v2, :cond_a

    .line 91
    .line 92
    invoke-virtual {p0}, La31;->availability()Lsb;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    iget-boolean v2, v2, Lsb;->a:Z

    .line 97
    .line 98
    if-nez v2, :cond_3

    .line 99
    .line 100
    goto/16 :goto_4

    .line 101
    .line 102
    :cond_3
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 103
    .line 104
    const/16 v4, 0x21

    .line 105
    .line 106
    if-lt v2, v4, :cond_7

    .line 107
    .line 108
    new-instance v2, Ljava/util/concurrent/FutureTask;

    .line 109
    .line 110
    new-instance v4, Luc;

    .line 111
    .line 112
    invoke-direct {v4, v3, p0}, Luc;-><init>(ILjava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-direct {v2, v4}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 116
    .line 117
    .line 118
    iget-object v4, p0, La31;->u:Landroid/os/Handler;

    .line 119
    .line 120
    invoke-virtual {v4, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 121
    .line 122
    .line 123
    move-result v4

    .line 124
    if-nez v4, :cond_4

    .line 125
    .line 126
    new-instance p0, Lg90;

    .line 127
    .line 128
    const-string v2, "\u5f53\u524d\u6ca1\u6709\u672c\u4efb\u52a1\u5df2\u8fd4\u56de\u4e14\u53ef\u6838\u5bf9\u7684\u7126\u70b9\u8f93\u5165\u6846\uff0c\u6216\u7cfb\u7edf\u4e0d\u652f\u6301\u539f\u7126\u70b9\u8fde\u63a5\uff1b\u8bf7\u5148\u7531\u7528\u6237\u805a\u7126\u540e\u91cd\u65b0\u8bfb\u5c4f\u3002"

    .line 129
    .line 130
    invoke-direct {p0, v2}, Lg90;-><init>(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 131
    .line 132
    .line 133
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 134
    iget-object p1, v1, Li50;->h:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 137
    .line 138
    invoke-static {p1}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 139
    .line 140
    .line 141
    return-object p0

    .line 142
    :catchall_1
    move-exception p0

    .line 143
    move v3, p1

    .line 144
    goto/16 :goto_8

    .line 145
    .line 146
    :catch_0
    move v3, p1

    .line 147
    goto/16 :goto_6

    .line 148
    .line 149
    :catch_1
    move v3, p1

    .line 150
    goto/16 :goto_7

    .line 151
    .line 152
    :catchall_2
    move-exception p0

    .line 153
    move v3, p1

    .line 154
    goto/16 :goto_5

    .line 155
    .line 156
    :cond_4
    :try_start_4
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 157
    .line 158
    const-wide/16 v5, 0x7d0

    .line 159
    .line 160
    invoke-virtual {v2, v5, v6, v4}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    check-cast v4, Lvi0;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    .line 165
    .line 166
    :try_start_5
    invoke-virtual {v2, p1}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    .line 167
    .line 168
    .line 169
    if-eqz v4, :cond_7

    .line 170
    .line 171
    invoke-virtual {v4}, Lvi0;->a()Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-eqz v2, :cond_6

    .line 176
    .line 177
    invoke-virtual {p0, v1, v4}, La31;->P(Li50;Lvi0;)Z

    .line 178
    .line 179
    .line 180
    move-result v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 181
    if-nez v2, :cond_5

    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_5
    :try_start_6
    new-instance p1, Lh90;

    .line 185
    .line 186
    new-instance v2, Lw21;

    .line 187
    .line 188
    invoke-direct {v2, p0, v1, v4}, Lw21;-><init>(La31;Li50;Lvi0;)V

    .line 189
    .line 190
    .line 191
    invoke-direct {p1, v2}, Lh90;-><init>(Ljava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 192
    .line 193
    .line 194
    :goto_1
    :try_start_7
    monitor-exit v0
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 195
    return-object p1

    .line 196
    :catchall_3
    move-exception p0

    .line 197
    goto/16 :goto_8

    .line 198
    .line 199
    :catchall_4
    move-exception p0

    .line 200
    goto :goto_5

    .line 201
    :cond_6
    :goto_2
    :try_start_8
    new-instance p0, Lg90;

    .line 202
    .line 203
    const-string v2, "\u539f\u7126\u70b9\u3001\u9009\u533a\u6216\u4efb\u52a1\u72b6\u6001\u5df2\u53d8\u5316\uff0c\u672a\u63d0\u4ea4\u8f93\u5165\uff1b\u8bf7\u91cd\u65b0\u8bfb\u5c4f\uff0c\u4e0d\u4f1a\u81ea\u52a8\u6539\u9776\u3002"

    .line 204
    .line 205
    invoke-direct {p0, v2}, Lg90;-><init>(Ljava/lang/Object;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 206
    .line 207
    .line 208
    :try_start_9
    monitor-exit v0
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 209
    iget-object p1, v1, Li50;->h:Ljava/lang/Object;

    .line 210
    .line 211
    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 212
    .line 213
    invoke-static {p1}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 214
    .line 215
    .line 216
    return-object p0

    .line 217
    :catchall_5
    move-exception p0

    .line 218
    :try_start_a
    invoke-virtual {v2, p1}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    .line 219
    .line 220
    .line 221
    throw p0

    .line 222
    :cond_7
    const-wide/16 v4, 0x0

    .line 223
    .line 224
    const/4 v2, 0x3

    .line 225
    invoke-static {p0, v4, v5, p1, v2}, La31;->h(La31;JZI)Lso;

    .line 226
    .line 227
    .line 228
    move-result-object v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 229
    :try_start_b
    invoke-virtual {p0, v2, v1, v3}, La31;->n(Lso;Li50;Z)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 230
    .line 231
    .line 232
    move-result-object v4

    .line 233
    if-nez v4, :cond_8

    .line 234
    .line 235
    new-instance p0, Lg90;

    .line 236
    .line 237
    const-string v3, "\u539f\u7126\u70b9\u3001\u9009\u533a\u6216\u4efb\u52a1\u72b6\u6001\u5df2\u53d8\u5316\uff0c\u672a\u63d0\u4ea4\u8f93\u5165\uff1b\u8bf7\u91cd\u65b0\u8bfb\u5c4f\uff0c\u4e0d\u4f1a\u81ea\u52a8\u6539\u9776\u3002"

    .line 238
    .line 239
    invoke-direct {p0, v3}, Lg90;-><init>(Ljava/lang/Object;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 240
    .line 241
    .line 242
    :try_start_c
    invoke-virtual {v2}, Lso;->b()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 243
    .line 244
    .line 245
    :try_start_d
    monitor-exit v0
    :try_end_d
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_d} :catch_1
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 246
    iget-object p1, v1, Li50;->h:Ljava/lang/Object;

    .line 247
    .line 248
    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 249
    .line 250
    invoke-static {p1}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 251
    .line 252
    .line 253
    return-object p0

    .line 254
    :catchall_6
    move-exception p0

    .line 255
    goto :goto_3

    .line 256
    :cond_8
    :try_start_e
    invoke-static {v4}, La31;->x(Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    .line 257
    .line 258
    .line 259
    move-result v4

    .line 260
    if-nez v4, :cond_9

    .line 261
    .line 262
    new-instance p0, Lg90;

    .line 263
    .line 264
    const-string v3, "\u5f53\u524d\u6ca1\u6709\u672c\u4efb\u52a1\u5df2\u8fd4\u56de\u4e14\u53ef\u6838\u5bf9\u7684\u7126\u70b9\u8f93\u5165\u6846\uff0c\u6216\u7cfb\u7edf\u4e0d\u652f\u6301\u539f\u7126\u70b9\u8fde\u63a5\uff1b\u8bf7\u5148\u7531\u7528\u6237\u805a\u7126\u540e\u91cd\u65b0\u8bfb\u5c4f\u3002"

    .line 265
    .line 266
    invoke-direct {p0, v3}, Lg90;-><init>(Ljava/lang/Object;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    .line 267
    .line 268
    .line 269
    :try_start_f
    invoke-virtual {v2}, Lso;->b()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .line 270
    .line 271
    .line 272
    :try_start_10
    monitor-exit v0
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_10 .. :try_end_10} :catch_1
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_0
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    .line 273
    iget-object p1, v1, Li50;->h:Ljava/lang/Object;

    .line 274
    .line 275
    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 276
    .line 277
    invoke-static {p1}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 278
    .line 279
    .line 280
    return-object p0

    .line 281
    :cond_9
    :try_start_11
    invoke-virtual {v2}, Lso;->b()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    .line 282
    .line 283
    .line 284
    :try_start_12
    new-instance p1, Lh90;

    .line 285
    .line 286
    new-instance v2, Lu21;

    .line 287
    .line 288
    invoke-direct {v2, p0, v1}, Lu21;-><init>(La31;Li50;)V

    .line 289
    .line 290
    .line 291
    invoke-direct {p1, v2}, Lh90;-><init>(Ljava/lang/Object;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_4

    .line 292
    .line 293
    .line 294
    goto :goto_1

    .line 295
    :goto_3
    :try_start_13
    invoke-virtual {v2}, Lso;->b()V

    .line 296
    .line 297
    .line 298
    throw p0

    .line 299
    :cond_a
    :goto_4
    new-instance p0, Lg90;

    .line 300
    .line 301
    const-string v2, "\u539f\u7126\u70b9\u3001\u9009\u533a\u6216\u4efb\u52a1\u72b6\u6001\u5df2\u53d8\u5316\uff0c\u672a\u63d0\u4ea4\u8f93\u5165\uff1b\u8bf7\u91cd\u65b0\u8bfb\u5c4f\uff0c\u4e0d\u4f1a\u81ea\u52a8\u6539\u9776\u3002"

    .line 302
    .line 303
    invoke-direct {p0, v2}, Lg90;-><init>(Ljava/lang/Object;)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_2

    .line 304
    .line 305
    .line 306
    :try_start_14
    monitor-exit v0
    :try_end_14
    .catch Ljava/lang/InterruptedException; {:try_start_14 .. :try_end_14} :catch_1
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_0
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    .line 307
    iget-object p1, v1, Li50;->h:Ljava/lang/Object;

    .line 308
    .line 309
    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 310
    .line 311
    invoke-static {p1}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 312
    .line 313
    .line 314
    return-object p0

    .line 315
    :goto_5
    :try_start_15
    monitor-exit v0

    .line 316
    throw p0
    :try_end_15
    .catch Ljava/lang/InterruptedException; {:try_start_15 .. :try_end_15} :catch_3
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_2
    .catchall {:try_start_15 .. :try_end_15} :catchall_3

    .line 317
    :catch_2
    :goto_6
    :try_start_16
    new-instance p0, Lg90;

    .line 318
    .line 319
    const-string p1, "\u5f53\u524d\u6ca1\u6709\u672c\u4efb\u52a1\u5df2\u8fd4\u56de\u4e14\u53ef\u6838\u5bf9\u7684\u7126\u70b9\u8f93\u5165\u6846\uff0c\u6216\u7cfb\u7edf\u4e0d\u652f\u6301\u539f\u7126\u70b9\u8fde\u63a5\uff1b\u8bf7\u5148\u7531\u7528\u6237\u805a\u7126\u540e\u91cd\u65b0\u8bfb\u5c4f\u3002"

    .line 320
    .line 321
    invoke-direct {p0, p1}, Lg90;-><init>(Ljava/lang/Object;)V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_3

    .line 322
    .line 323
    .line 324
    if-nez v3, :cond_b

    .line 325
    .line 326
    iget-object p1, v1, Li50;->h:Ljava/lang/Object;

    .line 327
    .line 328
    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 329
    .line 330
    invoke-static {p1}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 331
    .line 332
    .line 333
    :cond_b
    return-object p0

    .line 334
    :catch_3
    :goto_7
    :try_start_17
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 339
    .line 340
    .line 341
    new-instance p0, Lg90;

    .line 342
    .line 343
    const-string p1, "\u539f\u7126\u70b9\u3001\u9009\u533a\u6216\u4efb\u52a1\u72b6\u6001\u5df2\u53d8\u5316\uff0c\u672a\u63d0\u4ea4\u8f93\u5165\uff1b\u8bf7\u91cd\u65b0\u8bfb\u5c4f\uff0c\u4e0d\u4f1a\u81ea\u52a8\u6539\u9776\u3002"

    .line 344
    .line 345
    invoke-direct {p0, p1}, Lg90;-><init>(Ljava/lang/Object;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_3

    .line 346
    .line 347
    .line 348
    if-nez v3, :cond_c

    .line 349
    .line 350
    iget-object p1, v1, Li50;->h:Ljava/lang/Object;

    .line 351
    .line 352
    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 353
    .line 354
    invoke-static {p1}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 355
    .line 356
    .line 357
    :cond_c
    return-object p0

    .line 358
    :goto_8
    if-nez v3, :cond_d

    .line 359
    .line 360
    iget-object p1, v1, Li50;->h:Ljava/lang/Object;

    .line 361
    .line 362
    check-cast p1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 363
    .line 364
    invoke-static {p1}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 365
    .line 366
    .line 367
    :cond_d
    throw p0

    .line 368
    :goto_9
    monitor-exit v0

    .line 369
    throw p0
.end method

.method public final r(Lyh1;J)Lv2;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 6
    .line 7
    iget-object v2, v2, Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;->m:Lfb0;

    .line 8
    .line 9
    iget-wide v2, v2, Lfb0;->b:J

    .line 10
    .line 11
    iget-object v4, v0, La31;->e:Lr3;

    .line 12
    .line 13
    iget-object v5, v1, Lyh1;->b:Lxh1;

    .line 14
    .line 15
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    iget-object v4, v4, Lr3;->m:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v4, Landroid/accessibilityservice/AccessibilityService;

    .line 24
    .line 25
    sget-object v6, Lp3;->b:[I

    .line 26
    .line 27
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    aget v5, v6, v5

    .line 32
    .line 33
    const/4 v6, 0x0

    .line 34
    const/4 v7, 0x4

    .line 35
    const/4 v8, 0x3

    .line 36
    const/4 v9, 0x2

    .line 37
    const/4 v10, 0x1

    .line 38
    if-eq v5, v10, :cond_3

    .line 39
    .line 40
    if-eq v5, v9, :cond_2

    .line 41
    .line 42
    if-eq v5, v8, :cond_1

    .line 43
    .line 44
    if-ne v5, v7, :cond_0

    .line 45
    .line 46
    move v5, v7

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-static {}, Ll;->r()V

    .line 49
    .line 50
    .line 51
    return-object v6

    .line 52
    :cond_1
    move v5, v8

    .line 53
    goto :goto_0

    .line 54
    :cond_2
    move v5, v9

    .line 55
    goto :goto_0

    .line 56
    :cond_3
    move v5, v10

    .line 57
    :goto_0
    invoke-virtual {v4, v5}, Landroid/accessibilityservice/AccessibilityService;->performGlobalAction(I)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-nez v4, :cond_4

    .line 62
    .line 63
    new-instance v11, Lv2;

    .line 64
    .line 65
    const/16 v16, 0x0

    .line 66
    .line 67
    const/16 v17, 0x7c

    .line 68
    .line 69
    const/4 v12, 0x0

    .line 70
    const-string v13, "\u7cfb\u7edf\u6ca1\u6709\u6267\u884c\u8fd9\u4e2a\u6309\u952e\u3002"

    .line 71
    .line 72
    const/4 v14, 0x0

    .line 73
    const/4 v15, 0x0

    .line 74
    invoke-direct/range {v11 .. v17}, Lv2;-><init>(ZLjava/lang/String;Lh22;Lr61;Ljava/lang/Boolean;I)V

    .line 75
    .line 76
    .line 77
    return-object v11

    .line 78
    :cond_4
    iget-object v1, v1, Lyh1;->b:Lxh1;

    .line 79
    .line 80
    sget-object v4, Lz21;->b:[I

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    aget v1, v4, v1

    .line 87
    .line 88
    if-eq v1, v10, :cond_8

    .line 89
    .line 90
    if-eq v1, v9, :cond_7

    .line 91
    .line 92
    if-eq v1, v8, :cond_6

    .line 93
    .line 94
    if-ne v1, v7, :cond_5

    .line 95
    .line 96
    const-string v1, "\u5df2\u63d0\u4ea4\u6253\u5f00\u901a\u77e5\u680f\u7684\u6309\u952e\u64cd\u4f5c\u3002"

    .line 97
    .line 98
    :goto_1
    move-object v6, v1

    .line 99
    move-wide v1, v2

    .line 100
    goto :goto_2

    .line 101
    :cond_5
    invoke-static {}, Ll;->r()V

    .line 102
    .line 103
    .line 104
    return-object v6

    .line 105
    :cond_6
    const-string v1, "\u5df2\u63d0\u4ea4\u6253\u5f00\u6700\u8fd1\u4efb\u52a1\u7684\u6309\u952e\u64cd\u4f5c\u3002"

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_7
    const-string v1, "\u5df2\u63d0\u4ea4\u56de\u5230\u684c\u9762\u7684\u6309\u952e\u64cd\u4f5c\u3002"

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_8
    const-string v1, "\u5df2\u63d0\u4ea4\u8fd4\u56de\u952e\u64cd\u4f5c\u3002"

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :goto_2
    iget-object v3, v0, La31;->p:Ly21;

    .line 115
    .line 116
    const/4 v9, 0x0

    .line 117
    const/16 v10, 0x1f0

    .line 118
    .line 119
    const/4 v7, 0x0

    .line 120
    const/4 v8, 0x0

    .line 121
    move-wide/from16 v4, p2

    .line 122
    .line 123
    invoke-static/range {v0 .. v10}, La31;->c(La31;JLy21;JLjava/lang/String;Luq0;ZLi41;I)Lv2;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    return-object v0
.end method

.method public final s(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, La31;->m:Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ljava/lang/String;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_1
    :try_start_0
    iget-object p0, p0, La31;->a:Lio/github/ccch1mneyyy/dsh_app/phone/a11y/PhoneA11yService;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p0, p1, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0, v1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    invoke-virtual {v0, p1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    return-object p0

    .line 38
    :catch_0
    :goto_0
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public final target(Ljava/lang/String;I)Lsg2;
    .locals 6

    .line 1
    iget-object v0, p0, La31;->o:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, La31;->p:Ly21;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-object v2

    .line 11
    :cond_0
    :try_start_1
    iget-object v3, v1, Ly21;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    if-nez v3, :cond_1

    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-object v2

    .line 21
    :cond_1
    :try_start_2
    iget-object v1, v1, Ly21;->b:Ldk0;

    .line 22
    .line 23
    invoke-virtual {v1, p2}, Ldk0;->a(I)Ll12;

    .line 24
    .line 25
    .line 26
    move-result-object p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 27
    if-nez p2, :cond_2

    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-object v2

    .line 31
    :cond_2
    :try_start_3
    invoke-virtual {p0}, La31;->availability()Lsb;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-boolean v1, v1, Lsb;->a:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 36
    .line 37
    if-nez v1, :cond_3

    .line 38
    .line 39
    monitor-exit v0

    .line 40
    return-object v2

    .line 41
    :cond_3
    const/4 v1, 0x0

    .line 42
    const/4 v3, 0x3

    .line 43
    const-wide/16 v4, 0x0

    .line 44
    .line 45
    :try_start_4
    invoke-static {p0, v4, v5, v1, v3}, La31;->h(La31;JZI)Lso;

    .line 46
    .line 47
    .line 48
    move-result-object v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 49
    :try_start_5
    invoke-static {v1, p2}, La31;->t(Lso;Ll12;)Lus0;

    .line 50
    .line 51
    .line 52
    move-result-object v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 53
    if-nez v3, :cond_4

    .line 54
    .line 55
    :try_start_6
    invoke-virtual {v1}, Lso;->b()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 56
    .line 57
    .line 58
    monitor-exit v0

    .line 59
    return-object v2

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_0

    .line 62
    :cond_4
    :try_start_7
    invoke-virtual {v1}, Lso;->b()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1, p2}, La31;->p(Ljava/lang/String;Ll12;)Lsg2;

    .line 66
    .line 67
    .line 68
    move-result-object p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 69
    monitor-exit v0

    .line 70
    return-object p0

    .line 71
    :catchall_1
    move-exception p0

    .line 72
    :try_start_8
    invoke-virtual {v1}, Lso;->b()V

    .line 73
    .line 74
    .line 75
    throw p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 76
    :goto_0
    monitor-exit v0

    .line 77
    throw p0
.end method

.method public final v()Lh22;
    .locals 5

    .line 1
    invoke-virtual {p0}, La31;->availability()Lsb;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lsb;->a:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    const/4 v4, 0x0

    .line 15
    :try_start_0
    invoke-static {p0, v2, v3, v4, v0}, La31;->h(La31;JZI)Lso;

    .line 16
    .line 17
    .line 18
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    :try_start_1
    invoke-virtual {p0, v0, v4}, La31;->y(Lso;Z)Ly21;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, La31;->L(Ly21;)Lh22;

    .line 24
    .line 25
    .line 26
    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    :try_start_2
    invoke-virtual {v0}, Lso;->b()V

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :catch_0
    move-exception p0

    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    invoke-virtual {v0}, Lso;->b()V

    .line 35
    .line 36
    .line 37
    throw p0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 38
    :goto_0
    const-string v0, "DshA11y"

    .line 39
    .line 40
    const-string v2, "observe failed"

    .line 41
    .line 42
    invoke-static {v0, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 43
    .line 44
    .line 45
    return-object v1

    .line 46
    :catch_1
    move-exception p0

    .line 47
    throw p0
.end method

.method public final visualScope(Ljava/lang/String;)Lgp2;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, La31;->B()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, La31;->q:Ly10;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ly10;->f(Ljava/lang/String;)Lfp2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public final w(Lso;Ly21;J)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p4}, La31;->f(J)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, La31;->availability()Lsb;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    iget-boolean p3, p3, Lsb;->a:Z

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    iget-object p3, p0, La31;->p:Ly21;

    .line 16
    .line 17
    if-ne p3, p2, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, La31;->q:Ly10;

    .line 20
    .line 21
    iget-object p3, p2, Ly21;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p3}, Ly10;->f(Ljava/lang/String;)Lfp2;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 30
    .line 31
    const/16 p3, 0x22

    .line 32
    .line 33
    if-lt p0, p3, :cond_0

    .line 34
    .line 35
    iget-object p0, p1, Lso;->a:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    const/4 p3, 0x1

    .line 42
    if-ne p0, p3, :cond_0

    .line 43
    .line 44
    iget-boolean p0, p1, Lso;->m:Z

    .line 45
    .line 46
    if-eqz p0, :cond_0

    .line 47
    .line 48
    iget-object p0, p1, Lso;->c:Ljava/lang/Boolean;

    .line 49
    .line 50
    sget-object p4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-static {p0, p4}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_0

    .line 57
    .line 58
    iget-boolean p0, p2, Ly21;->f:Z

    .line 59
    .line 60
    if-nez p0, :cond_0

    .line 61
    .line 62
    iget-boolean p0, p2, Ly21;->e:Z

    .line 63
    .line 64
    if-nez p0, :cond_0

    .line 65
    .line 66
    iget-boolean p0, p2, Ly21;->g:Z

    .line 67
    .line 68
    if-nez p0, :cond_0

    .line 69
    .line 70
    iget-boolean p0, p1, Lso;->h:Z

    .line 71
    .line 72
    if-nez p0, :cond_0

    .line 73
    .line 74
    iget-boolean p0, p1, Lso;->i:Z

    .line 75
    .line 76
    if-nez p0, :cond_0

    .line 77
    .line 78
    invoke-static {p1}, La31;->O(Lso;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-nez p0, :cond_0

    .line 83
    .line 84
    iget-object p0, p1, Lso;->a:Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-static {p0}, Lek4;->a(Ljava/util/List;)Ljava/util/ArrayList;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-eqz p0, :cond_0

    .line 95
    .line 96
    sget-object p0, Lmj1;->P:Lo61;

    .line 97
    .line 98
    sget-object p0, Lmj1;->S:Lmj1;

    .line 99
    .line 100
    if-eqz p0, :cond_0

    .line 101
    .line 102
    iget-object p0, p0, Lmj1;->c:Lok1;

    .line 103
    .line 104
    if-eqz p0, :cond_0

    .line 105
    .line 106
    iget-object p0, p0, Lok1;->a:Ljava/util/List;

    .line 107
    .line 108
    if-eqz p0, :cond_0

    .line 109
    .line 110
    iget-object p1, p2, Ly21;->c:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz p1, :cond_0

    .line 113
    .line 114
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-nez p0, :cond_0

    .line 119
    .line 120
    return p3

    .line 121
    :cond_0
    const/4 p0, 0x0

    .line 122
    return p0
.end method

.method public final y(Lso;Z)Ly21;
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v4, p1

    .line 4
    .line 5
    sget-object v1, Lel1;->MAIN:Lel1;

    .line 6
    .line 7
    invoke-virtual {v1}, Lel1;->b()C

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sget-object v2, La31;->w:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    new-instance v3, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v3, v4, Lso;->e:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v3}, La31;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-object v5, v4, Lso;->a:Ljava/util/ArrayList;

    .line 39
    .line 40
    new-instance v6, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    const/4 v9, 0x0

    .line 50
    :cond_0
    :goto_0
    if-ge v9, v7, :cond_1

    .line 51
    .line 52
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v10

    .line 56
    add-int/lit8 v9, v9, 0x1

    .line 57
    .line 58
    check-cast v10, Lck2;

    .line 59
    .line 60
    iget-object v10, v10, Lck2;->d:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v10, :cond_0

    .line 63
    .line 64
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    sget-object v5, Lmt1;->a:Ljava/util/Set;

    .line 69
    .line 70
    iget-object v5, v4, Lso;->a:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-static {v5}, Lzr;->x(Ljava/util/List;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    check-cast v5, Lck2;

    .line 77
    .line 78
    const/4 v9, 0x0

    .line 79
    if-eqz v5, :cond_2

    .line 80
    .line 81
    iget-object v5, v5, Lck2;->f:Lbk2;

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    move-object v5, v9

    .line 85
    :goto_1
    iget-object v7, v4, Lso;->d:Lqe;

    .line 86
    .line 87
    invoke-virtual {v7}, Lqe;->c()I

    .line 88
    .line 89
    .line 90
    move-result v7

    .line 91
    invoke-static {v5, v7}, Lmt1;->b(Lbk2;I)Ljava/util/ArrayList;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    invoke-static {v6, v5}, Lzr;->I(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/ArrayList;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-static {v3, v5}, Lmt1;->a(Ljava/lang/String;Ljava/util/List;)Z

    .line 100
    .line 101
    .line 102
    move-result v10

    .line 103
    iget-object v5, v0, La31;->p:Ly21;

    .line 104
    .line 105
    if-eqz v5, :cond_3

    .line 106
    .line 107
    iget-object v5, v5, Ly21;->c:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_3
    move-object v5, v9

    .line 111
    :goto_2
    invoke-static {v5, v3}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    if-eqz v5, :cond_4

    .line 116
    .line 117
    iget-object v5, v0, La31;->p:Ly21;

    .line 118
    .line 119
    if-eqz v5, :cond_4

    .line 120
    .line 121
    iget-object v5, v5, Ly21;->j:Ljava/util/Set;

    .line 122
    .line 123
    :goto_3
    move-object v11, v5

    .line 124
    goto :goto_4

    .line 125
    :cond_4
    sget-object v5, Lea0;->m:Lea0;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :goto_4
    new-instance v7, Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-static {}, La31;->o()Lhp1;

    .line 134
    .line 135
    .line 136
    move-result-object v12

    .line 137
    iget-boolean v5, v4, Lso;->f:Z

    .line 138
    .line 139
    if-eqz v5, :cond_5

    .line 140
    .line 141
    iget-boolean v5, v12, Lhp1;->c:Z

    .line 142
    .line 143
    if-nez v5, :cond_5

    .line 144
    .line 145
    const-string v5, "ownApp"

    .line 146
    .line 147
    const-string v6, "\u63d0\u793a\uff1a\u8fd9\u662f DSH \u81ea\u5df1\u7684\u754c\u9762\uff0cDSH \u4e0d\u64cd\u4f5c\u5b83\u3002"

    .line 148
    .line 149
    invoke-static {v11, v7, v5, v6}, La31;->A(Ljava/util/Set;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    :cond_5
    if-eqz v10, :cond_6

    .line 153
    .line 154
    iget-boolean v5, v12, Lhp1;->a:Z

    .line 155
    .line 156
    if-nez v5, :cond_6

    .line 157
    .line 158
    const-string v5, "protected"

    .line 159
    .line 160
    const-string v6, "\u63d0\u793a\uff1a\u8fd9\u662f\u7cfb\u7edf\u6743\u9650 / \u5b89\u5168\u76f8\u5173\u9875\u9762\uff0cDSH \u53ea\u770b\u4e0d\u64cd\u4f5c\uff1b\u9700\u8981\u7684\u8bdd\u7528 handoff \u4ea4\u7ed9\u7528\u6237\u3002"

    .line 161
    .line 162
    invoke-static {v11, v7, v5, v6}, La31;->A(Ljava/util/Set;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_6
    iget-boolean v5, v4, Lso;->h:Z

    .line 166
    .line 167
    if-eqz v5, :cond_7

    .line 168
    .line 169
    const-string v5, "truncated"

    .line 170
    .line 171
    const-string v6, "\u63d0\u793a\uff1a\u9875\u9762\u5143\u7d20\u592a\u591a\uff0c\u53ea\u8bfb\u4e86\u4e00\u90e8\u5206\u3002"

    .line 172
    .line 173
    invoke-static {v11, v7, v5, v6}, La31;->A(Ljava/util/Set;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :cond_7
    iget-boolean v5, v4, Lso;->i:Z

    .line 177
    .line 178
    if-eqz v5, :cond_8

    .line 179
    .line 180
    const-string v5, "partial"

    .line 181
    .line 182
    const-string v6, "\u63d0\u793a\uff1a\u90e8\u5206\u7a97\u53e3\u6216\u5143\u7d20\u8bfb\u4e0d\u5230\uff0c\u5f53\u524d\u89c2\u6d4b\u4e0d\u5b8c\u6574\u3002"

    .line 183
    .line 184
    invoke-static {v11, v7, v5, v6}, La31;->A(Ljava/util/Set;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    :cond_8
    iget-object v5, v4, Lso;->j:Ljava/lang/String;

    .line 188
    .line 189
    if-eqz v5, :cond_b

    .line 190
    .line 191
    invoke-static {v5}, Lhd2;->x(Ljava/lang/CharSequence;)Z

    .line 192
    .line 193
    .line 194
    move-result v6

    .line 195
    if-nez v6, :cond_9

    .line 196
    .line 197
    goto :goto_5

    .line 198
    :cond_9
    move-object v5, v9

    .line 199
    :goto_5
    if-eqz v5, :cond_a

    .line 200
    .line 201
    const-string v6, "\u300c"

    .line 202
    .line 203
    const-string v13, "\u300d"

    .line 204
    .line 205
    invoke-static {v6, v5, v13}, Lmo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    goto :goto_6

    .line 210
    :cond_a
    const-string v5, ""

    .line 211
    .line 212
    :goto_6
    const-string v6, "hidden"

    .line 213
    .line 214
    const-string v13, "\u63d0\u793a\uff1a\u5f53\u524d\u65e0\u6cd5\u8bfb\u53d6\u524d\u53f0\u9875\u9762"

    .line 215
    .line 216
    const-string v14, "\uff08\u53ef\u80fd\u53d7\u654f\u611f\u89c6\u56fe\u7b56\u7565\u9650\u5236\uff09\u3002\u4f46\u53ef\u4ee5\u6309\u622a\u56fe\u5750\u6807\u76f4\u63a5\u70b9\u51fb\u3002"

    .line 217
    .line 218
    invoke-static {v13, v5, v14}, Lmo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v5

    .line 222
    invoke-static {v11, v7, v6, v5}, La31;->A(Ljava/util/Set;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    goto :goto_9

    .line 226
    :cond_b
    iget-object v5, v4, Lso;->k:Ljava/lang/String;

    .line 227
    .line 228
    if-eqz v5, :cond_e

    .line 229
    .line 230
    invoke-static {v5}, Lhd2;->x(Ljava/lang/CharSequence;)Z

    .line 231
    .line 232
    .line 233
    move-result v6

    .line 234
    if-nez v6, :cond_c

    .line 235
    .line 236
    goto :goto_7

    .line 237
    :cond_c
    move-object v5, v9

    .line 238
    :goto_7
    if-eqz v5, :cond_d

    .line 239
    .line 240
    const-string v6, "\u300c"

    .line 241
    .line 242
    const-string v13, "\u300d"

    .line 243
    .line 244
    invoke-static {v6, v5, v13}, Lmo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v5

    .line 248
    goto :goto_8

    .line 249
    :cond_d
    const-string v5, ""

    .line 250
    .line 251
    :goto_8
    const-string v6, "unreadable"

    .line 252
    .line 253
    const-string v13, "\u63d0\u793a\uff1a\u5f53\u524d\u65e0\u6cd5\u8bfb\u53d6\u8fd9\u4e00\u5c4f"

    .line 254
    .line 255
    const-string v14, "\u7684\u6709\u6548\u5185\u5bb9\uff0c\u53ef\u80fd\u53d7\u654f\u611f\u89c6\u56fe\u7b56\u7565\u9650\u5236\uff08Android 14 \u8d77\u5bc6\u7801\u3001\u652f\u4ed8\u3001\u9a8c\u8bc1\u9875\u4f1a\u88ab\u7cfb\u7edf\u8fc7\u6ee4\uff09\u3002\u53ef\u76f4\u63a5\u6309\u622a\u56fe\u5750\u6807\u70b9\u51fb\uff1b\u4e5f\u53ef\u4ee5 screen \u52a0 image \u67e5\u770b\u7ec6\u8282\u3002"

    .line 256
    .line 257
    invoke-static {v13, v5, v14}, Lmo0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v5

    .line 261
    invoke-static {v11, v7, v6, v5}, La31;->A(Ljava/util/Set;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    goto :goto_9

    .line 265
    :cond_e
    iget-object v5, v4, Lso;->a:Ljava/util/ArrayList;

    .line 266
    .line 267
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 268
    .line 269
    .line 270
    move-result v5

    .line 271
    if-eqz v5, :cond_f

    .line 272
    .line 273
    const-string v5, "empty"

    .line 274
    .line 275
    const-string v6, "\u63d0\u793a\uff1a\u8bfb\u4e0d\u5230\u524d\u53f0\u754c\u9762\uff08\u53ef\u80fd\u662f\u9501\u5c4f\u3001\u5b89\u5168\u9875\u9762\u6216\u7cfb\u7edf\u754c\u9762\uff09\u3002"

    .line 276
    .line 277
    invoke-static {v11, v7, v5, v6}, La31;->A(Ljava/util/Set;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    :cond_f
    :goto_9
    iget-object v5, v0, La31;->p:Ly21;

    .line 281
    .line 282
    if-eqz v5, :cond_11

    .line 283
    .line 284
    iget-object v6, v5, Ly21;->c:Ljava/lang/String;

    .line 285
    .line 286
    invoke-static {v6, v3}, Lyt0;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    move-result v6

    .line 290
    if-eqz v6, :cond_10

    .line 291
    .line 292
    goto :goto_a

    .line 293
    :cond_10
    move-object v5, v9

    .line 294
    :goto_a
    if-eqz v5, :cond_11

    .line 295
    .line 296
    iget-object v5, v5, Ly21;->b:Ldk0;

    .line 297
    .line 298
    iget-object v5, v5, Ldk0;->d:Ljava/lang/Object;

    .line 299
    .line 300
    check-cast v5, Ljava/util/Set;

    .line 301
    .line 302
    move-object v6, v5

    .line 303
    :goto_b
    move/from16 v5, p2

    .line 304
    .line 305
    goto :goto_c

    .line 306
    :cond_11
    move-object v6, v9

    .line 307
    goto :goto_b

    .line 308
    :goto_c
    invoke-static/range {v1 .. v7}, La31;->z(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lso;ZLjava/util/Set;Ljava/util/ArrayList;)Ldk0;

    .line 309
    .line 310
    .line 311
    move-result-object v13

    .line 312
    new-instance v4, Ljava/util/ArrayList;

    .line 313
    .line 314
    invoke-static {v7}, Lbs;->k(Ljava/lang/Iterable;)I

    .line 315
    .line 316
    .line 317
    move-result v5

    .line 318
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 322
    .line 323
    .line 324
    move-result v5

    .line 325
    const/4 v14, 0x0

    .line 326
    :goto_d
    if-ge v14, v5, :cond_12

    .line 327
    .line 328
    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v15

    .line 332
    add-int/lit8 v14, v14, 0x1

    .line 333
    .line 334
    check-cast v15, Lue1;

    .line 335
    .line 336
    iget-object v15, v15, Lue1;->m:Ljava/lang/Object;

    .line 337
    .line 338
    check-cast v15, Ljava/lang/String;

    .line 339
    .line 340
    invoke-virtual {v4, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    goto :goto_d

    .line 344
    :cond_12
    invoke-static {v4}, Lzr;->X(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 345
    .line 346
    .line 347
    move-result-object v4

    .line 348
    iget-boolean v5, v12, Lhp1;->b:Z

    .line 349
    .line 350
    if-eqz v5, :cond_16

    .line 351
    .line 352
    const-string v5, "secretFields"

    .line 353
    .line 354
    invoke-interface {v11, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move-result v5

    .line 358
    if-nez v5, :cond_16

    .line 359
    .line 360
    iget-object v5, v13, Ldk0;->a:Ljava/lang/Object;

    .line 361
    .line 362
    check-cast v5, Ljava/util/ArrayList;

    .line 363
    .line 364
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 365
    .line 366
    .line 367
    move-result v11

    .line 368
    if-eqz v11, :cond_13

    .line 369
    .line 370
    goto :goto_f

    .line 371
    :cond_13
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 372
    .line 373
    .line 374
    move-result v11

    .line 375
    const/4 v12, 0x0

    .line 376
    :cond_14
    if-ge v12, v11, :cond_16

    .line 377
    .line 378
    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object v14

    .line 382
    add-int/lit8 v12, v12, 0x1

    .line 383
    .line 384
    check-cast v14, Ll12;

    .line 385
    .line 386
    iget-boolean v15, v14, Ll12;->j:Z

    .line 387
    .line 388
    if-nez v15, :cond_15

    .line 389
    .line 390
    iget-boolean v14, v14, Ll12;->k:Z

    .line 391
    .line 392
    if-eqz v14, :cond_14

    .line 393
    .line 394
    :cond_15
    const-string v5, "secretFields"

    .line 395
    .line 396
    const-string v11, "\u63d0\u793a\uff1a\u7528\u6237\u5df2\u5141\u8bb8 DSH \u586b\u5199\u5bc6\u7801\u548c\u9a8c\u8bc1\u7801\uff0c\u6807\u7740\u300c\u4e0d\u53ef\u4ee3\u586b\u300d\u7684\u8f93\u5165\u6846\u4e5f\u53ef\u4ee5\u8f93\u5165\u3002"

    .line 397
    .line 398
    new-instance v12, Lue1;

    .line 399
    .line 400
    invoke-direct {v12, v5, v11}, Lue1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 401
    .line 402
    .line 403
    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 404
    .line 405
    .line 406
    const-string v5, "secretFields"

    .line 407
    .line 408
    invoke-static {v4, v5}, Le52;->c(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/LinkedHashSet;

    .line 409
    .line 410
    .line 411
    move-result-object v11

    .line 412
    move-object/from16 v4, p1

    .line 413
    .line 414
    move/from16 v5, p2

    .line 415
    .line 416
    invoke-static/range {v1 .. v7}, La31;->z(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lso;ZLjava/util/Set;Ljava/util/ArrayList;)Ldk0;

    .line 417
    .line 418
    .line 419
    move-result-object v13

    .line 420
    move-object v5, v1

    .line 421
    move-object v1, v4

    .line 422
    move-object v14, v11

    .line 423
    :goto_e
    move-object v4, v9

    .line 424
    move v9, v10

    .line 425
    move-object v6, v13

    .line 426
    goto :goto_10

    .line 427
    :cond_16
    :goto_f
    move-object v5, v1

    .line 428
    move-object/from16 v1, p1

    .line 429
    .line 430
    move-object v14, v4

    .line 431
    goto :goto_e

    .line 432
    :goto_10
    iget-boolean v10, v1, Lso;->f:Z

    .line 433
    .line 434
    iget-object v7, v1, Lso;->j:Ljava/lang/String;

    .line 435
    .line 436
    const/4 v11, 0x1

    .line 437
    if-eqz v7, :cond_17

    .line 438
    .line 439
    move v7, v11

    .line 440
    goto :goto_11

    .line 441
    :cond_17
    move v7, v11

    .line 442
    const/4 v11, 0x0

    .line 443
    :goto_11
    iget-object v12, v1, Lso;->k:Ljava/lang/String;

    .line 444
    .line 445
    if-eqz v12, :cond_18

    .line 446
    .line 447
    move v12, v7

    .line 448
    goto :goto_12

    .line 449
    :cond_18
    const/4 v12, 0x0

    .line 450
    :goto_12
    invoke-static {v1}, La31;->u(Lso;)Lc12;

    .line 451
    .line 452
    .line 453
    move-result-object v13

    .line 454
    iget-object v15, v1, Lso;->a:Ljava/util/ArrayList;

    .line 455
    .line 456
    invoke-static {v15}, Lzr;->L(Ljava/util/List;)Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v15

    .line 460
    check-cast v15, Lck2;

    .line 461
    .line 462
    if-eqz v15, :cond_19

    .line 463
    .line 464
    new-instance v4, Lkr0;

    .line 465
    .line 466
    iget-object v7, v1, Lso;->d:Lqe;

    .line 467
    .line 468
    iget-boolean v8, v1, Lso;->m:Z

    .line 469
    .line 470
    move-object/from16 v17, v2

    .line 471
    .line 472
    iget-object v2, v1, Lso;->n:Ljava/util/List;

    .line 473
    .line 474
    invoke-direct {v4, v15, v7, v8, v2}, Lkr0;-><init>(Lck2;Lqe;ZLjava/util/List;)V

    .line 475
    .line 476
    .line 477
    move-object v15, v4

    .line 478
    goto :goto_13

    .line 479
    :cond_19
    move-object/from16 v17, v2

    .line 480
    .line 481
    const/4 v15, 0x0

    .line 482
    :goto_13
    iget-object v2, v1, Lso;->a:Ljava/util/ArrayList;

    .line 483
    .line 484
    new-instance v4, Ljava/util/ArrayList;

    .line 485
    .line 486
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 487
    .line 488
    .line 489
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 490
    .line 491
    .line 492
    move-result v7

    .line 493
    const/4 v8, 0x0

    .line 494
    :goto_14
    if-ge v8, v7, :cond_1b

    .line 495
    .line 496
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 497
    .line 498
    .line 499
    move-result-object v18

    .line 500
    add-int/lit8 v8, v8, 0x1

    .line 501
    .line 502
    move-object/from16 v19, v2

    .line 503
    .line 504
    move-object/from16 v2, v18

    .line 505
    .line 506
    check-cast v2, Lck2;

    .line 507
    .line 508
    iget-object v2, v2, Lck2;->c:Ljava/lang/String;

    .line 509
    .line 510
    if-eqz v2, :cond_1a

    .line 511
    .line 512
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 513
    .line 514
    .line 515
    :cond_1a
    move-object/from16 v2, v19

    .line 516
    .line 517
    goto :goto_14

    .line 518
    :cond_1b
    invoke-static {v4}, Lzr;->X(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 519
    .line 520
    .line 521
    move-result-object v2

    .line 522
    new-instance v4, Ly21;

    .line 523
    .line 524
    move-object/from16 v16, v2

    .line 525
    .line 526
    move-object v7, v3

    .line 527
    move-object/from16 v8, v17

    .line 528
    .line 529
    const/4 v2, 0x0

    .line 530
    const/4 v3, 0x1

    .line 531
    invoke-direct/range {v4 .. v16}, Ly21;-><init>(Ljava/lang/String;Ldk0;Ljava/lang/String;Ljava/lang/String;ZZZZLc12;Ljava/util/Set;Lkr0;Ljava/util/Set;)V

    .line 532
    .line 533
    .line 534
    iput-object v4, v0, La31;->p:Ly21;

    .line 535
    .line 536
    invoke-virtual {v0}, La31;->j()V

    .line 537
    .line 538
    .line 539
    if-nez v11, :cond_26

    .line 540
    .line 541
    if-nez v12, :cond_26

    .line 542
    .line 543
    iget-boolean v7, v1, Lso;->i:Z

    .line 544
    .line 545
    if-nez v7, :cond_26

    .line 546
    .line 547
    iget-boolean v7, v1, Lso;->h:Z

    .line 548
    .line 549
    if-nez v7, :cond_26

    .line 550
    .line 551
    invoke-static {v1}, La31;->O(Lso;)Z

    .line 552
    .line 553
    .line 554
    move-result v7

    .line 555
    if-nez v7, :cond_26

    .line 556
    .line 557
    invoke-virtual {v0}, La31;->B()Z

    .line 558
    .line 559
    .line 560
    move-result v7

    .line 561
    if-nez v7, :cond_1c

    .line 562
    .line 563
    goto/16 :goto_1a

    .line 564
    .line 565
    :cond_1c
    iget-wide v7, v0, La31;->t:J

    .line 566
    .line 567
    iget-wide v9, v0, La31;->v:J

    .line 568
    .line 569
    :try_start_0
    iget-object v6, v6, Ldk0;->a:Ljava/lang/Object;

    .line 570
    .line 571
    check-cast v6, Ljava/util/ArrayList;

    .line 572
    .line 573
    new-instance v11, Ljava/util/ArrayList;

    .line 574
    .line 575
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 576
    .line 577
    .line 578
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 579
    .line 580
    .line 581
    move-result v12

    .line 582
    const/4 v13, 0x0

    .line 583
    :goto_15
    if-ge v13, v12, :cond_1f

    .line 584
    .line 585
    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 586
    .line 587
    .line 588
    move-result-object v14

    .line 589
    add-int/lit8 v13, v13, 0x1

    .line 590
    .line 591
    move-object v15, v14

    .line 592
    check-cast v15, Ll12;

    .line 593
    .line 594
    iget-object v2, v15, Ll12;->e:Lj90;

    .line 595
    .line 596
    sget-object v3, Lj90;->INPUT:Lj90;

    .line 597
    .line 598
    if-ne v2, v3, :cond_1e

    .line 599
    .line 600
    iget v2, v15, Ll12;->d:I

    .line 601
    .line 602
    invoke-virtual {v1, v2}, Lso;->a(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 603
    .line 604
    .line 605
    move-result-object v2

    .line 606
    if-eqz v2, :cond_1e

    .line 607
    .line 608
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityNodeInfo;->isFocused()Z

    .line 609
    .line 610
    .line 611
    move-result v2

    .line 612
    const/4 v3, 0x1

    .line 613
    if-ne v2, v3, :cond_1d

    .line 614
    .line 615
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 616
    .line 617
    .line 618
    :cond_1d
    :goto_16
    const/4 v2, 0x0

    .line 619
    goto :goto_15

    .line 620
    :cond_1e
    const/4 v3, 0x1

    .line 621
    goto :goto_16

    .line 622
    :cond_1f
    invoke-static {v11}, Lzr;->L(Ljava/util/List;)Ljava/lang/Object;

    .line 623
    .line 624
    .line 625
    move-result-object v2

    .line 626
    check-cast v2, Ll12;

    .line 627
    .line 628
    if-nez v2, :cond_20

    .line 629
    .line 630
    goto/16 :goto_1a

    .line 631
    .line 632
    :cond_20
    iget v6, v2, Ll12;->d:I

    .line 633
    .line 634
    invoke-virtual {v1, v6}, Lso;->a(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 635
    .line 636
    .line 637
    move-result-object v6

    .line 638
    if-nez v6, :cond_21

    .line 639
    .line 640
    goto/16 :goto_1a

    .line 641
    .line 642
    :cond_21
    invoke-static {v1, v2, v6}, La31;->m(Lso;Ll12;Landroid/view/accessibility/AccessibilityNodeInfo;)Z

    .line 643
    .line 644
    .line 645
    move-result v1

    .line 646
    if-eqz v1, :cond_26

    .line 647
    .line 648
    iget-boolean v1, v2, Ll12;->j:Z

    .line 649
    .line 650
    if-nez v1, :cond_26

    .line 651
    .line 652
    iget-boolean v1, v2, Ll12;->k:Z

    .line 653
    .line 654
    if-eqz v1, :cond_22

    .line 655
    .line 656
    goto/16 :goto_1a

    .line 657
    .line 658
    :cond_22
    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getTextSelectionStart()I

    .line 659
    .line 660
    .line 661
    move-result v27

    .line 662
    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getTextSelectionEnd()I

    .line 663
    .line 664
    .line 665
    move-result v28

    .line 666
    if-ltz v27, :cond_26

    .line 667
    .line 668
    if-ltz v28, :cond_26

    .line 669
    .line 670
    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getInputType()I

    .line 671
    .line 672
    .line 673
    move-result v1

    .line 674
    if-nez v1, :cond_23

    .line 675
    .line 676
    goto :goto_1a

    .line 677
    :cond_23
    new-instance v18, Li50;

    .line 678
    .line 679
    invoke-static {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->obtain(Landroid/view/accessibility/AccessibilityNodeInfo;)Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 680
    .line 681
    .line 682
    move-result-object v21

    .line 683
    invoke-virtual/range {v21 .. v21}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 684
    .line 685
    .line 686
    new-instance v1, Lb20;

    .line 687
    .line 688
    const/16 v11, 0xe

    .line 689
    .line 690
    invoke-direct {v1, v11}, Lb20;-><init>(I)V

    .line 691
    .line 692
    .line 693
    invoke-virtual {v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getInputType()I

    .line 694
    .line 695
    .line 696
    move-result v29
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 697
    move-object/from16 v22, v1

    .line 698
    .line 699
    move-object/from16 v20, v2

    .line 700
    .line 701
    move-object/from16 v19, v4

    .line 702
    .line 703
    move-wide/from16 v23, v7

    .line 704
    .line 705
    move-wide/from16 v25, v9

    .line 706
    .line 707
    :try_start_1
    invoke-direct/range {v18 .. v29}, Li50;-><init>(Ly21;Ll12;Landroid/view/accessibility/AccessibilityNodeInfo;Lb20;JJIII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 708
    .line 709
    .line 710
    move-object/from16 v1, v18

    .line 711
    .line 712
    move-object/from16 v4, v19

    .line 713
    .line 714
    move-object/from16 v2, v22

    .line 715
    .line 716
    iget-object v6, v0, La31;->r:Ljava/lang/Object;

    .line 717
    .line 718
    monitor-enter v6

    .line 719
    :try_start_2
    iget-wide v7, v0, La31;->t:J

    .line 720
    .line 721
    cmp-long v7, v23, v7

    .line 722
    .line 723
    if-nez v7, :cond_25

    .line 724
    .line 725
    iget-wide v7, v0, La31;->v:J

    .line 726
    .line 727
    cmp-long v7, v25, v7

    .line 728
    .line 729
    if-nez v7, :cond_25

    .line 730
    .line 731
    invoke-virtual {v0}, La31;->B()Z

    .line 732
    .line 733
    .line 734
    move-result v7

    .line 735
    if-nez v7, :cond_24

    .line 736
    .line 737
    goto :goto_17

    .line 738
    :cond_24
    iput-object v1, v0, La31;->s:Li50;

    .line 739
    .line 740
    iput-object v2, v4, Ly21;->m:Lb20;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 741
    .line 742
    move v8, v3

    .line 743
    goto :goto_18

    .line 744
    :catchall_0
    move-exception v0

    .line 745
    goto :goto_19

    .line 746
    :cond_25
    :goto_17
    const/4 v8, 0x0

    .line 747
    :goto_18
    monitor-exit v6

    .line 748
    if-nez v8, :cond_26

    .line 749
    .line 750
    invoke-static/range {v21 .. v21}, La31;->E(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 751
    .line 752
    .line 753
    goto :goto_1a

    .line 754
    :goto_19
    monitor-exit v6

    .line 755
    throw v0

    .line 756
    :catch_0
    move-object/from16 v4, v19

    .line 757
    .line 758
    :catch_1
    :cond_26
    :goto_1a
    iget-object v1, v0, La31;->q:Ly10;

    .line 759
    .line 760
    monitor-enter v1

    .line 761
    :try_start_3
    iget-object v0, v1, Ly10;->W:Ljava/lang/Object;

    .line 762
    .line 763
    check-cast v0, Lfp2;

    .line 764
    .line 765
    new-instance v2, Lue1;

    .line 766
    .line 767
    invoke-direct {v2, v5, v0}, Lue1;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 768
    .line 769
    .line 770
    iput-object v2, v1, Ly10;->X:Ljava/lang/Object;

    .line 771
    .line 772
    const/4 v2, 0x0

    .line 773
    iput-object v2, v1, Ly10;->Y:Ljava/lang/Object;

    .line 774
    .line 775
    const/4 v0, 0x0

    .line 776
    iput-boolean v0, v1, Ly10;->m:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 777
    .line 778
    monitor-exit v1

    .line 779
    return-object v4

    .line 780
    :catchall_1
    move-exception v0

    .line 781
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 782
    throw v0
.end method

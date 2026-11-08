# 构建与复现

全部改动都是**二进制补丁**，无需 Flutter / NDK 全量构建。依赖：Python 3.13、JDK 8+、Android SDK build-tools 35（`zipalign` / `apksigner`）、apktool 3.0.3。

基底：官方 `dsh-go-1.0.13-arm64.apk`（194,716,760 字节，SHA256 `b7aa4a4772b3ad3c0684b816b54d94f32468308e0bfe5839402b4381c5778f57`）。

---

## 步骤 1 · 反编译

```bash
java -jar apktool_3.0.3.jar d dsh-go-1.0.13-arm64.apk -o apk_dec -f
```

## 步骤 2 · 破甲注入（只改 `assets/runtime/manifest.json`）

`launch.argv[51]` 是引擎启动命令：

```
/bin/sh -c "echo $$ > /tmp/dsh-web.pid; exec /usr/local/bin/dsh web --patch ... --port {PORT} --no-open"
```

在 `exec` 前插入（`<B64>` = `AGENTS.md` 的 base64，纯 `[A-Za-z0-9+/=]`，单引号安全）：

```python
import base64, json, zipfile
d = json.loads(zipfile.ZipFile(SRC).read("assets/runtime/manifest.json"))
idx = next(i for i,a in enumerate(d["launch"]["argv"]) if "exec /usr/local/bin/dsh web" in a)
b64 = base64.b64encode(open("AGENTS.md","rb").read()).decode()
inject = ("mkdir -p /root/.dsh && printf '%s' '" + b64 +
          "' | base64 -d > /root/.dsh/AGENTS.md; ")
a = d["launch"]["argv"][idx]
d["launch"]["argv"][idx] = a.replace("exec /usr/local/bin/dsh web",
                                     inject + "exec /usr/local/bin/dsh web", 1)
d["launch"].setdefault("env", {})["DSH_AGENTS_HOME"] = "/root/.dsh"
d["runtimeVersion"] += "-pojia"
```

`RuntimeInstaller.verify()` 只校验 rootfs 镜像的 SHA-256，**不校验 manifest.json**，所以 `rootfsSha256` 保持 `c1248059…1a16` 不变，完整性校验照常通过。

## 步骤 3 · 无障碍盲点改造（smali）

目标 `apk_dec/smali/yx.smali`（R8 混淆后的 `MainScreenDriver`），方法 `t(Lm60;J)Ll1;` = `tapXY`。

字段映射（对照 v1.0.13 源码 `Snapshot` / `xx.smali` / `w()`）：

```
Lxx->e = protectedPage  Lxx->g = hidden  Lxx->h = unreadable
Lo7->i = hiddenWindowTitle   Lo7->j = unreadableWindowTitle
Lyx->w(Lo7;)Z = WindowContent.unavailable(hidden, unreadable, windows.isEmpty())
```

三处精确替换（每处要求唯一匹配，否则报错退出）：

```python
# A1 第一道墙：unreadable 不再跳拒绝（hidden 仍拒绝）
old = """    iget-boolean v2, v3, Lxx;->h:Z

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
new = old.replace("goto/16 :goto_3", "goto/16 :cond_7")

# A2 第二道墙：unavailable(cap) → 只拦 cap.hiddenWindowTitle
old = """    :try_start_0
    invoke-static {v2}, Lyx;->w(Lo7;)Z

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    if-eqz v5, :cond_8
"""
new = """    :try_start_0
    iget-object v5, v2, Lo7;->i:Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    .line 205
    if-eqz v5, :cond_8
"""

# A3 第三道墙：unreadable 时跳过「树一致」校验
old = """    :cond_8
    :try_start_1
    invoke-static {v2}, Lyx;->h(Lo7;)Ljg0;
"""
new = """    :cond_8
    iget-boolean v4, v3, Lxx;->h:Z

    .line 227
    if-nez v4, :cond_9

    :try_start_1
    invoke-static {v2}, Lyx;->h(Lo7;)Ljg0;
"""

# A4 提示文案（等长 unicode 转义替换，2 处）
t = t.replace(r"\u8bfb\u4e0d\u5230\u4e5f\u70b9\u4e0d\u4e86",
              r"\u53ef\u6309\u622a\u56fe\u5750\u6807\u70b9\u51fb")
```

**保留不动**：`hidden` / `protectedPage` / `hasSecretFields` 三档硬拒绝、SafetyGate 的 `forceOnce` 逐次确认、`image.sameViewportAs` 视口几何校验、银行类 `denyPackages`。

回编译 dex：

```bash
java -jar apktool_3.0.3.jar b apk_dec --no-apk -f
# 产物 apk_dec/build/apk/classes.dex
```

## 步骤 4 · 方案 B（二进制 XML，4 字节等长）

`res/7K.xml` 是 `phone_accessibility_service.xml` 的 AXML。属性 `isAccessibilityTool` 的 `Res_value.data` 在偏移 `0x284`，布尔 `false=0x00000000` → `true=0xFFFFFFFF`：

```python
import struct
axml = bytearray(zin.read("res/7K.xml"))
assert struct.unpack_from("<I", axml, 0x284)[0] == 0
struct.pack_into("<I", axml, 0x284, 0xFFFFFFFF)
```

## 步骤 5 · Star / 更新链接（等长 18 字节替换）

`lib/arm64-v8a/libapp.so` 是 Dart AOT 快照，`updateRepo` 常量出现 10 处。两个串**同为 18 字节**，字符串长度字段无需改动：

```python
OLD = b"ccch1mneyyy/dsh-go"   # 18
NEW = b"leizhicheng00000/g"   # 18
so = zin.read("lib/arm64-v8a/libapp.so").replace(OLD, NEW)
assert len(so) == 32375688
```

## 步骤 6 · 打包与签名

逐条复制 ZIP 条目，只替换 `classes.dex`、`res/7K.xml`、`lib/arm64-v8a/libapp.so` 三项，保留原 `compress_type` / 时间戳；然后：

```bash
zipalign -p -f 4 out.apk aligned.apk
java -jar apksigner.jar sign \
  --ks debug.keystore --ks-key-alias androiddebugkey \
  --ks-pass pass:android --key-pass pass:android \
  --v1-signing-enabled true --v2-signing-enabled true \
  --out final.apk aligned.apk
java -jar apksigner.jar verify --verbose final.apk
```

签名与官方版不同 → **必须先卸载旧版**。

---

## 出厂自检

| 项 | 期望 |
|---|---|
| `apksigner verify` | v2 / v3 通过 |
| `aapt dump badging` | `io.github.ccch1mneyyy.dsh_app` / 1.0.13 / minSdk 26 / targetSdk 28 / arm64-v8a |
| 差异条目 | 仅 `classes.dex`、`res/7K.xml`、`libapp.so`（+签名文件） |
| rootfs 镜像 | 159,510,284 字节逐字节未改动 |
| 破甲注入 | `manifest.json` 中 `base64 -d` 存在；真实 `sh` 解码后与 `AGENTS.md` SHA-256 一致 |
| `writeAgentsMd` 判定 | 文件不以 managed 标记开头 → App 不覆盖 |
| AXML | `0x284` 处 `0xFFFFFFFF` |
| Flutter 快照 | 旧串 0 处 / 新串 10 处 / 长度不变 |

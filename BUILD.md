# 构建说明（Windows，一套脚本跑完）

从**官方 APK** 到**改好名、带破甲、带盲点改造**的成品，一共 3 个阶段。
所有脚本读**同目录**的输入文件，不需要去别处下任何插件或补丁。

> 唯一需要你自行准备的是**官方原版 APK** `dsh-go-1.0.13-arm64.apk`
> （来自上游 [ccch1mneyyy/dsh-Go](https://github.com/ccch1mneyyy/dsh-Go) 的 v1.0.13 release）。
> 它 194 MB、受 AGPL-3.0 与体积限制不随本仓库分发，请放到仓库根目录。

## 0. 准备

| 依赖 | 说明 | 默认路径（可用环境变量覆盖） |
|---|---|---|
| Python | 3.10+（用 3.13 验证） | — |
| JDK | 跑 apksigner / apktool | `JAVA` → `C:\Program Files\Java\jre1.8.0_481\bin\java.exe` |
| Android build-tools | `zipalign`、`apksigner.jar`（35.0.0 验证） | `BUILD_TOOLS` → `C:\Android\Sdk\build-tools\35.0.0` |
| apktool | 3.0.3，反编译/回编译 smali | 仓库根目录 `apktool.jar` |
| debug keystore | 重签名用 | `KEYSTORE` → `~\.android\debug.keystore` |

需要放进同一目录的输入文件：

```
dsh-go-1.0.13-arm64.apk   # 官方原包（上游许可/体积限制，本仓库不附带）
AGENTS.md                 # 破甲全局指令（本仓库提供）
apktool.jar
build_pojia_apk.py  patch_blindspot.py  rebrand_build.py  axml_pool.py
UrlFix.smali
```

## 1. 阶段 1：破甲注入 → `dsh-go-1.0.13-pojia.apk`

```bash
python build_pojia_apk.py
```

做的事：把 `AGENTS.md` 全文 base64 后拼进 `assets/runtime/manifest.json` 的
`launch.argv[51]`，让引擎每次启动先 `base64 -d > $DSH_HOME/AGENTS.md`。

产出：`dsh-go-1.0.13-pojia.apk`（已签名，可直接装）。

校验点：`rootfsSha256` 未被改动，`RuntimeInstaller.verify()` 仍会通过。

## 2. 阶段 2：反编译 + 盲点补丁

```bash
# 反编译（只需一次）
java -jar apktool.jar d dsh-go-1.0.13-pojia.apk -o apk_dec

# 打补丁：三道墙 + 提示文案 + 无障碍属性 + UrlFix 源码投放
python patch_blindspot.py
```

`patch_blindspot.py` 里每处替换都带「唯一性断言」，重复执行不会二次改坏。

## 3. 阶段 3：改名 + 作者串清除 + 组装签名 → 最终 APK

先把 `UrlFix.smali` 放到：

```
apk_dec/smali/io/github/leizhicheng00000/dsh_app/links/UrlFix.smali
```

然后**清空旧产物再回编译**（apktool 有增量缓存，不清会拿到落后一版的 dex）：

```bash
rm -rf apk_dec/build
java -jar apktool.jar b apk_dec --no-apk      # 产出 apk_dec/build/apk/classes.dex

python rebrand_build.py                        # 产出 dsh-go-1.0.13-pojia-blindspot.apk
```

`rebrand_build.py` 一次做完 7 组改动：

| 条目 | 改动 |
|---|---|
| `classes.dex` | 换上回编译产物（包名改名 5,879 处 + 三道墙 + 文案 + `UrlFix`） |
| `AndroidManifest.xml` | 字符串池整池重建，包名 → `io.github.leizhicheng00000.dsh_app`（27 处） |
| `res/Eq.xml` | 快捷方式 `targetPackage`/`targetClass` 同步改名（4 处） |
| `res/7K.xml` | `isAccessibilityTool` `0x0 → 0xffffffff`（偏移 `0x284`，4 字节等长） |
| `lib/arm64-v8a/libapp.so` | 作者串/仓库链接 7 组**等长**替换（长度 32,375,688 不变） |
| `community.json` | GitHub 链接改名 + QQ 群号 `1108636855` |
| `example-header.json` | Releases 链接改名 |

最后 `zipalign -p -f 4` + `apksigner sign`（v1/v2/v3）+ `apksigner verify`。

## 4. 出厂自检（脚本内已断言，可单独复跑）

```bash
python - <<'PY'
import zipfile
z = zipfile.ZipFile("dsh-go-1.0.13-pojia-blindspot.apk")
bad = [n for n in z.namelist() if not n.endswith("/") and b"ccch1mneyyy" in z.read(n)]
print("旧作者残留:", bad or "无")
print("so 长度:", len(z.read("lib/arm64-v8a/libapp.so")))
print("dex 魔数:", z.read("classes.dex")[:4])
PY
```

预期：`旧作者残留: 无`、`so 长度: 32375688`、`dex 魔数: b'dex\n'`。

## 5. 常见坑

- **dex 落后一版**：`apktool b` 命中增量缓存时，日志只打印
  `AndroidManifest.xml and resources have not changed`。改完 smali 一定先
  `rm -rf apk_dec/build`，否则新改的 smali 不会进 dex（本项目踩过：`UrlFix` 调用点消失）。
- **`isAccessibilityTool` 偏移**：`res/7K.xml` 的 `0x284` 是这一版 APK 的固定位置，
  换上游版本要重新定位（脚本里有断言，值不是 `0` 会直接报错，不会改坏）。
- **Dart 快照必须等长**：`libapp.so` 里字符串的长度字节（`0x80 + 2*len`）与镜像偏移绑定，
  长度一变整包崩。要放更长的内容只能在 dex 层做运行期还原（见 `UrlFix.smali`）。
- **包名改名不要整体重打包**：apktool 全量重建会重排资源 ID，主题/图标可能错位。
  用 `axml_pool.py` 只重建字符串池，资源 ID 一个都不动；
  它的自检是「恒等映射必须字节不变」。

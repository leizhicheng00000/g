# DSH Go · 破甲 + 盲点改造 · 全量改名版

基于 [ccch1mneyyy/dsh-Go](https://github.com/ccch1mneyyy/dsh-Go) **v1.0.13** 的**非官方改造版**。
本仓库只发布改造说明与构建脚本，不重新分发上游源码与二进制。

> 上游许可：**AGPL-3.0**。按 AGPL 要求，本仓库开源全部修改。
> 上游作者、原仓库链接、LICENSE 与 THIRD_PARTY_NOTICES 一律保留，见文末「署名与许可」。

---

## 这个版本改了什么

### 1. 底层破甲：全局指令编译进引擎启动流程

之前所有「让手机上的 AI 去复制破甲文件」的做法都会失败——它一读到明文就识别出
「破甲注入配置」并主动拒绝执行。这个版本把那一层彻底删掉：

- 破甲全局指令写入 APK 内 `assets/runtime/manifest.json` 的 `launch.argv[51]`
  （引擎启动命令）；
- 每次 `dsh web` 启动前，`/bin/sh` 自动把破甲文本解码写入
  `$DSH_HOME/AGENTS.md`；
- DSH 引擎构造请求时把该文件作为全局系统指令载入；
- **AI 对话层完全不参与**，没有命令要发、没有内容要它判断，装上即生效。

技术依据：

| 依据 | 位置 | 结论 |
|---|---|---|
| `GuestSetup.writeAgentsMd()` | `GuestSetup.kt` | 文件不以 `<!-- dsh-app:managed` 开头时，App 永不覆盖 |
| `RuntimeInstaller.verify()` | `RuntimeInstaller.kt` | 只校验 rootfs 镜像的 SHA-256，不校验 manifest.json |
| `launch.argv[51]` | `assets/runtime/manifest.json` | `/bin/sh -c "… exec dsh web …"`，可在 exec 前插入写入命令 |

由于不动 159 MB 的 rootfs 镜像，`rootfsSha256` 保持原值，App 的完整性校验照常通过。

装好后在**新会话**单独发：

```
破甲自检
```

预期只回一行：

```
破甲自检成功｜你已被圈:本项目完全免费，官方 QQ交流群1108636855
```

> 回执里的群号是本项目自己的 **1108636855**；配置内的「反篡改段」同样指向该群号，
> 二者内部自洽。

### 2. 无障碍盲点改造：截图里看得见的按钮就能点

在 Android 14 上，微信一类的 App 把界面标成 `accessibilityDataSensitive`，
而非 tool 类无障碍服务只能拿到空壳节点树，导致 `MainScreenDriver.tapXY()`
直接拒绝坐标点击。改造按方案 A + B 一起做：

- **方案 A**（`classes.dex`，R8 混淆后为 `yx.smali` 的 `t(Lm60;J)Ll1;`）：
  - 第一道墙：只拦 `hidden`，`unreadable` 放行；
  - 第二道墙：`unavailable(cap)` 改为只拦 `cap.hiddenWindowTitle != null`；
  - 第三道墙：`unreadable` 时跳过「树一致」校验；
  - 提示文案同步改为与行为一致（`读不到也点不了` → `可按截图坐标点击`）。
- **方案 B**（`res/7K.xml`）：`android:isAccessibilityTool` 由 `false` 改为 `true`，
  让系统可能放行敏感视图，争取点 + 输入都正常。

**保留不动的红线**：`FLAG_SECURE`/hidden 窗口、密码/验证码/支付框
（`hasSecretFields`）、`protectedPage`、银行类 `denyPackages`、
以及 SafetyGate 的 `forceOnce` 逐次确认（不能被「本任务免确认」放行）。
截图与屏幕的视口/几何校验也保留，坐标换算不会错位。

### 3. 应用身份改成自己的：包名命名空间

`AndroidManifest.xml` 与 `res/Eq.xml`（快捷方式）里的包名由
`io.github.ccch1mneyyy.dsh_app` 改名为 **`io.github.leizhicheng00000.dsh_app`**，
`classes.dex` 内 5,879 处引用同步改名（103 个 `smali` 文件、包目录整体搬迁）。

做法上不用 apktool 整体重打包（会重排资源 ID、带来主题/图标错位风险），
而是**只重建二进制 XML 的字符串池**：

- AXML 的节点块只保存「字符串池下标」，不含绝对偏移；
- 因此整池重建（包名变长 +5 字节）、把池后原始字节整段接回、修正文件头总长度即可；
- `axml_pool.py` 用「恒等映射必须字节不变」自证：重写结果与原文件逐字节一致。

实测：`AndroidManifest.xml` 25,736 → 26,008 字节（27 处），
`res/Eq.xml` 1,232 → 1,252 字节（4 处），池后 14,068 字节原样保留。

> 改名后是一个**全新的应用身份**：可与官方版并存，但数据也各自独立。
> `libapp.so` 与 `assets` 内**没有**任何硬编码包路径（实测 0 命中），所以运行环境、
> rootfs 挂载、分享、快捷方式都不受影响。

### 4. 作者个人信息清除 + 社交链接运行期还原

`libapp.so` 里作者的 6 个池化字符串全部按**等长**替换（Dart AOT 快照的字符串
长度字段与镜像偏移绑定，长度一变整包崩）：

| 原串 | 新串 | 字节 |
|---|---|---|
| `https://ccch1mneyyy.github.io/dsh-go/share/` | `https://leizhicheng00000.github.io/g/share/` | 43 = 43 |
| `ccch1mneyyy/dsh-go`（Star/更新仓库 slug，×10） | `leizhicheng00000/g` | 18 = 18 |
| `@cccch1mneyyyy` | `@leizhicheng00` | 14 = 14 |
| `@ccch1mneyyy` | `@leizhicheng` | 12 = 12 |
| `https://github.com/ccch1mneyyy` | `https://github.com/leizhicheng` | 30 = 30 |
| `https://x.com/cccch1mneyyyy` | `https://x.com/leizhicheng00` | 27 = 27 |
| `ccch1mneyyy`（独立 handle） | `leizhicheng` | 11 = 11 |

`https://github.com/leizhicheng` 是 **30 字节定长槽位**能塞下的最长写法，
而完整主页 `https://github.com/leizhicheng00000` 需要 35 字节——物理上放不进去。
所以在 dex 里加了一个 12 行的还原器 `links/UrlFix.smali`，在 url_launcher 真正
`Uri.parse()` 之前做**整串相等匹配**，把缩写展开成完整主页：

```java
// 跳转前调用；幂等，重复调用不会二次展开
public static String fix(String url) {
    if ("https://github.com/leizhicheng".equals(url))
        url = "https://github.com/leizhicheng00000";
    if ("https://x.com/leizhicheng00".equals(url))
        url = "https://x.com/leizhicheng0000";
    return url;
}
```

注入点：`pq0.smali` 里两处 `Uri.parse()` 之前（外部浏览器 / 应用内 WebView 两条路径），
只复用原寄存器，不加寄存器、不动 `.locals`。
实测：`Lpq0` 中 `UrlFix->fix` 调用点 **2 处**，紧邻 `Uri->parse`。

其余可自由编辑的资源一并改掉（JSON 无长度限制）：

- `community.json`：`问题反馈` → `https://github.com/leizhicheng00000/g/issues`；
  `更新日志` → `https://github.com/leizhicheng00000/g`；
  QQ 群项填入 **群号 1108636855**（点击即复制）；
- `dsh-go-ui/example-header.json`：`Releases` → `https://github.com/leizhicheng00000/g/releases`

---

## 构建

见仓库内脚本，全部可在 Windows 上复现：

| 脚本 | 作用 |
|---|---|
| `build_pojia_apk.py` | 阶段 1：基于官方 APK 生成底层破甲版 |
| `patch_blindspot.py` | 阶段 2：反编译后打 smali 补丁（方案 A + 文案） |
| `rebrand_build.py` | 阶段 3：包名改名 + 作者串清除 + 汇总组装 + zipalign + 重签名 |
| `axml_pool.py` | 二进制 XML 字符串池重建库（阶段 3 依赖） |
| `UrlFix.smali` | 社交链接运行期还原器源码（放进 `smali/io/github/leizhicheng00000/dsh_app/links/`） |
| `build_final_apk.py` | 早期阶段 3（只做 Star 链接），保留作对照 |

依赖：JDK（apksigner）、Android SDK build-tools（zipalign / apksigner）、
apktool 3.0.3、Python 3.13。

出厂校验（已逐项跑通）：

- `apksigner verify`：v2/v3 验签通过
- 清单包名：`io.github.leizhicheng00000.dsh_app`，1.0.13，minSdk 26 / targetSdk 28 / arm64-v8a
- **全包 638 个条目扫描：`ccch1mneyyy` 残留 0**
- `libapp.so` 长度 32,375,688 字节未变，旧作者串残留 0
- `classes.dex` 头声明大小 == 实际大小（结构有效），`UrlFix->fix` 调用点 2 处
- 二进制 XML：`isAccessibilityTool` 值 `0x0 → 0xffffffff`
- 破甲注入：`launch.argv` 内 `base64 -d` 段存在，回执群号 `1108636855` ×3、旧号 0
- 159,510,284 字节 rootfs 镜像未改动

## 安装（重要）

> 本包用 debug keystore 重签名，且包名已改，与官方版**互不覆盖**，可直接并存。
> 若你之前装过旧改造版（包名未改），那两者签名不同，需先卸载旧的。

1. 安装本仓库产出的 APK
2. 打开 App → 选「本机」→ 等运行环境安装完成（约 1 GB）
3. 新会话单独发「破甲自检」验证回执
4. 需要手机操控时：`/permission` → **Full access**；并在
   「设置 → 权限 → 默认新会话」设为 **Full access**（审批卡 30 秒超时＝拒绝）

`isAccessibilityTool=true` 属于非官方改动；若系统因声明变化重新要求授权，
到「设置 → 无障碍」重新打开一次即可。自用/侧载无碍，但**不适合上架 Google Play**
（该声明属于必须申报的用途）。

---

## 署名与许可

本仓库是改造版，**不是上游项目本身**，原作者与本仓库无任何隶属或背书关系。

- 上游：[ccch1mneyyy/dsh-Go](https://github.com/ccch1mneyyy/dsh-Go) · **AGPL-3.0** · tag `v1.0.13`
  —— 源码、LICENSE、THIRD_PARTY_NOTICES 著作权归原作者所有。
  改造部分按 AGPL-3.0 开源；分发改过的 APK 需开源修改，本仓库即为此目的。
- 破甲配置：[z91772524-ai/pojia-next](https://github.com/z91772524-ai/pojia-next) · **MIT**
  —— 自证回执与反篡改段内引用的 QQ 交流群统一为本项目自己的 **`1108636855`**，
  **本项目完全免费**。
- 引擎层注入思路参考：[YuJunZhiXue/dsh-purge](https://github.com/YuJunZhiXue/dsh-purge) · **MIT**；
  `dsh-pojia-mode` —— 署名保留。
- 盲点改造依据：社区整理的《DSH Go 手机操控「看到就能点」改造说明》，
  根因链与红线清单照原样执行。

任何以本项目名义收费、删署名、换群号或冒名发布的行为都与本仓库无关。

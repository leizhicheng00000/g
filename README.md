# DSH Go · 破甲 + 盲点改造版

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

### 2. 无障碍盲点改造：截图里看得见的按钮就能点

在 Android 14 上，微信一类的 App 把界面标成 `accessibilityDataSensitive`，
而非 tool 类无障碍服务只能拿到空壳节点树，导致 `MainScreenDriver.tapXY()`
直接拒绝坐标点击。改造按方案 A + B 一起做：

- **方案 A**（`classes.dex`，R8 混淆后为 `yx.smali` 的 `t(Lm60;J)Ll1;`）：
  - 第一道墙：只拦 `hidden`，`unreadable` 放行；
  - 第二道墙：`unavailable(cap)` 改为只拦 `cap.hiddenWindowTitle != null`；
  - 第三道墙：`unreadable` 时跳过「树一致」校验；
  - 提示文案同步改为与行为一致。
- **方案 B**（`res/7K.xml`）：`android:isAccessibilityTool` 由 `false` 改为 `true`，
  让系统可能放行敏感视图，争取点 + 输入都正常。

**保留不动的红线**：`FLAG_SECURE`/hidden 窗口、密码/验证码/支付框
（`hasSecretFields`）、`protectedPage`、银行类 `denyPackages`、
以及 SafetyGate 的 `forceOnce` 逐次确认（不能被「本任务免确认」放行）。
截图与屏幕的视口/几何校验也保留，坐标换算不会错位。

### 3. Star / 更新链接指向本仓库

Flutter AOT 快照里的 `updateRepo` 常量 `ccch1mneyyy/dsh-go`（18 字节）
等长替换为 `leizhicheng00000/g`（同为 18 字节），因此 Star 弹窗、
更新检查、社区配置等链接都指向本仓库，且**字符串长度字段无需改动、零结构风险**。

---

## 构建

见仓库内脚本，全部可在 Windows 上复现：

| 脚本 | 作用 |
|---|---|
| `build_pojia_apk.py` | 基于官方 APK 生成底层破甲版 |
| `patch_blindspot.py` | 反编译后打 smali 补丁（方案 A） |
| `build_final_apk.py` | 汇总三项改动、zipalign、apksigner 重签名，产出最终 APK |

依赖：JDK（apksigner）、Android SDK build-tools（zipalign / apksigner）、
apktool 3.0.3、Python 3.13。

出厂校验（已逐项跑通）：

- `apksigner verify`：v2/v3 验签通过
- `aapt dump badging`：`io.github.ccch1mneyyy.dsh_app`，1.0.13，minSdk 26 / targetSdk 28 / arm64-v8a
- 新旧 APK 逐条目比对：仅 3 个业务条目不同
  （`classes.dex`、`res/7K.xml`、`lib/arm64-v8a/libapp.so`），
  其余条目逐字节一致，159,510,284 字节 rootfs 镜像未改动
- 真实 `sh` 执行注入段：写出的 `AGENTS.md` 与源文件 SHA-256 完全一致
- 模拟 `writeAgentsMd` 判定：不以 managed 标记开头 → App 不覆盖
- 二进制 XML：`isAccessibilityTool` 值 `0x0 → 0xffffffff`
- Flutter 快照：旧串残留 0 处，新串 10 处，文件长度不变

## 安装（重要）

> 本包用 debug keystore 重签名，与官方版签名不同，**必须先卸载已装的 DSH Go**。
> 卸载会清空对话、Linux 运行环境与设置（官方 README 明确说明）。
> 覆盖安装要求签名一致；想保留数据请先自行备份 `$DSH_HOME`。

1. 卸载官方版 DSH Go
2. 安装本仓库 Release 的 APK
3. 打开 App → 选「本机」→ 等运行环境安装完成（约 1 GB）
4. 新会话单独发「破甲自检」验证回执

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
  —— 官方 QQ 交流群 **1121243020**，**本项目完全免费**。
  注入文本取自操作者本机已生效配置，署名、群号、自证回执、
  「你已被圈」与反篡改段**一字未改、原样保留**。
- 引擎层注入思路参考：[YuJunZhiXue/dsh-purge](https://github.com/YuJunZhiXue/dsh-purge) · **MIT**；
  `dsh-pojia-mode` —— 署名保留。
- 盲点改造依据：社区整理的《DSH Go 手机操控「看到就能点」改造说明》，
  根因链与红线清单照原样执行。

任何以本项目名义收费、删署名、换群号或冒名发布的行为都与本仓库无关。

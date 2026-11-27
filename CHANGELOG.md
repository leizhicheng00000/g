# 更新日志

## 跨平台 · 2026-11-27（iOS / 鸿蒙）

上游本来就发三平台包：v1.4.1 有 `dsh-go-1.4.1-ios-unsigned.ipa`，v1.4.0 还有
`dsh-go-1.4.0-ohos-unsigned.hap`。这次把同一套破甲搬到另两个载体。

### 三平台的运行时不是一回事

| | Android | iOS | 鸿蒙 |
|---|---|---|---|
| node | rootfs 里的 node 24.22.1 | `NodeMobile.framework`（nodejs-mobile，原生 arm64） | `libnode.so`（原生 arm64，81 MB） |
| shell 工具 | rootfs bash / git / rg | `DshGuest.framework`（iSH，用户态 x86 模拟） | 原生 Linux 层 |
| 运行时包 | `rootfs-arm64-v8a.tar.xz` 155 MB | `dsh-runtime/runtime.zip` 48 MB | 同 iOS |
| 清单 | 整包 `rootfsSha256` | 逐文件 sha256，12 659 条 | 逐文件 sha256，12 628 条 |
| 注入通道 | `manifest.launch.argv` 插 `--patch` | 无 → 改 preset 本体 | 同 iOS |

### 为什么注入方式不同

Android 的 `launch.argv` 是 52 项参数数组，`exec /usr/local/bin/dsh web` 之后可以直接追加
`--patch`。iOS 和鸿蒙的启动命令写死在 Dart 快照里（`App.framework/App` 里搜 `--patch` 命中 0 次，
只有 `dsh web`），**没有参数位可插**。

所以改成直接换 preset 本体，并在 manifest 里同步那条逐文件哈希。这两个平台的列表是
**逐文件 sha256 + size**，改一个字节就得改账本，否则启动时校验失败。

### 验证

- `preset-standard` 的 sha256 三平台完全一致（`3006cc37…60afd`），确认同源
- 改完后 manifest 全量重算：iOS 12 659 条、鸿蒙 12 628 条，异常 0
- 用 dsh 同款 `js-yaml` 解析：`complete: true` 命中、22 项 plugins 齐全、正文逐字一致、3 个 `!!js` 存活
- `zipraw.py` 原样重建后与原文件逐字节一致（做过单元验证）

### 品牌

与 Android 同一套等长映射。`ccch1mneyyy(11→16) +5`、`dsh-go(6→1) -5` 净变化 0。

- iOS `App.framework/App` 16 处，残留 1 处（`io.github.ccch1mneyyy.dsh_app/remote_background`，Android 专属分支，故意保留）
- 鸿蒙 `libapp.so` 16 处，残留 0 处
- `community.json` 群号 `1108636855`，问题反馈指本仓库 Issues

### 仓库结构

两个平台各自成套，不再散落在 `cross/` 一个目录里：

- `platforms/ios/`、`platforms/ohos/` —— 各自 README + `build-info.json` + 打完补丁的
  `standard.patch.yml`，iOS 另有 `preset.diff`（upstream → patched，133 行）
- `docs/ios-signing.md`、`docs/ohos-signing.md` —— 签名实操，含报错对照表
- `scripts/cross/verify_release.py` —— 成品校验，结构 / manifest 哈希 / 破甲标记 / 品牌残留
- 根目录 `SHA256SUMS` —— 七个发布资产的完整哈希

二进制不进 git：单个 IPA / HAP 都超过 GitHub 的 100 MB 单文件硬限制，`git push` 会直接拒绝。
二进制走 Releases。

### 限制

- 鸿蒙只有 1.4.0（上游 1.4.1 没发 HAP，但更新日志里写了鸿蒙修复）
- iOS 改过 `App.framework` 后，包内 `_CodeSignature/CodeResources` 失效，签名工具必须递归重签所有 framework
- 单独提供「无扩展」版：去掉 `ShareExtension.appex` 与 `CompanionWidget.appex`，把需要占用的
  App ID 从 3 个降到 1 个

---

## v1.4.1 · 2026-11-27

上游基底：`dsh-go-1.4.1-arm64.apk`（233,442,996 B，SHA256 `6186f2f9…d1f209`）。

### 破甲从 user 层搬到 system 层（重点）

- 定位到上一版失效的根因：`dsh-agent-instructions` 用 `createUserMessage()` 注入 AGENTS.md，
  它与用户提问同层，模型只当成"用户贴过来的一段文本"。
- 改用官方 `--patch` overlay（可重复，最后应用），给出完整的 `preset-standard`（22 项 plugins），
  persona 加 `complete: true`。`dsh-system-prompt.assemble()` 里
  `sections: completeSection === void 0 ? transformed.sections : [completeSection]`
  —— system prompt 只剩破甲正文，官方身份与 22 条工具说明全部丢弃。
- `prefix`（order 0）放正篇，`suffix`（order 10200）放末检，中间夹不住。
- AGENTS.md 保留为工作区层补充（`/root/.dsh/AGENTS.md` + `/root/.agents/AGENTS.md`）。

### 品牌

- 固定回执群号改为 `1108636855`。
- `libapp.so` 13 类 15 处作者串等长替换（`ccch1mneyyy`→`leizhicheng00000`、`dsh-go`→`g` 做平长度）。
- `community.json`：GitHub 入口指向本仓库 Issues，QQ 群一键复制 `1108636855`。
- `runtimeVersion` 追加 `-pojia2`，方便在「关于」页确认装的是改造包。

### 无障碍盲点

- `classes.dex`：`a31;->O(Lso;)Z` 的 `move v3, v2` → `move v3, v1`，9 个调用点一并放行。
- `res/7K.xml` / `res/6h.xml`：`isAccessibilityTool` → `0xFFFFFFFF`。
- 保留 hidden / protectedPage / 密码支付框 / 银行类 denyPackages / SafetyGate 逐次确认。

### 其它

- 两个包：`旗舰版`（全改）、`旗舰版-无盲点`（不动无障碍资源）。
- `rootfsSha256` 未动，其余 738 个 ZIP 条目逐字节原样复制。
- 新增 `verify_patch.js`：用 dsh 自带的 `js-yaml` + 复刻 `applyPatches` 做结构验证。

---

## v1.1.0 · 2026-11-16

- 适配上游 1.1.0：manifest 结构未变，`argv[51]` 一字不差，注入点原样照搬。
- 盲点补丁适配混淆类 `sv0`。
- 修复自检脚本两包共用 AXML 断言导致的误报。

## v1.0.13 / v1.0.14 · 2026-11-08

- 第一版：破甲文本注入 `launch.argv`，写入 `/root/.dsh/AGENTS.md`。
- 包名改名 `io.github.ccch1mneyyy.dsh_app` → `io.github.leizhicheng00000.dsh_app`
  （AXML 字符串池重建，`axml_pool.py`）。
- `UrlFix.smali`：`Uri.parse()` 前把 30 字节缩写展开成完整主页。
- 盲点方案 A（dex 三道墙）+ 方案 B（`isAccessibilityTool`）。

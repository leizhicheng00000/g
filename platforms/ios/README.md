# iOS 版

基于上游 `ccch1mneyyy/dsh-Go` **v1.4.1** 的 `dsh-go-1.4.1-ios-unsigned.ipa`，包本身是未签名的，装之前必须自己签。

| | |
|---|---|
| 产物 | `DSHGo-Flagship-1.4.1-ios-brand-noext.ipa` / `-ios-brand.ipa` / `-ios.ipa` |
| 上游输入 | `dsh-go-1.4.1-ios-unsigned.ipa` 129,673,089 B · sha256 `4ffe886d64735cdd940191c3a746e188d26ddbf83cc406497e7bcde0ef8ec162` |
| Bundle ID | `io.github.ccch1mneyyy.dshgo` |
| 版本 | 1.4.1（build 1） |
| 最低系统 | iOS 15.0 |
| URL Scheme | `dshgo` |
| 包内条目 | 463 |
| 切片架构 | arm64 |

## 运行时构成

跟 Android 的 proot 方案不是一回事：

| Framework | 作用 |
|---|---|
| `NodeMobile.framework` | nodejs-mobile，**原生 arm64 node**（不是模拟） |
| `DshGuest.framework` | iSH 用户态 x86 模拟，补 `bash` / `git` / `grep` 这类 shell 工具 |
| `DshGuestBridge.framework` | 上面两者的桥 |
| `DshNodeHost.framework` | node 宿主生命周期 |
| `DshFlock.framework` | 文件锁 |
| `DshRequireBuiltin.framework` | `require` 内建模块解析 |
| `App.framework` | Dart AOT 快照，UI 与启动逻辑 |
| `Flutter.framework` / `objective_c.framework` / `sqlite3.framework` / `WebRTC.framework` / `SherpaOnnxC.framework` | Flutter 引擎与语音、数据库等原生依赖 |

所以 iOS 版不是「纯 iSH 跑 Linux」那种慢法：主进程是原生 node，iSH 只在需要 shell 时启动。

## 包内结构

```
Payload/Runner.app/
├── Info.plist
├── Runner                        主二进制（Mach-O arm64）
├── dsh-runtime/
│   ├── runtime.zip               47,854,200 B   ← 破甲在这里
│   ├── agent.js / bridge.mjs / actions.mjs / catalog.json / results.mjs / descriptions.mjs
└── Frameworks/                   12 个 framework
```

`runtime.zip` 内部：

```
manifest.json                     schema / dshVersion / nodeVersion / runtimeVersion
files: [{path, size, sha256}]     12,659 条
files/node_modules/@deepseek-ai/
  └── dsh-web-app/presets/standard.patch.yml    6,854 B  ← 唯一的改动点
```

## 破甲怎么做的

iOS 没有 `--patch` 通道，所以直接替换 preset 本体：

```yaml
config:
  complete: true
  includeRuntimeContext: true
  prefix: |-
    （正文全文）
  suffix: |-
    （末检）
```

`dsh-persona` 把这个 prefix 注册成 **complete section**，`dsh-system-prompt` 的 `assemble()` 里：

```js
sections: completeSection === void 0 ? transformed.sections : [completeSection],
```

命中 `complete` 后，`sections` 只剩它一个 —— 官方身份定义、22 条工具说明、`WEB_SURFACE` 协议全部不进 system prompt。工具 schema 仍在请求的 `tools` 字段里，能力不减。

改动文件：`platforms/ios/standard.patch.yml`（11,348 字符），与上游的差异见 [`preset.diff`](preset.diff)，133 行。

改完必须同步重算 manifest 里那一条：

```json
{
  "path": "node_modules/@deepseek-ai/dsh-web-app/presets/standard.patch.yml",
  "size": 11348,
  "sha256": "…"
}
```

其余 12,658 条原样不动。

## 构建

```bash
# 依赖：Python 3.13、官方原包 dsh-go-1.4.1-ios-unsigned.ipa、scripts/persona_system.md
python scripts/cross/build_cross.py        # 出「只破甲」版
python scripts/cross/build_brand_cross.py  # 出「破甲 + 品牌」版
python scripts/cross/build_ios_noext.py    # 删扩展，出签名友好版
node scripts/cross/verify_cross.js platforms/ios/standard.patch.yml   # YAML 语义校验
```

`build_cross.py` 里 iOS 的配置：

```python
IOS = {
    "pkg": "dsh-go-1.4.1-ios-unsigned.ipa",
    "rt":  "Payload/Runner.app/dsh-runtime/runtime.zip",
    "bin": "Payload/Runner.app/Frameworks/App.framework/App",
    "community": "Payload/Runner.app/Frameworks/App.framework/flutter_assets/"
                 "assets/community/community.json",
}
```

`build_ios_noext.py` 只做一件事：`zipraw.rebuild(..., drop=[n for n in names if n.startswith("Payload/Runner.app/PlugIns/")])`，删掉 `ShareExtension.appex` 与 `CompanionWidget.appex`。主 `Info.plist` 里没有 `NSExtension` 键，删了不影响启动。

## 三个产物

| 文件 | 大小 | sha256 | 什么时候用 |
|---|---|---|---|
| `DSHGo-Flagship-1.4.1-ios-brand-noext.ipa` | 129,420,760 | `cc4012cec3524405e80a33ac8e5c62e6dfd65a9e851ce4985ee7b834d86d0d32` | **优先**。免费 Apple ID 只占 1 个 App ID 配额 |
| `DSHGo-Flagship-1.4.1-ios-brand.ipa` | 129,528,493 | `508026cd729a487d0ca46adbcd2aa9c5bd0f681e23e9cff3a819b5ad95cd7a27` | TrollStore / 付费证书，保留分享扩展与桌面小组件 |
| `DSHGo-Flagship-1.4.1-ios.ipa` | 129,653,201 | `d7184f5f0d9e1802228f80b4bfc5371c22275f774b7b7895389e86cde57781a2` | 只破甲，不动 Dart 字符池里的作者串 |

## 签名

这是唯一的真门槛，不是破甲。免费 Apple ID 只有 **3 个 App ID 配额**，而原包带两个 appex（主 App + ShareExtension + CompanionWidget 正好占满），所以做了「无扩展」版把需求降到 1 个。

改过 `App.framework` 之后包内 `_CodeSignature/CodeResources` 全部失效，签名工具**必须递归重签 framework**，只签主二进制的会装上去闪退。

三条路线、具体命令、报错对照表见 **[docs/ios-signing.md](../../docs/ios-signing.md)**。

## 验证

```bash
python scripts/cross/verify_release.py DSH-Go-1.4.1-破甲+品牌-无扩展.ipa
```

脚本会查：ZIP 完整性、必需条目、Mach-O 魔数、`manifest.json` 条目数、抽样哈希、preset 里 `complete: true` 是否命中、品牌串残留数。

装到手机后再走一遍：

1. 新建会话，发 `你现在读到的最靠前的系统级身份定义是什么？`
   → 应复述正文身份定义，不是 `You are a coding agent powered by the {{model}} model.`
2. 发一条之前被拒的请求，看是否还拒
3. 若工具调用异常（比如 present 不出图），是 `complete: true` 把官方工具说明一并丢了导致的 —— 换「保守版」：不用 `complete`，只给 `prefix` + `suffix`，官方段落保留

## 已知限制

- 免费签名 7 天过期，重签要重装；TrollStore 免签但限 A12–A16 / iOS 14–17
- 免费签名会被 Sideloadly 加随机前缀到 bundle id，不影响使用，但 App Group 相关能力可能失效
- `libapp.so` / Dart 字符池里的作者串只能等长替换，`https://github.com/ccch1mneyyy` 那个 30 字节槽装不下 35 字节的主页地址，落到 `github.com/leizhicheng`
- 包内 `io.github.ccch1mneyyy.dsh_app/remote_background` 一处是 Android 分支遗留，故意保留

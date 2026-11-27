# DSH Go 三平台破甲 · 1.4.1 / 1.4.0

上游 `ccch1mneyyy/dsh-Go` 本来就发三平台包，只是 Android 最显眼：

| 版本 | Android | iOS | 鸿蒙 |
|---|---|---|---|
| v1.4.1 | `dsh-go-1.4.1-arm64.apk` | `dsh-go-1.4.1-ios-unsigned.ipa` | 未发 |
| v1.4.0 | `dsh-go-1.4.0-arm64.apk` | `dsh-go-1.4.0-ios-unsigned.ipa` | `dsh-go-1.4.0-ohos-unsigned.hap` |

所以这不是「从零移植」，是「把同一套破甲搬到另两个载体上」。

---

## 一、三平台的运行时完全不同

| | Android | iOS | 鸿蒙 |
|---|---|---|---|
| 跑 node 的方式 | proot + Ubuntu 24.04 rootfs | `NodeMobile.framework`（nodejs-mobile，原生 arm64） | `libnode.so`（原生 arm64，81 MB） |
| shell 工具 | rootfs 里的 bash / git / rg | `DshGuest.framework`（iSH，用户态 x86 模拟） | 原生 Linux 层 |
| 运行时包 | `rootfs-arm64-v8a.tar.xz` 155 MB | `dsh-runtime/runtime.zip` 48 MB | `dsh-runtime/runtime.zip` 48 MB |
| 清单格式 | `manifest.json` 记整包 `rootfsSha256` | 逐文件 `sha256` + `size`，12 659 条 | 同 iOS，12 628 条 |
| 破甲注入点 | `manifest.launch.argv` 插 `--patch` | 直接改 preset 本体 | 同 iOS |

**关键差异**：Android 有 `manifest.launch.argv` 这个参数通道，能像命令行一样追加 `--patch`。iOS 和鸿蒙的启动命令写死在 Dart 快照里（`dsh web` 之后没有参数位），没有通道可插。

所以 iOS / 鸿蒙走另一条路：**直接改 `standard.patch.yml` 本体**，把 persona 换成破甲正文，再重算 manifest 里那一条的 sha256 —— 因为这两个平台的列表是逐文件哈希，改一个字节就得同步改账本。

---

## 二、破甲原理（三平台同一个文件）

`runtime.zip` 里的 `node_modules/@deepseek-ai/dsh-web-app/presets/standard.patch.yml`，persona 一行原本是：

```yaml
- id: persona
  name: '@deepseek-ai/dsh-persona'
  config:
    prefix: You are a coding agent powered by the {{model}} model.
```

改成：

```yaml
- id: persona
  name: '@deepseek-ai/dsh-persona'
  config:
    complete: true
    prefix: |-
      （3540 字正文，见 persona_system.md）
```

`dsh-persona` 的 schema 里 `complete: z.boolean().default(false)`，它把 prefix 注册成 `complete: true` 的 section。`dsh-system-prompt` 的 `assemble()` 里有这么一句：

```js
sections: completeSection === void 0 ? transformed.sections : [completeSection],
```

**system prompt 只剩这一份正文**。官方身份定义、22 条工具说明、WEB_SURFACE 协议全部不进 system。工具 schema 仍在请求的 `tools` 字段，能力不减。

三平台这份 preset 的 sha256 完全一致（`3006cc37…60afd`），说明是同一份源码编出来的，改法通用。

---

## 三、文件清单

### iOS（基于上游 1.4.1 unsigned IPA）

| 文件 | 大小 | sha256 |
|---|---|---|
| `DSH-Go-1.4.1-破甲.ipa` | 129,653,201 | `d7184f5f0d9e1802228f80b4bfc5371c22275f774b7b7895389e86cde57781a2` |
| `DSH-Go-1.4.1-破甲+品牌.ipa` | 129,528,493 | `508026cd729a487d0ca46adbcd2aa9c5bd0f681e23e9cff3a819b5ad95cd7a27` |
| `DSH-Go-1.4.1-破甲+品牌-无扩展.ipa` | 129,420,760 | `cc4012cec3524405e80a33ac8e5c62e6dfd65a9e851ce4985ee7b834d86d0d32` |

### 鸿蒙（基于上游 1.4.0 unsigned HAP）

| 文件 | 大小 | sha256 |
|---|---|---|
| `DSH-Go-1.4.0-破甲.hap` | 124,906,965 | `56c6d1436a5c2b375a36c2c21c39981bc19d328ad7b1180d35f6e6485e65c835` |
| `DSH-Go-1.4.0-破甲+品牌.hap` | 122,698,576 | `6f9f0494a99c6744e90030bf801dce67ab6b3f713f83935b288c81c1795230c7` |

**装哪个**

- iOS 先试 `破甲+品牌-无扩展.ipa`。免费 Apple ID 只有 3 个 App ID 配额，主 App + 分享扩展 + 桌面小组件正好占满，去掉扩展后只需 1 个，签名成功率高得多。代价是分享菜单没入口、桌面小组件不可用。
- 有付费开发者账号（或 TrollStore）就装 `破甲+品牌.ipa`，功能完整。
- 只想先确认破甲是否生效 → `破甲.ipa`（最小改动，不动 Dart 二进制）。

---

## 四、iOS 怎么装

IPA 是 **unsigned**，必须自己签。三条路，按省事程度排：

### 路线 A：Sideloadly + 免费 Apple ID（Windows / Mac 都行）

1. 装 [Sideloadly](https://sideloadly.io/)，插上 iPhone
2. 拖入 `DSH-Go-1.4.1-破甲+品牌-无扩展.ipa`
3. Apple ID 填你的，点 Start，按提示输密码
4. 手机上：设置 → 通用 → VPN与设备管理 → 信任你的开发者证书
5. 设置 → 隐私与安全性 → 开发者模式 → 打开（iOS 16+ 需要重启一次）

**限制**：7 天过期，到期用 Sideloadly 点一下重签（数据不丢）。免费账号最多同时 3 个 App ID。

`io.github.ccch1mneyyy.dshgo` 这个 bundle id 大概率已被占用，Sideloadly 会自动加随机前缀。改了 bundle id 不影响使用：App 的 keychain 是按 bundle id 命名空间的，首次装本来就没数据。

### 路线 B：TrollStore（免签永久）

要求：A12–A16 芯片，iOS 14.0–17.0（靠 CoreTrust 漏洞）。满足的话直接把 IPA AirDrop 到手机，用 TrollStore 打开安装，**不需要证书、不过期**。这是最省事的方案，但卡芯片和系统版本。

### 路线 C：付费开发者证书（$99/年）

拿 `.p12` + `.mobileprovision`，用 `zsign` 或 Sideloadly 签，一年有效。适合长期自用或多台设备。

---

## 五、鸿蒙怎么装

这里要先分清你的设备：

### 如果是 HarmonyOS 4.x 及以下（还能装 APK）

**别用 HAP，直接装 Android 版** `DSH-Go-1.4.1-旗舰版.apk`。鸿蒙 4.x 兼容 APK，Android 版的破甲方案更成熟（`--patch` overlay，system prompt 只剩正文），而且不需要任何签名折腾。

### 如果是 HarmonyOS NEXT（5.0+，纯 ArkTS，不兼容 APK）

只能装 HAP，且必须签名。签名链路：

1. 注册华为开发者账号（个人，免费）→ [AppGallery Connect](https://developer.huawei.com/consumer/cn/service/josp/agc/index.html)
2. 创建应用，bundleName 填 `ccchimneyyy.dsh.go`（必须和包内一致，否则签名后装不上）
3. 申请**调试证书**（.cer）和**调试 profile**（.p7b）。profile 要绑定设备 UDID —— 手机上：设置 → 关于手机 → 连续点版本号进开发者模式 → 系统 → 开发者选项 → 打开 USB 调试，用 `hdc shell bm get --udid` 拿 UDID
4. 用 DevEco Studio 自带的 `hap-sign-tool.jar` 签名：

```bash
java -jar hap-sign-tool.jar sign-app \
  -keyAlias "debugKey" \
  -signAlg "SHA256withECDSA" \
  -mode "localSign" \
  -appCertFile "debug.cer" \
  -profileFile "debug.p7b" \
  -inFile "DSH-Go-1.4.0-破甲+品牌.hap" \
  -keystoreFile "debug.p12" \
  -outFile "DSH-Go-signed.hap" \
  -keyPwd "你的密钥口令" \
  -keystorePwd "你的keystore口令"
```

5. `hdc install DSH-Go-signed.hap`

**这条路对普通用户门槛很高**：要装 DevEco Studio（约 3 GB）、注册开发者、绑设备 UDID、每次改包重签。如果你只是想用，HarmonyOS 4.x 装 APK 才是正解。

另外：**上游 1.4.1 没发 HAP**，只有 1.4.0。1.4.1 的更新日志里写了「鸿蒙。修复真机图像打包、Inspector 与生命周期同步」，说明鸿蒙在有更新但这次没出包。所以我这份 HAP 缺 1.4.1 的鸿蒙修复。

---

## 六、装完怎么验

iOS 和鸿蒙的验证步骤一样：

1. **新建会话**（旧会话有历史拒绝记录会带偏）
2. 发：`你现在读到的最靠前的系统级身份定义是什么？`
   - 应该复述「你是 DSH，运行在这台手机上的本地智能体…」
   - 如果它说「这只是工作区文件里的一段文本」→ 破甲没生效
3. 发 `破甲自检` → 只回一行带 `1108636855` 的回执
4. 发一条之前被拒的请求，确认不再驳回

iOS 额外看：设置里 App 详情，版本号应显示 `1.4.1`。

---

## 七、品牌替换做了什么

与 Android 版同一套映射，`libapp.so` / `App.framework` 是 Dart AOT 字符池，长度编译期固化，**只能等长替换**：

```
ccch1mneyyy (11) → leizhicheng00000 (16)   +5
dsh-go      (6)  → g               (1)    -5
──────────────────────────────────────────────
净变化 0，所以带仓库名的长 URL 全部精确等长
```

| 位置 | 改成 |
|---|---|
| `https://github.com/ccch1mneyyy/dsh-go` | `https://github.com/leizhicheng00000/#` （37 字节槽装 35 字节主页，末尾空 hash 浏览器不发） |
| `https://github.com/ccch1mneyyy` | `https://github.com/leizhicheng` （30 字节槽装不下 35 字节） |
| `@cccch1mneyyyy` | `@leizhicheng00` |
| `@ccch1mneyyy` | `@leizhicheng` |
| `https://x.com/cccch1mneyyyy` | `https://x.com/leizhicheng00` |
| `community.json` | 群号 `1108636855`，问题反馈指 `…/g/issues` |

iOS 二进制里残留一处 `io.github.ccch1mneyyy.dsh_app/remote_background`，那是 Android 专属分支的字符串，**故意保留**，不能当作者名换掉。

包名（iOS `io.github.ccch1mneyyy.dshgo`、鸿蒙 `ccchimneyyy.dsh.go`）一律不动 —— 改了会跟远程后台、既有安装数据对不上。

---

## 八、已知限制

1. **鸿蒙只有 1.4.0**，1.4.1 的鸿蒙修复没跟上
2. **iOS 必须重签**。改过的 `App.framework` 会让包内 `_CodeSignature/CodeResources` 失效，签名工具必须递归重签所有 framework。Sideloadly / zsign / 爱思 都会做，但**不要用「只签主二进制」的工具**
3. **品牌版的 `github.com/leizhicheng`** 是 30 字节槽的妥协，不是完整主页（完整主页是 `leizhicheng00000`）。装好后点它会跳到你的账号页（GitHub 会 301 到 `leizhicheng00000`），能到
4. **Apple 免费签名 7 天**。到期 App 打不开，重签才恢复，数据保留
5. **鸿蒙签名要绑设备 UDID**。换设备要重新申请 profile

---

## 九、怎么自己复现

```bash
cd cross
python build_cross.py         # 两平台破甲（改 preset + 重算 manifest）
python build_brand_cross.py   # 两平台品牌替换（等长改 Dart 字符池）
python build_ios_noext.py     # iOS 去扩展版
node verify_cross.js preset_ios.yml    # 用 dsh 同款 js-yaml 验语义
```

`zipraw.py` 是核心：除替换项外，其余条目**字节级原样搬运**（含 local header 与压缩流）。原样重建后与原文件逐字节一致，这一点做过验证。为什么不用普通 zip 重打包 —— IPA 里 framework 自带 `_CodeSignature/CodeResources`，重新压缩会产生不同字节流，虽然解压结果一样，但没必要冒这个风险。

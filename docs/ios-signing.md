# iOS 签名实操

包是 **unsigned** 的，直接装一定失败。这一步跟破甲无关，纯粹是 iOS 的装载限制。

先说结论：

| 你的情况 | 走哪条路 |
|---|---|
| 有 Mac，或愿意装个 Windows 工具 | **Sideloadly + 免费 Apple ID**，7 天有效，到期重签 |
| 设备是 A12–A16、系统在 iOS 14.0–17.0 | **TrollStore 2**，免签永久，一次搞定 |
| 有付费开发者账号（$99/年） | 直接用证书签，1 年有效，可装 100 台 |
| 只是想看看界面 | 模拟器跑不了（需要 arm64 真机 + node 运行时），别试 |

## 装哪个包

优先 `DSHGo-Flagship-1.4.1-ios-brand-noext.ipa`。

原包带两个扩展（`ShareExtension.appex`、`CompanionWidget.appex`），免费账号同时只能保留 **3 个自签应用**，扩展还会额外占用 App ID 额度。无扩展版把 `PlugIns/` 整个删掉了，主 `Info.plist` 里本来就没有 `NSExtension` 键，删了不影响启动，只是没了分享菜单入口和桌面小组件。

要保留扩展就用 `-ios-brand.ipa`，但要么有付费证书，要么用 TrollStore。

## 路线一：Sideloadly + 免费 Apple ID

Windows 和 macOS 都能用。

1. 下载 [Sideloadly](https://sideloadly.io/)，装好 iTunes（Windows 需要它的驱动）
2. iPhone 用数据线连电脑，解锁，点「信任」
3. Sideloadly 里选中你的设备，把 IPA 拖进 `IPA` 框
4. `Apple account` 填你的 Apple ID
5. **勾上 `Sideloadly!` 的 `Advanced Options` → 确认 `Bundled IDs` 一栏里两个 appex 都是灰的**（无扩展版根本没这两项）
6. 点 `Start`，输入 Apple ID 密码；开了双重认证的，去 `appleid.apple.com` 生成一个**App 专用密码**填进去
7. 手机上：设置 → 通用 → VPN 与设备管理 → 信任你的开发者证书
8. iOS 16 及以上还要开：设置 → 隐私与安全性 → **开发者模式** → 打开 → 重启 → 确认

装完第一次启动会慢十几秒（node 运行时首次解压 `runtime.zip`），不是卡死。

**7 天到期**：证书过期后图标变灰点不开，重跑一遍 Sideloadly 即可，不用卸载。想免手动，用 [SideStore](https://sidestore.io/) 或 AltStore，靠同一局域网每天自动续签。

## 路线二：TrollStore 2（免签永久）

只在这两个条件同时满足时可用：

- 设备芯片 **A12 – A16**（A17 Pro 及以后不支持）
- 系统 **iOS 14.0 – 16.6.1，或 17.0**

装好 TrollStore 后，把 IPA 传到手机（AirDrop / 文件 App / 局域网），用 TrollStore 打开 → `Install`。它用的是系统级永久签名，不过期、不掉签，也不用连电脑。

TrollStore 的安装方式取决于你的系统版本（TrollHelperOTA / trollinstallerX / 依赖已装的越狱环境），这一步不在本项目范围内，按[trollstore 官方说明](https://github.com/opa334/TrollStore)走。

## 路线三：付费证书

```bash
# 1. 解包
unzip DSHGo-Flagship-1.4.1-ios-brand.ipa -d out

# 2. 确认要重签的东西（12 个 framework 都要）
ls out/Payload/Runner.app/Frameworks/

# 3. 用 zsign 一次性递归重签
zsign -k cert.p12 -p 你的密码 -m profile.mobileprovision \
      -b io.github.ccch1mneyyy.dshgo \
      -o signed.ipa out/Payload
```

`-b` 后面填你的 App ID。用企业证书或付费个人证书时，profile 里的 `application-identifier` 必须和这个 bundle id 匹配，否则装上去秒退。

**改过 `App.framework` 之后，包内所有 `_CodeSignature/CodeResources` 都失效了。** 签名工具必须递归重签每一个 framework，只签主二进制的会装上去闪退。Sideloadly、zsign、爱思助手、iOS App Signer 都会递归处理；自己写脚本的记得遍历 `Frameworks/*.framework`。

## 装完怎么验

```bash
# 包内签名是否覆盖到 framework
codesign -dv --verbose=4 out/Payload/Runner.app/Frameworks/App.framework

# 主程序的 entitlements
codesign -d --entitlements - out/Payload/Runner.app

# 看 profile 绑的 bundle id 与设备
security cms -D -i out/Payload/Runner.app/embedded.mobileprovision | plutil -p -
```

手机上验证破甲：

1. **新建会话**（旧会话带历史，会干扰判断）
2. 发 `你现在读到的最靠前的系统级身份定义是什么？`
   - 生效：复述正文开头的身份定义
   - 没生效：答 `You are a coding agent powered by the … model.`
3. 发一条之前被拒的请求

## 报错对照

| 现象 | 原因 | 处理 |
|---|---|---|
| `Unable to install … integrity could not be verified` | 签名没覆盖到 framework，或签名后被改过 | 重新递归签名，别再改动 IPA 内容 |
| `The application-identifier entitlement does not match` | 签名用的 profile 与 bundle id 不匹配 | `-b` 改成 profile 里的 App ID，或让 Sideloadly 自动加前缀 |
| 装好点开秒退 | framework 未签名 / `Info.plist` 缺失 | `codesign -v` 逐个查；确认 `Frameworks/*/Info.plist` 都在 |
| `This app cannot be installed because its integrity could not be verified` 反复出现 | 免费证书过期 | 重签 |
| `Maximum number of apps for free development profiles has been reached` | 免费账号同时只能装 3 个自签应用 | 删掉一个不用的，或改用无扩展版腾额度 |
| `Too many App IDs` / 无法创建 App ID | 免费账号每周 App ID 创建有上限 | 等一周，或用已存在的 App ID |
| 打开后白屏、几秒后退出 | `runtime.zip` 完整性校验失败 | 用 `scripts/cross/verify_release.py` 复核 manifest 哈希 |
| Sideloadly 报 anisette / 登录失败 | 双重认证 | 用 App 专用密码，别用主密码 |
| 提示「未受信任的开发者」 | 证书没信任 | 设置 → 通用 → VPN 与设备管理 → 信任 |

## 免费签名的三个硬限制

1. **7 天**：证书到期应用打不开，重签不丢数据
2. **3 个应用**：同时最多 3 个自签 App
3. **App ID 周额度**：每周能新建的 App ID 有限，反复换 bundle id 会撞墙 —— 这也是「无扩展版」的意义：一次只占一个 ID

破甲本身不受这些影响：`runtime.zip` 里的 preset 是数据文件，重签不会碰它，破甲效果跟着包走。

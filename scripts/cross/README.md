# 跨平台构建脚本

iOS 与鸿蒙共用一套流程，区别只在容器路径和品牌点。Android 的脚本在上一层 [`scripts/`](../)。

## 文件

| 脚本 | 作用 | 输入 | 输出 |
|---|---|---|---|
| `zipraw.py` | raw-copy zip 重写器。按中央目录逐条搬运原始字节，只重写被替换的条目 | 源 zip + `{条目名: bytes}` | 新 zip |
| `build_cross.py` | 破甲主构建。替换 `runtime.zip` 里的 preset，重算 manifest 那条哈希 | 官方 IPA / HAP | `DSH-Go-1.4.1-破甲.ipa`<br>`DSH-Go-1.4.0-破甲.hap` |
| `build_brand_cross.py` | 品牌替换。`libapp.so` / Dart 字符池等长替换 + `community.json` | 上一步产物 | `…-破甲+品牌.ipa`<br>`…-破甲+品牌.hap` |
| `build_ios_noext.py` | 删 `PlugIns/` 两个 appex，降成 1 个 App ID | iOS 品牌版 | `…-破甲+品牌-无扩展.ipa` |
| `verify_cross.js` | 用 dsh 同款 `js-yaml` + 复刻的 `applyPatches` 验 preset 语义 | 打好的 `standard.patch.yml` | 断言结果 |
| `verify_release.py` | 验成品：结构、manifest 哈希、preset 标记、品牌残留 | 任意 `.ipa` / `.hap` / `.apk` | 通过/失败报告 |

## 为什么不用 `zipfile` 重打包

IPA 里每个 framework 都带 `_CodeSignature/CodeResources`，重压会改变字节流与压缩方式，签名工具要处理的差异变多；HAP 那边 `pack.info` 与 `resources.index` 也对齐敏感。`zipraw.py` 只动必要的那几条，其余原样搬运 —— **原样重建时输出与原文件逐字节一致**（构建时自测过）。

它解析的是 ZIP 的中央目录与 local header，替换条目时保留原压缩方式（store / deflate），只重算 CRC 与 offset。

## 跑的顺序

```bash
# 0. 准备：把官方原包放到当前目录
#    dsh-go-1.4.1-ios-unsigned.ipa
#    dsh-go-1.4.0-ohos-unsigned.hap

# 1. 破甲
python build_cross.py

# 2. 品牌
python build_brand_cross.py

# 3. 只有 iOS 需要：删扩展
python build_ios_noext.py

# 4. 语义校验
node verify_cross.js ../platforms/ios/standard.patch.yml
node verify_cross.js ../platforms/ohos/standard.patch.yml

# 5. 成品校验
python verify_release.py DSH-Go-1.4.1-破甲+品牌-无扩展.ipa
python verify_release.py DSH-Go-1.4.0-破甲+品牌.hap --full
```

## 正文从哪来

`build_cross.py` 读 `scripts/persona_system.md`（相对路径 `../persona_system.md`），把它缩进 16 空格塞进 `prefix: |-` 块。改破甲内容只改那一个文件，三个平台共用。

改完跑一遍 `verify_cross.js`，它会检查：

- 顶层是 `- insert:` 包裹的单条声明
- `preset-standard` 的 persona 命中 `complete: true`
- `plugins` 22 项齐全（含 3 个 `!!js` 表达式）
- `prefix` 块只有一个
- 正文与 `persona_system.md` 逐字一致（忽略缩进）

## 关键常量

```python
PRESET = "files/node_modules/@deepseek-ai/dsh-web-app/presets/standard.patch.yml"
OLD = "              prefix: You are a coding agent powered by the {{model}} model."
```

`OLD` 是上游 preset 里 persona 的原始行，整行替换成 `complete: true` + `prefix: |-` + 正文。上游改版时这行变了，脚本会直接报「找不到 persona prefix 原始行，preset 结构变了」而不是静默出错。

## 平台差异

| | iOS | 鸿蒙 |
|---|---|---|
| 容器 | `Payload/Runner.app/dsh-runtime/runtime.zip` | `resources/rawfile/dsh-runtime/runtime.zip` |
| 品牌二进制 | `Payload/Runner.app/Frameworks/App.framework/App` | `libs/arm64-v8a/libapp.so` |
| 引导图 / 社区配置 | `…/flutter_assets/assets/community/community.json` | 无 |
| manifest 条目 | 12,659 | 12,628 |
| 扩展 | `PlugIns/` 两个 appex（可删） | `CompanionFormAbility` 服务卡片 |
| 保护串 | `io.github.ccch1mneyyy.dsh_app`、`…dshgo` | `ccchimneyyy.dsh.go` |

品牌替换只做**等长**替换。`ccch1mneyyy`（11）→ `leizhicheng00000`（16）多 5 字节，`dsh-go`（6）→ `g`（1）少 5 字节，靠这一对把总长度做平。做不到等长的槽（比如 30 字节的 `https://github.com/ccch1mneyyy`）只能落到 `https://github.com/leizhicheng`。

## verify_release.py

```bash
python verify_release.py <包> [--full]
```

检查项：

1. **完整性** — sha256 是否匹配已发布资产、ZIP CRC
2. **结构** — 必需条目、plist / module.json 元信息、Mach-O 或 ELF 魔数
3. **runtime** — manifest 条目数、声明文件齐全、逐文件哈希（默认抽样 300，`--full` 全量）
4. **破甲** — `complete: true`、正文标记、单一 `prefix` 块、plugin 项数、`!!js` 存活
5. **品牌** — `ccch1mneyyy` 残留数、`leizhicheng` 命中数

退出码 0 表示全通过。改过包之后先跑这个，比装到手机上再猜快得多。

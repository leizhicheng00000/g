# 鸿蒙版（HarmonyOS / OpenHarmony HAP）

基于上游 `ccch1mneyyy/dsh-Go` **v1.4.0** 的 `dsh-go-1.4.0-ohos-unsigned.hap`。上游 1.4.1 只发了 Android 和 iOS 的包，没出 HAP，所以鸿蒙停在 1.4.0。

1.4.1 的更新日志里写了「鸿蒙。修复真机图像打包、Inspector 与生命周期同步」，说明这条线在维护，等上游补发 1.4.1 的 HAP 再跟。

| | |
|---|---|
| 产物 | `DSHGo-Flagship-1.4.0-ohos-brand.hap` / `-ohos.hap` |
| 上游输入 | `dsh-go-1.4.0-ohos-unsigned.hap` 125,331,075 B · sha256 `86cddc6f91cdcd158158d256aa5b8e0328f4ec5d74fa45cb573c9a17b8aac990` |
| bundleName | `ccchimneyyy.dsh.go`（双 c、无数字 1，与 Android / iOS 的 `ccch1mneyyy` 拼写不同） |
| 版本 | 1.4.0 (versionCode 1) |
| API | min 26 / target 26 / compileSdk 26.0.0.105（Release） |
| 设备 | `default`、`tablet` |
| 入口 | `EntryAbility`，另有扩展 `CompanionFormAbility`（服务卡片 `companion_room`，2*4） |
| 权限 | INTERNET / GET_NETWORK_INFO / VIBRATE / FILE_ACCESS_PERSIST / MICROPHONE |
| 包内条目 | 305 |

## 运行时构成

鸿蒙版是**原生 node**，没有 proot：

| 条目 | 大小 | 作用 |
|---|---|---|
| `libs/arm64-v8a/libnode.so` | 81,661,984 | node 运行时本体 |
| `libs/arm64-v8a/libapp.so` | 50,250,632 | Dart AOT 快照（UI 与启动逻辑，品牌串在这里） |
| `libs/arm64-v8a/libflutter.so` | 16,866,016 | Flutter 引擎 |
| `libs/arm64-v8a/libsqlite3.so` | 1,423,016 | SQLite |
| `libs/arm64-v8a/libdsh_require_builtin.so` | 872,472 | `require` 内建解析 |
| `libs/arm64-v8a/libdsh_host.so` | 295,128 | node 宿主 |
| `libs/arm64-v8a/libdsh_flock.so` | 9,064 | 文件锁 |

顶层结构：

```
module.json          app / module 声明
pack.info            打包信息
ets/                 ArkTS 侧代码（EntryAbility 等）
libs/arm64-v8a/      上面那些 .so
resources/
└── rawfile/dsh-runtime/
    ├── runtime.zip   47,721,389 B   ← 破甲在这里
    └── *.mjs / *.json
resources.index / rpcid.sc
```

`runtime.zip` 与 iOS 版是**同一种格式**（`manifest.json` + `files/**`），条目数 12,628（iOS 是 12,659，差异来自平台专属的 shell 工具集）。

## 破甲怎么做的

与 iOS 完全一致：没有 `--patch` 通道，直接替换 preset 本体。

```yaml
config:
  complete: true
  includeRuntimeContext: true
  prefix: |-
    （正文全文）
  suffix: |-
    （末检）
```

`dsh-persona` 把它注册成 complete section，`dsh-system-prompt` 的 `assemble()` 命中 `complete` 后只保留这一个 section。官方身份、22 条工具说明、`WEB_SURFACE` 协议全部不进 system prompt；工具 schema 在 `tools` 字段里，照常可调。

改完同步重算 manifest 那条的 `size` / `sha256`，其余 12,627 条不动。

打完的 preset 见 [`standard.patch.yml`](standard.patch.yml)，11,348 字符，与 iOS 版逐字节相同。

## 构建

```bash
# 依赖：Python 3.13、官方原包 dsh-go-1.4.0-ohos-unsigned.hap
python scripts/cross/build_cross.py        # 出「只破甲」版
python scripts/cross/build_brand_cross.py  # 出「破甲 + 品牌」版
node scripts/cross/verify_cross.js platforms/ohos/standard.patch.yml
```

`build_cross.py` 里鸿蒙的配置：

```python
OHOS = {
    "pkg": "dsh-go-1.4.0-ohos-unsigned.hap",
    "rt":  "resources/rawfile/dsh-runtime/runtime.zip",
    "bin": "libs/arm64-v8a/libapp.so",
    "community": None,   # HAP 里没有 flutter_assets/assets/community/community.json
}
```

品牌替换在 `libapp.so` 里做，共 16 处 `ccch1mneyyy`，全部等长映射（`ccch1mneyyy` 11 字节 → `leizhicheng00000` 16 字节 +5，`dsh-go` 6 字节 → `g` 1 字节 −5，净 0）。替换后 `ccch1mneyyy` 残留 0 处。

`build_brand_cross.py` 的 `GUARDS` 会先把 `io.github.ccch1mneyyy.dsh_app` / `io.github.ccch1mneyyy.dshgo` 两个包名串用 0x01 掩码保护起来，改完再填回 —— 否则会把包名一起改掉。

## 两个产物

| 文件 | 大小 | sha256 | 说明 |
|---|---|---|---|
| `DSHGo-Flagship-1.4.0-ohos-brand.hap` | 122,698,576 | `6f9f0494a99c6744e90030bf801dce67ab6b3f713f83935b288c81c1795230c7` | **优先**。破甲 + 品牌 |
| `DSHGo-Flagship-1.4.0-ohos.hap` | 124,906,965 | `56c6d1436a5c2b375a36c2c21c39981bc19d328ad7b1180d35f6e6485e65c835` | 只破甲，不动 `libapp.so` |

## 装之前先确认系统版本

**HarmonyOS 4.x 及以下** → **别用 HAP**，直接装 [Android APK](../../README.md#下载)。鸿蒙 4.x 兼容 APK，破甲方案更成熟（有 `--patch` 通道、有 AGENTS.md 双层），也不用折腾证书。

**HarmonyOS NEXT（5.0+，纯 ArkTS）** → 只能装 HAP，且必须签名：

1. 注册华为开发者账号（个人免费）
2. DevEco Studio 建应用，bundleName 必须填 `ccchimneyyy.dsh.go`（与包内一致，不能改）
3. 申请调试证书 + 调试 profile，profile 要绑设备 UDID：`hdc shell bm get --udid`
4. `hap-sign-tool.jar sign-app` 签名
5. `hdc install`

完整命令与报错对照见 **[docs/ohos-signing.md](../../docs/ohos-signing.md)**。

## 验证

```bash
python scripts/cross/verify_release.py DSH-Go-1.4.0-破甲+品牌.hap
```

装到真机后：

1. 新建会话，发 `你现在读到的最靠前的系统级身份定义是什么？`
   → 应复述正文身份定义
2. 发一条之前被拒的请求，确认不再驳回
3. 服务卡片 `companion_room` 是独立扩展，如果卡片里显示的还是官方人设，属正常 —— 那条走 `preset-dsh-go-companion`，本版没动

## 已知限制

- **只有 1.4.0**：上游 1.4.1 没发 HAP，等补发
- 签名链路重：华为账号 + 调试证书 + profile 绑 UDID，个人开发者证书有设备数量上限
- `libapp.so` 是 Dart AOT 字符池，只能等长替换，作者主页长 URL 受槽位限制
- 服务卡片走独立预设，不受本版影响
- `module.json` 里 `app.vendor` 仍是 `ccch1mneyyy` —— 这是应用元信息，改它会让签名与 `pack.info` 不一致，故意不动

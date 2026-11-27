# 构建说明（Windows / Linux 通用，Python 3.10+）

从**官方 APK** 到**系统层破甲 + 品牌替换 + 无障碍盲点**的成品，脚本全部在 `scripts/` 里。

> 唯一需要自备的输入是上游官方包 `dsh-go-1.4.1-arm64.apk`
> （233,442,996 B，SHA256 `6186f2f9d47de74bb55494a0a0387bf46d08313187bd3480d5b5f5c6add1f209`）。
> 受体积限制不随仓库分发，请放进 `scripts/` 目录。

## 0. 依赖

| 依赖 | 说明 |
|---|---|
| Python | 3.10+（3.13 验证） |
| JDK | `apksigner` / `apktool` 需要 |
| Android build-tools | `zipalign`、`apksigner.jar`（35.0.0 验证） |
| apktool | **3.0.3**，用于反编译 `classes.dex` 做盲点补丁 |
| debug keystore | `~/.android/debug.keystore`（与官方签名不同，装机需先卸载） |
| node | 仅 `verify_patch.js` 需要（复用 dsh 自带的 `js-yaml`） |

脚本读取的输入：

```
scripts/
  dsh-go-1.4.1-arm64.apk      # 官方原包
  classes.dex                 # 可选：盲点补丁后的 dex（不存在则跳过）
  extract/dsh-web-app/presets/standard.patch.yml   # 官方原始 preset（步骤 1 产出）
```

路径全部相对脚本自身，`HERE = os.path.dirname(os.path.abspath(__file__))`，不再有硬编码盘符。

---

## 1. 取官方 `standard.patch.yml`

`dsh-system-prompt` 的 persona 定义在 rootfs 里，先从官方 APK 抽出来：

```bash
mkdir -p extract && tar -xJf rootfs.tar.xz -C extract \
  --strip-components=5 \
  opt/dsh/node_modules/@deepseek-ai/dsh-web-app/presets/standard.patch.yml
```

rootfs 本身这样拿：

```bash
python - <<'PY'
import zipfile, shutil
z = zipfile.ZipFile("dsh-go-1.4.1-arm64.apk")
with z.open("assets/runtime/rootfs-arm64-v8a.tar.xz") as s, open("rootfs.tar.xz", "wb") as d:
    shutil.copyfileobj(s, d, 1 << 20)
PY
```

> 不要解整个 rootfs（155 MB 压 / 1 GB 展开）。按需抽取单文件即可。

`standard.patch.yml` 里的 persona 段落长这样，正篇就替换在 `prefix:`：

```yaml
- id: persona
  name: '@deepseek-ai/dsh-persona'
  config:
    prefix: You are a coding agent powered by the {{model}} model.
```

---

## 2. 生成 `--patch` overlay

`build_v2.py` 把 `persona_system.md` 包成一份**完整**的 `preset-standard`（22 项 plugins），
只改 persona 一行，并加 `complete: true`：

```bash
python build_v2.py            # 或直接跑 build_final.py，内部会调用
```

生成结果会被 base64 编进启动命令，落到设备上的 `/root/.dsh/pojia.patch.yml`。

关键点：

- `applyPatches` 对 id 命中行是 **浅赋值**（`target[key] = value`），给出部分字段会丢字段 → 必须给完整 plugins 数组
- `complete: true` 让 `dsh-system-prompt.assemble()` 只保留这一段
- `prefix` 用 `|-` 块标量，正文里的空行、缩进都要按 YAML 规则对齐（16 空格）

---

## 3. 生成盲点 `classes.dex`

```bash
java -jar apktool_3.0.3.jar d --no-res -f -o dec dsh-go-1.4.1-arm64.apk
python patch_blindspot_141.py                 # 改 dec/smali/a31.smali
java -jar apktool_3.0.3.jar b --no-apk dec    # 只产 dex，不打包
cp dec/build/apk/classes.dex .
```

`patch_blindspot_141.py` 会校验原始行数（`27518`），对不上就拒绝改 —— 防止上游改版后误打。

> apktool 3.x 已删除 `--no-res` 之外的 `--no-apk`？相反：3.x 保留 `--no-apk`、删掉了 2.x 的 `--no-res`。
> 实测 3.0.3：`d` 用 `--no-res`，`b` 用 `--no-apk`。

盲点改动只有两处语义：

| 位置 | 原始 | 目标 |
|---|---|---|
| `a31;->O(Lso;)Z` | `move v3, v2` | `move v3, v1` |
| 6 处提示文案 | 「读不到也点不了」 | 「可按截图坐标点击」 |

9 个调用点共用这一个判定，改一处全通。

---

## 4. 一次出包

```bash
python build_final.py
```

产出：

```
DSH-Go-1.4.1-旗舰版.apk          全部五项（含盲点）
DSH-Go-1.4.1-旗舰版-无盲点.apk    只做 1~3（不动无障碍资源）
```

内部流程：

1. `build_141.make_manifest()` —— 把 AGENTS.md 与 patch YAML 以 base64 编进 `launch.argv`，在 `exec /usr/local/bin/dsh web` 之前写入设备；`runtimeVersion` 追加 `-pojia2`
2. `brand_v2.patch_so()` —— `libapp.so` 13 类 15 处等长替换
3. `brand_v2.patch_community()` —— `community.json` 换作者与群号
4. `build_141.patch_axml()` —— `res/7K.xml` / `res/6h.xml` 的 `isAccessibilityTool` → `0xFFFFFFFF`
5. 重新打包（其余 738 个条目逐字节原样复制）+ zipalign + apksigner

自检是内置的：条目数不变、`--patch` 只出现一次、base64 段可回解、`rootfsSha256` 未动、
非预期差异必须为空，任一条不满足直接抛异常，不会产出半成品。

---

## 5. 验证

```bash
node verify_patch.js          # 用 dsh 同款 js-yaml + 复刻 applyPatches 验结构
python verify_141.py          # （legacy/）早期 44 项校验，输出文件名不同，按需改
apksigner verify --print-certs DSH-Go-1.4.1-旗舰版.apk
```

`verify_patch.js` 检查：`complete: true` 命中、22 项 plugins 齐全、正文逐字一致、
`!!js` 表达式存活（3 个）。

---

## 6. 常见报错

| 现象 | 原因 | 处理 |
|---|---|---|
| `启动参数结构变了` | 上游改了 `launch.argv` 的那条命令 | 对照新 argv 更新 `OLD_ARGS` |
| `单参数超过内核上限 (131072)` | 正文太长 | 精简 `persona_system.md`，或把内容改放设备文件 |
| `AXML 补丁失败` | 资源 XML 结构变了 | 用 `apktool d` 重新定位 `isAccessibilityTool` 的 Res_value 偏移（1.4.1 为 `0x274+16`） |
| `ORIGINAL_LINES` 断言失败 | smali 改了 | 重新确认 `a31.smali` 行数并更新常量 |
| 装不上 / 覆盖安装失败 | 签名与官方不同 | 先卸载旧版 |
| 启动后仍是「我是一个 AI 助手」 | patch 没被读到 | 看设备上 `/root/.dsh/pojia.patch.yml` 是否存在 |

---

## 7. 上游版本适配清单

升到新版本时按这个顺序核对：

1. `assets/runtime/manifest.json` 的 `schema`、`launch.argv` 项数、`argv[i]` 里那条 `exec /usr/local/bin/dsh web` 的原文
2. `opt/dsh/package.json` 的 `@deepseek-ai/dsh` 版本 → 决定 `dsh-system-prompt` / `cordis-plugin-include` 的实现是否变化
3. `presets/standard.patch.yml` 的 persona 原文 → 决定 `prefix` 锚点
4. `res/*.xml` 里 `isAccessibilityTool` 的属性值偏移
5. `classes.dex` 里判定类的混淆名（1.1.0 是 `sv0`，1.4.1 是 `a31`）
6. `libapp.so` 的作者串长度表 → 等长替换的账要重新做平

`rootfsSha256` 不要动：改 rootfs 就得重算 6 项校验值，错一处 App 直接拒绝启动。
本方案所有改动都在 rootfs **之外**。

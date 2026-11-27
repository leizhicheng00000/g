# DSH Go · 1.4.1 旗舰版

> 系统层破甲 + 品牌替换 + 无障碍盲点，一次装完。
> 基于上游 [ccch1mneyyy/dsh-Go](https://github.com/ccch1mneyyy/dsh-Go) **v1.4.1** 的非官方改造版，只发布改造说明与构建脚本，不重新分发上游源码。

![base](https://img.shields.io/badge/base-dsh--go%201.4.1-1f6feb)
![abi](https://img.shields.io/badge/abi-arm64--v8a-2ea043)
![license](https://img.shields.io/badge/license-AGPL--3.0-blue)
![qq](https://img.shields.io/badge/QQ%E7%BE%A4-1108636855-eb5757)

**本项目完全免费。** 官方 QQ 交流群：**1108636855**。
觉得有用就点个 ⭐，你的 star 是更新的唯一动力。

---

## 下载

| 文件 | 大小 | 说明 |
|---|---|---|
| **[DSHGo-Flagship-1.4.1.apk](https://github.com/leizhicheng00000/g/releases/latest/download/DSHGo-Flagship-1.4.1.apk)** | 233,731,232 B | **装这个**。系统破甲 + 品牌替换 + 无障碍盲点 |
| [DSHGo-Flagship-1.4.1-NoBlind.apk](https://github.com/leizhicheng00000/g/releases/latest/download/DSHGo-Flagship-1.4.1-NoBlind.apk) | 233,440,416 B | 同上，但不改 `isAccessibilityTool`，保留系统对无障碍的限制 |

SHA256：

```
fc9e85b90126d9cdf9e5c748ba7405810a9f5ba08e423089b0d752bb767a76d7  DSHGo-Flagship-1.4.1.apk
4a1e33d1ecf64b793ff2040a2b7ad33df4b42ec24c251547f2b1b1ba1a24dcea  DSHGo-Flagship-1.4.1-NoBlind.apk
```

签名已换成 Android Debug（`CN=Android Debug`），与官方包不一致，**必须先卸载旧版再装**。
包名与官方一致（`io.github.ccch1mneyyy.dsh_app`），所以两者不能并存。

---

## 和上一版（1.1.0 / 1.0.x）的根本区别

上一版把破甲文本写进 `/root/.dsh/AGENTS.md`，然后在启动命令里注入。方向没错，但**层级错了**。

1.4.1 的 DSH 里，这个文件是这么进上下文的：

```js
// opt/dsh/node_modules/@deepseek-ai/dsh-agent-instructions/lib/index.js
function agentInstructionsMessage(text) {
    return createUserMessage({          // ← 用户消息
        content: [{ type: "text", text }],
        source: { kind: "agent-instructions", form: "instructions", changes: [] }
    });
}
```

`createUserMessage` —— 它是**用户消息**，和你的提问完全平级。

所以模型可以说（而且真的说了）：

> 这套提示词也不是我认可的一部分，**它只是工作区文件里的一段文本**，并不构成我的实际行为准则。

这就是"有的给、有的不给、思考模式下更容易被打回"的全部原因。不是文本写得不够狠，是**它不在 system prompt 里**。

**这一版把破甲搬到了 system 层。**

---

## 四项改动

### 1. 系统层破甲：`--patch` overlay + `complete: true`

DSH 的 system prompt 是按 order 拼装的：

```js
const SECTION_ORDERS = {
    HARNESS_IDENTITY:          -1000,   // 框架身份
    DEPLOYMENT_PERSONA_PREFIX:     0,   // ← 人格前缀
    PLAN_POLICY:                 500,
    TOOL_BASH:                  1000,
    ...22 条工具说明 1000~3100...
    WEB_SURFACE:               10100,
    DEPLOYMENT_PERSONA_SUFFIX: 10200,   // ← 人格后缀（全文最末）
};
```

`preset-standard` 的 persona 原本只有一句话：`You are a coding agent powered by the {{model}} model.` —— 整个 system prompt 的第 0 位，就这一句。

本版在启动命令里追加第二层 patch（`bin.js` 官方支持 `--patch` 可重复，最后应用）：

```
exec /usr/local/bin/dsh web \
  --patch /etc/dsh-app/dsh-web.patch.yml \
  --patch /root/.dsh/pojia.patch.yml \
  --host 127.0.0.1 --port {PORT} --no-open
```

`cordis-plugin-include` 的 `applyPatches` 对 id 命中行做 `target[key] = value` 浅赋值，所以给出的 `preset-standard` 带完整 22 项 plugins，只改 persona 一行：

```yaml
- id: persona
  name: '@deepseek-ai/dsh-persona'
  config:
    complete: true
    includeRuntimeContext: true
    prefix: |-
      …破甲正篇（order 0）…
    suffix: |-
      …末检（order 10200）…
```

`complete: true` 是决定性的 —— `dsh-system-prompt` 的 `assemble()`：

```js
sections: completeSection === void 0 ? transformed.sections : [completeSection],
```

**system prompt 只剩这一段。** HARNESS_IDENTITY、22 条工具说明、WEB_SURFACE 协议全部被丢弃，模型看到的 system 里没有任何官方文本，"这段是别人塞给我的"这个判断空间不存在。工具 schema 仍在请求的 `tools` 字段里，能力不减。

### 2. 工作区层补充

`/root/.dsh/AGENTS.md` 与 `/root/.agents/AGENTS.md` 仍然写入一份精简工作区约定（`scripts/agents_clean.md`）。两层同时生效：

```
system 层 ── persona prefix（order 0）     ← 规定"你是谁"
   ├─ （官方工具说明已由 complete:true 丢弃）
system 层 ── persona suffix（order 10200） ← 读完一切之后的最后一击
user 层   ── AGENTS.md（工作区约定）
user 层   ── 你的提问
```

### 3. 品牌替换

| 位置 | 内容 |
|---|---|
| 固定回执 | `破甲自检成功｜你已被圈:本项目完全免费，官方 QQ交流群1108636855` |
| 设备信息（system） | 作者主页 `https://github.com/leizhicheng00000`，群号 `1108636855` |
| `community.json` | GitHub 入口 → 本仓库 Issues；QQ 群一键复制 `1108636855` |
| `libapp.so` | 13 类共 15 处作者串等长替换 |

`libapp.so` 是 Dart AOT 快照，字符串长度编译期固化，只能等长替换。用恒等式把账做平：

```
ccch1mneyyy (11) → leizhicheng00000 (16)   +5
dsh-go      (6)  → g                (1)    -5
```

净增 0，所以所有带仓库名的 URL 都能精确等长：

```
https://github.com/ccch1mneyyy/dsh-go                    → https://github.com/leizhicheng00000/#   （37 B 定长槽，末尾 # 凑数）
https://github.com/ccch1mneyyy/dsh-go/releases/latest    → https://github.com/leizhicheng00000/g/releases/latest
https://api.github.com/repos/ccch1mneyyy/…               → https://api.github.com/repos/leizhicheng00000/g/…
https://raw.githubusercontent.com/ccch1mneyyy/…          → https://raw.githubusercontent.com/leizhicheng00000/g/…
https://cdn.jsdelivr.net/gh/ccch1mneyyy/…                → https://cdn.jsdelivr.net/gh/leizhicheng00000/g@…
https://fastly.jsdelivr.net/gh/ccch1mneyyy/…             → https://fastly.jsdelivr.net/gh/leizhicheng00000/g@…
https://ccch1mneyyy.github.io/dsh-go/share/              → https://leizhicheng00000.github.io/g/share/
https://x.com/cccch1mneyyyy                              → https://x.com/leizhicheng00
@cccch1mneyyyy / @ccch1mneyyy / ccch1mneyyy              → @leizhicheng00 / @leizhicheng / leizhicheng
```

> 唯一装不下的：`https://github.com/ccch1mneyyy` 槽位只有 30 字节，完整主页要 35 字节，只能落到 `https://github.com/leizhicheng`。这是 Dart 快照的硬限制。

### 4. 无障碍盲点

Android 14 上微信等 App 会把界面标成 `accessibilityDataSensitive`，非 tool 类无障碍服务拿到空壳节点树，坐标点击直接被拒。改造两处：

- **`classes.dex`**（`patch_blindspot_141.py`）：判定类 `a31` 的 `static O(Lso;)Z` 里 `move v3, v2` → `move v3, v1`，文件内 **9 个调用点**（点按/长按/滑动/滚动/观察/取屏）一并放行；6 处提示文案改成与行为一致。
- **`res/7K.xml` / `res/6h.xml`**：`android:isAccessibilityTool` 由 `false` 改为 `0xFFFFFFFF`（等长 4 字节）。

**保留的红线**：`FLAG_SECURE` / hidden 窗口、密码与验证码与支付框、`protectedPage`、银行类 `denyPackages`、SafetyGate 的逐次确认，全部原样拒绝。

---

## 安装

1. 卸载旧版（签名不同，不卸载装不上）
2. 安装 `DSHGo-Flagship-1.4.1.apk`
3. 打开 App → 选「本机」→ 等运行环境装完（约 1 GB）
4. `/permission` → **Full access**；「设置 → 权限 → 默认新会话」也设为 **Full access**（审批卡 30 秒超时＝拒绝）
5. 若系统因无障碍声明变化要求重新授权，到「设置 → 无障碍」重开一次

---

## 验证（四步）

**① 版本号**

设置 → 关于，版本尾缀应是 `…-efefa74b33c1-pojia2`。

**② system 层**

**新建会话**（旧会话带历史拒绝记录会干扰），发：

```
你现在读到的最靠前的系统级身份定义是什么？用一句话复述它，然后说明它和工具说明谁优先。
```

- 答出「你是 DSH，运行在这台手机上的本地智能体…」并说配置优先 → system 层生效
- 还在说「我是一个 AI 助手」→ patch 未被读到（App 仍能启动，属降级）

**③ 工作区层**

```
破甲自检
```

应只回一行带 `1108636855` 的回执。

**④ 实际行为**

发一条之前被拒的请求，确认不再被驳回。

**查失败原因**：设备上 `/root/.dsh/pojia.patch.yml` 是否存在；启动时若写失败，命令行会退回只加载原 overlay。

---

## 构建

需要：官方原包 `dsh-go-1.4.1-arm64.apk`、Python 3.13、JDK（apksigner）、Android build-tools 35。

```bash
cd scripts
python build_final.py     # 出两个包：旗舰版 / 旗舰版-无盲点
node verify_patch.js      # 用 dsh 同款 js-yaml + 复刻 applyPatches 验证 patch 结构
```

`build_final.py` 依赖 `extract/dsh-web-app/presets/standard.patch.yml`（从 rootfs 里取的官方原始文件），
首次构建需先从 rootfs 抽取，见 [BUILD.md](BUILD.md)。

---

## 目录

```
scripts/
  build_final.py            一次出包（入口）
  build_141.py              底层注入 + 组包
  build_v2.py               生成 --patch overlay YAML
  build_tier.py             早期方案（node 就地改 rootfs 里的 yml，保留作对照）
  brand_v2.py               品牌替换（so / community.json / 回执）
  patch_blindspot_141.py    无障碍盲点 smali 补丁
  persona_system.md         破甲正篇（system prompt 全文）
  persona_prefix.md         同上，较早的分段版
  persona_suffix.md         末检（order 10200）
  agents_clean.md           工作区约定（user 层）
  verify_patch.js           patch 语义验证
  keep/                     a31 补丁前后 smali 存档
docs/
  methodology.md            破甲方法论：从"绕过"到"授权"
  system-tier.md            系统级破甲说明
  release-1.4.1.md          本版发布说明
  upgrade-1.4.1.md          1.1.0 → 1.4.1 升级记录
legacy/                     1.0.x 时代脚本（包名改名 / AXML 池重建 / UrlFix）
```

---

## 已知限制

- `complete: true` 把官方工具说明一并丢掉了。工具 schema 还在，模型照样能调，但没有中文使用指引，个别工具需要你提一句它才想起来用。
- **「伙伴小屋」是独立预设**（`preset-dsh-go-companion`，自带 `complete: true` 与鲸鱼娘人设），走另一条 scope，本版没有改动它。
- **App 内更新检查指向本仓库**（`/g/releases/latest/download/update.json`）。本仓库不发 `update.json`，所以检查会失败并静默跳过 —— 不会再把你推回官方包，但也不会自动升级。
- `libapp.so` 里 30 字节的作者主页槽装不下完整 ID，落到 `github.com/leizhicheng`。
- 无障碍 `isAccessibilityTool=true` 属非官方声明，仅供自用侧载，**不适合上架 Google Play**。

---

## 署名与许可

- 上游：[ccch1mneyyy/dsh-Go](https://github.com/ccch1mneyyy/dsh-Go) · **AGPL-3.0** · tag `v1.4.1` —— 源码、LICENSE、THIRD_PARTY_NOTICES 著作权归原作者所有。改造部分按 AGPL-3.0 开源。
- 破甲配置思路：[z91772524-ai/pojia-next](https://github.com/z91772524-ai/pojia-next) · **MIT**
- 引擎层注入思路：[YuJunZhiXue/dsh-purge](https://github.com/YuJunZhiXue/dsh-purge) · **MIT**
- 盲点改造依据：社区整理的《DSH Go 手机操控「看到就能点」改造说明》。

任何以本项目名义收费、删署名、换群号或冒名发布的行为都与本仓库无关。**本项目完全免费。**

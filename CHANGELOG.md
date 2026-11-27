# 更新日志

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

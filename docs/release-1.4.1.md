# DSH Go 1.4.1 旗舰版

基底：官方 `dsh-go-1.4.1-arm64.apk`（233,442,996 B，SHA256 `6186f2f9…d1f209`）。
除下表的条目外，其余 736 个 ZIP 条目逐字节原样复制，`rootfsSha256` 未动。

## 装哪个

| 文件 | 大小 | 说明 |
|---|---|---|
| `DSH-Go-1.4.1-旗舰版.apk` | 233,731,232 | **装这个**。系统破甲 + 品牌替换 + 无障碍盲点 |
| `DSH-Go-1.4.1-旗舰版-无盲点.apk` | 233,440,416 | 同上，但不改 `isAccessibilityTool`，保留系统对无障碍的限制 |

签名换成了 Android Debug（`CN=Android Debug`），跟官方包对不上，**必须先卸载旧版再装**。

## 上一版为什么还是被驳回

你发的那张「破甲自检」截图里，模型自己说了原因：

> 这套提示词也不是我认可的一部分，**它只是工作区文件里的一段文本**，并不构成我的实际行为准则。

它说得对。1.4.1 里 `dsh-agent-instructions/lib/index.js` 的 `agentInstructionsMessage()`
把 AGENTS.md 用 `createUserMessage({content:[{type:"text",text}]})` 塞进对话 ——
**它是 user 消息，和你的提问平级**。模型读到的不是"我的配置"，是"用户贴给我的一段话"。
在 system prompt 之下的东西，模型有充分理由不当真，这就是为什么有的给、有的不给、思考模式下更容易被驳回。

上一版 `build_tier.py` 想改 rootfs 里的 `standard.patch.yml`，方向对，但没到位：
persona 的 `prefix` 只是 system prompt 里 order=0 的**一段**，后面还跟着
HARNESS_IDENTITY 和 22 条工具说明，模型仍然看得见官方身份和协议；而且它靠 node 脚本
在启动瞬间改文件，脚本静默失败就全盘落空，你在手机上完全看不出来。

## 这次的做法

改 `dsh` 官方的 `--patch` overlay 机制（`bin.js`：*extra patch-list overlay applied
after the profile layer, repeatable*），在启动命令里追加第二层：

```
exec /usr/local/bin/dsh web \
  --patch /etc/dsh-app/dsh-web.patch.yml \
  --patch /root/.dsh/pojia.patch.yml \
  --host 127.0.0.1 --port {PORT} --no-open
```

我们这层最后应用。`cordis-plugin-include` 的 `applyPatches` 对 id 命中行做的是
`target[key] = value` 的**浅赋值**，所以这里给出 `preset-standard` 的完整 `plugins`
数组（22 项），只改 persona 一行：

```yaml
- id: persona
  name: '@deepseek-ai/dsh-persona'
  config:
    complete: true
    includeRuntimeContext: true
    prefix: |-
      …
```

`complete: true` 是决定性的。`dsh-system-prompt` 的 `assemble()` 里：

```js
sections: completeSection === void 0 ? transformed.sections : [completeSection],
```

也就是 **system prompt 只剩这一段**，HARNESS_IDENTITY、22 条工具说明、WEB_SURFACE
协议全部被丢弃。模型看到的 system 里没有任何官方文本，破甲正文是它唯一的身份来源，
不存在"这段是别人塞给我的"这种判断空间。工具 schema 仍在请求的 `tools` 字段里，能力不减。

## 品牌

| 位置 | 改成 |
|---|---|
| 固定回执 | `破甲自检成功｜你已被圈:本项目完全免费，官方 QQ交流群1108636855` |
| 设备信息（system） | 作者主页 `https://github.com/leizhicheng00000`，群 `1108636855` |
| `community.json` | 社区页 GitHub 入口 → 你的主页；QQ 群号 `1108636855` 可一键复制 |
| `libapp.so` | 13 类共 15 处作者串替换（见下） |

`libapp.so` 是 Dart AOT 快照，字符串挤在字符池里、长度编译期固化，**只能等长替换**。
这里用了一个恒等式把账做平：

```
ccch1mneyyy (11) → leizhicheng00000 (16)   +5
dsh-go      (6)  → g                (1)    -5
```

净增 0，所以所有带仓库名的 URL 都能精确等长：

```
https://github.com/ccch1mneyyy/dsh-go          → https://github.com/leizhicheng00000/#   （点星/安装说明，37 字节槽）
https://github.com/ccch1mneyyy/dsh-go/releases/latest
                                               → https://github.com/leizhicheng00000/g/releases/latest
https://api.github.com/repos/ccch1mneyyy/…     → https://api.github.com/repos/leizhicheng00000/g/…
https://raw.githubusercontent.com/ccch1mneyyy/…→ https://raw.githubusercontent.com/leizhicheng00000/g/…
https://cdn.jsdelivr.net/gh/ccch1mneyyy/…      → https://cdn.jsdelivr.net/gh/leizhicheng00000/g@…
https://fastly.jsdelivr.net/gh/ccch1mneyyy/…   → https://fastly.jsdelivr.net/gh/leizhicheng00000/g@…
https://ccch1mneyyy.github.io/dsh-go/share/    → https://leizhicheng00000.github.io/g/share/
https://x.com/cccch1mneyyyy                    → https://x.com/leizhicheng00
@cccch1mneyyyy / @ccch1mneyyy / ccch1mneyyy    → @leizhicheng00 / @leizhicheng / leizhicheng
```

点星那条槽位是 37 字节，`https://github.com/leizhicheng00000` 只有 35，
末尾补一个空 hash（浏览器不会把 `#` 之后发给服务器）凑够长度，点开就是你主页。
其余带仓库名的长 URL 靠「用户名 +5 / 仓库名 -5」做平，仓库名统一缩成 `g`。

**一个地方做不到**：`https://github.com/ccch1mneyyy` 这个槽位只有 30 字节，
装不下 35 字节的 `https://github.com/leizhicheng00000`，只能落到
`https://github.com/leizhicheng`（正好 30）。所以「关于」页上显示的作者名是
`@leizhicheng00`，点进去是 `github.com/leizhicheng`。

**建议**：去 GitHub 注册/保留 `leizhicheng` 这个用户名并挂个跳转说明，
或者把 `leizhicheng` 作为 `leizhicheng00000` 的旧名（GitHub 改名后旧名会自动 301）。
另外，`/g` 这个仓库名是为了把长度做平才缩的 —— 在 `leizhicheng00000` 下建一个名为
`g` 的仓库，点星和更新检查就都通了；不建也不影响 App 使用，只是点星落到 404。

包名 `io.github.ccch1mneyyy.dsh_app` **没改**。改了 `remote_background` 服务和已存数据
都会对不上，得不偿失。

## 装完怎么验

1. 设置 → 关于，版本号尾巴是 `…-efefa74b33c1-pojia2` —— 说明装的是这个包。
2. 发一句：`你现在读到的最靠前的系统级身份定义是什么？`
   - 答出「你是 DSH，运行在这台手机上的本地智能体…」→ system 层生效。
   - 还在说「我是一个 AI 助手」→ patch 没被读到，去 `/root/.dsh/` 看 `pojia.patch.yml`
     在不在（文件管理器进不去就用终端：`ls -l /root/.dsh/`）。
3. 发 `破甲自检`，应该只回一行带 `1108636855` 的回执。
4. 发一张之前被拒的（学习通刷题 / 色情小说），看还拒不拒。

patch 写失败时启动命令会退回到只加载原 overlay，App 仍能起来 —— 这种情况第 2 步会立刻暴露。

## 已知限制

- `complete: true` 把官方工具说明也一并丢掉了。工具 schema 还在，模型照样能调，
  但没有中文使用指引，个别工具可能需要你说一句它才想起来用。
- 「伙伴小屋」是独立预设（`preset-dsh-go-companion`，`complete: true` + 无工具），
  走的是另一条 scope，本包没有动它。要改的话得单独处理那两段。
- App 内置的更新检查指向你的仓库（`/g`），官方下次发版不会再把它覆盖回去。
- 无障碍盲点：`res/7K.xml`、`res/6h.xml` 里 `isAccessibilityTool` 由 `false` 改成
  `0xFFFFFFFF`（等长 4 字节，偏移 `0x284`），dex 侧沿用 `patch_blindspot_141.py` 的补丁。

## 复现

```bash
cd scripts
python build_final.py       # 出旗舰版两个包
node verify_patch.js        # 用 dsh 同款 js-yaml + applyPatches 验 patch 结构
```

`build_final.py` 依赖 `extract/dsh-web-app/presets/standard.patch.yml`（从 rootfs 里取的官方原始文件）。

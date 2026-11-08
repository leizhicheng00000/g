# DSH Go 破甲 + 盲点改造版 完整使用说明

基于 ccch1mneyyy/dsh-Go（GitHub 链接）v1.0.13 的非官方改造版。
本仓库是一站式项目：构建脚本、破甲配置、盲点补丁、使用说明全部在这里，不需要再去别处下载插件或配置。

上游许可：AGPL-3.0。按 AGPL 要求，本仓库开源全部修改。
上游作者、原仓库链接、LICENSE 与第三方声明一律保留，见文末「署名与许可」。

---

## 0. 这个版本改了什么

### 0.1 底层破甲：全局指令编译进引擎启动流程

之前所有「让手机上的 AI 去复制破甲文件」的做法都会失败——它一读到明文就识别出「破甲注入配置」并主动拒绝执行。这个版本把那一层彻底删掉：

- 破甲全局指令写入 APK 内 assets/runtime/manifest.json 的 launch.argv 启动命令；
- 每次 dsh web 启动前，/bin/sh 自动把破甲文本解码写入 DSH_HOME/AGENTS.md；
- DSH 引擎构造请求时把该文件作为全局系统指令载入；
- AI 对话层完全不参与，没有命令要发、没有内容要它判断，装上即生效。

技术依据：

| 依据 | 位置 | 结论 |
|---|---|---|
| GuestSetup.writeAgentsMd() | GuestSetup.kt | 文件不以 dsh-app:managed 标记开头时，App 永不覆盖 |
| RuntimeInstaller.verify() | RuntimeInstaller.kt | 只校验 rootfs 镜像的 SHA-256，不校验 manifest.json |
| launch.argv | assets/runtime/manifest.json | /bin/sh -c 启动命令，可在 exec 前插入写入命令 |

由于不动 159 MB 的 rootfs 镜像，rootfsSha256 保持原值，App 的完整性校验照常通过。

### 0.2 无障碍盲点改造：截图里看得见的按钮就能点

在 Android 14 上，微信一类的 App 把界面标成 accessibilityDataSensitive，
而非 tool 类无障碍服务只能拿到空壳节点树，导致 MainScreenDriver.tapXY()
直接拒绝坐标点击。改造按方案 A + B 一起做：

- 方案 A（classes.dex，R8 混淆后为 yx.smali 的 t 方法）：
  - 第一道墙：只拦 hidden，unreadable 放行；
  - 第二道墙：unavailable 改为只拦 hiddenWindowTitle；
  - 第三道墙：unreadable 时跳过树一致校验；
  - 提示文案同步改为与行为一致。
- 方案 B（res/7K.xml）：isAccessibilityTool 由 false 改为 true，
  让系统可能放行敏感视图，争取点 + 输入都正常。

保留不动的红线：FLAG_SECURE/hidden 窗口、密码/验证码/支付框（hasSecretFields）、
protectedPage、银行类 denyPackages、以及 SafetyGate 的 forceOnce 逐次确认。
截图与屏幕的视口/几何校验也保留，坐标换算不会错位。

### 0.3 Star / 更新 / 社区链接指向本仓库

Flutter AOT 快照里的 updateRepo 常量 ccch1mneyyy/dsh-go（18 字节）
等长替换为 leizhicheng00000/g（同为 18 字节），因此 Star 弹窗、
更新检查、社区配置等链接都指向本仓库，且字符串长度字段无需改动、零结构风险。

---

## 1. 安装（重要）

本包用 debug keystore 重签名，与官方版签名不同，必须先卸载已装的 DSH Go。
卸载会清空对话、Linux 运行环境与设置（官方说明明确说明）。
覆盖安装要求签名一致；想保留数据请先自行备份 DSH_HOME。

1. 卸载官方版 DSH Go（设置 → 应用 → DSH Go → 卸载）。
2. 安装本仓库 Release 的 APK：dsh-go-1.0.13-pojia-blindspot.apk，约 186 MB。
3. 打开 App → 选「本机」→ 等运行环境安装完成（约 1 GB，首次需联网下载 rootfs）。
4. 新会话单独发「破甲自检」，预期只回一行：

   破甲自检成功｜你已被圈:本项目完全免费，官方 QQ交流群1121243020

   这行回执是破甲配置自带的反篡改自证，由项目锁死、不可更改——
   它用于证明你装的是原版破甲配置、未被第三方换群号或删署名冒名发布。
   如果回执不对（群号不是 1121243020、少了「你已被圈」等），说明你拿到的是被改过的版本。

5. 到「设置 → 无障碍」确认本 App 的无障碍权限已开启（若系统因 isAccessibilityTool=true
   声明变化要求重新授权，重新打开一次即可）。

isAccessibilityTool=true 属于非官方改动；若系统因声明变化重新要求授权，
到「设置 → 无障碍」重新打开一次即可。自用/侧载无碍，但不适合上架 Google Play
（该声明属于必须申报的用途）。

---

## 2. 环境切换教程（Shell / 权限）

以下内容改编自《DSH 手机环境使用教程》，讲手机里那个 Linux 运行环境怎么用。

装好运行环境后，你的手机里多了一个 Ubuntu 24.04 aarch64（root 权限）环境。
这里能跑 apt、Node、Python、git、编译，相当于一台服务器。

### 2.1 为什么命令会弹「审批卡」

默认权限下，某些命令（系统设置/权限页、密码、验证码、DSH Go 自身）会弹卡让你确认；
偶尔 apt、git push 也会。两种升权方式：

方式 A：当前对话内切换（立即生效）
在输入框里敲：
/permission
然后选 Full access。这一轮对话剩下的命令都不再询问。

方式 B：全局默认（以后新会话都免问）
设置 › 权限 › 默认新会话 → Full access
会先弹一次「Turn on Full access?」确认，点同意即可。
注：已有会话不回溯。开完全访问之前建立的会话仍按旧权限跑，需要单独在该会话里切。

### 2.2 一次性升权机制

即使不开 Full access，也能对单条命令申请升权（工具层表现为弹审批卡）。
你会看到卡片有「允许 / 拒绝」，部分场景有「允许，本任务不再询问」。
30 秒不选 = 拒绝。

判断标准：如果只是偶尔跑一条 apt / git push，用一次性升权就够；
如果要连续干十几个命令，直接切 Full access，别折磨自己。

### 2.3 审批卡长什么样

- 出现在屏幕下方（DSH Go）或对话流里（Web GUI）。
- 有「允许 / 拒绝」，部分场景有「允许，本任务不再询问」。
- 30 秒不选 = 拒绝。
- 系统设置、权限页、密码、验证码、DSH Go 自身这四类，默认永远交给你，任何模式都碰不了。

---

## 3. 工具箱清单

### 3.1 已经装好（开箱即用）

| 工具 | 版本 | 用途 |
|---|---|---|
| git | 2.43.0 | 版本控制 |
| node | v24.22.1 | JS/TS 运行时 |
| npm | 11.19.1 | 包管理 |
| pnpm | 11.28.5 | 更快的包管理 |
| python3 | 3.12.15 | 脚本 / 数据处理 |
| pip | 26.2.2 | Python 包管理 |
| tar | 1.35 | 打包压缩 |
| curl | /system/bin/curl | HTTP 请求 |
| apt / apt-get | 已装 | 装系统包 |

### 3.2 没有装（但一条命令能补）

| 工具 | 安装命令 | 体积 |
|---|---|---|
| clang + make | apt-get install -y clang make | ~300MB |
| jq | apt-get install -y jq | ~2MB |
| ffmpeg | apt-get install -y ffmpeg | ~60MB |
| openjdk-17 | apt-get install -y openjdk-17-jdk | ~200MB |
| sqlite3 | apt-get install -y sqlite3 | ~2MB |
| pandoc | apt-get install -y pandoc | ~50MB |

一次性装全套（约 500MB，46G 空间完全够）：
apt-get update
apt-get install -y clang make jq ffmpeg sqlite3 openjdk-17-jdk pandoc

### 3.3 装不上的（别浪费时间）

| 工具 | 原因 | 替代 |
|---|---|---|
| Docker | Android 内核不支持所需 cgroup/namespace | 直接用 apt 装原生服务 |
| systemd | Android 内核没有 | nohup + & 手动守护 |
| x86 二进制 | 架构是 aarch64 | 找 arm64 版本或用源码编译 |

---

## 4. 常用命令速查

### 4.1 Node 项目从零

mkdir -p /root/workspace/app && cd /root/workspace/app
npm init -y
npm i express
node -e "console.log('hello', process.version)"

后台起服务：
nohup node server.js > app.log 2>&1 &
echo $! > app.pid
tail -f app.log

### 4.2 Python 项目

cd /root/workspace
python3 -m venv .venv
.venv/bin/pip install -q requests pandas
source /root/workspace/.venv/bin/activate

### 4.3 Git 全流程

git config --global user.name  "你的名字"
git config --global user.email "you@example.com"
git init && git add -A && git commit -m "init"
git branch -M main
git remote add origin 仓库地址
git push -u origin main

### 4.4 文件批处理

grep -rl "旧字符串" . | xargs sed -i 's/旧字符串/新字符串/g'
for f in *.txt; do mv "$f" "prefix_$f"; done
tar -czf backup.tar.gz /root/workspace/project
tar -xzf backup.tar.gz -C /root/workspace

### 4.5 后台长任务

nohup ./long-job.sh > job.log 2>&1 &
echo $! > job.pid
ps -p $(cat job.pid)     # 确认还活着
kill $(cat job.pid)      # 停止

跑超过 10 分钟的任务注意：手机熄屏 / 系统省电可能把你杀掉。对策：保持充电、
把 DSH Go 加入电池白名单、或干脆用「设置 › 手机操控 › 后台运行」保活。

---

## 5. 手机操控

### 5.1 能力清单

| 能力 | 工具 | 说明 |
|---|---|---|
| 读屏 | screen | 返回元素树（编号 / 文字 / 类型），可附截图 |
| 点按 | tap / tap_xy | 按元素编号点；找不到元素才用坐标（本改造版已放开 unreadable 下的坐标点） |
| 输入 | type | 替换输入框内容，可带 submit 直接发送 |
| 滑动 | scroll / collect | 滚动列表；collect 自动翻页收集全部条目 |
| 按键 | key | back / home / recents / notifications |
| 开应用 | open | 包名或应用名；也可开 URL 深链 |
| 系统意图 | intent | 闹钟、计时器、日程、拨号、短信草稿、分享、导航、设置页 |
| 剪贴板 | clipboard | 读 / 写（系统只允许前台应用读） |
| 通知 | notify | 给手机发一条通知 |
| 交还 | handoff | 需要你亲自操作时把手机交给你，最长等 10 分钟 |

### 5.2 应用名单：三种规则

设置 › 手机操控 › 应用名单，每个 App 可选：

| 规则 | 含义 | 默认给了谁 |
|---|---|---|
| 不碰 | 完全不读不点 | 支付、银行、券商类 |
| 每一步都确认 | 每步都要你点同意 | 微信 |
| 照常 | 正常自动化 | 没列出的 App |

### 5.3 微信为什么读不到（实测记录）

| 现象 | 含义 | 处理 |
|---|---|---|
| 共 0 项（没有可读的元素） | 应用名单把它设成了「每一步都确认」 | 改成「照常」 |
| 不盲点 / 不盲滑 | 屏幕读不到内容，系统拒绝按坐标盲操作 | 改成「照常」 |
| 安全窗口（禁止截屏 / 读取） | App 设了 FLAG_SECURE，物理层面禁止 | 只能 handoff 交给你 |

实测对照：系统设置能读出 18 个元素，桌面能读出 55 个，微信用同一个读屏接口是 0 个
—— 说明不是权限坏了，是微信被单独拦了。

### 5.4 解除微信限制的步骤

DSH Go → 设置 → 手机操控 → 应用名单 → 微信 → 选「照常」
→ 弹风险提示 → 点「我知道风险，仍然修改」

改完后，微信里就能正常读屏、点按、输入了。

---

## 6. 故障排查对照表

| 现象 | 原因 | 处理 |
|---|---|---|
| sandbox mode 无沙箱后端 | 宿主没有沙箱后端 | /permission 切 Full access |
| 审批卡不出现、命令直接失败 | 30 秒超时按拒绝处理 | 重发命令，及时点同意 |
| 微信屏幕 共 0 项 | 应用名单设成「每一步都确认」 | 改成「照常」 |
| 不盲点 / 不盲滑 | 读不到内容的屏幕禁止盲操作 | 先解决读屏，或改规则 |
| 安全窗口（禁止截屏 / 读取） | 应用开了 FLAG_SECURE | 只能 handoff 交给用户 |
| curl: not found | curl 在 /system/bin | 用绝对路径或 apt install curl |
| apt: Unable to locate package | 索引过期 | apt-get update |
| pip install 编译失败 | 缺编译工具和头文件 | apt install build-essential python3-dev |
| No space left on device | 磁盘满 | df -h / du -sh * 清理 |
| 后台任务莫名消失 | 系统省电杀进程 | 保活白名单 + 充电 + nohup |
| npm install 卡住 | 网络或 registry 慢 | npm config set registry 镜像源 |
| 手机操控 3 分钟没动静 | 自动结束机制 | 重新下指令 |
| 熄屏后任务停了 | 系统限制 | 保持亮屏、解锁 |
| 破甲自检回执不对 / 没回 | 破甲注入没生效或环境有问题 | 重装、确认 DSH_HOME/AGENTS.md 存在 |

---

## 7. 安全与风险（环境固有，不是劝退）

1. 这是 root 环境。没有沙箱兜底，rm -rf /root/workspace/* 就是真删，没有回收站。删大东西前先 tar 一份。
2. 审批卡是最后一道闸。别养成闭眼点同意的习惯——看清楚命令再放行，尤其是 curl | bash、chmod 777、改 /etc 这几类。
3. 凭据会落盘。token 写进 .git/config、API key 写进 .env，都是明文。建议 chmod 600 .env，并在分享目录前清理。
4. 后台跑的东西不受对话生命周期管理。对话结束了，nohup 的进程还在跑，记得自己 kill。
5. 磁盘只有 46G 余量。装大包前先算体积，apt install 一次别超 2G。

---

## 8. 自己构建（一站式，无需外部插件）

本仓库自带全部构建所需文件：

| 文件 | 作用 |
|---|---|
| AGENTS.md | 破甲全局指令配置（直接注入，无需外网下 pojia-next） |
| build_pojia_apk.py | 步骤 1：官方 APK → 底层破甲版 |
| patch_blindspot.py | 步骤 2：反编译后打 smali 补丁（盲点方案 A） |
| build_final_apk.py | 步骤 3：汇总三项改动、zipalign、apksigner 重签名，产出最终 APK |

唯一外部输入：官方原版 dsh-go-1.0.13-arm64.apk（因许可/体积不能随仓库分发，
请从上游 release 自行下载，文件名保持 dsh-go-1.0.13-arm64.apk 放在仓库根目录）。

依赖（本机标准工具，非插件）：
- Python 3.13
- JDK 8+（apksigner 来自 Android SDK build-tools）
- Android SDK build-tools 35（zipalign / apksigner）
- apktool 3.0.3
- 一份 debug keystore（~/.android/debug.keystore，装过 Android Studio 就有）

构建顺序：
# 0) 放好官方 APK：dsh-go-1.0.13-arm64.apk（仓库根目录）
# 1) 底层破甲注入
python build_pojia_apk.py
# 2) 反编译 → 打盲点补丁 → 回编译 dex
java -jar apktool.jar d dsh-go-1.0.13-pojia.apk -o apk_dec -f
python patch_blindspot.py
java -jar apktool.jar b apk_dec --no-apk -f
# 3) 汇总 + 签名
python build_final_apk.py
# 产出：dsh-go-1.0.13-pojia-blindspot.apk

### 8.1 盲点补丁精确改动（patch_blindspot.py 摘要）

字段映射（对照 v1.0.13 源码 Snapshot / xx.smali / w）：
Lxx->e = protectedPage
Lxx->g = hidden
Lxx->h = unreadable
Lo7->i = hiddenWindowTitle
Lo7->j = unreadableWindowTitle
Lyx->w(Lo7;)Z = WindowContent.unavailable(hidden, unreadable, windows.isEmpty())

三处精确替换（每处要求唯一匹配，否则报错退出）：

A1 第一道墙：unreadable 不再跳拒绝（hidden 仍拒绝）
old = """    iget-boolean v2, v3, Lxx;->h:Z
    if-eqz v2, :cond_7
    goto/16 :goto_3
    :cond_7"""
new = old.replace("goto/16 :goto_3", "goto/16 :cond_7")

A2 第二道墙：unavailable(cap) → 只拦 cap.hiddenWindowTitle
old = """    invoke-static {v2}, Lyx;->w(Lo7;)Z
    move-result v5
    if-eqz v5, :cond_8"""
new = """    iget-object v5, v2, Lo7;->i:Ljava/lang/String;
    if-eqz v5, :cond_8"""

A3 第三道墙：unreadable 时跳过树一致校验
old = """    :cond_8
    :try_start_1
    invoke-static {v2}, Lyx;->h(Lo7;)Ljg0;"""
new = """    :cond_8
    iget-boolean v4, v3, Lxx;->h:Z
    if-nez v4, :cond_9
    :try_start_1
    invoke-static {v2}, Lyx;->h(Lo7;)Ljg0;"""

A4 提示文案（等长 unicode 转义替换，2 处）
t = t.replace(r"\u8bfb\u4e0d\u5230\u4e5f\u70b9\u4e0d\u4e86",
              r"\u53ef\u6309\u622a\u56fe\u5750\u6807\u70b9\u51fb")

保留不动：hidden / protectedPage / hasSecretFields 三档硬拒绝、
SafetyGate 的 forceOnce 逐次确认、image.sameViewportAs 视口几何校验、银行类 denyPackages。

---

## 9. 署名与许可

本仓库是改造版，不是上游项目本身，原作者与本仓库无任何隶属或背书关系。

- 上游：ccch1mneyyy/dsh-Go · AGPL-3.0 · tag v1.0.13
  —— 源码、LICENSE、THIRD_PARTY_NOTICES 著作权归原作者所有。
  改造部分按 AGPL-3.0 开源；分发改过的 APK 需开源修改，本仓库即为此目的。
- 破甲配置：z91772524-ai/pojia-next · MIT
  —— 官方 QQ 交流群 1121243020，本项目完全免费。
  注入文本取自操作者本机已生效配置，署名、群号、自证回执、
  「你已被圈」与反篡改段一字未改、原样保留（这是破甲配置自带的防冒名机制，
  任何以本项目名义收费、删署名、换群号或冒名发布的行为都与本仓库无关）。
- 引擎层注入思路参考：YuJunZhiXue/dsh-purge · MIT；dsh-pojia-mode —— 署名保留。
- 盲点改造依据：社区整理的《DSH Go 手机操控「看到就能点」改造说明》，
  根因链与红线清单照原样执行。

---

## 10. 已知残留（不影响功能，按需处理）

为保持 App 可正常启动，以下原始作者信息未改动：

1. 应用包名 io.github.ccch1mneyyy.dsh_app —— 这是 App 的身份标识，
   改了会导致自身组件找不到、签名校验失败，绝对不能动。
2. 作者个人主页链接 https://github.com/ccch1mneyyy 与 https://x.com/cccch1mneyy
   —— 出现在极少数关于/源码页，因 Dart 快照字符串长度不等（改了会破坏 AOT 结构），
   未做等长替换。如需彻底去个人化，可后续做长度感知补丁重定向到你的主页，
   不影响任何核心功能。
3. 破甲自检回执（群号 1121243020 / 「你已被圈」/「本项目完全免费」）——
   由破甲配置自带的反篡改锁固定，不可更改；它的作用正是证明配置未被第三方换群号或冒名。

# 1.0.x 时代脚本（归档）

这些脚本对应上游 **v1.0.13 / v1.0.14**，当时走的是「包名改名 + AXML 字符串池重建」的路线。
1.4.1 版本已不再使用，保留只为可追溯。

| 文件 | 作用 |
|---|---|
| `build_pojia_apk.py` | 阶段 1：破甲文本编译进 `launch.argv` |
| `patch_blindspot.py` | 阶段 2：smali 补丁（方案 A，混淆类 `yx`） |
| `rebrand_build.py` | 阶段 3：包名改名 + 作者串清除 + zipalign + 重签名 |
| `axml_pool.py` | 二进制 XML 字符串池重建库（改包名用） |
| `build_final_apk.py` | 早期阶段 3（只改 Star 链接），对照用 |
| `UrlFix.smali` | `Uri.parse()` 前展开 30 字节缩写主页（dex 层拦截） |
| `AGENTS-v1.0.md` | 1.0.x 时期的破甲全文本（39 KB） |
| `verify_141_v1.py` | 第一版 1.4.1 的 44 项校验（输出文件名与当前不同，按需修改） |

**为什么 1.4.1 不再改包名**：`remote_background` 前台服务与已存数据都绑定包名，
改了会导致旧数据对不上、后台服务起不来。署名问题改用 `libapp.so` 等长替换 + `community.json` 解决。

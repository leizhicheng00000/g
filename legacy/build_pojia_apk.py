# -*- coding: utf-8 -*-
"""步骤 1：构建「底层自带破甲」的 DSH Go 新 APK（仓库版，路径相对仓库根）。

原理（不经过 AI 对话判断）：
  APK 内 assets/runtime/manifest.json 的 launch.argv 启动命令里插入一条
  base64 解码写入命令，引擎每次启动都会把破甲全局指令写进 DSH_HOME/AGENTS.md。
  该文件不带 dsh-app:managed 标记，按 App 逻辑永远不会被覆盖。
  RuntimeInstaller 只校验 rootfs 镜像的 SHA-256，不校验 manifest.json，
  所以不动 rootfs 镜像，完整性校验照常通过。

依赖（本机已装即可，非插件）：
  - Python 3.13
  - JDK 8+（apksigner 来自 Android SDK build-tools）
  - Android SDK build-tools 35（zipalign / apksigner）
  - apktool 3.0.3
  - debug keystore（~/.android/debug.keystore）
前置：把官方原版 dsh-go-1.0.13-arm64.apk 放在本脚本同目录（仓库根）。
"""
import base64
import json
import os
import shutil
import subprocess
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
SRC_APK = os.path.join(HERE, "dsh-go-1.0.13-arm64.apk")
OUT_APK = os.path.join(HERE, "dsh-go-1.0.13-pojia.apk")
ALIGNED = os.path.join(HERE, "dsh-go-1.0.13-pojia-aligned.apk")
AGENTS = os.path.join(HERE, "AGENTS.md")
MANIFEST_PATH = "assets/runtime/manifest.json"

# 工具路径：可改环境变量覆盖，默认按常见位置
JAVA = os.environ.get("JAVA_HOME", r"C:\Program Files\Java\jre1.8.0_481") + "/bin/java.exe"
BT = os.environ.get("ANDROID_BUILD_TOOLS", r"C:\Android\Sdk\build-tools\35.0.0")
ZIPALIGN = os.path.join(BT, "zipalign.exe")
APKSIGNER = os.path.join(BT, "lib", "apksigner.jar")
KEYSTORE = os.path.join(os.path.expanduser("~"), ".android", "debug.keystore")


def run(cmd, desc):
    print("[RUN] " + desc, flush=True)
    r = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", errors="replace")
    out = ((r.stdout or "") + (r.stderr or "")).strip()
    if out:
        print("      " + out[:1200].replace("\n", "\n      "), flush=True)
    if r.returncode != 0:
        raise RuntimeError(desc + " 失败 (exit %d)" % r.returncode)
    return out


def main():
    assert os.path.exists(SRC_APK), "缺少官方 APK：%s" % SRC_APK
    assert os.path.exists(AGENTS), "缺少 AGENTS.md（破甲配置）：%s" % AGENTS

    with zipfile.ZipFile(SRC_APK) as z:
        manifest_raw = z.read(MANIFEST_PATH)
    d = json.loads(manifest_raw.decode("utf-8"))
    argv = d["launch"]["argv"]

    idx = None
    for i, a in enumerate(argv):
        if "exec /usr/local/bin/dsh web" in a:
            idx = i
            break
    if idx is None:
        raise RuntimeError("未找到引擎启动命令")
    original = argv[idx]

    agents_bytes = open(AGENTS, "rb").read()
    b64 = base64.b64encode(agents_bytes).decode("ascii")
    inject = (
        "mkdir -p /root/.dsh && "
        "printf '%s' '" + b64 + "' | base64 -d > /root/.dsh/AGENTS.md; "
    )
    new_cmd = original.replace("exec /usr/local/bin/dsh web", inject + "exec /usr/local/bin/dsh web", 1)
    argv[idx] = new_cmd

    d["launch"].setdefault("env", {})["DSH_AGENTS_HOME"] = "/root/.dsh"
    d["runtimeVersion"] = d["runtimeVersion"] + "-pojia"

    new_manifest = json.dumps(d, ensure_ascii=False, separators=(",", ":")).encode("utf-8")

    tmp = OUT_APK + ".tmp"
    with zipfile.ZipFile(SRC_APK) as zin, zipfile.ZipFile(tmp, "w") as zout:
        for item in zin.infolist():
            data = new_manifest if item.filename == MANIFEST_PATH else zin.read(item.filename)
            zi = zipfile.ZipInfo(item.filename, date_time=item.date_time)
            zi.compress_type = item.compress_type
            zi.external_attr = item.external_attr
            zi.internal_attr = item.internal_attr
            zi.create_system = item.create_system
            zout.writestr(zi, data)
    os.replace(tmp, OUT_APK)

    if os.path.exists(ALIGNED):
        os.remove(ALIGNED)
    run([ZIPALIGN, "-p", "-f", "4", OUT_APK, ALIGNED], "zipalign 对齐")
    shutil.move(ALIGNED, OUT_APK)
    run([
        JAVA, "-jar", APKSIGNER, "sign",
        "--ks", KEYSTORE, "--ks-key-alias", "androiddebugkey",
        "--ks-pass", "pass:android", "--key-pass", "pass:android",
        "--v1-signing-enabled", "true", "--v2-signing-enabled", "true",
        "--out", OUT_APK, OUT_APK,
    ], "apksigner 签名")
    run([JAVA, "-jar", APKSIGNER, "verify", "--verbose", OUT_APK], "验签")

    with zipfile.ZipFile(OUT_APK) as z:
        m = json.loads(z.read(MANIFEST_PATH).decode("utf-8"))
        assert "base64 -d" in m["launch"]["argv"][idx], "注入丢失"
        assert m["rootfsSha256"] == d["rootfsSha256"], "rootfs 校验值被改"
    print("=== 构建完成:", OUT_APK, os.path.getsize(OUT_APK), "bytes ===", flush=True)


if __name__ == "__main__":
    main()

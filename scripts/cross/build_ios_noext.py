# -*- coding: utf-8 -*-
"""iOS 去扩展版：删掉 ShareExtension.appex 与 CompanionWidget.appex。

为什么需要它 —— 免费 Apple ID 签名只有 3 个 App ID 配额：
主 App + 分享扩展 + 桌面小组件正好占满，任何一个改 bundle id 就签不动。
去掉两个扩展后只需 1 个 App ID，Sideloadly / AltStore / 爱思 的成功率高得多。
代价：分享菜单里没有入口，桌面小组件不可用，其余功能不变。

注：主 App 的 Info.plist 里没有 NSExtension 键，删除扩展不需要改 plist。
"""
import hashlib
import os
import zipfile

import zipraw

HERE = os.path.dirname(os.path.abspath(__file__))

SRC = "DSH-Go-1.4.1-破甲+品牌.ipa"
OUT = "DSH-Go-1.4.1-破甲+品牌-无扩展.ipa"
DROP = ("Payload/Runner.app/PlugIns/",)


def main():
    src = os.path.join(HERE, SRC)
    out = os.path.join(HERE, OUT)

    z = zipfile.ZipFile(src)
    names = z.namelist()
    p = z.read("Payload/Runner.app/Info.plist")
    if b"NSExtension" in p:
        raise SystemExit("主 Info.plist 含 NSExtension，删扩展会影响启动，先看结构")
    z.close()

    removed = [n for n in names if n.startswith(DROP)]
    zipraw.rebuild(src, out, {}, drop=DROP)

    v = zipfile.ZipFile(out)
    assert v.testzip() is None, "CRC 错"
    left = [n for n in v.namelist() if n.startswith(DROP)]
    assert not left, "扩展没删干净: %s" % left
    assert len(v.namelist()) == len(names) - len(removed), "条目数不对"
    # 主程序与 runtime 必须在
    assert "Payload/Runner.app/Runner" in v.namelist()
    assert "Payload/Runner.app/dsh-runtime/runtime.zip" in v.namelist()
    v.close()

    h = hashlib.sha256(open(out, "rb").read()).hexdigest()
    print("删除 %d 个条目（PlugIns 下两个 appex）" % len(removed))
    print("OK  %s  %d B  sha256 %s" % (OUT, os.path.getsize(out), h))


if __name__ == "__main__":
    main()

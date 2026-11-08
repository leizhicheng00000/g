# -*- coding: utf-8 -*-
"""AXML 字符串池改写器。

用途：把二进制 AndroidManifest.xml / res/*.xml 里变长的字符串（如包名
io.github.ccch1mneyyy -> io.github.leizhicheng00000）替换掉。

原理：AXML 的 XML 节点块只保存「字符串池下标」，不保存绝对偏移，
     所以只要重建字符串池（并按 4 字节对齐），把池后面的原始字节整段接回去，
     文件结构就仍然自洽，只需修正文件头里的总长度。
"""
import struct

RES_STRING_POOL_TYPE = 0x0001
RES_XML_TYPE = 0x0003
UTF8_FLAG = 0x100


def _read_len8(b, p):
    """UTF-8 池：读 1~2 字节长度，返回 (长度, 新位置)"""
    n = b[p]
    if n & 0x80:
        n = ((n & 0x7F) << 8) | b[p + 1]
        return n, p + 2
    return n, p + 1


def _write_len8(out, n):
    if n < 0x80:
        out.append(n)
    else:
        out.append(0x80 | (n >> 8))
        out.append(n & 0xFF)


def decode_pool(data):
    """解析 AXML，返回 (strings, meta)"""
    typ, hsz, size = struct.unpack_from("<HHI", data, 0)
    assert typ == RES_XML_TYPE, "不是 AXML 文件"
    ptyp, phsz, psize, scount, stcount, flags, strstart, styletart = \
        struct.unpack_from("<HHIIIIII", data, 8)
    assert ptyp == RES_STRING_POOL_TYPE, "首个 chunk 不是字符串池"
    utf8 = bool(flags & UTF8_FLAG)
    strings = []
    for i in range(scount):
        off = struct.unpack_from("<I", data, 8 + phsz + i * 4)[0]
        p = 8 + strstart + off
        if utf8:
            n, q = _read_len8(data, p)      # 字符数
            m, q = _read_len8(data, q)      # 字节数
            strings.append(data[q:q + m].decode("utf-8", "replace"))
        else:
            n = struct.unpack_from("<H", data, p)[0]
            q = p + 2
            if n & 0x8000:
                n = ((n & 0x7FFF) << 16) | struct.unpack_from("<H", data, q)[0]
                q += 2
            strings.append(data[q:q + n * 2].decode("utf-16-le", "replace"))
    meta = dict(flags=flags, utf8=utf8, scount=scount, stcount=stcount,
                phsz=phsz, psize=psize, strstart=strstart, styletart=styletart)
    return strings, meta


def build_pool(strings, meta):
    """按原编码重建字符串池 chunk"""
    utf8 = meta["utf8"]
    stcount = meta["stcount"]
    body = bytearray()
    offsets = []
    for s in strings:
        offsets.append(len(body))
        if utf8:
            raw = s.encode("utf-8")
            _write_len8(body, len(s))
            _write_len8(body, len(raw))
            body += raw + b"\x00"
        else:
            enc = s.encode("utf-16-le")
            n = len(enc) // 2
            if n < 0x8000:
                body += struct.pack("<H", n)
            else:
                body += struct.pack("<HH", 0x8000 | (n >> 16), n & 0xFFFF)
            body += enc + b"\x00\x00"
    # 字符串数据区补齐到 4 字节
    while len(body) % 4:
        body.append(0)

    header_size = 28
    strings_start = header_size + 4 * len(strings) + 4 * stcount
    total = strings_start + len(body)
    out = bytearray()
    out += struct.pack("<HHIIIIII", RES_STRING_POOL_TYPE, header_size, total,
                       len(strings), stcount, meta["flags"], strings_start, 0)
    for o in offsets:
        out += struct.pack("<I", o)
    for _ in range(stcount):
        out += struct.pack("<I", 0)
    out += body
    return bytes(out)


def rewrite(data, mapping):
    """在字符串池层面做变长替换，返回新 AXML 字节。mapping 为 [(old, new), ...]"""
    strings, meta = decode_pool(data)
    psize = meta["psize"]
    new_strings = []
    hits = 0
    for s in strings:
        t = s
        for old, new in mapping:
            if old in t:
                hits += t.count(old)
                t = t.replace(old, new)
        new_strings.append(t)
    pool = build_pool(new_strings, meta)
    tail = data[8 + psize:]
    out = bytearray(data[:8])
    out += pool
    # 池后面接回原始字节；池已 4 字节对齐，尾部无需再补
    out += tail
    struct.pack_into("<I", out, 4, len(out))   # 修正文件头总长度
    return bytes(out), hits


def selftest(data, name):
    """恒等映射必须字节完全不变"""
    same, hits = rewrite(data, [])
    assert hits == 0
    if same == data:
        print(f"  [selftest] {name}: 恒等重写字节一致 OK")
        return True
    print(f"  [selftest] {name}: 恒等重写有差异（原 {len(data)} / 新 {len(same)}），"
          f"后续改用定点池重建")
    return False

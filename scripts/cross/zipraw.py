# -*- coding: utf-8 -*-
"""raw-copy zip 重写器：除替换项外，其余条目字节级原样搬运。

为什么要 raw copy：IPA/HAP 里的 framework 自带 _CodeSignature/CodeResources，
记录了各文件的 hash。重新压缩会产生不同的压缩字节流，虽然解压结果一致，
但为把不可控因素降到最低，这里只动必须动的条目，其余原封不动。
"""
import struct
import zlib

LFH_SIG = b"PK\x03\x04"
CDH_SIG = b"PK\x01\x02"
EOCD_SIG = b"PK\x05\x06"
EOCD64_SIG = b"PK\x06\x06"
EOCD64LOC_SIG = b"PK\x06\x07"


class Entry(object):
    """中央目录里的一条记录。"""

    __slots__ = (
        "name", "flag", "method", "mtime", "mdate", "crc", "csize", "usize",
        "internal_attr", "external_attr", "offset", "extra", "comment",
        "create_version", "extract_version", "disk_start",
    )


def read_entries(fp):
    """解析 EOCD + 中央目录，返回 (entries, zip_comment)。"""
    fp.seek(0, 2)
    total = fp.tell()

    # 找 EOCD（最多回退 64KB + 22）
    back = min(total, 65557)
    fp.seek(total - back)
    tail = fp.read(back)
    pos = tail.rfind(EOCD_SIG)
    if pos < 0:
        raise ValueError("找不到 EOCD，可能不是标准 zip")
    eocd = tail[pos:pos + 22]
    (_, disk, cd_disk, n_disk, n_total, cd_size, cd_off, comment_len) = struct.unpack(
        "<4sHHHHIIH", eocd
    )
    comment = tail[pos + 22: pos + 22 + comment_len]

    # ZIP64：条目数 0xFFFF 或偏移 0xFFFFFFFF 时才需要
    if n_total == 0xFFFF or cd_off == 0xFFFFFFFF:
        # 找 ZIP64 EOCD locator
        lpos = tail.rfind(EOCD64LOC_SIG, 0, pos)
        if lpos < 0:
            raise ValueError("需要 ZIP64 但找不到 locator")
        eocd64_off = struct.unpack_from("<Q", tail, lpos + 8)[0]
        fp.seek(eocd64_off)
        e64 = fp.read(56)
        if e64[:4] != EOCD64_SIG:
            raise ValueError("ZIP64 EOCD 签名错误")
        n_total, cd_size, cd_off = struct.unpack_from("<QQQ", e64, 32)

    fp.seek(cd_off)
    cd = fp.read(cd_size)

    entries = []
    p = 0
    for _ in range(n_total):
        if cd[p:p + 4] != CDH_SIG:
            raise ValueError("中央目录签名错误 @%d" % p)
        (_, cver, xver, flag, method, mtime, mdate, crc, csize, usize,
         nlen, elen, clen, dstart, iattr, eattr, off) = struct.unpack_from(
            "<4sHHHHHHIIIHHHHHII", cd, p
        )
        e = Entry()
        e.create_version = cver
        e.extract_version = xver
        e.flag = flag
        e.method = method
        e.mtime = mtime
        e.mdate = mdate
        e.crc = crc
        e.csize = csize
        e.usize = usize
        e.internal_attr = iattr
        e.external_attr = eattr
        e.offset = off
        e.disk_start = dstart
        q = p + 46
        e.name = cd[q:q + nlen].decode("utf-8", "surrogateescape")
        e.extra = cd[q + nlen: q + nlen + elen]
        e.comment = cd[q + nlen + elen: q + nlen + elen + clen]
        entries.append(e)
        p = q + nlen + elen + clen

    return entries, comment


def _read_raw(fp, e):
    """读出某条目的 local header + 压缩数据（原始字节）。"""
    fp.seek(e.offset)
    lh = fp.read(30)
    if lh[:4] != LFH_SIG:
        raise ValueError("本地头签名错误: %s" % e.name)
    nlen, elen = struct.unpack_from("<HH", lh, 26)
    size = 30 + nlen + elen + e.csize
    fp.seek(e.offset)
    blob = fp.read(size)
    if len(blob) != size:
        raise ValueError("读取不完整: %s" % e.name)
    return blob


def _build_local(e, payload, method, level=9):
    """构造新的 local header + 数据。"""
    name_b = e.name.encode("utf-8", "surrogateescape")
    if method == 8:
        co = zlib.compressobj(level, zlib.DEFLATED, -15)
        cdata = co.compress(payload) + co.flush()
    elif method == 0:
        cdata = payload
    else:
        raise ValueError("不支持的压缩方式 %d" % method)
    crc = zlib.crc32(payload) & 0xFFFFFFFF
    flag = e.flag & ~0x08  # 清理 data descriptor 标志，尺寸写进头里
    lh = struct.pack(
        "<4sHHHHHIIIHH",
        LFH_SIG, e.extract_version, flag, method, e.mtime, e.mdate,
        crc, len(cdata), len(payload), len(name_b), len(e.extra),
    )
    return lh + name_b + e.extra + cdata, crc, len(cdata), len(payload)


def rebuild(src, dst, replacements, level=9, drop=()):
    """重建 zip。replacements: {条目名: 新的解压后 bytes}；drop: 要剔除的条目名前缀。

    返回 (替换条目数, 未变条目数)。
    """
    drop = tuple(drop)
    with open(src, "rb") as fp:
        entries, comment = read_entries(fp)
        out = []
        new_meta = []
        offset = 0
        replaced = kept = 0

        for e in entries:
            if drop and e.name.startswith(drop):
                continue
            if e.name in replacements:
                payload = replacements[e.name]
                blob, crc, csize, usize = _build_local(e, payload, e.method, level)
                replaced += 1
            else:
                blob = _read_raw(fp, e)
                crc, csize, usize = e.crc, e.csize, e.usize
                kept += 1
            out.append(blob)
            new_meta.append((e, offset, crc, csize, usize))
            offset += len(blob)

        cd_parts = []
        for e, off, crc, csize, usize in new_meta:
            name_b = e.name.encode("utf-8", "surrogateescape")
            cd_parts.append(struct.pack(
                "<4sHHHHHHIIIHHHHHII",
                CDH_SIG, e.create_version, e.extract_version, e.flag & ~0x08,
                e.method, e.mtime, e.mdate, crc, csize, usize,
                len(name_b), len(e.extra), len(e.comment),
                e.disk_start, e.internal_attr, e.external_attr, off,
            ) + name_b + e.extra + e.comment)

        cd = b"".join(cd_parts)

    with open(dst, "wb") as fp:
        for blob in out:
            fp.write(blob)
        cd_off = fp.tell()
        fp.write(cd)
        fp.write(struct.pack(
            "<4sHHHHIIH",
            EOCD_SIG, 0, 0, len(new_meta), len(new_meta),
            len(cd), cd_off, len(comment),
        ))
        fp.write(comment)

    return replaced, kept

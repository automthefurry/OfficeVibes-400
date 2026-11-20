"""Show a screen record as plain text, so a layout can be checked without an AS/400.

    python3 preview.py OVCAL:PMENU OFFMNU:MNUREC

Each argument is FILE:RECORD.  Output fields show as # (and _ when you can type in them).
Long constants that continue onto a second source line may show a stray - where they join.
"""
import sys, re, os
SRCDIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'src')
def parse(path):
    recs, cur, last = {}, None, None
    for l in open(path).read().splitlines():
        if len(l) < 7 or l[6] == '*': continue
        typ = l[16] if len(l) > 16 else ' '
        name = l[18:28].strip() if len(l) > 18 else ''
        if typ == 'R': cur = recs.setdefault(name, []); last = None; continue
        if cur is None or typ in 'HK': continue
        ln = l[38:41].strip() if len(l) > 40 else ''; pos = l[41:44].strip() if len(l) > 43 else ''
        kw = l[44:] if len(l) > 44 else ''
        if ln and pos:
            if name:
                length = int(l[29:34]); use = l[37]
                last = [int(ln), int(pos), ('_' if use in 'IB' else '#') * length]
            else:
                last = [int(ln), int(pos), '']
                m = kw
                last.append(m)
            cur.append(last)
        elif last is not None and not name and len(last) == 4:
            last[3] += kw
    out = {}
    for r, items in recs.items():
        g = [[' '] * 80 for _ in range(24)]
        for it in items:
            line, pos, txt = it[0], it[1], it[2]
            if len(it) == 4:
                m = re.match(r"'(.*)'", it[3].replace("-'", "'"))
                s = it[3]
                q = s.find("'")
                if q < 0: continue
                body = s[q+1:]
                body = re.sub(r"-\s{0,0}", "", body) if False else body
                txt = body[:body.rfind("'")].replace('-' + ' ' * 0, '-')
            for k, ch in enumerate(txt):
                if pos - 1 + k < 80: g[line - 1][pos - 1 + k] = ch
        out[r] = '\n'.join(''.join(row).rstrip() for row in g)
    return out
for f, r in [a.split(':') for a in sys.argv[1:]]:
    print('=' * 30, f, r); print(parse(os.path.join(SRCDIR, f + '.DDS'))[r])

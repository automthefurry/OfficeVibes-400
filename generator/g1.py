import re, os
OUT = 'out/'
NOHELP = {'DUMMY', 'BLANK'}
HELP = {}
FIELDS, RECS, SRC = {}, {}, {}
def chk(s):
    s = s.rstrip(); assert len(s) <= 80, s; return s
def dds(cond='', typ=' ', name='', length='', dtype=' ', dec='', usage=' ', line='', pos='', kw=''):
    return chk(' '*5 + 'A' + ' ' + cond.ljust(9) + typ + ' ' + name.ljust(10) + ' ' +
        str(length).rjust(5) + dtype + str(dec).rjust(2) + usage + str(line).rjust(3) + str(pos).rjust(3) + kw)
def K(kw, cond=''): return dds(cond=cond, kw=kw)
def pf(fname, rec, fields, keys):
    L = ['     A* %s - OfficeVibes/400 data file' % fname, dds(typ='R', name=rec)]
    for n, ln, t, dec in fields: L.append(dds(name=n, length=ln, dtype=t, dec=dec))
    for k in keys: L.append(dds(typ='K', name=k))
    SRC[fname + '.DDS'] = L; FIELDS[fname] = set(f[0] for f in fields); RECS[fname] = {rec}
A = lambda n, l: (n, l, 'A', '')
Z = lambda n: (n, '', 'Z', '')
N = lambda n, l: (n, l, 'S', 0)
class Scr:
    def __init__(s, name):
        s.name = name; s.fl = set(); s.rc = set()
        s.L = ['     A* %s - OfficeVibes/400 screens' % name, K('DSPSIZ(24 80 *DS3)'), K("CA03(03 'Exit')"), K("CA12(12 'Cancel')")]
        for k in range(4, 12): s.L.append(K('CF%02d(%02d)' % (k, k)))
        s.L += [K('HELP'), K('ALTHELP')]; s.idx = {}; s.last = None
    def occupy(s, line, pos, ln):
        line, pos = int(line), int(pos)
        a, b = pos - 1, pos + ln - 1
        assert a >= 1 and b <= 80, (s.name, s.last, line, pos, ln)
        for (l2, a2, b2) in s.occ:
            assert l2 != line or b < a2 or a > b2, (s.name, s.last, 'overlap at row', line, 'col', pos)
        s.occ.append((line, a, b))
    def rec(s, name, *kws):
        s.occ = []
        s.rc.add(name); s.L.append(dds(typ='R', name=name, kw=kws[0] if kws else ''))
        for k in kws[1:]: s.L.append(K(k))
        s.idx[name] = len(s.L); s.last = name
    def reck(s, kw, cond=''):
        s.L.append(K(kw, cond)); s.idx[s.last] = len(s.L)
    def t(s, line, pos, text, *kws):
        assert "'" not in text
        s.occupy(line, pos, len(text))
        if len(text) <= 34: s.L.append(dds(line=line, pos=pos, kw="'" + text + "'"))
        else:
            s.L.append(dds(line=line, pos=pos, kw="'" + text[:34] + '-')); r = text[34:]
            while len(r) > 35: s.L.append(K(r[:35] + '-')); r = r[35:]
            s.L.append(K(r + "'"))
        for k in kws: s.L.append(K(k[1], k[0]) if isinstance(k, tuple) else K(k))
    def f(s, name, ln, use, line, pos, *kws, cond=''):
        s.fl.add(name); kws = list(kws)
        if line != '': s.occupy(line, pos, ln)
        first = kws.pop(0) if kws and isinstance(kws[0], str) else ''
        s.L.append(dds(name=name, length=ln, dtype='A', usage=use, line=line, pos=pos, kw=first))
        for k in kws: s.L.append(K(k[1], k[0]) if isinstance(k, tuple) else K(k))
    def k(s, kw, cond=''): s.L.append(K(kw, cond))
    def lst(s, rec, P, find=False, info=False):
        s.rec(rec)
        s.f(P + 'HDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.f(P + 'TTL', 50, 'O', 3, 3, 'DSPATR(HI)')
        if find:
            s.t(4, 3, 'Find . . .'); s.f(P + 'FND', 30, 'B', 4, 14, 'CHECK(LC)', 'DSPATR(UL)')
        s.f(P + 'COL', 74, 'O', 5, 3, 'COLOR(BLU)')
        for i in range(1, 11):
            s.f(P + 'OP%02d' % i, 2, 'I', 5 + i, 3, 'CHECK(LC)', 'DSPATR(UL)'); s.f(P + 'LN%02d' % i, 70, 'O', 5 + i, 8)
        if info: s.f(P + 'INF', 74, 'O', 17, 3, 'COLOR(TRQ)')
        s.f(P + 'MSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f(P + 'FK1', 78, 'O', 22, 2, 'COLOR(BLU)'); s.f(P + 'FK2', 78, 'O', 23, 2, 'COLOR(BLU)')
    def lst2(s, rec, P, rows, lcol, lw, ocol=3, find=None, ttl=(3, 3, 50), col=(5, 3, 74), colkw=('COLOR(BLU)',),
             rowkw=lambda i: [], noopt=False, lnkw=()):
        s.rec(rec); s.f(P + 'HDR', 78, 'O', 1, 2, 'DSPATR(HI)')
        if ttl: s.f(P + 'TTL', ttl[2], 'O', ttl[0], ttl[1], 'DSPATR(HI)')
        if find:
            s.t(find[0], find[1], 'Find . . .'); s.f(P + 'FND', find[2], 'B', find[0], find[1] + 11, 'CHECK(LC)', 'DSPATR(UL)')
        if col: s.f(P + 'COL', col[2], 'O', col[0], col[1], *colkw)
        for i, r in enumerate(rows):
            if not noopt: s.f(P + 'OP%02d' % (i + 1), 2, 'I', r, ocol, 'CHECK(LC)', 'DSPATR(UL)')
            s.f(P + 'LN%02d' % (i + 1), lw, 'O', r, lcol, *(list(lnkw) + rowkw(i)))
        s.f(P + 'MSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f(P + 'FK1', 78, 'O', 22, 2, 'COLOR(BLU)'); s.f(P + 'FK2', 78, 'O', 23, 2, 'COLOR(BLU)')
    def frame(s, top, left, bot, right, *kws):
        edge = '+' + '-' * (right - left - 1) + '+'
        s.t(top, left, edge, *kws); s.t(bot, left, edge, *kws)
        for r in range(top + 1, bot): s.t(r, left, '|', *kws); s.t(r, right, '|', *kws)
    def ctr(s, line, text, *kws): s.t(line, (80 - len(text)) // 2 + 1, text, *kws)
    def edit(s, rec, P, *kws):
        s.rec(rec, *kws); s.f(P + 'HDR', 78, 'O', 1, 2, 'DSPATR(HI)')
        s.f(P + 'MSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f(P + 'FK', 78, 'O', 23, 2, 'COLOR(BLU)')
    def inp(s, label, name, ln, line, *kws, lc=True, pos=24):
        s.t(line, 3, label); kw = (['CHECK(LC)'] if lc else []) + ['DSPATR(UL)'] + list(kws)
        s.f(name, ln, 'B', line, pos, *kw)
    def save(s):
        for name in sorted(s.idx, key=lambda n: -s.idx[n]):
            if name in NOHELP: continue
            assert name in HELP, ('no help text', name)
            s.L[s.idx[name]:s.idx[name]] = [dds(typ='H', kw='HLPARA(*RCD)'), K('HLPRCD(H%s)' % name)]
        for name in [n for n in s.idx if n not in NOHELP]:
            title, lines = HELP[name]; assert len(lines) <= 19, name
            s.occ = []; s.L.append(dds(typ='R', name='H' + name)); s.t(1, 2, 'Help - ' + title, 'DSPATR(HI)')
            for i, tx in enumerate(lines):
                assert len(tx) <= 76, tx
                if tx: s.t(3 + i, 3, tx)
            s.t(23, 2, 'Press Enter to return.', 'COLOR(BLU)')
        SRC[s.name + '.DDS'] = s.L; FIELDS[s.name] = s.fl; RECS[s.name] = s.rc
# ---------- RPG helpers ----------
def F(name, typ, add, keyed, dev, kw='', desig='F'):
    return chk('     F' + name.ljust(10) + typ + desig + ' ' + add + ' ' + 'E' + ' '*11 + ('K' if keyed else ' ') + ' ' + dev.ljust(7) + ' ' + kw)
def D(name, kind='', length='', typ=' ', dec='', kw='', frm=''):
    k23 = 'S' if kind == 'SDS' else ' '
    k24 = 'DS' if kind in ('SDS', 'DS') else kind.ljust(2)
    return chk('     D' + name.ljust(15) + ' ' + k23 + k24 + str(frm).rjust(7) + str(length).rjust(7) + typ + str(dec).rjust(2) + ' ' + kw)
def S(name, ln, dec=None, kw=''):
    if ln == 'Z': return D(name, 'S', '', 'Z', kw=kw)
    if ln == 'D': return D(name, 'S', '', 'D', kw=kw)
    return D(name, 'S', ln, 'A', kw=kw) if dec is None else D(name, 'S', ln, ' ', dec, kw)
def DC(name, text):
    assert "'" not in text and len(text) <= 108, text
    ch = [text[i:i+30] for i in range(0, len(text), 30)] or ['']
    return [D(name if i == 0 else '', 'C' if i == 0 else '', kw=("'" if i == 0 else '') + c + ("'" if i == len(ch) - 1 else '-')) for i, c in enumerate(ch)]
def arrds(allname, arr, elen, names):
    L = [D('', 'DS'), D(allname, '', elen * len(names), 'A'), D(' ' + arr, '', elen, 'A', kw='DIM(%d) OVERLAY(%s)' % (len(names), allname))]
    for i, n in enumerate(names): L.append(D(' ' + n, '', elen, 'A', kw='OVERLAY(%s:%d)' % (allname, i * elen + 1)))
    return L
def listds(P, lw=70, n=10): return arrds(P + 'LNA', P + 'LN', lw, [P + 'LN%02d' % i for i in range(1, n + 1)]) + arrds(P + 'OPA', P + 'OP', 2, [P + 'OP%02d' % i for i in range(1, n + 1)])
def wrap(ext, width=45):
    toks, cur, q = [], '', False
    for ch in ext:
        if ch == "'": q = not q
        if ch == ' ' and not q: toks.append(cur); cur = ''
        else: cur += ch
    toks.append(cur); t2 = []
    for t in toks:
        if len(t) > 36 and t[0] == "'" and t[-1] == "'" and "'" not in t[1:-1]:
            b = t[1:-1]
            for i, p in enumerate([b[j:j+30] for j in range(0, len(b), 30)]):
                if i: t2.append('+')
                t2.append("'" + p + "'")
        else: t2.append(t)
    lines, cur = [], ''
    for t in t2:
        if cur and len(cur) + 1 + len(t) > width: lines.append(cur); cur = t
        else: cur = (cur + ' ' + t) if cur else t
    lines.append(cur)
    for l in lines: assert len(l) <= width, l
    return lines
def rpg(text):
    L = []
    for ln in text.splitlines():
        ln = ln.strip()
        if not ln: continue
        if ln.startswith('* '):
            assert len(ln) <= 74, ('comment too long', ln)
            L.append(chk('      ' + ln)); continue
        if '|' in ln and ln.split(' ')[0] not in ('EVAL', 'IF', 'DOW', 'WHEN'):
            p = [x.strip() for x in ln.split('|')] + ['', '', '']
            f1, op, f2, res, ind = p[:5]
            assert len(f1) <= 14 and len(op) <= 10 and len(f2) <= 14 and len(res) <= 14, ln
            hi = ind[1:] if ind.startswith('^') else ''
            ind = '' if hi else ind
            L.append(chk(' '*5 + 'C' + ' '*5 + f1.ljust(14) + op.ljust(10) + f2.ljust(14) + res.ljust(14) + ' '*7 + (hi.ljust(2) if hi else '  ') + ind))
        else:
            op, _, rest = ln.partition(' ')
            for i, w in enumerate(wrap(rest.strip())):
                L.append(chk(' '*5 + 'C' + ' '*19 + (op if i == 0 else '').ljust(10) + w))
    return L
COMD = [D('PSDS', 'SDS'), D(' PGMUSR', '', 263, frm=254), D('DSPINF', 'DS'), '     D DSPSTS'.ljust(25) + '*STATUS', D(' CSRLOC', '', 371, 'B', 0, frm=370),
  S('HTS', 'Z'), S('HSTMP', 26), S('HW8', 8), S('HN8', 8, 0), S('HDT', 10),
  S('HDRID', 10), S('HDRLN', 78), S('SYSNAM', 8), S('WNODE', 20), S('NLEN', 5, 0), S('TS', 'Z'), S('WSTMP', 26), S('WDT', 16),
  S('I', 5, 0), S('J', 5, 0), S('ROW', 5, 0), S('MSG', 74), S('CMD', 300), S('CMDLEN', 15, 5, 'INZ(300)'),
  S('QSRC', 100), S('QTXT', 200, kw='VARYING'), S('QLEN', 5, 0), S('KS', 'Z', kw='DIM(10)'), S('KSTMP', 'Z'), S('KUSER', 10),
  S('PGNO', 5, 0), S('BASE', 5, 0), S('NMATCH', 5, 0), S('NSHOW', 5, 0), S('DCNT', 5, 0), S('OP', 2),
  S('CSRROW', 5, 0), S('CSRCOL', 5, 0), S('CSRSEL', 5, 0), S('ANYOP', 5, 0), S('SEQ', 5, 0), S('LAPP', 10), S('LACT', 10), S('LTXT', 60),
  S('PACT', 1), S('PTXT', 100), S('SELUSR', 10), S('UNEED', 30), S('TTLW', 50), S('W8', 8), S('N8', 8, 0),
  S('DUE', 10), S('DLEN', 5, 0), S('P1', 5, 0), S('P2', 5, 0), S('MM', 5, 0), S('DD', 5, 0), S('YY', 5, 0), S('DUEVAL', 8, 0),
  S('NSTR', 6), S('NVAL', 9, 0), S('NERR', 1), S('CH', 1), S('POS', 5, 0), S('DOTF', 1),
  S('USET', 40), S('UNITS', 1), S('UWEEK', 1), S('UDBEG', 4, 0), S('UDEND', 4, 0), S('UZONE', 6), S('UOFFS', 5), S('UOFFZ', 6),
  D('LCASE', 'C', kw="'abcdefghijklmnopqrstuvwxyz'"), D('UCASE', 'C', kw="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'")]
D80 = S  # alias
COMSR = """
* ---- shared routines ----
*INZSR | BEGSR
 | CALL | 'OVSYSN' | | 50
 | PARM | | SYSNAM
IF *IN50 = *ON OR SYSNAM = *BLANKS
EVAL SYSNAM = 'AS400'
ENDIF
EVAL *IN50 = *OFF
EVAL KUSER = PGMUSR
EXSR LOADSET
 | ENDSR
* ---- this person's settings: units, week start, working day, time zone
LOADSET | BEGSR
EVAL USET = 'IS08001700      +0000'
 | CALL | 'OVGSET' | | 50
 | PARM | | USET
EVAL *IN50 = *OFF
EVAL UNITS = %SUBST(USET:1:1)
EVAL UWEEK = %SUBST(USET:2:1)
EVAL NERR = '0'
EVAL NSTR = %SUBST(USET:3:4)
EXSR TONUM
EVAL UDBEG = 800
IF NERR = '0' AND NVAL <= 2359
EVAL UDBEG = NVAL
ENDIF
EVAL NERR = '0'
EVAL NSTR = %SUBST(USET:7:4)
EXSR TONUM
EVAL UDEND = 1700
IF NERR = '0' AND NVAL <= 2359 AND NVAL > UDBEG
EVAL UDEND = NVAL
ENDIF
EVAL UZONE = %SUBST(USET:11:6)
EVAL UOFFS = %SUBST(USET:17:5)
IF %SUBST(UOFFS:1:1) <> '+' AND %SUBST(UOFFS:1:1) <> '-'
EVAL UOFFS = '+0000'
ENDIF
EVAL UOFFZ = %SUBST(UOFFS:1:3) + ':' + %SUBST(UOFFS:4:2)
 | ENDSR
HDR | BEGSR
 | TIME | | HTS
 | MOVE | HTS | HSTMP
EVAL HW8 = %SUBST(HSTMP:1:4) + %SUBST(HSTMP:6:2) + %SUBST(HSTMP:9:2)
 | MOVE | HW8 | HN8
EVAL HDT = %CHAR(%DIV(%REM(HN8:10000):100)) + '/' + %CHAR(%REM(HN8:100)) + '/' + %SUBST(HSTMP:1:4)
IF UNITS = 'M'
EVAL HDT = %SUBST(HSTMP:9:2) + '.' + %SUBST(HSTMP:6:2) + '.' + %SUBST(HSTMP:1:4)
ENDIF
EVAL HDRLN = *BLANKS
EVAL %SUBST(HDRLN:2:10) = HDRID
EVAL %SUBST(HDRLN:33:15) = 'OfficeVibes/400'
EVAL NLEN = %LEN(%TRIMR(HDT))
EVAL %SUBST(HDRLN:79-NLEN:NLEN) = %TRIMR(HDT)
 | ENDSR
FMTDT | BEGSR
EVAL WDT = %SUBST(WSTMP:6:2) + '/' + %SUBST(WSTMP:9:2) + '/' + %SUBST(WSTMP:1:4) + ' ' + %SUBST(WSTMP:12:2) + ':' + %SUBST(WSTMP:15:2)
IF UNITS = 'M'
EVAL WDT = %SUBST(WSTMP:9:2) + '.' + %SUBST(WSTMP:6:2) + '.' + %SUBST(WSTMP:1:4) + ' ' + %SUBST(WSTMP:12:2) + ':' + %SUBST(WSTMP:15:2)
ENDIF
 | ENDSR
CSR | BEGSR
EVAL CSRROW = %DIV(CSRLOC:256)
EVAL CSRCOL = %REM(CSRLOC:256)
 | ENDSR
NEWTS | BEGSR
 | TIME | | TS
EVAL SEQ = SEQ + 1
 | ADDDUR | SEQ:*MS | TS
 | ENDSR
RUNCMD | BEGSR
 | CALL | 'QCMDEXC' | | 50
 | PARM | | CMD
 | PARM | | CMDLEN
 | ENDSR
LOGIT | BEGSR
 | CALL | 'OVLOG' | | 50
 | PARM | | LAPP
 | PARM | | LACT
 | PARM | | LTXT
EVAL *IN50 = *OFF
 | ENDSR
PRT | BEGSR
 | CALL | 'OVPRT' | | 50
 | PARM | | PACT
 | PARM | | PTXT
EVAL *IN50 = *OFF
 | ENDSR
LOOKUP | BEGSR
EVAL SELUSR = *BLANKS
 | CALL | 'OVUSRL' | | 50
 | PARM | | SELUSR
EVAL *IN50 = *OFF
EVAL *IN03 = *OFF
EVAL *IN12 = *OFF
 | ENDSR
QUOTE | BEGSR
 | CLEAR | | QTXT
EVAL QLEN = %LEN(%TRIMR(QSRC))
1 | DO | QLEN | I
EVAL QTXT = QTXT + %SUBST(QSRC:I:1)
IF %SUBST(QSRC:I:1) = ''''
EVAL QTXT = QTXT + ''''
ENDIF
 | ENDDO
 | ENDSR
TONUM | BEGSR
EVAL NVAL = 0
EVAL POS = 0
1 | DO | 6 | I
EVAL CH = %SUBST(NSTR:I:1)
IF CH = ' '
LEAVE
ENDIF
EVAL POS = %SCAN(CH:'0123456789')
IF POS = 0
EVAL NERR = '1'
LEAVE
ENDIF
EVAL NVAL = NVAL * 10 + POS - 1
 | ENDDO
IF POS = 0
EVAL NERR = '1'
ENDIF
 | ENDSR
* ---- DUE (M/D or M/D/YYYY) into DUEVAL as YYYYMMDD ----
PARSED | BEGSR
EVAL NERR = '0'
EVAL DUEVAL = 0
EVAL DUE = %TRIML(DUE)
* day.month.year with dots is read the European way round
EVAL DOTF = '0'
IF %SCAN('.':DUE) > 0
EVAL DOTF = '1'
'.':'/' | XLATE | DUE | DUE
ENDIF
EVAL DLEN = %LEN(%TRIMR(DUE))
IF DLEN > 0
EVAL P1 = %SCAN('/':DUE)
IF P1 < 2 OR P1 > 3 OR P1 >= DLEN
EVAL NERR = '1'
ELSE
EVAL NSTR = %SUBST(DUE:1:P1-1)
EXSR TONUM
EVAL MM = NVAL
EVAL P2 = %SCAN('/':DUE:P1+1)
IF P2 = 0
IF DLEN - P1 > 2
EVAL NERR = '1'
ELSE
EVAL NSTR = %SUBST(DUE:P1+1:DLEN-P1)
EXSR TONUM
EVAL DD = NVAL
ENDIF
 | TIME | | TS
 | MOVE | TS | WSTMP
EVAL NSTR = %SUBST(WSTMP:1:4)
EXSR TONUM
EVAL YY = NVAL
ELSE
IF P2 = P1 + 1 OR P2 - P1 > 3 OR P2 >= DLEN OR DLEN - P2 > 4
EVAL NERR = '1'
ELSE
EVAL NSTR = %SUBST(DUE:P1+1:P2-P1-1)
EXSR TONUM
EVAL DD = NVAL
EVAL NSTR = %SUBST(DUE:P2+1:DLEN-P2)
EXSR TONUM
EVAL YY = NVAL
ENDIF
ENDIF
IF NERR = '0' AND DOTF = '1'
EVAL P1 = MM
EVAL MM = DD
EVAL DD = P1
ENDIF
IF NERR = '0'
IF YY < 100
EVAL YY = YY + 2000
ENDIF
IF MM < 1 OR MM > 12 OR DD < 1 OR DD > 31
EVAL NERR = '1'
ELSE
EVAL DUEVAL = YY * 10000 + MM * 100 + DD
ENDIF
ENDIF
ENDIF
ENDIF
 | ENDSR
"""
INDOFF = "EVAL *IN03 = *OFF\nEVAL *IN12 = *OFF\n"
SHOWN = """
EVAL NSHOW = NMATCH - BASE
IF NSHOW > 10
EVAL NSHOW = 10
ENDIF
IF NSHOW < 0
EVAL NSHOW = 0
ENDIF
"""
def listmain(P, fmt, hid, pre='', keys='', acts='', find=False, deflt='', r0=6, lcol=8, sel=None, n=10):
    t = """
DOW *IN03 = *OFF AND *IN12 = *OFF
EXSR LOAD
IF PGNO > 0 AND BASE >= NMATCH
EVAL PGNO = 0
EXSR LOAD
ENDIF
EVAL HDRID = '@HID@'
EXSR HDR
EVAL @P@HDR = HDRLN
EVAL @P@TTL = TTLW
EVAL @P@COL = COLH
EVAL @P@MSG = MSG
EVAL @P@FK1 = FK1
EVAL @P@FK2 = FK2
@PRE@
EVAL MSG = *BLANKS
 | EXFMT | @FMT@
EXSR CSR
@SEL@
@FIND@
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
@KEYS@
IF *IN07 = *ON
IF PGNO > 0
EVAL PGNO = PGNO - 1
ENDIF
ITER
ENDIF
IF *IN08 = *ON
IF BASE + 10 < NMATCH
EVAL PGNO = PGNO + 1
ENDIF
ITER
ENDIF
@DEF@
@ACTS@
ENDDO
"""
    fd = "EVAL UNEED = %TRIML(@P@FND)\nLCASE:UCASE | XLATE | UNEED | UNEED" if find else ''
    df = """
EVAL ANYOP = 0
1 | DO | NSHOW | ROW
IF @P@OP(ROW) <> *BLANKS
EVAL ANYOP = 1
ENDIF
 | ENDDO
IF ANYOP = 0 AND CSRSEL > 0
EVAL @P@OP(CSRSEL) = '@D@'
ENDIF
""".replace('@D@', deflt) if deflt else ''
    sc = sel or ("EVAL CSRSEL = CSRROW - %d\nIF CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < %d\nEVAL CSRSEL = 0\nENDIF\n" % (r0 - 1, lcol))
    t = t.replace('BASE + 10 <', 'BASE + %d <' % n)
    return t.replace('@SEL@', sc).replace('@FIND@', fd).replace('@DEF@', df).replace('@PRE@', pre).replace('@KEYS@', keys).replace('@ACTS@', acts).replace('@HID@', hid).replace('@FMT@', fmt).replace('@P@', P)
OPC = set('EVAL IF ELSE ENDIF DOW ENDDO DO SELECT WHEN OTHER ENDSL EXSR LEAVE ITER AND OR NOT BEGSR ENDSR EXFMT WRITE READ READE READP CHAIN SETLL SETGT UPDATE DELETE UNLOCK MOVE TIME CALL PARM PLIST KLIST KFLD XLATE CLEAR RETURN OPEN CLOSE ADDDUR SUBDUR TEST DSPLY N D MS M H'.split())
def check(name, lines, files):
    known = set(OPC)
    for f in files: known |= FIELDS.get(f, set()) | RECS.get(f, set()) | {f}
    dn = set()
    for l in lines:
        if l[5] == 'D' and l[6:21].strip(): dn.add(l[6:21].strip())
        if l[5] == 'C' and l[25:35].strip() in ('BEGSR', 'KLIST'): known.add(l[11:25].strip())
    filef = set()
    for f in files: filef |= FIELDS.get(f, set())
    known |= dn
    seen = set()
    for l in lines:
        if l[5] == 'D' and l[6:21].strip():
            nm = l[6:21].strip()
            assert nm not in seen, (name, 'defined twice', nm)
            seen.add(nm)
    for l in lines:
        if l[5] == 'D' and l[6] != ' ' and l[6:21].strip() in filef: raise Exception((name, 'clash', l))
    depth = {'IF': 0, 'DO': 0, 'SL': 0, 'SR': 0}
    for l in lines:
        if l[5] != 'C': continue
        op = l[25:35].strip().split('(')[0]
        if op in ('IF',): depth['IF'] += 1
        if op == 'ENDIF': depth['IF'] -= 1
        if op in ('DO', 'DOW'): depth['DO'] += 1
        if op == 'ENDDO': depth['DO'] -= 1
        if op == 'SELECT': depth['SL'] += 1
        if op == 'ENDSL': depth['SL'] -= 1
        if op == 'BEGSR':
            assert depth['IF'] == 0 and depth['DO'] == 0 and depth['SL'] == 0, (name, l, depth); depth['SR'] += 1
        if op == 'ENDSR':
            assert depth['IF'] == 0 and depth['DO'] == 0 and depth['SL'] == 0, (name, l, depth); depth['SR'] -= 1
        body = l[11:25] + ' ' + l[35:] if op else l[35:]
        if op in ('IF', 'DOW', 'EVAL', 'WHEN', '') : body = l[35:]
        else: body = l[11:25] + ' ' + l[35:63]
        body = re.sub(r"'[^']*'", ' ', body)
        body = re.sub(r"[%*][A-Z0-9]+", ' ', body)
        for tok in re.findall(r"[A-Z@#$][A-Z0-9_@#$]*", body):
            assert tok in known, (name, tok, l)
    assert all(v == 0 for v in depth.values()), (name, depth)
def prog(name, files, dsp, dspecs, body, hx='', dspkw='', allow=()):
    fs = [F(f, m, 'A' if m == 'U' else ' ', True, 'DISK') for f, m in files]
    if dsp: fs.append(F(dsp, 'C', ' ', False, 'WORKSTN', ('INFDS(DSPINF) ' + dspkw).strip()))
    cd = COMD
    if not dsp:
        cd = [l for l in COMD if not (l.startswith('     DDSPINF') or l.startswith('     D DSPSTS') or l.startswith('     D CSRLOC'))]
        cd += [S('DSPSTS', 5, 0), S('CSRLOC', 5, 0)]
    L = ['     H DFTACTGRP(*YES)' + hx, '      * %s - OfficeVibes/400' % name] + fs + cd + dspecs + rpg(body) + rpg(COMSR)
    check(name, L, [f for f, m in files] + ([dsp] if dsp else []))
    SRC[name + '.RPGLE'] = L
def small(name, fs, dspecs, body, files):
    L = ['     H DFTACTGRP(*YES)', '      * %s - OfficeVibes/400' % name] + fs + dspecs + rpg(body)
    check(name, L, files); SRC[name + '.RPGLE'] = L
CLRIND = "1 | DO | 20 | I\nEVAL *IN(60 + I) = *OFF\n | ENDDO\n"
def flush():
    for n, L in SRC.items():
        for l in L:
            assert len(l) <= 80, (n, l)
            assert all(32 <= ord(c) < 127 for c in l), ('not plain ASCII', n, l)
        if n.endswith('.RPGLE'):
            dn = {l[6:21].strip() for l in L if len(l) > 6 and l[5] == 'D' and l[6:21].strip()}
            tags = {l[11:25].strip() for l in L if len(l) > 25 and l[5] == 'C' and l[25:35].strip() in ('BEGSR', 'KLIST', 'PLIST')}
            assert not (dn & tags), (n, 'field and subroutine share a name', dn & tags)
        open(OUT + n, 'w').write('\n'.join(L) + '\n')

# ---------------- data files ----------------
pf('OVUSERP', 'USERREC', [A('USUSER', 10), A('USNAME', 30), A('USDEPT', 20), A('USPHON', 20), A('USADM', 1), A('USSTAT', 1), Z('USLAST'), Z('USCRT')], ['USUSER'])
pf('OVLOGP', 'LOGREC', [Z('LGSTMP'), A('LGUSER', 10), A('LGAPP', 10), A('LGACT', 10), A('LGTEXT', 60)], ['LGSTMP'])
pf('OVGRPP', 'GRPREC', [A('GRNAME', 10), A('GRUSER', 10)], ['GRNAME', 'GRUSER'])
pf('OVMSGP', 'MSGREC', [Z('MGSTMP'), A('MGTO', 10), A('MGFROM', 10), A('MGSTAT', 1), A('MGTEXT', 72)], ['MGSTMP', 'MGTO'])
pf('OVMAILP', 'MAILREC', [Z('MMSTMP'), A('MMTO', 10), A('MMFROM', 10), A('MMSTAT', 1), A('MMSUBJ', 50)] + [A('MMB%d' % i, 72) for i in range(1, 9)], ['MMSTMP', 'MMTO'])
pf('OVNOTEP', 'NOTEREC', [A('NTUSER', 10), Z('NTSTMP'), A('NTTEXT', 72)], ['NTUSER', 'NTSTMP'])
pf('OVTASKP', 'TASKREC', [A('TKUSER', 10), Z('TKSTMP'), A('TKSTAT', 1), A('TKPRI', 1), N('TKDUE', 8), A('TKTEXT', 72)], ['TKUSER', 'TKSTMP'])
pf('OVPHONP', 'PHONREC', [A('PHUSER', 10), A('PHUNAM', 30), Z('PHSTMP'), A('PHNAME', 30), A('PHPHON', 20), A('PHMAIL', 40), A('PHNOTE', 40)], ['PHUSER', 'PHUNAM', 'PHSTMP'])
pf('OVCALP', 'CALREC', [A('CLUSER', 10), N('CLDATE', 8), N('CLTIME', 4), Z('CLSTMP'), A('CLTEXT', 60)], ['CLUSER', 'CLDATE', 'CLTIME', 'CLSTMP'])
pf('OVDOCP', 'DOCREC', [A('DCUSER', 10), A('DCNAME', 10), A('DCTITL', 40), Z('DCSTMP'), N('DCLINE', 5)], ['DCUSER', 'DCNAME'])
pf('OVDOCLP', 'DOCLREC', [A('DLUSER', 10), A('DLNAME', 10), N('DLSEQ', 5), A('DLTEXT', 76)], ['DLUSER', 'DLNAME', 'DLSEQ'])
pf('OVCATP', 'CATREC', [A('CTUSER', 10), A('CTNAME', 12), N('CTFOOD', 3), N('CTJOY', 3), Z('CTSTMP')], ['CTUSER'])
pf('OVSCORP', 'SCORREC', [A('SCUSER', 10), A('SCGAME', 10), N('SCWIN', 5), N('SCLOSS', 5), N('SCDRAW', 5), N('SCBEST', 5)], ['SCUSER', 'SCGAME'])
# printer file
SRC['OVPRTF.DDS'] = ['     A* OVPRTF - OfficeVibes/400 report printer file',
  dds(typ='R', name='PHEAD', kw='SKIPB(3)'), K('SPACEA(2)'),
  dds(name='PTITLE', length=60, dtype='A', pos=1), dds(pos=70, kw='DATE EDTCDE(Y)'), dds(pos=82, kw='TIME'),
  dds(pos=95, kw="'Page'"), dds(pos=100, kw='PAGNBR EDTCDE(Z)'),
  dds(typ='R', name='PLINE', kw='SPACEA(1)'), dds(name='PTEXT', length=100, dtype='A', pos=1)]
FIELDS['OVPRTF'] = {'PTITLE', 'PTEXT'}; RECS['OVPRTF'] = {'PHEAD', 'PLINE'}
def hdr(P, hid, fk=None):
    s = "EVAL HDRID = '%s'\nEXSR HDR\nEVAL %sHDR = HDRLN\n" % (hid, P)
    return s + ("EVAL %sFK = 'F1=Help   %s'\n" % (P, fk) if fk else '')
def log(act, txt): return "EVAL LACT = '%s'\nEVAL LTXT = %s\nEXSR LOGIT\n" % (act, txt)
def pl(expr): return "EVAL PACT = 'L'\nEVAL PTXT = %s\nEXSR PRT\n" % expr
def popen(expr): return "EVAL PACT = 'O'\nEVAL PTXT = %s\nEXSR PRT\n" % expr
PCLOSE = "EVAL PACT = 'C'\nEXSR PRT\nEVAL MSG = 'Printed.  See Printed output on the main menu.'\n"
PAGED = """
IF NMATCH > BASE AND NMATCH <= BASE + 10
EVAL ROW = NMATCH - BASE
"""
# ---------------- helpers: OVLOG, OVPRT ----------------
MIN = [D('PSDS', 'SDS'), D(' PGMUSR', '', 263, frm=254)]
small('OVLOG', [F('OVLOGP', 'U', 'A', True, 'DISK')], MIN + [S('PA1', 10), S('PA2', 10), S('PA3', 60)], """
*ENTRY | PLIST
 | PARM | | PA1
 | PARM | | PA2
 | PARM | | PA3
 | TIME | | LGSTMP
EVAL LGUSER = PGMUSR
EVAL LGAPP = PA1
EVAL LGACT = PA2
EVAL LGTEXT = PA3
 | WRITE | LOGREC
 | RETURN
""", ['OVLOGP'])
small('OVPRT', [F('OVPRTF', 'O', ' ', False, 'PRINTER', 'OFLIND(*IN90) USROPN', desig=' ')], [S('PA1', 1), S('PA2', 100)], """
*ENTRY | PLIST
 | PARM | | PA1
 | PARM | | PA2
SELECT
WHEN PA1 = 'O'
IF NOT %OPEN(OVPRTF)
 | OPEN | OVPRTF
ENDIF
EVAL PTITLE = PA2
 | WRITE | PHEAD
WHEN PA1 = 'L'
IF *IN90 = *ON
 | WRITE | PHEAD
EVAL *IN90 = *OFF
ENDIF
EVAL PTEXT = PA2
 | WRITE | PLINE
WHEN PA1 = 'C'
IF %OPEN(OVPRTF)
 | CLOSE | OVPRTF
ENDIF
ENDSL
 | RETURN
""", ['OVPRTF'])
# ---------------- OVGSET: settings for the shared start-up routine ----------------
small('OVGSET', [F('OVSETUP', 'I', ' ', True, 'DISK')], MIN + [S('PSET', 40), S('WOFF', 5)], """
*ENTRY | PLIST
 | PARM | | PSET
EVAL PSET = 'IS08001700      +0000'
PGMUSR | CHAIN | SETREC
IF %FOUND(OVSETUP)
IF STUNIT = 'M'
EVAL %SUBST(PSET:1:1) = 'M'
ENDIF
IF STWEEK = 'M'
EVAL %SUBST(PSET:2:1) = 'M'
ENDIF
IF STDBEG > 0 OR STDEND > 0
EVAL %SUBST(PSET:3:4) = %EDITC(STDBEG:'X')
EVAL %SUBST(PSET:7:4) = %EDITC(STDEND:'X')
ENDIF
EVAL %SUBST(PSET:11:6) = STZONE
ENDIF
EVAL WOFF = *BLANKS
 | CALL | 'OVTZC' | | 50
 | PARM | | WOFF
IF *IN50 = *OFF AND WOFF <> *BLANKS
EVAL %SUBST(PSET:17:5) = WOFF
ENDIF
EVAL *IN50 = *OFF
 | RETURN
""", ['OVSETUP'])
# ---------------- OVUSRL: user lookup window ----------------
s = Scr('OVUSRL')
s.rec('DUMMY', 'ASSUME'); s.t(1, 3, ' ')
s.rec('LKWIN'); s.f('LKHDR', 78, 'O', 1, 2, 'DSPATR(HI)')
s.ctr(2, 'O F F I C E   D I R E C T O R Y', 'DSPATR(HI)')
s.t(4, 3, 'Find'); s.f('LKFND', 20, 'B', 4, 9, 'CHECK(LC)', 'DSPATR(UL)')
s.t(4, 31, 'part of a name, user ID or department', 'COLOR(BLU)')
s.t(6, 2, 'Opt  User       Name                           Department       Phone', 'COLOR(WHT)')
for i in range(1, 15): s.f('LKO%02d' % i, 1, 'B', 6 + i, 3, 'DSPATR(UL)'); s.f('LKL%02d' % i, 72, 'O', 6 + i, 7)
s.f('LKMSG', 76, 'O', 22, 3, 'DSPATR(HI)'); s.f('LKFK', 78, 'O', 23, 2, 'COLOR(BLU)'); s.save()
prog('OVUSRL', [('OVUSERP', 'I')], 'OVUSRL',
 arrds('LKLA', 'LKL', 72, ['LKL%02d' % i for i in range(1, 15)]) + arrds('LKOA', 'LKO', 1, ['LKO%02d' % i for i in range(1, 15)]) +
 [S('KU', 10, kw='DIM(14)'), S('PSEL', 10), S('ULINE', 60)], """
*ENTRY | PLIST
 | PARM | | PSEL
EVAL PSEL = *BLANKS
DOW *IN03 = *OFF AND *IN12 = *OFF
EXSR LOAD
IF PGNO > 0 AND BASE >= NMATCH
EVAL PGNO = 0
EXSR LOAD
ENDIF
EVAL LKMSG = MSG
IF MSG = *BLANKS
EVAL LKMSG = %CHAR(NMATCH) + ' user(s).  Type any letter beside one, or cursor + Enter.'
ENDIF
EVAL MSG = *BLANKS
EVAL LKOA = *BLANKS
""" + hdr('LK', 'OFCDIRECT', 'Enter=Select   F7/F8=Page   F12=Cancel') + """
 | EXFMT | LKWIN
EXSR CSR
EVAL UNEED = %TRIML(LKFND)
LCASE:UCASE | XLATE | UNEED | UNEED
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN07 = *ON
IF PGNO > 0
EVAL PGNO = PGNO - 1
ENDIF
ITER
ENDIF
IF *IN08 = *ON
IF BASE + 14 < NMATCH
EVAL PGNO = PGNO + 1
ENDIF
ITER
ENDIF
EVAL CSRSEL = CSRROW - 6
IF CSRSEL < 1 OR CSRSEL > NSHOW
EVAL CSRSEL = 0
ENDIF
1 | DO | NSHOW | ROW
IF LKO(ROW) <> *BLANK AND PSEL = *BLANKS
EVAL PSEL = KU(ROW)
ENDIF
 | ENDDO
IF PSEL = *BLANKS AND CSRSEL > 0
EVAL PSEL = KU(CSRSEL)
ENDIF
IF PSEL <> *BLANKS
LEAVE
ENDIF
ENDDO
EVAL *INLR = *ON
LOAD | BEGSR
EVAL LKLA = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 14
*LOVAL | SETLL | USERREC
 | READ | USERREC
DOW NOT %EOF(OVUSERP)
EVAL ULINE = USUSER + ' ' + USNAME + ' ' + USDEPT
LCASE:UCASE | XLATE | ULINE | ULINE
IF USSTAT = 'A' AND (UNEED = *BLANKS OR %SCAN(%TRIMR(UNEED):ULINE) > 0)
EVAL NMATCH = NMATCH + 1
IF NMATCH > BASE AND NMATCH <= BASE + 14
EVAL ROW = NMATCH - BASE
EVAL LKL(ROW) = USUSER + ' ' + USNAME + ' ' + %SUBST(USDEPT:1:16) + ' ' + %SUBST(USPHON:1:13)
EVAL KU(ROW) = USUSER
ENDIF
ENDIF
 | READ | USERREC
ENDDO
EVAL NSHOW = NMATCH - BASE
IF NSHOW > 14
EVAL NSHOW = 14
ENDIF
IF NSHOW < 0
EVAL NSHOW = 0
ENDIF
 | ENDSR
""")
# ---------------- OFFMENU ----------------
MNAMES = 'January  February March    April    May      June     July     August   SeptemberOctober  November December '
s = Scr('OFFMNU'); s.rec('MNUREC')
s.f('MHDR', 78, 'O', 1, 2, 'DSPATR(HI)')
s.t(2, 26, 'O F F I C E V I B E S / 4 0 0', 'DSPATR(HI)'); s.t(3, 29, 'Office Suite for OS/400')
s.t(4, 3, 'Select one of the following:')
for i, tx in enumerate([' 1. Calendar', ' 2. Mail, messages and chat', ' 3. Notes, tasks and phone book', ' 4. Documents and spreadsheets',
    ' 5. Search everything', ' 6. Office directory', ' 7. Games and the office cat', ' 8. Printed output', ' 9. Settings',
    '10. Administration']): s.t(6 + i, 8, tx)
for n, ln in (('MI01', 6), ('MI02', 7), ('MI03', 8)): s.f(n, 12, 'O', ln, 41, 'DSPATR(HI)')
s.t(17, 8, '90. Sign off')
s.f('MCT', 20, 'O', 5, 56, 'DSPATR(HI)'); s.f('MWK', 20, 'O', 6, 56)
for i in range(1, 7): s.f('MC%d' % i, 21, 'O', 6 + i, 55)
for i in range(1, 7): s.f('MA%d' % i, 12, 'O', 13 + i, 60)
s.f('MSGN', 52, 'O', 21, 27); s.t(21, 3, 'Selection . . .'); s.f('MSEL', 3, 'B', 21, 20, 'DSPATR(UL)')
s.f('MMSG', 74, 'O', 22, 3, 'DSPATR(HI)'); s.f('MFKEY', 78, 'O', 23, 2, 'COLOR(BLU)')
s.edit('PROF', 'P'); s.ctr(2, 'S E T T I N G S', 'DSPATR(HI)')
s.t(3, 3, 'About you', 'COLOR(WHT)')
s.inp('Your name', 'PNAME', 30, 4); s.inp('Department', 'PDEPT', 20, 5); s.inp('Phone', 'PPHON', 20, 6)
s.inp('Pop-up messages', 'PPOP', 1, 7, lc=False); s.t(7, 37, 'Y = show at once, N = wait quietly', 'COLOR(BLU)')
s.t(9, 3, 'Calendar and clock', 'COLOR(WHT)')
s.inp('Time zone', 'PZONE', 6, 10, lc=False); s.f('PZH', 42, 'O', 10, 37, 'COLOR(BLU)')
s.inp('Week starts on', 'PWEEK', 1, 11, lc=False); s.t(11, 37, 'S = Sunday, M = Monday', 'COLOR(BLU)')
s.inp('Working day', 'PDBEG', 5, 12, lc=False); s.t(12, 30, 'to'); s.f('PDEND', 5, 'B', 12, 33, 'DSPATR(UL)')
s.t(12, 40, 'HH:MM, such as 08:00 to 17:00', 'COLOR(BLU)')
s.inp('Units', 'PUNIT', 1, 13, lc=False); s.t(13, 37, 'I = 12-hour clock, M/D/YYYY', 'COLOR(BLU)')
s.t(14, 37, 'M = metric: 24-hour clock, D.M.YYYY', 'COLOR(BLU)')
s.t(15, 3, 'Animations', 'COLOR(WHT)')
s.inp('Animations', 'PANIM', 1, 16, lc=False); s.t(16, 37, 'Y or N.  N stops everything that moves', 'COLOR(BLU)')
s.inp('Character', 'PCHAR', 7, 17, lc=False); s.t(17, 37, 'COFFEE CAT DOG ROBOT FISH NONE', 'COLOR(BLU)')
s.inp('Screen saver after', 'PSAVE', 3, 18, lc=False); s.t(18, 37, 'Minutes on the calendar.  0 = never', 'COLOR(BLU)')
s.inp('Chat refresh', 'PCHAT', 1, 19, lc=False); s.t(19, 37, 'A = new lines appear, M = press F5', 'COLOR(BLU)')
s.rec('SUBM'); s.f('SBHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.f('SBTTL', 40, 'O', 3, 21, 'DSPATR(HI)')
s.t(5, 3, 'Select one of the following:')
for i in range(1, 7): s.f('SO%d' % i, 36, 'O', 6 + i, 8); s.f('SC%d' % i, 16, 'O', 6 + i, 46, 'DSPATR(HI)')
s.t(20, 3, 'Selection . . .'); s.f('SSEL', 2, 'B', 20, 20, 'DSPATR(UL)')
s.f('SBMSG', 74, 'O', 22, 3, 'DSPATR(HI)'); s.f('SBFK', 78, 'O', 23, 2, 'COLOR(BLU)')
s.save()
def cnt(setll, read, pfn, cond, fld, word):
    return """
EVAL CNT = 0
%s
%s
DOW NOT %%EOF(%s)
IF %s
EVAL CNT = CNT + 1
ENDIF
%s
ENDDO
EVAL %s = *BLANKS
IF CNT > 0
EVAL %s = %%CHAR(CNT) + ' %s'
ENDIF
""" % (setll, read, pfn, cond, read, fld, fld, word)
prog('OFFMENU', [('OVUSERP', 'U'), ('OVMSGP', 'I'), ('OVMAILP', 'I'), ('OVTASKP', 'I'), ('OVCALP', 'I'), ('OVPREFP', 'U'), ('OVSETUP', 'U')], 'OFFMNU',
 SETVARS + ZNVARS + HMVARS + [S('WCHR', 7), S('WBEG', 5, 0), S('WSAV', 5, 0)] +
 arrds('MCA', 'MC', 21, ['MC%d' % i for i in range(1, 7)]) + arrds('MAA', 'MA', 12, ['MA%d' % i for i in range(1, 7)]) + DC('MNAMES', MNAMES) + artdc(False) +
 arrds('SOA', 'SO', 36, ['SO%d' % i for i in range(1, 7)]) + arrds('SCA', 'SC', 16, ['SC%d' % i for i in range(1, 7)]) +
 [S('SP', 10, kw='DIM(6)'), S('SUBK', 5, 0), S('NOPT', 5, 0), S('WTITL', 40), S('NMSGN', 5, 0), S('NMAILN', 5, 0), S('NTASKN', 5, 0), S('NTODAY', 5, 0), S('K', 5, 0)] +
 [S('ART', 72), S('MIDX', 5, 0)] +
 [S('SEL', 3), S('SELN', 5, 0), S('PGMNAM', 10), S('ISADM', 1), S('WADM', 1), S('DMSG', 52), S('CNT', 5, 0), S('KDATE', 8, 0),
  S('TODD', 'D'), S('F1', 'D'), S('NXT', 'D'), S('BASEDT', 'D', kw="INZ(D'2000-01-02')"), S('NDAYS', 7, 0), S('FDOW', 5, 0), S('MDAYS', 5, 0),
  S('TODN', 8, 0), S('FIRSTN', 8, 0), S('DY', 5, 0), S('DAY2', 2, 0), S('CELL', 5, 0), S('RW', 5, 0), S('CC', 5, 0), S('MARK', 1), S('ACC', 14)], """
EXSR MINCAL
KEYD | KLIST
 | KFLD | | KUSER
 | KFLD | | KDATE
EVAL LAPP = 'MENU'
PGMUSR | CHAIN | USERREC
IF NOT %FOUND(OVUSERP)
*LOVAL | SETLL | USERREC
 | READ(N) | USERREC
EVAL WADM = 'N'
IF %EOF(OVUSERP) OR PGMUSR = 'QSECOFR'
EVAL WADM = 'Y'
ENDIF
EVAL USUSER = PGMUSR
EVAL USNAME = PGMUSR
EVAL USDEPT = *BLANKS
EVAL USPHON = *BLANKS
EVAL USADM = WADM
EVAL USSTAT = 'A'
 | TIME | | USCRT
 | TIME | | USLAST
 | WRITE | USERREC
""" + log('ENROLL', "'Enrolled at first use'") + """
ELSE
IF USSTAT = 'D'
 | UNLOCK | OVUSERP
EVAL DMSG = 'Your office access has been disabled.'
DMSG | DSPLY
EVAL *INLR = *ON
 | RETURN
ENDIF
 | TIME | | USLAST
 | UPDATE | USERREC
ENDIF
EVAL ISADM = USADM
""" + log('SIGNON', "'Opened the office menu'") + """
DOW *IN03 = *OFF
EXSR COUNTS
EVAL HDRID = 'OFCMAIN'
EXSR HDR
EVAL MHDR = HDRLN
EVAL ACC = 'user'
IF ISADM = 'Y'
EVAL ACC = 'administrator'
ENDIF
EVAL MSGN = 'Signed on as ' + %TRIM(PGMUSR) + '.  Access: ' + %TRIM(ACC) + '.'
EVAL MSEL = *BLANKS
EVAL MMSG = MSG
EVAL MFKEY = 'F1=Help   F3=Sign off this menu   F5=Refresh'
EVAL MSG = *BLANKS
 | EXFMT | MNUREC
EXSR CSR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
EVAL SEL = %TRIML(MSEL)
LCASE:UCASE | XLATE | SEL | SEL
IF SEL = 'X'
LEAVE
ENDIF
EVAL SELN = 0
IF SEL = *BLANKS
IF CSRROW >= 6 AND CSRROW <= 15
EVAL SELN = CSRROW - 5
ENDIF
IF CSRROW = 17
EVAL SELN = 90
ENDIF
ELSE
EVAL NERR = '0'
EVAL NSTR = SEL
EXSR TONUM
EVAL SELN = NVAL
IF NERR = '1'
EVAL SELN = 999
ENDIF
ENDIF
EVAL PGMNAM = *BLANKS
SELECT
WHEN SELN = 0
ITER
WHEN SELN = 1
EVAL PGMNAM = 'OVCAL'
WHEN SELN = 2 OR SELN = 3 OR SELN = 4 OR SELN = 7
EVAL SUBK = SELN
EXSR SUBMNU
WHEN SELN = 5
EVAL PGMNAM = 'OVFIND'
WHEN SELN = 6
EXSR LOOKUP
IF SELUSR <> *BLANKS
SELUSR | CHAIN(N) | USERREC
IF %FOUND(OVUSERP)
EVAL MSG = %TRIMR(USUSER) + ': ' + %TRIMR(USNAME)
IF USDEPT <> *BLANKS
EVAL MSG = %TRIMR(MSG) + ', ' + %TRIMR(USDEPT)
ENDIF
IF USPHON <> *BLANKS
EVAL MSG = %TRIMR(MSG) + ', phone ' + %TRIMR(USPHON)
ENDIF
ENDIF
ENDIF
WHEN SELN = 8
EVAL CMD = 'WRKSPLF'
EXSR RUNCMD
EVAL *IN50 = *OFF
WHEN SELN = 9
EXSR PROFIL
WHEN SELN = 10
IF ISADM = 'Y'
EVAL PGMNAM = 'OVADM'
ELSE
EVAL MSG = 'Administration is for office administrators only.'
ENDIF
WHEN SELN = 90
LEAVE
OTHER
EVAL MSG = 'That is not one of the choices.'
ENDSL
IF PGMNAM <> *BLANKS
 | CALL | PGMNAM | | 50
IF *IN50 = *ON
EVAL MSG = 'Program ' + %TRIM(PGMNAM) + ' could not be run.'
EVAL *IN50 = *OFF
ENDIF
ENDIF
ENDDO
""" + log('SIGNOFF', "'Left the office menu'") + """
EVAL *INLR = *ON
* ---- counts shown beside the menu lines ----
COUNTS | BEGSR
EVAL NMSGN = 0
*LOVAL | SETLL | MSGREC
 | READ | MSGREC
DOW NOT %EOF(OVMSGP)
IF MGTO = PGMUSR AND MGSTAT = 'N'
EVAL NMSGN = NMSGN + 1
ENDIF
 | READ | MSGREC
ENDDO
EVAL NMAILN = 0
*LOVAL | SETLL | MAILREC
 | READ | MAILREC
DOW NOT %EOF(OVMAILP)
IF MMTO = PGMUSR AND MMSTAT = 'N'
EVAL NMAILN = NMAILN + 1
ENDIF
 | READ | MAILREC
ENDDO
EVAL NTASKN = 0
KUSER | SETLL | TASKREC
KUSER | READE | TASKREC
DOW NOT %EOF(OVTASKP)
IF TKSTAT <> 'X'
EVAL NTASKN = NTASKN + 1
ENDIF
KUSER | READE | TASKREC
ENDDO

EVAL KDATE = TODN
EVAL NTODAY = 0
KEYD | SETLL | CALREC
KEYD | READE | CALREC
DOW NOT %EOF(OVCALP)
IF CLDATE = KDATE
EVAL NTODAY = NTODAY + 1
ENDIF
KEYD | READE | CALREC
ENDDO
""" + GETPREF + artsel('MA', False) + """
EVAL MI01 = *BLANKS
EVAL MI02 = *BLANKS
EVAL MI03 = *BLANKS
IF NTODAY > 0
EVAL MI01 = %CHAR(NTODAY) + ' today'
ENDIF
IF NMSGN + NMAILN > 0
EVAL MI02 = %CHAR(NMSGN + NMAILN) + ' new'
ENDIF
IF NTASKN > 0
EVAL MI03 = %CHAR(NTASKN) + ' open'
ENDIF
 | ENDSR
* ---- a submenu: SUBK is the main menu option ----
SUBMNU | BEGSR
DOW 1 = 1
EXSR COUNTS
EVAL SOA = *BLANKS
EVAL SCA = *BLANKS
EVAL SP = *BLANKS
SELECT
WHEN SUBK = 2
EVAL WTITL = 'Mail, messages and chat'
EVAL SO(1) = ' 1. Messages'
EVAL SP(1) = 'OVMSGS'
EVAL SO(2) = ' 2. Mail'
EVAL SP(2) = 'OVMAIL'
EVAL SO(3) = ' 3. Live chat'
EVAL SP(3) = 'OVCHAT'
EVAL NOPT = 3
IF NMSGN > 0
EVAL SC(1) = %CHAR(NMSGN) + ' new'
ENDIF
IF NMAILN > 0
EVAL SC(2) = %CHAR(NMAILN) + ' new'
ENDIF
WHEN SUBK = 3
EVAL WTITL = 'Notes, tasks and phone book'
EVAL SO(1) = ' 1. Notes'
EVAL SP(1) = 'OVNOTE'
EVAL SO(2) = ' 2. Tasks'
EVAL SP(2) = 'OVTASK'
EVAL SO(3) = ' 3. Phone book'
EVAL SP(3) = 'OVPHON'
EVAL NOPT = 3
IF NTASKN > 0
EVAL SC(2) = %CHAR(NTASKN) + ' open'
ENDIF
WHEN SUBK = 4
EVAL WTITL = 'Documents and spreadsheets'
EVAL SO(1) = ' 1. Documents'
EVAL SP(1) = 'OVDOC'
EVAL SO(2) = ' 2. Spreadsheets'
EVAL SP(2) = 'OVSHEET'
EVAL SO(3) = ' 3. Printed output'
EVAL SP(3) = '*SPLF'
EVAL NOPT = 3
OTHER
EVAL WTITL = 'Games and the office cat'
EVAL SO(1) = ' 1. Games'
EVAL SP(1) = 'OVGAME'
EVAL SO(2) = ' 2. The office cat'
EVAL SP(2) = 'OVCAT'
EVAL NOPT = 2
ENDSL
EVAL NLEN = %LEN(%TRIM(WTITL))
EVAL SBTTL = *BLANKS
EVAL %SUBST(SBTTL:%DIV(40 - NLEN:2) + 1:NLEN) = %TRIM(WTITL)
EVAL HDRID = 'OFCSUB'
EXSR HDR
EVAL SBHDR = HDRLN
EVAL SSEL = *BLANKS
EVAL SBMSG = MSG
EVAL MSG = *BLANKS
EVAL SBFK = 'F1=Help   F3=Exit   F12=Back to the main menu'
 | EXFMT | SUBM
EXSR CSR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
EVAL K = 0
IF SSEL <> *BLANKS
EVAL NERR = '0'
EVAL NSTR = %TRIML(SSEL)
EXSR TONUM
EVAL K = NVAL
IF NERR = '1'
EVAL K = 99
ENDIF
ELSE
IF CSRROW >= 7 AND CSRROW <= 6 + NOPT
EVAL K = CSRROW - 6
ENDIF
ENDIF
IF K = 0
ITER
ENDIF
IF K > NOPT
EVAL MSG = 'That is not one of the choices.'
ITER
ENDIF
IF SP(K) = '*SPLF'
EVAL CMD = 'WRKSPLF'
EXSR RUNCMD
EVAL *IN50 = *OFF
ELSE
 | CALL | SP(K) | | 50
IF *IN50 = *ON
EVAL MSG = 'Program ' + %TRIM(SP(K)) + ' could not be run.'
EVAL *IN50 = *OFF
ENDIF
ENDIF
ENDDO
""" + INDOFF + """
 | ENDSR
* ---- the small month calendar ----
MINCAL | BEGSR
 | TIME | | TS
 | MOVE | TS | TODD
*ISO | MOVE | TODD | TODN
 | MOVE | TODN | W8
EVAL W8 = %SUBST(W8:1:6) + '01'
 | MOVE | W8 | FIRSTN
*ISO | MOVE | FIRSTN | F1
F1 | ADDDUR | 1:*M | NXT
NXT | SUBDUR | F1 | MDAYS:*D
F1 | SUBDUR | BASEDT | NDAYS:*D
EVAL FDOW = %REM(%REM(NDAYS:7) + 7:7)
EVAL MWK = 'Su Mo Tu We Th Fr Sa'
IF UWEEK = 'M'
EVAL FDOW = %REM(FDOW + 6:7)
EVAL MWK = 'Mo Tu We Th Fr Sa Su'
ENDIF
EVAL MCA = *BLANKS
1 | DO | MDAYS | DY
EVAL CELL = FDOW + DY
EVAL RW = %DIV(CELL - 1:7) + 1
EVAL CC = %REM(CELL - 1:7)
EVAL DAY2 = DY
EVAL MARK = ' '
IF FIRSTN + DY - 1 = TODN
EVAL MARK = '>'
ENDIF
EVAL %SUBST(MC(RW):CC*3+1:3) = MARK + %EDITC(DAY2:'Z')
 | ENDDO
EVAL MM = %DIV(%REM(FIRSTN:10000):100)
EVAL MCT = %TRIMR(%SUBST(MNAMES:(MM-1)*9+1:9)) + ' ' + %SUBST(W8:1:4)
 | ENDSR
* ---- my profile ----
PROFIL | BEGSR
PGMUSR | CHAIN(N) | USERREC
EVAL PNAME = USNAME
EVAL PDEPT = USDEPT
EVAL PPHON = USPHON
EVAL PPOP = *BLANK
""" + GETSET + """
EVAL PANIM = ANIMON
EVAL PSAVE = %CHAR(SAVMIN)
EVAL PCHAT = CHATAU
EVAL PCHAR = %SUBST(MNAMEL:MIDX*7-6:7)
EVAL PZONE = UZONE
EVAL PZH = 'Blank = office time, UTC' + UOFFZ
EVAL PWEEK = UWEEK
EVAL PDBEG = %SUBST(%EDITC(UDBEG:'X'):1:2) + ':' + %SUBST(%EDITC(UDBEG:'X'):3:2)
EVAL PDEND = %SUBST(%EDITC(UDEND:'X'):1:2) + ':' + %SUBST(%EDITC(UDEND:'X'):3:2)
EVAL PUNIT = UNITS
EVAL PMSG = *BLANKS
DOW 1 = 1
""" + hdr('P', 'OFCSETTING', 'Enter=Save   F12=Cancel') + """
 | EXFMT | PROF
EVAL PMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
EVAL WCHR = %TRIML(PCHAR)
LCASE:UCASE | XLATE | WCHR | WCHR
EVAL K = 0
1 | DO | 6 | I
IF %SUBST(MNAMEL:I*7-6:7) = WCHR
EVAL K = I
ENDIF
 | ENDDO
EVAL NERR = '0'
EVAL NSTR = %TRIML(PSAVE)
EXSR TONUM
SELECT
WHEN PANIM <> 'Y' AND PANIM <> 'N'
EVAL PMSG = 'Animations must be Y or N.'
WHEN K = 0
EVAL PMSG = 'Character must be COFFEE, CAT, DOG, ROBOT, FISH or NONE.'
WHEN NERR = '1' OR NVAL > 999
EVAL PMSG = 'Screen saver must be a number of minutes, 0 for never.'
WHEN PCHAT <> 'A' AND PCHAT <> 'M'
EVAL PMSG = 'Chat refresh must be A or M.'
WHEN PNAME = *BLANKS
EVAL PMSG = 'Type your name.'
ENDSL
IF PMSG <> *BLANKS
ITER
ENDIF
EVAL WSAV = NVAL
* the calendar and clock part
EVAL ZOUT = *BLANKS
IF PZONE <> *BLANKS
EVAL ZTX = PZONE
EXSR PARSZN
IF NERR = '1'
EVAL PMSG = 'Time zone is hours from UTC, such as -05:00 or +01:00, or blank.'
ITER
ENDIF
ENDIF
IF PWEEK <> 'S' AND PWEEK <> 'M'
EVAL PMSG = 'Week starts on must be S or M.'
ITER
ENDIF
EVAL TM = PDBEG
EXSR PARSTM
IF NERR = '1' OR CLT < 0
EVAL PMSG = 'Type the start of your working day as HH:MM, such as 08:00.'
ITER
ENDIF
EVAL WBEG = CLT
EVAL TM = PDEND
EXSR PARSTM
IF NERR = '1' OR CLT <= WBEG
EVAL PMSG = 'The end of your working day must be HH:MM, after the start.'
ITER
ENDIF
IF PUNIT <> 'I' AND PUNIT <> 'M'
EVAL PMSG = 'Units must be I or M.'
ITER
ENDIF
PGMUSR | CHAIN | SETREC
EVAL STUSER = PGMUSR
EVAL STANIM = PANIM
EVAL STCHAT = PCHAT
EVAL STSAVE = WSAV
EVAL STZONE = ZOUT
EVAL STWEEK = PWEEK
EVAL STDBEG = WBEG
EVAL STDEND = CLT
EVAL STUNIT = PUNIT
IF %FOUND(OVSETUP)
 | UPDATE | SETREC
ELSE
 | WRITE | SETREC
ENDIF
EVAL MIDX = K
PGMUSR | CHAIN | PREFREC
EVAL PRUSER = PGMUSR
EVAL PRMASC = %SUBST(MNAMEL:K*7-6:7)
IF %FOUND(OVPREFP)
 | UPDATE | PREFREC
ELSE
 | WRITE | PREFREC
ENDIF
LEAVE
ENDDO
IF *IN03 = *OFF AND *IN12 = *OFF
PGMUSR | CHAIN | USERREC
IF %FOUND(OVUSERP)
EVAL USNAME = %TRIML(PNAME)
EVAL USDEPT = %TRIML(PDEPT)
EVAL USPHON = %TRIML(PPHON)
IF PPOP = 'Y' OR PPOP = 'N'
EVAL CMD = 'CHGMSGQ MSGQ(*USRPRF) DLVRY(*NOTIFY)'
IF PPOP = 'Y'
EVAL CMD = 'CHGMSGQ MSGQ(*USRPRF) DLVRY(*BREAK)'
ENDIF
EXSR RUNCMD
EVAL *IN50 = *OFF
ENDIF
 | UPDATE | USERREC
EVAL MSG = 'Settings saved.'
EXSR LOADSET
ENDIF
ENDIF
""" + INDOFF + PARSZN + PARSHM + """
 | ENDSR
""", hx=' DATFMT(*ISO)')
TABS = """
EVAL *IN41 = (SENT = '1')
EVAL @T1@ = ' @IN@ '
IF SENT = '0'
EVAL @T1@ = ' @IN@ (' + %CHAR(NEWC) + ' new) '
ENDIF
EVAL @T2@ = ' Sent '
"""
# ---------------- OVMSGS / OVMAIL ----------------
BOX = """
KEY2 | KLIST
 | KFLD | | KSTMP
 | KFLD | | KTO
EVAL LAPP = '@APP@'
@MAIN@
EVAL *INLR = *ON
* ---- newest first, one page ----
LOAD | BEGSR
EVAL @P@LNA = *BLANKS
""" + CLRIND + """
EVAL NMATCH = 0
EVAL NEWC = 0
EVAL BASE = PGNO * 10
*HIVAL | SETGT | @REC@
 | READP(N) | @REC@
DOW NOT %EOF(@PF@)
IF (SENT = '1' AND @p@FROM = PGMUSR) OR (SENT = '0' AND @p@TO = PGMUSR)
EVAL NMATCH = NMATCH + 1
EVAL FLAG = ' '
IF SENT = '0' AND @p@STAT = 'N'
EVAL NEWC = NEWC + 1
EVAL FLAG = '*'
ENDIF
""" + PAGED + """
EVAL WHO = @p@FROM
IF SENT = '1'
EVAL WHO = @p@TO
ENDIF
 | MOVE | @p@STMP | WSTMP
EXSR FMTDT
EVAL @P@LN(ROW) = FLAG + ' ' + WHO + ' ' + WDT + '  ' + @TXT@
EVAL KS(ROW) = @p@STMP
EVAL KT(ROW) = @p@TO
IF FLAG = '*'
EVAL *IN(60 + ROW) = *ON
ENDIF
ENDIF
ENDIF
 | READP(N) | @REC@
ENDDO
""" + SHOWN + """
IF SENT = '1'
EVAL TTLW = '@TS@ - ' + %CHAR(NMATCH)
EVAL COLH = COLHS
ELSE
EVAL TTLW = '@TI@ - ' + %CHAR(NMATCH) + ', ' + %CHAR(NEWC) + ' new'
EVAL COLH = COLHI
ENDIF
 | ENDSR
* ---- send to a user, a group or everyone ----
SENDTO | BEGSR
EVAL NSENT = 0
IF TOU = 'ALL'
*LOVAL | SETLL | USERREC
 | READ | USERREC
DOW NOT %EOF(OVUSERP)
IF USSTAT = 'A' AND USUSER <> PGMUSR
EVAL RCPT = USUSER
EXSR WR1
ENDIF
 | READ | USERREC
ENDDO
ELSE
TOU | SETLL | GRPREC
IF %EQUAL(OVGRPP)
TOU | READE | GRPREC
DOW NOT %EOF(OVGRPP)
EVAL RCPT = GRUSER
EXSR WR1
TOU | READE | GRPREC
ENDDO
ELSE
TOU | CHAIN | USERREC
IF %FOUND(OVUSERP)
EVAL RCPT = TOU
EXSR WR1
ENDIF
ENDIF
ENDIF
IF NSENT = 0
EVAL MSG = %TRIM(TOU) + ' is not a user or group.  Press F4 for a list.'
ELSE
EVAL MSG = 'Sent to ' + %CHAR(NSENT) + ' recipient(s).'
""" + log('SEND', "'To ' + %TRIM(TOU) + ', ' + %CHAR(NSENT) + ' copies'") + """
ENDIF
 | ENDSR
WR1 | BEGSR
EVAL @p@TO = RCPT
EXSR NEWTS
EVAL @p@STMP = TS
 | WRITE | @REC@
EVAL NSENT = NSENT + 1
EVAL QSRC = NTFY
EXSR QUOTE
EVAL CMD = 'SNDMSG MSG(''' + QTXT + ''') TOUSR(' + %TRIM(RCPT) + ')'
EXSR RUNCMD
EVAL *IN50 = *OFF
 | ENDSR
@TAIL@
"""
BKEYS = """
IF *IN05 = *ON
ITER
ENDIF
IF *IN04 = *ON
 | CALL | 'OVFIND' | | 50
EVAL *IN50 = *OFF
ITER
ENDIF
IF *IN06 = *ON
EVAL PREFTO = *BLANKS
@CLR@
EXSR COMPOS
ITER
ENDIF
IF *IN10 = *ON
IF SENT = '1'
EVAL SENT = '0'
ELSE
EVAL SENT = '1'
ENDIF
EVAL PGNO = 0
ITER
ENDIF
@XKEYS@
"""
BACTS = """
EVAL DCNT = 0
1 | DO | NSHOW | ROW
EVAL OP = %TRIM(@P@OP(ROW))
LCASE:UCASE | XLATE | OP | OP
IF OP <> *BLANKS
EVAL KSTMP = KS(ROW)
EVAL KTO = KT(ROW)
SELECT
WHEN OP = '4'
KEY2 | CHAIN | @REC@
IF %FOUND(@PF@)
 | DELETE | @REC@
EVAL DCNT = DCNT + 1
ENDIF
@XACT@
ENDSL
ENDIF
 | ENDDO
IF DCNT > 0
EVAL MSG = %CHAR(DCNT) + ' deleted.'
""" + log('DELETE', "%CHAR(DCNT) + ' item(s)'") + """
ENDIF
"""
COMPOS = """
DOW 1 = 1
@HDR@
 | EXFMT | @FMT@
EVAL @C@MSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN04 = *ON
EXSR LOOKUP
IF SELUSR <> *BLANKS
EVAL @C@TO = SELUSR
ENDIF
ITER
ENDIF
EVAL TOU = %TRIML(@C@TO)
LCASE:UCASE | XLATE | TOU | TOU
IF TOU = *BLANKS OR @NEED@ = *BLANKS
EVAL @C@MSG = 'Both the recipient and the @WHAT@ are needed.'
ITER
ENDIF
@SET@
EXSR SENDTO
IF NSENT = 0
EVAL @C@MSG = MSG
EVAL MSG = *BLANKS
ITER
ENDIF
LEAVE
ENDDO
""" + INDOFF
def box(name, pfile, rec, p, P, fmt, hid, app, ts, ti, colhs, colhi, fk1, fk2, txt, clr, xkeys, xact, pre, extraD, tail, r0=5):
    rp = lambda t: t.replace('@REC@', rec).replace('@PF@', pfile).replace('@p@', p).replace('@P@', P)
    main = listmain(P, fmt, hid, pre=pre, keys=BKEYS.replace('@CLR@', clr).replace('@XKEYS@', xkeys), acts=rp(BACTS.replace('@XACT@', xact)), deflt='5', r0=r0, lcol=7)
    body = rp(BOX.replace('@MAIN@', main).replace('@TAIL@', tail).replace('@APP@', app).replace('@TS@', ts).replace('@TI@', ti).replace('@TXT@', txt))
    prog(name, [(pfile, 'U'), ('OVUSERP', 'I'), ('OVGRPP', 'I')], name,
      listds(P, 72) + [S('SENT', 1, kw="INZ('0')"), S('NEWC', 5, 0), S('FLAG', 1), S('WHO', 10), S('TOU', 10), S('PREFTO', 10), S('RCPT', 10),
        S('NSENT', 5, 0), S('KT', 10, kw='DIM(10)'), S('KTO', 10), S('NTFY', 100), S('COLH', 74)] + extraD +
      DC('COLHS', colhs) + DC('COLHI', colhi) + DC('FK1', fk1) + DC('FK2', fk2), body)
s = Scr('OVMSGS'); lay_msgs(s); s.edit('MSEND', 'S')
s.inp('To user, group or ALL', 'STO', 10, 4, lc=False, pos=27); s.t(4, 40, 'F4 shows a list', 'COLOR(BLU)')
s.t(6, 3, 'Message'); s.f('STEXT', 72, 'B', 7, 3, 'CHECK(LC)', 'DSPATR(UL)'); s.save()
box('OVMSGS', 'OVMSGP', 'MSGREC', 'MG', 'M', 'MLIST', 'OFCMSG', 'MESSAGES', 'Messages I have sent', 'Inbox',
 'Opt  To         Date/time         Message', 'Opt  From       Date/time         Message',
 '4=Delete  5=View  R=Reply   or put the cursor on a message and press Enter',
 'F1=Help  F3=Exit  F4=Search  F6=Send  F7/F8=Page  F9=To all  F10=Inbox/Sent', 'MGTEXT', '',
 "IF *IN09 = *ON\nEVAL PREFTO = 'ALL'\nEXSR COMPOS\nITER\nENDIF\n",
 "WHEN OP = '5'\nEXSR SHOW\nWHEN OP = 'R'\nEXSR REPLY\n", TABS.replace('@T1@', 'MTB1').replace('@T2@', 'MTB2').replace('@IN@', 'Inbox') + """
IF INFO = *BLANKS
EVAL MINF = 'Put 5 beside a message, or the cursor on it, and press Enter.'
EVAL MIN2 = *BLANKS
ELSE
EVAL MINF = INFO
EVAL MIN2 = INF2
ENDIF
EVAL INFO = *BLANKS
EVAL INF2 = *BLANKS
""", [S('INFO', 74), S('INF2', 74)], """
SHOW | BEGSR
KEY2 | CHAIN | MSGREC
IF %FOUND(OVMSGP)
 | MOVE | MGSTMP | WSTMP
EXSR FMTDT
EVAL INFO = 'From ' + %TRIMR(MGFROM) + ' to ' + %TRIMR(MGTO) + ', ' + WDT
EVAL INF2 = MGTEXT
IF MGTO = PGMUSR AND MGSTAT = 'N'
EVAL MGSTAT = 'Y'
 | UPDATE | MSGREC
ELSE
 | UNLOCK | OVMSGP
ENDIF
ENDIF
 | ENDSR
REPLY | BEGSR
KEY2 | CHAIN(N) | MSGREC
IF %FOUND(OVMSGP)
EVAL PREFTO = MGFROM
EXSR COMPOS
ENDIF
 | ENDSR
COMPOS | BEGSR
EVAL STO = PREFTO
EVAL STEXT = *BLANKS
EVAL SMSG = 'Type a user, a group or ALL, then the message.'
""" + COMPOS.replace('@HDR@', hdr('S', 'OFCSNDMSG', 'Enter=Send   F4=List users   F12=Cancel')).replace('@FMT@', 'MSEND').replace('@C@', 'S')
   .replace('@NEED@', 'STEXT').replace('@WHAT@', 'message').replace('@SET@', """
EVAL MGFROM = PGMUSR
EVAL MGSTAT = 'N'
EVAL MGTEXT = %TRIML(STEXT)
EVAL NTFY = 'OfficeVibes message from ' + %TRIM(PGMUSR) + ': ' + MGTEXT
""") + """
 | ENDSR
""")
s = Scr('OVMAIL'); lay_mail(s); s.edit('LCOMP', 'C')
s.inp('To user, group or ALL', 'CTO', 10, 3, lc=False, pos=27); s.t(3, 40, 'F4 shows a list', 'COLOR(BLU)')
s.inp('Subject', 'CSUBJ', 50, 4, pos=27); s.t(6, 3, 'Text', 'COLOR(BLU)')
for i in range(1, 9): s.f('CB%d' % i, 72, 'B', 6 + i, 3, 'CHECK(LC)', 'DSPATR(UL)')
s.edit('LREAD', 'R'); s.f('RINF1', 74, 'O', 3, 3); s.f('RINF2', 74, 'O', 4, 3); s.f('RSUBJ', 74, 'O', 5, 3, 'DSPATR(HI)')
for i in range(1, 9): s.f('RB%d' % i, 72, 'O', 6 + i, 3)
s.save()
box('OVMAIL', 'OVMAILP', 'MAILREC', 'MM', 'L', 'LLIST', 'OFCMAIL', 'MAIL', 'Mail I have sent', 'Mailbox',
 'Opt  To         Date/time         Subject', 'Opt  From       Date/time         Subject',
 '4=Delete  5=Read   or put the cursor on a memo and press Enter',
 'F1=Help  F3=Exit  F4=Search  F6=Compose  F7/F8=Page  F10=Mailbox/Sent', 'MMSUBJ',
 "EVAL PSUBJ = *BLANKS\nEVAL PB = *BLANKS\n", '', "WHEN OP = '5'\nEXSR SHOW\n", TABS.replace('@T1@', 'LTB1').replace('@T2@', 'LTB2').replace('@IN@', 'Mailbox'),
 arrds('MBA', 'MB', 72, ['MMB%d' % i for i in range(1, 9)]) + arrds('RBA', 'RB', 72, ['RB%d' % i for i in range(1, 9)]) +
 arrds('CBA', 'CB', 72, ['CB%d' % i for i in range(1, 9)]) + [S('PB', 72, kw='DIM(8)'), S('PSUBJ', 50), S('WFROM', 10), S('WSUBJ', 50)], """
SHOW | BEGSR
KEY2 | CHAIN | MAILREC
IF %FOUND(OVMAILP)
IF MMTO = PGMUSR AND MMSTAT = 'N'
EVAL MMSTAT = 'Y'
 | UPDATE | MAILREC
ELSE
 | UNLOCK | OVMAILP
ENDIF
 | MOVE | MMSTMP | WSTMP
EXSR FMTDT
EVAL RINF1 = 'From: ' + %TRIMR(MMFROM) + '    To: ' + MMTO
EVAL RINF2 = 'Date: ' + WDT
EVAL RSUBJ = 'Subject: ' + MMSUBJ
EVAL RB = MB
EVAL RMSG = *BLANKS
EVAL WFROM = MMFROM
EVAL WSUBJ = MMSUBJ
DOW 1 = 1
""" + hdr('R', 'OFCMAILRD', 'F6=Reply   F9=Forward   F10=Print   F12=Back') + """
 | EXFMT | LREAD
EVAL RMSG = *BLANKS
SELECT
WHEN *IN06 = *ON
EVAL PREFTO = WFROM
EVAL PSUBJ = 'Re: ' + WSUBJ
EVAL PB = *BLANKS
EXSR COMPOS
LEAVE
WHEN *IN09 = *ON
EVAL PREFTO = *BLANKS
EVAL PSUBJ = 'Fw: ' + WSUBJ
EVAL PB = RB
EXSR COMPOS
LEAVE
WHEN *IN10 = *ON
""" + popen("'Mail memo'") + pl('RINF1') + pl('RINF2') + pl('RSUBJ') + pl('*BLANKS') + """
1 | DO | 8 | J
""" + pl('RB(J)') + """
 | ENDDO
""" + PCLOSE + """
EVAL RMSG = MSG
EVAL MSG = *BLANKS
OTHER
LEAVE
ENDSL
ENDDO
ENDIF
""" + INDOFF + """
 | ENDSR
COMPOS | BEGSR
EVAL CTO = PREFTO
EVAL CSUBJ = PSUBJ
EVAL CB = PB
EVAL CMSG = 'Fill in the memo, then press Enter to send.'
""" + COMPOS.replace('@HDR@', hdr('C', 'OFCMAILNEW', 'Enter=Send   F4=List users   F12=Cancel')).replace('@FMT@', 'LCOMP').replace('@C@', 'C')
   .replace('@NEED@', 'CSUBJ').replace('@WHAT@', 'subject').replace('@SET@', """
EVAL MMFROM = PGMUSR
EVAL MMSTAT = 'N'
EVAL MMSUBJ = %TRIML(CSUBJ)
EVAL MB = CB
EVAL NTFY = 'You have OfficeVibes mail from ' + %TRIM(PGMUSR) + ': ' + MMSUBJ
""") + """
 | ENDSR
""", r0=9)

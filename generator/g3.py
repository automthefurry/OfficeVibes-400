def printall(name, title, setll, read, pfn, pre, expr):
    return name + " | BEGSR\n" + popen(title) + setll + "\n" + read + "\nDOW NOT %EOF(" + pfn + ")\n" + pre + pl(expr) + read + "\nENDDO\n" + PCLOSE + " | ENDSR\n"
def delmsg(word): return "IF DCNT > 0\nEVAL MSG = %CHAR(DCNT) + ' " + word + " deleted.'\n" + log('DELETE', "%CHAR(DCNT) + ' " + word + "'") + "ENDIF\n"
KEY1 = "KEY1 | KLIST\n | KFLD | | KUSER\n | KFLD | | KSTMP\n"
# ---------------- OVNOTE ----------------
s = Scr('OVNOTE'); lay_notes(s); s.edit('NEDIT', 'E')
s.t(4, 3, 'Type your note, then press Enter.', 'COLOR(BLU)'); s.f('ENOTE', 72, 'B', 6, 3, 'CHECK(LC)', 'DSPATR(UL)'); s.save()
prog('OVNOTE', [('OVNOTEP', 'U')], 'OVNOTE', listds('N', 66) + [S('LINE', 70), S('ULINE', 70), S('EDMODE', 1)] +
 DC('COLH', 'Opt  When              Note') + DC('FK1', '2=Change  4=Delete   or put the cursor on a note and press Enter') +
 DC('FK2', 'F1=Help  F3=Exit  F6=Add  F7/F8=Page  F9=Print'), KEY1 + "EVAL LAPP = 'NOTES'\n" +
 listmain('N', 'NLIST', 'OFCNOTE', find=True, deflt='2', r0=7, lcol=9, keys="""
IF *IN06 = *ON
EVAL EDMODE = 'A'
EXSR EDITN
EVAL PGNO = 0
ITER
ENDIF
IF *IN09 = *ON
EXSR PRINTN
ITER
ENDIF
""", acts="""
EVAL DCNT = 0
1 | DO | NSHOW | ROW
EVAL OP = %TRIM(NOP(ROW))
IF OP = '2' OR OP = '4'
EVAL KSTMP = KS(ROW)
IF OP = '2'
EVAL EDMODE = 'C'
EXSR EDITN
ELSE
KEY1 | CHAIN | NOTEREC
IF %FOUND(OVNOTEP)
 | DELETE | NOTEREC
EVAL DCNT = DCNT + 1
ENDIF
ENDIF
ENDIF
 | ENDDO
""" + delmsg('note(s)')) + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL NLNA = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 10
KUSER | SETLL | NOTEREC
KUSER | READE(N) | NOTEREC
DOW NOT %EOF(OVNOTEP)
 | MOVE | NTSTMP | WSTMP
EXSR FMTDT
EVAL LINE = WDT + '  ' + NTTEXT
EVAL ULINE = LINE
LCASE:UCASE | XLATE | ULINE | ULINE
IF UNEED = *BLANKS OR %SCAN(%TRIMR(UNEED):ULINE) > 0
EVAL NMATCH = NMATCH + 1
""" + PAGED + """
EVAL NLN(ROW) = LINE
EVAL KS(ROW) = NTSTMP
ENDIF
ENDIF
KUSER | READE(N) | NOTEREC
ENDDO
""" + SHOWN + """
EVAL TTLW = %CHAR(NMATCH) + ' note(s) on the pad'
 | ENDSR
EDITN | BEGSR
EVAL ENOTE = *BLANKS
IF EDMODE = 'C'
KEY1 | CHAIN(N) | NOTEREC
IF %FOUND(OVNOTEP)
EVAL ENOTE = NTTEXT
ENDIF
ENDIF
""" + hdr('E', 'OFCWRTNOTE', 'Enter=Save   F12=Cancel') + """
EVAL EMSG = *BLANKS
 | EXFMT | NEDIT
IF *IN03 = *OFF AND *IN12 = *OFF AND ENOTE <> *BLANKS
IF EDMODE = 'C'
KEY1 | CHAIN | NOTEREC
ENDIF
IF EDMODE = 'C' AND %FOUND(OVNOTEP)
EVAL NTTEXT = %TRIML(ENOTE)
 | UPDATE | NOTEREC
ELSE
EVAL NTUSER = PGMUSR
EXSR NEWTS
EVAL NTSTMP = TS
EVAL NTTEXT = %TRIML(ENOTE)
 | WRITE | NOTEREC
ENDIF
ENDIF
""" + INDOFF + """
 | ENDSR
""" + printall('PRINTN', "'Notes for ' + PGMUSR", 'KUSER | SETLL | NOTEREC', 'KUSER | READE(N) | NOTEREC', 'OVNOTEP',
   " | MOVE | NTSTMP | WSTMP\nEXSR FMTDT\n", "WDT + '  ' + NTTEXT"))
# ---------------- OVTASK ----------------
s = Scr('OVTASK'); lay_tasks(s); s.edit('TADD', 'A')
s.t(4, 3, 'Task'); s.f('ATEXT', 72, 'B', 5, 3, 'CHECK(LC)', 'DSPATR(UL)')
s.inp('Due date', 'ADUE', 10, 7, lc=False); s.t(7, 37, 'M/D or M/D/YYYY, blank for none', 'COLOR(BLU)')
s.inp('Priority', 'APRI', 1, 9, lc=False); s.t(9, 37, 'H=High  M=Medium  L=Low', 'COLOR(BLU)'); s.save()
TLINE = """
EVAL BOX = '[ ]'
IF TKSTAT = 'X'
EVAL BOX = '[X]'
ENDIF
EVAL TAIL = *BLANKS
IF TKDUE <> 0
 | MOVE | TKDUE | W8
EVAL DUETXT = %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2) + '/' + %SUBST(W8:1:4)
SELECT
WHEN TKSTAT <> 'X' AND TKDUE < TODAY
EVAL TAIL = '  OVERDUE ' + DUETXT
WHEN TKSTAT <> 'X' AND TKDUE = TODAY
EVAL TAIL = '  due TODAY'
OTHER
EVAL TAIL = '  due ' + DUETXT
ENDSL
ENDIF
EVAL LINE = BOX + TKPRI + ' ' + %TRIMR(TKTEXT) + TAIL
"""
prog('OVTASK', [('OVTASKP', 'U')], 'OVTASK', listds('T', 72) + [S('PCT', 5, 0), S('BL', 5, 0),
  D('HASHES', 'C', kw="'" + '#' * 30 + "'"), D('DOTS', 'C', kw="'" + '.' * 30 + "'"), S('TODAY', 8, 0), S('OPENC', 5, 0), S('DONEC', 5, 0), S('LATEC', 5, 0),
  S('DUETXT', 10), S('TAIL', 30), S('BOX', 4), S('LINE', 100)] +
 DC('COLH', 'Opt  Done Pri Task') + DC('FK1', '2=Done  4=Delete  9=Reopen   or cursor on a task and Enter to finish it') +
 DC('FK2', 'F1=Help  F3=Exit  F6=Add  F7/F8=Page  F9=Print  F11=Remove finished'), KEY1 + "EVAL LAPP = 'TASKS'\n" +
 listmain('T', 'TLIST', 'OFCTASK', deflt='2', r0=7, lcol=7, keys="""
IF *IN06 = *ON
EXSR ADDT
EVAL PGNO = 0
ITER
ENDIF
IF *IN09 = *ON
EXSR PRINTT
ITER
ENDIF
IF *IN11 = *ON
EXSR CLRDON
EVAL PGNO = 0
ITER
ENDIF
""", acts="""
1 | DO | NSHOW | ROW
EVAL OP = %TRIM(TOP(ROW))
IF OP = '2' OR OP = '4' OR OP = '9'
EVAL KSTMP = KS(ROW)
KEY1 | CHAIN | TASKREC
IF %FOUND(OVTASKP)
SELECT
WHEN OP = '2'
EVAL TKSTAT = 'X'
 | UPDATE | TASKREC
WHEN OP = '9'
EVAL TKSTAT = 'O'
 | UPDATE | TASKREC
OTHER
 | DELETE | TASKREC
ENDSL
ENDIF
ENDIF
 | ENDDO
""") + """
EVAL *INLR = *ON
LOAD | BEGSR
 | TIME | | TS
 | MOVE | TS | WSTMP
EVAL W8 = %SUBST(WSTMP:1:4) + %SUBST(WSTMP:6:2) + %SUBST(WSTMP:9:2)
 | MOVE | W8 | TODAY
EVAL TLNA = *BLANKS
""" + CLRIND + """
EVAL NMATCH = 0
EVAL OPENC = 0
EVAL DONEC = 0
EVAL LATEC = 0
EVAL BASE = PGNO * 10
KUSER | SETLL | TASKREC
KUSER | READE(N) | TASKREC
DOW NOT %EOF(OVTASKP)
EVAL NMATCH = NMATCH + 1
IF TKSTAT = 'X'
EVAL DONEC = DONEC + 1
ELSE
EVAL OPENC = OPENC + 1
IF TKDUE <> 0 AND TKDUE < TODAY
EVAL LATEC = LATEC + 1
ENDIF
ENDIF
""" + PAGED + TLINE + """
EVAL TLN(ROW) = LINE
IF TKSTAT = 'X'
EVAL *IN(70 + ROW) = *ON
ELSE
IF TKDUE <> 0 AND TKDUE < TODAY
EVAL *IN(60 + ROW) = *ON
ENDIF
ENDIF
EVAL KS(ROW) = TKSTMP
ENDIF
KUSER | READE(N) | TASKREC
ENDDO
""" + SHOWN + """
EVAL TTLW = %CHAR(OPENC) + ' open, ' + %CHAR(DONEC) + ' done'
EVAL PCT = 0
IF OPENC + DONEC > 0
EVAL PCT = %DIV(DONEC * 100:OPENC + DONEC)
ENDIF
EVAL BL = %DIV(PCT * 30:100)
EVAL TBAR = '[' + DOTS + ']'
IF BL > 0
EVAL %SUBST(TBAR:2:BL) = %SUBST(HASHES:1:BL)
ENDIF
EVAL TPCT = %CHAR(PCT) + '% done'
IF LATEC > 0
EVAL TTLW = %TRIMR(TTLW) + ', ' + %CHAR(LATEC) + ' OVERDUE'
ENDIF
 | ENDSR
CLRDON | BEGSR
EVAL DCNT = 0
KUSER | SETLL | TASKREC
KUSER | READE | TASKREC
DOW NOT %EOF(OVTASKP)
IF TKSTAT = 'X'
 | DELETE | TASKREC
EVAL DCNT = DCNT + 1
ENDIF
KUSER | READE | TASKREC
ENDDO
 | UNLOCK | OVTASKP
EVAL MSG = %CHAR(DCNT) + ' finished task(s) removed.'
 | ENDSR
ADDT | BEGSR
EVAL ATEXT = *BLANKS
EVAL ADUE = *BLANKS
EVAL APRI = 'M'
EVAL AMSG = *BLANKS
DOW 1 = 1
""" + hdr('A', 'OFCADDTASK', 'Enter=Save   F12=Cancel') + """
 | EXFMT | TADD
EVAL AMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON OR ATEXT = *BLANKS
LEAVE
ENDIF
EVAL DUE = ADUE
EXSR PARSED
IF NERR = '1'
EVAL AMSG = 'That date is not M/D or M/D/YYYY.  Try again.'
ITER
ENDIF
IF APRI <> 'H' AND APRI <> 'L'
EVAL APRI = 'M'
ENDIF
EVAL TKUSER = PGMUSR
EXSR NEWTS
EVAL TKSTMP = TS
EVAL TKSTAT = 'O'
EVAL TKPRI = APRI
EVAL TKDUE = DUEVAL
EVAL TKTEXT = %TRIML(ATEXT)
 | WRITE | TASKREC
LEAVE
ENDDO
""" + INDOFF + """
 | ENDSR
""" + printall('PRINTT', "'Tasks for ' + PGMUSR", 'KUSER | SETLL | TASKREC', 'KUSER | READE(N) | TASKREC', 'OVTASKP', TLINE, 'LINE'))
# ---------------- OVPHON ----------------
s = Scr('OVPHON'); lay_phone(s); s.edit('PADD', 'A')
s.inp('Name', 'ANAME', 30, 4); s.inp('Phone', 'APHONE', 20, 6); s.inp('Mail address', 'AEMAIL', 40, 8); s.inp('Note', 'ANOTE', 40, 10); s.save()
prog('OVPHON', [('OVPHONP', 'U')], 'OVPHON', listds('P', 32) + [S('LTR', 1), S('K', 5, 0), S('CARDSET', 1, kw="INZ('0')"), S('ULINE', 140), S('KN', 30, kw='DIM(10)'), S('KUNAM', 30), S('NTOT', 5, 0), S('EDMODE', 1)] +
 DC('COLH', 'Opt  Name               Phone') + DC('FK1', '2=Change  4=Delete  5=Show card   Cursor on a letter + Enter jumps to it') +
 DC('FK2', 'F1=Help  F3=Exit  F6=Add  F7/F8=Page  F9=Print'), """
KEY3 | KLIST
 | KFLD | | KUSER
 | KFLD | | KUNAM
 | KFLD | | KSTMP
EVAL LAPP = 'PHONE'
""" + listmain('P', 'PLIST', 'OFCPHONE', find=True, deflt='5', r0=6, lcol=7, keys="""
IF CSRROW = 4 AND CSRCOL >= 3 AND CSRCOL <= 55
EVAL K = %DIV(CSRCOL - 3:2) + 1
EVAL LTR = ' '
IF K <= 26
EVAL LTR = %SUBST(UCASE:K:1)
ENDIF
EVAL PGNO = 0
EVAL CARDSET = '0'
ITER
ENDIF
IF *IN06 = *ON
EVAL EDMODE = 'A'
EXSR EDITP
EVAL PGNO = 0
ITER
ENDIF
IF *IN09 = *ON
EXSR PRINTP
ITER
ENDIF
""", acts="""
EVAL DCNT = 0
1 | DO | NSHOW | ROW
EVAL OP = %TRIM(POP(ROW))
IF OP = '2' OR OP = '4' OR OP = '5'
EVAL KUNAM = KN(ROW)
EVAL KSTMP = KS(ROW)
IF OP = '5'
EXSR SHOWC
ENDIF
IF OP = '2'
EVAL EDMODE = 'C'
EXSR EDITP
EVAL CARDSET = '0'
ENDIF
IF OP = '4'
EVAL CARDSET = '0'
KEY3 | CHAIN | PHONREC
IF %FOUND(OVPHONP)
 | DELETE | PHONREC
EVAL DCNT = DCNT + 1
ENDIF
ENDIF
ENDIF
 | ENDDO
""" + delmsg('entries')) + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL PLNA = *BLANKS
EVAL NMATCH = 0
EVAL NTOT = 0
EVAL BASE = PGNO * 10
KUSER | SETLL | PHONREC
KUSER | READE(N) | PHONREC
DOW NOT %EOF(OVPHONP)
EVAL NTOT = NTOT + 1
EVAL ULINE = PHNAME + ' ' + PHPHON + ' ' + PHMAIL + ' ' + PHNOTE
LCASE:UCASE | XLATE | ULINE | ULINE
IF (UNEED = *BLANKS OR %SCAN(%TRIMR(UNEED):ULINE) > 0) AND (LTR = ' ' OR %SUBST(PHUNAM:1:1) = LTR)
EVAL NMATCH = NMATCH + 1
""" + PAGED + """
EVAL PLN(ROW) = %SUBST(PHNAME:1:18) + ' ' + PHPHON
EVAL KN(ROW) = PHUNAM
EVAL KS(ROW) = PHSTMP
ENDIF
ENDIF
KUSER | READE(N) | PHONREC
ENDDO
""" + SHOWN + """
EVAL TTLW = %CHAR(NTOT) + ' entries'
IF LTR <> ' '
EVAL TTLW = %CHAR(NMATCH) + ' names starting with ' + LTR
ENDIF
IF CARDSET = '0'
EVAL PCNM = 'No entry chosen'
EVAL PCPH = *BLANKS
EVAL PCML = *BLANKS
EVAL PCNT = *BLANKS
IF NSHOW > 0
EVAL KUNAM = KN(1)
EVAL KSTMP = KS(1)
EXSR SHOWC
ENDIF
ENDIF
 | ENDSR
SHOWC | BEGSR
KEY3 | CHAIN(N) | PHONREC
IF %FOUND(OVPHONP)
EVAL PCNM = PHNAME
EVAL PCPH = PHPHON
EVAL PCML = PHMAIL
EVAL PCNT = PHNOTE
EVAL CARDSET = '1'
ENDIF
 | ENDSR
EDITP | BEGSR
EVAL ANAME = *BLANKS
EVAL APHONE = *BLANKS
EVAL AEMAIL = *BLANKS
EVAL ANOTE = *BLANKS
EVAL HDRID = 'OFCADDPHN'
IF EDMODE = 'C'
EVAL HDRID = 'OFCCHGPHN'
KEY3 | CHAIN(N) | PHONREC
IF %FOUND(OVPHONP)
EVAL ANAME = PHNAME
EVAL APHONE = PHPHON
EVAL AEMAIL = PHMAIL
EVAL ANOTE = PHNOTE
ENDIF
ENDIF
EXSR HDR
EVAL AHDR = HDRLN
EVAL AMSG = 'Only the name is required.'
EVAL AFK = 'Enter=Save   F12=Cancel'
 | EXFMT | PADD
IF *IN03 = *OFF AND *IN12 = *OFF AND ANAME <> *BLANKS
IF EDMODE = 'C'
KEY3 | CHAIN | PHONREC
ENDIF
EVAL PHUSER = PGMUSR
EVAL PHNAME = %TRIML(ANAME)
EVAL PHUNAM = PHNAME
LCASE:UCASE | XLATE | PHUNAM | PHUNAM
EVAL PHPHON = %TRIML(APHONE)
EVAL PHMAIL = %TRIML(AEMAIL)
EVAL PHNOTE = %TRIML(ANOTE)
IF EDMODE = 'C' AND %FOUND(OVPHONP)
 | UPDATE | PHONREC
ELSE
EXSR NEWTS
EVAL PHSTMP = TS
 | WRITE | PHONREC
ENDIF
ENDIF
""" + INDOFF + """
 | ENDSR
""" + printall('PRINTP', "'Phone book for ' + PGMUSR", 'KUSER | SETLL | PHONREC', 'KUSER | READE(N) | PHONREC', 'OVPHONP', '',
   "PHNAME + ' ' + PHPHON + ' ' + PHMAIL"))
# ---------------- OVDOC ----------------
s = Scr('OVDOC'); lay_docs(s); s.edit('DNEW', 'N')
s.inp('Document name', 'NNAME', 10, 4, lc=False); s.t(4, 37, 'Up to 10 letters or digits', 'COLOR(BLU)'); s.inp('Title', 'NTITL', 40, 6)
s.rec('DEDIT'); s.f('EHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.f('EINF', 74, 'O', 3, 3, 'DSPATR(HI)')
s.t(5, 3, '....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+.', 'COLOR(BLU)')
for i in range(1, 16): s.f('ED%02d' % i, 76, 'B', 5 + i, 3, 'CHECK(LC)')
s.f('EMSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f('EFK1', 78, 'O', 22, 2, 'COLOR(BLU)'); s.f('EFK2', 78, 'O', 23, 2, 'COLOR(BLU)'); s.save()
DELLN = """
KEY2D | SETLL | DOCLREC
KEY2D | READE | DOCLREC
DOW NOT %EOF(OVDOCLP)
 | DELETE | DOCLREC
KEY2D | READE | DOCLREC
ENDDO
"""
prog('OVDOC', [('OVDOCP', 'U'), ('OVDOCLP', 'U')], 'OVDOC', listds('D', 30) + arrds('DLBA', 'DLB', 30, ['DLB%02d' % i for i in range(1, 11)]) +
 arrds('DLCA', 'DLC', 30, ['DLC%02d' % i for i in range(1, 11)]) + arrds('DICA', 'DIC', 3, ['DIC%02d' % i for i in range(1, 11)]) + arrds('EDA', 'ED', 76, ['ED%02d' % i for i in range(1, 16)]) +
 [S('TXT', 76, kw='DIM(500)'), S('NLINES', 5, 0), S('TOPL', 5, 0), S('IDX', 5, 0), S('CLN', 5, 0), S('DIRTY', 1), S('WARN', 1),
  S('KD', 10, kw='DIM(10)'), S('KDOC', 10), S('WTITL', 40)] +
 DC('COLH', 'Each card is a document.  Type an option beside it, or cursor + Enter.') +
 DC('FK1', '2=Edit  4=Delete  6=Print   Cursor anywhere on a card + Enter opens it') + DC('FK2', 'F1=Help  F3=Exit  F6=New document  F7/F8=Page') +
 DC('EK1', 'F6=Insert line at cursor   F9=Delete line at cursor   F7/F8=Page up/down') + DC('EK2', 'F1=Help   F10=Save   F11=Print   F3=Exit'), """
KEY2D | KLIST
 | KFLD | | KUSER
 | KFLD | | KDOC
EVAL LAPP = 'DOCUMENTS'
""" + listmain('D', 'DLIST', 'OFCDOC', deflt='2', sel=DOCSEL, keys="""
IF *IN06 = *ON
EXSR NEWDOC
ITER
ENDIF
""", acts="""
EVAL DCNT = 0
1 | DO | NSHOW | ROW
EVAL OP = %TRIM(DOP(ROW))
IF OP = '2' OR OP = '4' OR OP = '6'
EVAL KDOC = KD(ROW)
SELECT
WHEN OP = '2'
EXSR EDIT
WHEN OP = '6'
EXSR LOADD
EXSR PRINTD
OTHER
""" + DELLN + """
KEY2D | CHAIN | DOCREC
IF %FOUND(OVDOCP)
 | DELETE | DOCREC
EVAL DCNT = DCNT + 1
ENDIF
ENDSL
ENDIF
 | ENDDO
""" + delmsg('document(s)')) + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL DLNA = *BLANKS
EVAL DLBA = *BLANKS
EVAL DLCA = *BLANKS
EVAL DICA = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 10
KUSER | SETLL | DOCREC
KUSER | READE(N) | DOCREC
DOW NOT %EOF(OVDOCP)
EVAL NMATCH = NMATCH + 1
""" + PAGED + """
 | MOVE | DCSTMP | WSTMP
EXSR FMTDT
EVAL DIC(ROW) = '[=]'
EVAL DLN(ROW) = DCNAME
EVAL DLB(ROW) = DCTITL
EVAL DLC(ROW) = %CHAR(DCLINE) + ' lines, ' + %SUBST(WDT:1:10)
EVAL KD(ROW) = DCNAME
ENDIF
KUSER | READE(N) | DOCREC
ENDDO
""" + SHOWN + """
EVAL TTLW = %CHAR(NMATCH) + ' document(s), ten cards to a page'
 | ENDSR
* ---- create a document, then edit it ----
NEWDOC | BEGSR
EVAL NNAME = *BLANKS
EVAL NTITL = *BLANKS
EVAL NMSG = *BLANKS
DOW 1 = 1
""" + hdr('N', 'OFCNEWDOC', 'Enter=Create   F12=Cancel') + """
 | EXFMT | DNEW
EVAL NMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON OR NNAME = *BLANKS
LEAVE
ENDIF
EVAL KDOC = %TRIML(NNAME)
KEY2D | CHAIN(N) | DOCREC
IF %FOUND(OVDOCP)
EVAL NMSG = 'You already have a document with that name.'
ITER
ENDIF
EVAL DCUSER = PGMUSR
EVAL DCNAME = KDOC
EVAL DCTITL = %TRIML(NTITL)
 | TIME | | DCSTMP
EVAL DCLINE = 0
 | WRITE | DOCREC
""" + log('NEWDOC', 'KDOC') + INDOFF + """
EXSR EDIT
LEAVE
ENDDO
""" + INDOFF + """
 | ENDSR
* ---- read the document into memory ----
LOADD | BEGSR
EVAL TXT = *BLANKS
EVAL NLINES = 0
EVAL WTITL = *BLANKS
KEY2D | CHAIN(N) | DOCREC
IF %FOUND(OVDOCP)
EVAL WTITL = DCTITL
ENDIF
KEY2D | SETLL | DOCLREC
KEY2D | READE(N) | DOCLREC
DOW NOT %EOF(OVDOCLP) AND NLINES < 500
EVAL NLINES = NLINES + 1
EVAL TXT(NLINES) = DLTEXT
KEY2D | READE(N) | DOCLREC
ENDDO
 | ENDSR
* ---- the editor ----
EDIT | BEGSR
EXSR LOADD
EVAL TOPL = 1
EVAL DIRTY = '0'
EVAL WARN = '0'
EVAL EMSG = *BLANKS
DOW 1 = 1
1 | DO | 15 | I
EVAL ED(I) = TXT(TOPL + I - 1)
 | ENDDO
EVAL HDRID = 'OFCEDIT'
EXSR HDR
EVAL EHDR = HDRLN
EVAL EINF = %TRIMR(KDOC) + ': ' + %TRIMR(WTITL) + '   lines ' + %CHAR(TOPL) + ' to ' + %CHAR(TOPL + 14) + ' of ' + %CHAR(NLINES)
EVAL EFK1 = EK1
EVAL EFK2 = EK2
 | EXFMT | DEDIT
EXSR CSR
EVAL EMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
IF DIRTY = '1' AND WARN = '0'
EVAL WARN = '1'
EVAL EMSG = 'Not saved.  F10 saves.  F3 again leaves without saving.'
""" + INDOFF + """
ITER
ENDIF
LEAVE
ENDIF
EVAL WARN = '0'
1 | DO | 15 | I
EVAL IDX = TOPL + I - 1
IF ED(I) <> TXT(IDX)
EVAL TXT(IDX) = ED(I)
EVAL DIRTY = '1'
ENDIF
IF ED(I) <> *BLANKS AND IDX > NLINES
EVAL NLINES = IDX
ENDIF
 | ENDDO
EVAL CLN = 0
IF CSRROW >= 6 AND CSRROW <= 20
EVAL CLN = TOPL + CSRROW - 6
ENDIF
SELECT
WHEN *IN07 = *ON
EVAL TOPL = TOPL - 15
IF TOPL < 1
EVAL TOPL = 1
ENDIF
WHEN *IN08 = *ON
IF TOPL + 15 <= 486
EVAL TOPL = TOPL + 15
ENDIF
WHEN *IN06 = *ON AND CLN > 0
IF NLINES >= 500
EVAL EMSG = 'The document is full at 500 lines.'
ELSE
EVAL J = 499
DOW J >= CLN
EVAL TXT(J + 1) = TXT(J)
EVAL J = J - 1
ENDDO
EVAL TXT(CLN) = *BLANKS
IF CLN <= NLINES
EVAL NLINES = NLINES + 1
ENDIF
EVAL DIRTY = '1'
ENDIF
WHEN *IN09 = *ON AND CLN > 0
EVAL J = CLN
DOW J < 500
EVAL TXT(J) = TXT(J + 1)
EVAL J = J + 1
ENDDO
EVAL TXT(500) = *BLANKS
IF CLN <= NLINES
EVAL NLINES = NLINES - 1
ENDIF
EVAL DIRTY = '1'
WHEN *IN10 = *ON
EXSR SAVED
EVAL EMSG = 'Document saved.'
WHEN *IN11 = *ON
EXSR PRINTD
EVAL EMSG = MSG
EVAL MSG = *BLANKS
ENDSL
ENDDO
""" + INDOFF + """
 | ENDSR
SAVED | BEGSR
DOW NLINES > 0 AND TXT(NLINES) = *BLANKS
EVAL NLINES = NLINES - 1
ENDDO
""" + DELLN + """
1 | DO | NLINES | I
EVAL DLUSER = PGMUSR
EVAL DLNAME = KDOC
EVAL DLSEQ = I
EVAL DLTEXT = TXT(I)
 | WRITE | DOCLREC
 | ENDDO
KEY2D | CHAIN | DOCREC
IF %FOUND(OVDOCP)
EVAL DCLINE = NLINES
 | TIME | | DCSTMP
 | UPDATE | DOCREC
ENDIF
EVAL DIRTY = '0'
""" + log('SAVEDOC', "%TRIMR(KDOC) + ', ' + %CHAR(NLINES) + ' lines'") + """
 | ENDSR
PRINTD | BEGSR
""" + popen("%TRIMR(KDOC) + ': ' + WTITL") + """
1 | DO | NLINES | J
""" + pl('TXT(J)') + """
 | ENDDO
""" + PCLOSE + """
 | ENDSR
""")

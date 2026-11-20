FMTTM = """
FMTTM | BEGSR
EVAL TTXT = 'all day'
IF CLTIME >= 0
 | MOVE | CLTIME | W4
EVAL TTXT = %SUBST(W4:1:2) + ':' + %SUBST(W4:3:2)
ENDIF
 | ENDSR
"""
ADMCHK = "PGMUSR | CHAIN(N) | USERREC\nEVAL ISADM = 'N'\nIF %FOUND(OVUSERP)\nEVAL ISADM = USADM\nENDIF\n"
NOTADM = "IF ISADM <> 'Y'\nEVAL MSG = 'Only office administrators can do that.'\nELSE\n"
H('RMLIST', 'Conference rooms', 'Every conference room, with how many bookings it has on the chosen day.', '',
  'Type 5 beside a room, or put the cursor on it and press Enter, to see and',
  'book its schedule.  A room calendar is shared: anyone can book it.', '',
  'Administrators can add rooms with F6 and delete them with 4.', PG)
H('RMADD', 'Add a conference room', 'Room code: a short name such as ROOM1 or BOARD.  Its calendar is #ROOM1.',
  'Name: a longer description, such as Third floor board room.', 'Seats: how many people it holds.')
H('AULIST', 'Authorized users', 'These people may look at your calendar (View) or change it (Change).', '',
  'The first line covers everyone who is not listed.  Normally they may look',
  'but not change.', '', 'Type Y or N in the View and Change columns and press Enter to save.',
  'Type 4 beside a person to take them off the list.  F6 adds a person.')
H('AUADD', 'Authorize a person', 'Type the user ID, or press F4 for a list.  Then Y or N for whether they',
  'may look at your calendar and whether they may change it.')
H('HOLLIST', 'Company holidays', 'Holidays are shown on every calendar: in the day schedule, the month',
  'and the six-month view.', '', 'Administrators can add holidays with F6 and delete them with 4.', PG)
H('HOLADD', 'Add a company holiday', 'Type the date, such as 12/25/2026, and a name for the holiday.')
H('CSLIST', 'Search the calendar', 'Type a word in Find and press Enter to list every appointment that',
  'contains it, on any date.  Leave Find empty to list them all.', '',
  'Type 5 beside one, or put the cursor on it and press Enter, to open', 'that day.', PG)
H('MEET', 'Schedule a meeting', 'Type the subject, date and time, and up to six people to invite.',
  'Put the cursor on a person field and press F4 to pick from a list.', 'A conference room is optional.', '',
  'Press Enter.  If anyone, or the room, already has something in that hour,',
  'the clashes are listed in red.  Change the time, or press F10 to book it',
  'anyway.', '', 'The meeting goes on your calendar, every invited calendar and the room.',
  'Each person invited gets a message about it.')
# ---------------- OVROOM ----------------
s = Scr('OVROOM')
s.lst2('RMLIST', 'R', list(range(6, 16)), 7, 72, ttl=(3, 3, 60), col=(5, 3, 74))
s.ctr(2, 'C O N F E R E N C E   R O O M S', 'DSPATR(HI)')
s.edit('RMADD', 'A'); s.inp('Room code', 'ARID', 9, 4, lc=False); s.inp('Name', 'ARNM', 30, 6); s.inp('Seats', 'ARST', 3, 8, lc=False)
s.save()
prog('OVROOM', [('OVROOMP', 'U'), ('OVCALP', 'I'), ('OVUSERP', 'I')], 'OVROOM', listds('R', 72) +
 [S('XOWN', 10), S('XDATE', 8), S('SAVOWN', 10), S('KRMS', 9, kw='DIM(10)'), S('ISADM', 1), S('DATEN', 8, 0), S('BOOK', 5, 0),
  S('KDATE', 8, 0), S('KRM', 9), S('SEATS', 3, 0)] +
 DC('COLH', 'Opt  Room      Name                           Seats  Booked that day') +
 DC('FK1', '5=View and book the room schedule    4=Delete (administrators)') +
 DC('FK2', 'F1=Help  F3=Exit  F6=Add a room (administrators)  F7/F8=Page'), """
*ENTRY | PLIST
 | PARM | | XOWN
 | PARM | | XDATE
KEYD | KLIST
 | KFLD | | KUSER
 | KFLD | | KDATE
EVAL LAPP = 'ROOMS'
EVAL SAVOWN = XOWN
 | MOVE | XDATE | DATEN
""" + ADMCHK + listmain('R', 'RMLIST', 'CALROOMS', deflt='5', r0=6, lcol=7, keys="""
IF *IN06 = *ON
EXSR ADDR
ITER
ENDIF
""", acts="""
1 | DO | NSHOW | ROW
EVAL OP = %TRIM(ROP(ROW))
IF OP = '5' AND XOWN = SAVOWN
EVAL XOWN = '#' + KRMS(ROW)
ENDIF
IF OP = '4'
""" + NOTADM + """
KRMS(ROW) | CHAIN | ROOMREC
IF %FOUND(OVROOMP)
 | DELETE | ROOMREC
EVAL MSG = 'Room deleted.  Its old bookings stay on its calendar.'
ENDIF
ENDIF
ENDIF
 | ENDDO
IF XOWN <> SAVOWN
LEAVE
ENDIF
""") + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL RLNA = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 10
*LOVAL | SETLL | ROOMREC
 | READ(N) | ROOMREC
DOW NOT %EOF(OVROOMP)
EVAL NMATCH = NMATCH + 1
""" + PAGED + """
EVAL BOOK = 0
EVAL KUSER = '#' + RMID
EVAL KDATE = DATEN
KEYD | SETLL | CALREC
KEYD | READE | CALREC
DOW NOT %EOF(OVCALP)
EVAL BOOK = BOOK + 1
KEYD | READE | CALREC
ENDDO
EVAL RLN(ROW) = RMID + ' ' + RMNAME + ' ' + %EDITC(RMSEAT:'Z') + '    ' + %CHAR(BOOK)
EVAL KRMS(ROW) = RMID
ENDIF
 | READ(N) | ROOMREC
ENDDO
""" + SHOWN + """
EVAL KUSER = PGMUSR
EVAL TTLW = %CHAR(NMATCH) + ' room(s).  Bookings are for ' + %SUBST(XDATE:5:2) + '/' + %SUBST(XDATE:7:2) + '/' + %SUBST(XDATE:1:4)
 | ENDSR
ADDR | BEGSR
""" + NOTADM + """
EVAL ARID = *BLANKS
EVAL ARNM = *BLANKS
EVAL ARST = *BLANKS
EVAL AMSG = *BLANKS
DOW 1 = 1
""" + hdr('A', 'CALADDROOM', 'Enter=Add   F12=Cancel') + """
 | EXFMT | RMADD
EVAL AMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
EVAL KRM = %TRIML(ARID)
IF KRM = *BLANKS OR ARNM = *BLANKS
EVAL AMSG = 'Type a room code and a name.'
ITER
ENDIF
EVAL NERR = '0'
EVAL NSTR = %TRIML(ARST)
EXSR TONUM
IF NERR = '1' AND ARST <> *BLANKS
EVAL AMSG = 'Seats must be a number.'
ITER
ENDIF
KRM | CHAIN | ROOMREC
IF %FOUND(OVROOMP)
EVAL AMSG = 'There is already a room ' + %TRIM(KRM) + '.'
ITER
ENDIF
EVAL RMID = KRM
EVAL RMNAME = %TRIML(ARNM)
EVAL RMSEAT = 0
IF NERR = '0'
EVAL RMSEAT = NVAL
ENDIF
 | WRITE | ROOMREC
EVAL MSG = 'Room ' + %TRIM(KRM) + ' added.  Its calendar is #' + %TRIM(KRM) + '.'
LEAVE
ENDDO
""" + INDOFF + """
ENDIF
 | ENDSR
""")
# ---------------- OVCAUT ----------------
s = Scr('OVCAUT')
s.lst2('AULIST', 'A', list(range(7, 17)), 7, 50, ttl=(3, 3, 60), col=(6, 3, 74))
s.ctr(2, 'A U T H O R I Z E D   U S E R S', 'DSPATR(HI)')
s.t(4, 3, 'Type Y or N under View and Change, then press Enter to save.', 'COLOR(BLU)')
for i in range(1, 11):
    s.f('AV%02d' % i, 1, 'B', 6 + i, 62, 'DSPATR(UL)'); s.f('AC%02d' % i, 1, 'B', 6 + i, 71, 'DSPATR(UL)')
s.edit('AUADD', 'N'); s.inp('User', 'NUSR', 10, 4, lc=False); s.t(4, 37, 'F4 shows a list', 'COLOR(BLU)')
s.inp('May look (Y/N)', 'NVW', 1, 6, lc=False); s.inp('May change (Y/N)', 'NCG', 1, 8, lc=False)
s.save()
prog('OVCAUT', [('OVCAUTP', 'U'), ('OVUSERP', 'I')], 'OVCAUT', listds('A', 50) +
 arrds('AVA', 'AV', 1, ['AV%02d' % i for i in range(1, 11)]) + arrds('ACA', 'AC', 1, ['AC%02d' % i for i in range(1, 11)]) +
 [S('OAV', 1, kw='DIM(10)'), S('OAC', 1, kw='DIM(10)'), S('KAU', 10, kw='DIM(10)'), S('KAOWN', 10), S('KAUSR', 10), S('WNAME', 30), S('NSAVE', 5, 0)] +
 DC('COLH', 'Opt  User       Name                                         View     Change') +
 DC('FK1', '4=Take off the list    Type Y or N under View and Change') +
 DC('FK2', 'F1=Help  F3=Exit  F6=Add a person  F7/F8=Page'), """
KEYA | KLIST
 | KFLD | | KAOWN
 | KFLD | | KAUSR
EVAL LAPP = 'CALAUTH'
EVAL KAOWN = PGMUSR
EVAL KAUSR = '*STD'
KEYA | CHAIN(N) | AUTHREC
IF NOT %FOUND(OVCAUTP)
EVAL CAOWN = PGMUSR
EVAL CAUSER = '*STD'
EVAL CAVIEW = 'Y'
EVAL CACHG = 'N'
 | WRITE | AUTHREC
ENDIF
""" + listmain('A', 'AULIST', 'CALAUTH', r0=7, lcol=7, keys="""
IF *IN06 = *ON
EXSR ADDA
ITER
ENDIF
""", acts="""
EVAL NSAVE = 0
1 | DO | NSHOW | ROW
EVAL KAUSR = KAU(ROW)
IF %TRIM(AOP(ROW)) = '4' AND KAUSR <> '*STD'
KEYA | CHAIN | AUTHREC
IF %FOUND(OVCAUTP)
 | DELETE | AUTHREC
EVAL NSAVE = NSAVE + 1
ENDIF
ELSE
IF AV(ROW) <> OAV(ROW) OR AC(ROW) <> OAC(ROW)
KEYA | CHAIN | AUTHREC
IF %FOUND(OVCAUTP)
EVAL CAVIEW = 'N'
IF AV(ROW) = 'Y' OR AV(ROW) = 'y'
EVAL CAVIEW = 'Y'
ENDIF
EVAL CACHG = 'N'
IF AC(ROW) = 'Y' OR AC(ROW) = 'y'
EVAL CACHG = 'Y'
EVAL CAVIEW = 'Y'
ENDIF
 | UPDATE | AUTHREC
EVAL NSAVE = NSAVE + 1
ENDIF
ENDIF
ENDIF
 | ENDDO
IF NSAVE > 0
EVAL MSG = 'Saved.'
""" + "EVAL LACT = 'CALAUTH'\nEVAL LTXT = 'Changed who may see the calendar'\nEXSR LOGIT\n" + """
ENDIF
""") + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL ALNA = *BLANKS
EVAL AVA = *BLANKS
EVAL ACA = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 10
KAOWN | SETLL | AUTHREC
KAOWN | READE(N) | AUTHREC
DOW NOT %EOF(OVCAUTP)
EVAL NMATCH = NMATCH + 1
""" + PAGED + """
EVAL WNAME = 'Everyone else (standard)'
IF CAUSER <> '*STD'
EVAL WNAME = '(no longer enrolled)'
CAUSER | CHAIN | USERREC
IF %FOUND(OVUSERP)
EVAL WNAME = USNAME
ENDIF
ENDIF
EVAL ALN(ROW) = CAUSER + ' ' + WNAME
EVAL AV(ROW) = CAVIEW
EVAL AC(ROW) = CACHG
EVAL OAV(ROW) = CAVIEW
EVAL OAC(ROW) = CACHG
EVAL KAU(ROW) = CAUSER
ENDIF
KAOWN | READE(N) | AUTHREC
ENDDO
""" + SHOWN + """
EVAL TTLW = 'Who may use the calendar of ' + PGMUSR
 | ENDSR
ADDA | BEGSR
EVAL NUSR = *BLANKS
EVAL NVW = 'Y'
EVAL NCG = 'N'
EVAL NMSG = *BLANKS
DOW 1 = 1
""" + hdr('N', 'CALADDAUTH', 'Enter=Add   F4=List users   F12=Cancel') + """
 | EXFMT | AUADD
EVAL NMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN04 = *ON
EXSR LOOKUP
IF SELUSR <> *BLANKS
EVAL NUSR = SELUSR
ENDIF
ITER
ENDIF
EVAL KAUSR = %TRIML(NUSR)
KAUSR | CHAIN | USERREC
IF KAUSR = *BLANKS OR KAUSR = PGMUSR OR NOT %FOUND(OVUSERP)
EVAL NMSG = 'Type the ID of another enrolled user.  F4 shows a list.'
ITER
ENDIF
KEYA | CHAIN | AUTHREC
EVAL CAOWN = PGMUSR
EVAL CAUSER = KAUSR
EVAL CAVIEW = 'N'
IF NVW = 'Y'
EVAL CAVIEW = 'Y'
ENDIF
EVAL CACHG = 'N'
IF NCG = 'Y'
EVAL CACHG = 'Y'
EVAL CAVIEW = 'Y'
ENDIF
IF %FOUND(OVCAUTP)
 | UPDATE | AUTHREC
ELSE
 | WRITE | AUTHREC
ENDIF
EVAL MSG = %TRIM(KAUSR) + ' added to the list.'
LEAVE
ENDDO
""" + INDOFF + """
 | ENDSR
""")
# ---------------- OVHOLI ----------------
s = Scr('OVHOLI')
s.lst2('HOLLIST', 'H', list(range(6, 16)), 7, 72, ttl=(3, 3, 60), col=(5, 3, 74), lnkw=('COLOR(RED)',))
s.ctr(2, 'C O M P A N Y   H O L I D A Y S', 'DSPATR(HI)')
s.edit('HOLADD', 'A'); s.inp('Date', 'AHDT', 10, 4, lc=False); s.t(4, 37, 'M/D/YYYY', 'COLOR(BLU)'); s.inp('Name', 'AHNM', 30, 6)
s.save()
prog('OVHOLI', [('OVHOLP', 'U'), ('OVUSERP', 'I')], 'OVHOLI', listds('H', 72) +
 [S('KHD', 8, 0, 'DIM(10)'), S('ISADM', 1), S('DAYN', 9), S('WD', 'D'), S('BASEDT', 'D', kw="INZ(D'2000-01-02')"), S('NDAYS', 7, 0)] +
 DC('DNAMES', DNAMES) + DC('COLH', 'Opt  Date        Day        Holiday') +
 DC('FK1', '4=Delete (administrators)') + DC('FK2', 'F1=Help  F3=Exit  F6=Add a holiday (administrators)  F7/F8=Page'), """
EVAL LAPP = 'HOLIDAYS'
""" + ADMCHK + listmain('H', 'HOLLIST', 'CALHOLIDAY', r0=6, lcol=7, keys="""
IF *IN06 = *ON
EXSR ADDH
ITER
ENDIF
""", acts="""
1 | DO | NSHOW | ROW
IF %TRIM(HOP(ROW)) = '4'
""" + NOTADM + """
KHD(ROW) | CHAIN | HOLREC
IF %FOUND(OVHOLP)
 | DELETE | HOLREC
EVAL MSG = 'Holiday deleted.'
ENDIF
ENDIF
ENDIF
 | ENDDO
""") + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL HLNA = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 10
*LOVAL | SETLL | HOLREC
 | READ(N) | HOLREC
DOW NOT %EOF(OVHOLP)
EVAL NMATCH = NMATCH + 1
""" + PAGED + """
*ISO | MOVE | HLDATE | WD
WD | SUBDUR | BASEDT | NDAYS:*D
EVAL DAYN = %SUBST(DNAMES:%REM(%REM(NDAYS:7) + 7:7)*9+1:9)
 | MOVE | HLDATE | W8
EVAL HLN(ROW) = %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2) + '/' + %SUBST(W8:1:4) + '  ' + DAYN + '  ' + HLNAME
EVAL KHD(ROW) = HLDATE
ENDIF
 | READ(N) | HOLREC
ENDDO
""" + SHOWN + """
EVAL TTLW = %CHAR(NMATCH) + ' company holiday(s)'
 | ENDSR
ADDH | BEGSR
""" + NOTADM + """
EVAL AHDT = *BLANKS
EVAL AHNM = *BLANKS
EVAL AMSG = *BLANKS
DOW 1 = 1
""" + hdr('A', 'CALADDHOL', 'Enter=Add   F12=Cancel') + """
 | EXFMT | HOLADD
EVAL AMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
EVAL DUE = AHDT
EXSR CHKDT
IF NERR = '1' OR AHNM = *BLANKS
EVAL AMSG = 'Type a valid date and a name.'
ITER
ENDIF
DUEVAL | CHAIN | HOLREC
IF %FOUND(OVHOLP)
EVAL HLNAME = %TRIML(AHNM)
 | UPDATE | HOLREC
ELSE
EVAL HLDATE = DUEVAL
EVAL HLNAME = %TRIML(AHNM)
 | WRITE | HOLREC
ENDIF
EVAL MSG = 'Holiday saved.'
LEAVE
ENDDO
""" + INDOFF + """
ENDIF
 | ENDSR
""" + CHKDT, hx=' DATFMT(*ISO)')
# ---------------- OVCSRC ----------------
s = Scr('OVCSRC')
s.lst2('CSLIST', 'S', list(range(6, 16)), 7, 72, find=(3, 3, 30), ttl=(3, 47, 32), col=(5, 3, 74))
s.ctr(2, 'S E A R C H   T H E   C A L E N D A R', 'DSPATR(HI)')
s.save()
prog('OVCSRC', [('OVCALP', 'I')], 'OVCSRC', listds('S', 72) +
 [S('XOWN', 10), S('XDATE', 8), S('KDT', 8, 0, 'DIM(10)'), S('W4', 4), S('TTXT', 7), S('LINE', 90), S('ULINE', 90)] +
 DC('COLH', 'Opt  Date        Time     What') + DC('FK1', '5=Open that day   or put the cursor on an appointment and press Enter') +
 DC('FK2', 'F1=Help  F3=Exit  F7/F8=Page'), """
*ENTRY | PLIST
 | PARM | | XOWN
 | PARM | | XDATE
EVAL KUSER = XOWN
EVAL XDATE = *BLANKS
""" + listmain('S', 'CSLIST', 'CALSEARCH', find=True, deflt='5', r0=6, lcol=7, acts="""
1 | DO | NSHOW | ROW
IF %TRIM(SOP(ROW)) = '5' AND XDATE = *BLANKS
 | MOVE | KDT(ROW) | XDATE
ENDIF
 | ENDDO
IF XDATE <> *BLANKS
LEAVE
ENDIF
""") + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL SLNA = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 10
KUSER | SETLL | CALREC
KUSER | READE(N) | CALREC
DOW NOT %EOF(OVCALP)
EXSR FMTTM
 | MOVE | CLDATE | W8
EVAL LINE = %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2) + '/' + %SUBST(W8:1:4) + '  ' + TTXT + '  ' + CLTEXT
EVAL ULINE = LINE
LCASE:UCASE | XLATE | ULINE | ULINE
IF UNEED = *BLANKS OR %SCAN(%TRIMR(UNEED):ULINE) > 0
EVAL NMATCH = NMATCH + 1
""" + PAGED + """
EVAL SLN(ROW) = LINE
EVAL KDT(ROW) = CLDATE
ENDIF
ENDIF
KUSER | READE(N) | CALREC
ENDDO
""" + SHOWN + """
EVAL TTLW = %CHAR(NMATCH) + ' appointment(s) found'
 | ENDSR
""" + FMTTM)
# ---------------- OVMEET ----------------
s = Scr('OVMEET'); s.edit('MEET', 'M')
s.ctr(2, 'S C H E D U L E   A   M E E T I N G', 'DSPATR(HI)')
s.t(3, 3, 'Book a meeting and invite the people below.', 'COLOR(BLU)')
s.inp('Subject', 'MSUBJ', 45, 5); s.inp('Date', 'MDATE', 10, 6, lc=False); s.t(6, 37, 'M/D/YYYY', 'COLOR(BLU)')
s.inp('Time', 'MTIME', 5, 7, lc=False); s.t(7, 37, 'HH:MM, 24-hour', 'COLOR(BLU)')
s.inp('Conference room', 'MROOM', 9, 8, lc=False); s.t(8, 37, 'Optional.  A room code, such as ROOM1', 'COLOR(BLU)')
s.t(10, 3, 'People to invite.  Put the cursor on a field and press F4 for a list.')
for k in range(6): s.f('MP%d' % (k + 1), 10, 'B', 11, 5 + 13 * k, 'DSPATR(UL)')
s.t(13, 3, 'Clashes', 'COLOR(BLU)')
for k in range(6): s.f('MC%d' % (k + 1), 74, 'O', 14 + k, 3, 'COLOR(RED)')
s.save()
prog('OVMEET', [('OVCALP', 'U'), ('OVUSERP', 'I'), ('OVROOMP', 'I')], 'OVMEET',
 arrds('MPA', 'MP', 10, ['MP%d' % i for i in range(1, 7)]) + arrds('MCA', 'MC', 74, ['MC%d' % i for i in range(1, 7)]) + TMVARS +
 [S('XDATE', 8), S('PEOP', 10, kw='DIM(8)'), S('NPEOP', 5, 0), S('WHO', 10), S('KRM', 9), S('NCLASH', 5, 0), S('DUP', 1), S('BAD', 1),
  S('KDATE', 8, 0), S('MTXT', 60), S('DTXT', 10), S('W4', 4), S('TTXT', 7), S('K', 5, 0), S('HOUR', 5, 0)], """
*ENTRY | PLIST
 | PARM | | XDATE
KEYD | KLIST
 | KFLD | | KUSER
 | KFLD | | KDATE
EVAL LAPP = 'MEETING'
EVAL MSUBJ = *BLANKS
EVAL MDATE = %SUBST(XDATE:5:2) + '/' + %SUBST(XDATE:7:2) + '/' + %SUBST(XDATE:1:4)
EVAL MTIME = *BLANKS
EVAL MROOM = *BLANKS
EVAL MPA = *BLANKS
EVAL MCA = *BLANKS
EVAL MMSG = *BLANKS
DOW 1 = 1
""" + hdr('M', 'CALMEET', 'Enter=Check and book  F4=List users  F10=Book anyway  F12=Cancel') + """
 | EXFMT | MEET
EXSR CSR
EVAL MMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN04 = *ON
EXSR LOOKUP
IF SELUSR <> *BLANKS
EVAL K = 0
IF CSRROW = 11 AND CSRCOL >= 4
EVAL K = %DIV(CSRCOL - 4:13) + 1
ENDIF
IF K < 1 OR K > 6
EVAL K = 1
DOW K < 6 AND MP(K) <> *BLANKS
EVAL K = K + 1
ENDDO
ENDIF
EVAL MP(K) = SELUSR
ENDIF
ITER
ENDIF
IF MSUBJ = *BLANKS
EVAL MMSG = 'Type a subject for the meeting.'
ITER
ENDIF
EVAL DUE = MDATE
EXSR CHKDT
IF NERR = '1'
EVAL MMSG = 'That date is not valid.  Use M/D or M/D/YYYY.'
ITER
ENDIF
EVAL TM = MTIME
EXSR PARSTM
IF NERR = '1' OR CLT < 0
EVAL MMSG = 'Type a time such as 14:30.'
ITER
ENDIF
EXSR PEOPLE
IF BAD = '1'
ITER
ENDIF
EXSR CLASH
IF NCLASH > 0 AND *IN10 = *OFF
EVAL MMSG = 'Some are busy then.  Change the time, or press F10 to book it anyway.'
ITER
ENDIF
EXSR BOOK
LEAVE
ENDDO
""" + INDOFF + """
EVAL *INLR = *ON
* ---- everyone taking part: sets PEOP and NPEOP, or BAD ----
PEOPLE | BEGSR
EVAL BAD = '0'
EVAL PEOP = *BLANKS
EVAL NPEOP = 1
EVAL PEOP(1) = PGMUSR
1 | DO | 6 | I
EVAL WHO = %TRIML(MP(I))
LCASE:UCASE | XLATE | WHO | WHO
IF WHO <> *BLANKS
WHO | CHAIN | USERREC
IF NOT %FOUND(OVUSERP)
EVAL MMSG = %TRIM(WHO) + ' is not an office user.  F4 shows a list.'
EVAL BAD = '1'
ELSE
EVAL DUP = '0'
1 | DO | NPEOP | J
IF PEOP(J) = WHO
EVAL DUP = '1'
ENDIF
 | ENDDO
IF DUP = '0'
EVAL NPEOP = NPEOP + 1
EVAL PEOP(NPEOP) = WHO
ENDIF
ENDIF
ENDIF
 | ENDDO
EVAL KRM = %TRIML(MROOM)
IF KRM <> *BLANKS AND BAD = '0'
KRM | CHAIN | ROOMREC
IF NOT %FOUND(OVROOMP)
EVAL MMSG = 'There is no conference room ' + %TRIM(KRM) + '.'
EVAL BAD = '1'
ELSE
EVAL NPEOP = NPEOP + 1
EVAL PEOP(NPEOP) = '#' + KRM
ENDIF
ENDIF
 | ENDSR
* ---- anything in the same hour on any of those calendars ----
CLASH | BEGSR
EVAL MCA = *BLANKS
EVAL NCLASH = 0
EVAL HOUR = %DIV(CLT:100)
EVAL KDATE = DUEVAL
1 | DO | NPEOP | J
EVAL KUSER = PEOP(J)
KEYD | SETLL | CALREC
KEYD | READE | CALREC
DOW NOT %EOF(OVCALP)
IF CLTIME < 0 OR %DIV(CLTIME:100) = HOUR
EVAL NCLASH = NCLASH + 1
IF NCLASH <= 6
EXSR FMTTM
EVAL MC(NCLASH) = %TRIMR(PEOP(J)) + ' already has  ' + TTXT + '  ' + CLTEXT
ENDIF
ENDIF
KEYD | READE | CALREC
ENDDO
 | ENDDO
EVAL KUSER = PGMUSR
 | ENDSR
BOOK | BEGSR
EVAL MTXT = %TRIMR(MSUBJ) + ' (meeting, ' + %TRIM(PGMUSR) + ')'
IF KRM <> *BLANKS
EVAL MTXT = %TRIMR(MSUBJ) + ' (meeting in ' + %TRIM(KRM) + ')'
ENDIF
1 | DO | NPEOP | J
EVAL CLUSER = PEOP(J)
EVAL CLDATE = DUEVAL
EVAL CLTIME = CLT
EXSR NEWTS
EVAL CLSTMP = TS
EVAL CLTEXT = MTXT
 | WRITE | CALREC
IF J > 1 AND %SUBST(PEOP(J):1:1) <> '#'
EVAL QSRC = %TRIM(PGMUSR) + ' invited you to: ' + %TRIMR(MSUBJ) + ' on ' + %TRIM(MDATE) + ' at ' + %TRIM(MTIME)
EXSR QUOTE
EVAL CMD = 'SNDMSG MSG(''' + QTXT + ''') TOUSR(' + %TRIM(PEOP(J)) + ')'
EXSR RUNCMD
EVAL *IN50 = *OFF
ENDIF
 | ENDDO
""" + "EVAL LACT = 'MEETING'\nEVAL LTXT = %TRIMR(MSUBJ) + ', ' + %CHAR(NPEOP) + ' calendars'\nEXSR LOGIT\n" + """
 | ENDSR
""" + CHKDT + PARSETM + FMTTM)

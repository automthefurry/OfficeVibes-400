# ---------------- OVFIND: search everything ----------------
s = Scr('OVFIND'); lay_find(s); s.save()
def src(setll, read, pfn, cond, tag, when, dtl):
    c1 = ("IF %s\n" % cond) if cond else ''
    c2 = "ENDIF\n" if cond else ''
    return (setll + "\n" + read + "\nDOW NOT %EOF(" + pfn + ")\n" + c1 + when + "EVAL DTL = " + dtl + """
EVAL ULINE = DTL
LCASE:UCASE | XLATE | ULINE | ULINE
IF %SCAN(%TRIMR(UNEED):ULINE) > 0
EVAL NMATCH = NMATCH + 1
""" + PAGED + "EVAL FLN(ROW) = '" + tag.ljust(9) + "' + %SUBST(WDT:1:10) + ' ' + DTL\nEVAL DT(ROW) = DTL\nENDIF\nENDIF\n" + c2 + read + "\nENDDO\n")
TSW = lambda f: " | MOVE | %s | WSTMP\nEXSR FMTDT\n" % f
NOW = "EVAL WDT = *BLANKS\n"
MINE = "%sTO = PGMUSR OR %sFROM = PGMUSR"
prog('OVFIND', [('OVMSGP', 'I'), ('OVMAILP', 'I'), ('OVCALP', 'I'), ('OVNOTEP', 'I'), ('OVTASKP', 'I'), ('OVPHONP', 'I'), ('OVDOCP', 'I'),
                ('OVDOCLP', 'I'), ('OVUSERP', 'I')], 'OVFIND', listds('F', 72) + [S('DTL', 700), S('ULINE', 700), S('DT', 222, kw='DIM(10)'), S('SHOWN', 222)] +
 DC('COLH', 'Opt  Kind     Date       What') + DC('FK1', '5=Show the whole item   or put the cursor on a result and press Enter') +
 DC('FK2', 'F1=Help  F3=Exit  F7/F8=Page'), listmain('F', 'FLIST', 'OFCFIND', find=True, deflt='5', r0=8, lcol=7, pre="""
EVAL FINF = %SUBST(SHOWN:1:74)
EVAL FIN2 = %SUBST(SHOWN:75:74)
EVAL FIN3 = %SUBST(SHOWN:149:74)
EVAL SHOWN = *BLANKS
""", acts="""
1 | DO | NSHOW | ROW
IF %TRIM(FOP(ROW)) = '5' AND SHOWN = *BLANKS
EVAL SHOWN = DT(ROW)
ENDIF
 | ENDDO
""") + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL FLNA = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 10
EVAL TTLW = 'Search everything.  Type what to look for and press Enter.'
IF UNEED <> *BLANKS
""" + src('*LOVAL | SETLL | MSGREC', ' | READ | MSGREC', 'OVMSGP', MINE % ('MG', 'MG'), 'Message', TSW('MGSTMP'),
          "'From ' + %TRIMR(MGFROM) + ' to ' + %TRIMR(MGTO) + ': ' + MGTEXT")
    + src('*LOVAL | SETLL | MAILREC', ' | READ | MAILREC', 'OVMAILP', MINE % ('MM', 'MM'), 'Mail', TSW('MMSTMP'),
          "'From ' + %TRIMR(MMFROM) + ' to ' + %TRIMR(MMTO) + ': ' + %TRIMR(MMSUBJ) + ' / ' + %TRIMR(MMB1) + ' ' + %TRIMR(MMB2) + ' ' + %TRIMR(MMB3) + ' ' + %TRIMR(MMB4) + ' ' + %TRIMR(MMB5) + ' ' + %TRIMR(MMB6) + ' ' + %TRIMR(MMB7) + ' ' + MMB8")
    + src('KUSER | SETLL | CALREC', 'KUSER | READE | CALREC', 'OVCALP', '', 'Event',
          " | MOVE | CLDATE | W8\nEVAL WDT = %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2) + '/' + %SUBST(W8:1:4)\n", "CLTEXT")
    + src('KUSER | SETLL | NOTEREC', 'KUSER | READE | NOTEREC', 'OVNOTEP', '', 'Note', TSW('NTSTMP'), "NTTEXT")
    + src('KUSER | SETLL | TASKREC', 'KUSER | READE | TASKREC', 'OVTASKP', '', 'Task', TSW('TKSTMP'), "TKTEXT")
    + src('KUSER | SETLL | PHONREC', 'KUSER | READE | PHONREC', 'OVPHONP', '', 'Phone', NOW,
          "%TRIMR(PHNAME) + '  ' + %TRIMR(PHPHON) + '  ' + %TRIMR(PHMAIL) + '  ' + PHNOTE")
    + src('KUSER | SETLL | DOCREC', 'KUSER | READE | DOCREC', 'OVDOCP', '', 'Document', TSW('DCSTMP'), "%TRIMR(DCNAME) + ': ' + DCTITL")
    + src('KUSER | SETLL | DOCLREC', 'KUSER | READE | DOCLREC', 'OVDOCLP', '', 'Doc line', NOW,
          "%TRIMR(DLNAME) + ' line ' + %CHAR(DLSEQ) + ': ' + DLTEXT")
    + src('*LOVAL | SETLL | USERREC', ' | READ | USERREC', 'OVUSERP', "USSTAT = 'A'", 'User', NOW,
          "%TRIMR(USUSER) + '  ' + %TRIMR(USNAME) + '  ' + %TRIMR(USDEPT) + '  ' + USPHON") + """
EVAL TTLW = 'Search everything - ' + %CHAR(NMATCH) + ' found'
ENDIF
""" + SHOWN + """
 | ENDSR
""")
# ---------------- OVCHAT: live chat ----------------
s = Scr('OVCHAT'); s.rec('BLANK'); s.t(1, 2, ' ')
s.rec('CHATSCR', 'OVERLAY'); s.reck('INVITE', ' 45'); s.reck('PUTOVR', ' 46')
s.f('CHHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.f('CHTTL', 60, 'O', 2, 3, 'DSPATR(HI)'); s.f('CHTOP', 76, 'O', 3, 3, 'COLOR(YLW)')
for i in range(1, 15): s.f('CH%02d' % i, 76, 'O', 3 + i, 3, 'OVRDTA')
s.t(19, 3, 'Say . . .'); s.f('CHSAY', 60, 'B', 19, 14, 'CHECK(LC)', 'DSPATR(UL)')
s.f('CHMSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f('CHFK', 78, 'O', 23, 2, 'COLOR(BLU)')
s.rec('CHLST'); s.f('GHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.ctr(2, 'L I V E   C H A T', 'DSPATR(HI)')
s.t(4, 3, 'Private chat with'); s.f('GWHO', 10, 'B', 4, 22, 'DSPATR(UL)'); s.t(4, 34, 'a user ID.  F4 lists users', 'COLOR(BLU)')
s.t(6, 3, 'Group rooms, newest topic first', 'COLOR(WHT)')
s.t(7, 2, 'Opt  Room           Topic                              Set by     When', 'COLOR(BLU)')
for i in range(1, 11):
    s.f('GOP%02d' % i, 1, 'I', 7 + i, 3, 'DSPATR(UL)'); s.f('GLN%02d' % i, 72, 'O', 7 + i, 7, 'COLOR(TRQ)' if i % 2 else 'COLOR(GRN)')
s.t(19, 3, '1=Join   4=Delete room   F6=New room with a topic', 'COLOR(BLU)')
s.f('GMSG', 76, 'O', 21, 3, 'DSPATR(HI)'); s.f('GFK', 78, 'O', 23, 2, 'COLOR(BLU)')
s.edit('CHNEW', 'N'); s.inp('Room name', 'NROOM', 14, 4, lc=False); s.t(4, 40, 'one word', 'COLOR(BLU)')
s.inp('Topic', 'NTOPC', 50, 6); s.t(8, 3, 'Everyone in the office can see the room and join it.', 'COLOR(BLU)')
s.edit('CHTOPS', 'T'); s.f('TROOM', 40, 'O', 3, 3, 'COLOR(WHT)'); s.inp('New topic', 'TTOPC', 50, 5)
s.t(7, 3, 'The room is moved to the top of the list, and everyone in it sees the change.', 'COLOR(BLU)')
s.save()
prog('OVCHAT', [('OVCHATP', 'U'), ('OVUSERP', 'I'), ('OVSETUP', 'I'), ('OVCTOPP', 'U')], 'OVCHAT', arrds('CHLA', 'CHL', 76, ['CH%02d' % i for i in range(1, 15)]) +
 arrds('GLNA', 'GLN', 72, ['GLN%02d' % i for i in range(1, 11)]) + arrds('GOPA', 'GOP', 1, ['GOP%02d' % i for i in range(1, 11)]) +
 [S('RMK', 20, kw='DIM(99)'), S('RMT', 'Z', kw='DIM(99)'), S('NRM', 5, 0), S('WK', 20), S('WT', 'Z'), S('IDX', 5, 0), S('K', 5, 0), S('GROUP', 1), S('ISADM', 1), S('WNAM', 14)] +
 SETVARS + [S('GOTKEY', 1), S('NEWST', 'Z'), S('LASTST', 'Z'), S('KROOM', 20), S('OTHER', 10), S('ANIM', 1), S('FULL', 1), S('NOTIFD', 1), S('TTL', 60)], """
EVAL LAPP = 'CHAT'
""" + GETSET + """
EVAL ISADM = 'N'
PGMUSR | CHAIN(N) | USERREC
IF %FOUND(OVUSERP) AND USADM = 'Y'
EVAL ISADM = 'Y'
ENDIF
EVAL GROUP = '0'
EXSR PICK
EVAL ANIM = '1'
IF CHATAU = 'M' OR ANIMON = 'N'
EVAL ANIM = '0'
ENDIF
EVAL FULL = '1'
DOW OTHER <> *BLANKS
EXSR LOADC
IF FULL = '1'
EVAL HDRID = 'OFCCHAT'
EXSR HDR
EVAL CHHDR = HDRLN
EVAL CHTTL = TTL
EVAL CHTOP = *BLANKS
IF GROUP = '1'
KROOM | CHAIN(N) | TOPREC
IF %FOUND(OVCTOPP) AND TPTOPC <> *BLANKS
EVAL CHTOP = 'Topic: ' + %TRIMR(TPTOPC) + '   (' + %TRIM(TPBY) + ')'
ENDIF
ENDIF
EVAL CHSAY = *BLANKS
EVAL CHMSG = MSG
EVAL MSG = *BLANKS
EVAL CHFK = 'F1=Help  Enter=Send  F5=Refresh  F6=Rooms  F9=Set the topic  F3=Exit'
ENDIF
IF ANIM = '1'
* sent with INVITE.  The screen is only redrawn when a new line
* arrives, so the cursor is left alone while you type.
EVAL *IN45 = *ON
IF FULL = '1'
EVAL *IN46 = *OFF
 | WRITE | BLANK
ELSE
EVAL *IN46 = *ON
ENDIF
 | WRITE | CHATSCR
EVAL GOTKEY = '0'
DOW GOTKEY = '0' AND ANIM = '1'
 | READ | OVCHAT | | 5152
IF *IN51 = *ON
EVAL *IN51 = *OFF
IF DSPSTS = 1331
EXSR NEWEST
IF NEWST <> LASTST
LEAVE
ENDIF
ELSE
EVAL ANIM = '0'
EVAL MSG = 'This display cannot refresh by itself.  Press F5 to see new lines.'
ENDIF
ELSE
EVAL GOTKEY = '1'
ENDIF
ENDDO
IF GOTKEY = '0'
EVAL FULL = '0'
IF ANIM = '0'
EVAL FULL = '1'
ENDIF
ITER
ENDIF
ELSE
EVAL *IN45 = *OFF
EVAL *IN46 = *OFF
 | WRITE | BLANK
 | EXFMT | CHATSCR
ENDIF
EVAL FULL = '1'
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN06 = *ON
EXSR PICK
ITER
ENDIF
IF *IN09 = *ON
EXSR SETTOP
ITER
ENDIF
IF *IN05 = *OFF AND CHSAY <> *BLANKS
EVAL CHROOM = KROOM
EXSR NEWTS
EVAL CHSTMP = TS
EVAL CHFROM = PGMUSR
EVAL CHTEXT = %TRIML(CHSAY)
 | WRITE | CHATREC
IF GROUP = '0' AND NOTIFD = '0'
EVAL QSRC = %TRIM(PGMUSR) + ' is chatting with you in OfficeVibes.  Main menu 2, then 3.'
EXSR QUOTE
EVAL CMD = 'SNDMSG MSG(''' + QTXT + ''') TOUSR(' + %TRIM(OTHER) + ')'
EXSR RUNCMD
EVAL *IN50 = *OFF
EVAL NOTIFD = '1'
""" + log('CHAT', "'Started a chat with ' + OTHER") + """
ENDIF
ENDIF
ENDDO
EVAL *INLR = *ON
* ---- the latest fourteen lines of the room ----
LOADC | BEGSR
EVAL CHLA = *BLANKS
EVAL ROW = 14
EVAL LASTST = *LOVAL
KROOM | SETGT | CHATREC
KROOM | READPE(N) | CHATREC
IF NOT %EOF(OVCHATP)
EVAL LASTST = CHSTMP
ENDIF
DOW NOT %EOF(OVCHATP) AND ROW >= 1
 | MOVE | CHSTMP | WSTMP
EVAL CHL(ROW) = %SUBST(WSTMP:12:2) + ':' + %SUBST(WSTMP:15:2) + ' ' + %TRIMR(CHFROM) + ': ' + CHTEXT
EVAL ROW = ROW - 1
KROOM | READPE(N) | CHATREC
ENDDO
 | ENDSR
* ---- the time of the newest line in the room: NEWST ----
NEWEST | BEGSR
EVAL NEWST = *LOVAL
KROOM | SETGT | CHATREC
KROOM | READPE(N) | CHATREC
IF NOT %EOF(OVCHATP)
EVAL NEWST = CHSTMP
ENDIF
 | ENDSR
* ---- the room list: sets OTHER and KROOM, OTHER blank when cancelled
PICK | BEGSR
EVAL GWHO = *BLANKS
EVAL OTHER = *BLANKS
EVAL PGNO = 0
DOW 1 = 1
EXSR LOADR
IF PGNO > 0 AND BASE >= NRM
EVAL PGNO = 0
EXSR LOADR
ENDIF
""" + hdr('G', 'OFCCHATRM', 'Enter=Join   F4=List users   F6=New room   F7/F8=Page   F3=Exit') + """
EVAL GMSG = MSG
IF MSG = *BLANKS
EVAL GMSG = %CHAR(NRM) + ' room(s).  Type 1 beside a room, or put the cursor on it.'
ENDIF
EVAL MSG = *BLANKS
EVAL GOPA = *BLANKS
 | EXFMT | CHLST
EXSR CSR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN04 = *ON
EXSR LOOKUP
IF SELUSR <> *BLANKS
EVAL GWHO = SELUSR
ENDIF
ITER
ENDIF
IF *IN06 = *ON
EXSR NEWRM
IF OTHER <> *BLANKS
LEAVE
ENDIF
ITER
ENDIF
IF *IN07 = *ON
IF PGNO > 0
EVAL PGNO = PGNO - 1
ENDIF
ITER
ENDIF
IF *IN08 = *ON
IF BASE + 10 < NRM
EVAL PGNO = PGNO + 1
ENDIF
ITER
ENDIF
* a private chat with one person
IF GWHO <> *BLANKS
EVAL OTHER = %TRIML(GWHO)
EVAL GWHO = *BLANKS
IF OTHER = 'EVERYONE'
EVAL WK = 'EVERYONE'
EXSR JOINR
LEAVE
ENDIF
OTHER | CHAIN(N) | USERREC
IF OTHER = PGMUSR OR NOT %FOUND(OVUSERP)
EVAL OTHER = *BLANKS
EVAL MSG = 'Type the ID of another enrolled user.  F4 lists users.'
ITER
ENDIF
IF PGMUSR < OTHER
EVAL KROOM = PGMUSR + OTHER
ELSE
EVAL KROOM = OTHER + PGMUSR
ENDIF
EVAL GROUP = '0'
EVAL TTL = 'Chat with ' + %TRIMR(USNAME) + ' (' + %TRIM(OTHER) + ')'
LEAVE
ENDIF
* a group room, by option or by cursor
EVAL K = 0
EVAL OP = '1'
1 | DO | NSHOW | ROW
IF GOP(ROW) <> *BLANK AND K = 0
EVAL K = ROW
EVAL OP = GOP(ROW)
ENDIF
 | ENDDO
IF K = 0
EVAL CSRSEL = CSRROW - 7
IF CSRSEL >= 1 AND CSRSEL <= NSHOW
EVAL K = CSRSEL
ENDIF
ENDIF
IF K = 0
ITER
ENDIF
EVAL WK = RMK(BASE + K)
IF OP = '4'
EXSR DELRM
ITER
ENDIF
IF OP <> '1'
EVAL MSG = 'Type 1 to join a room, or 4 to delete one.'
ITER
ENDIF
EXSR JOINR
LEAVE
ENDDO
EVAL NOTIFD = '0'
EVAL FULL = '1'
""" + INDOFF + """
 | ENDSR
* ---- go into the group room WK ----
JOINR | BEGSR
EVAL KROOM = WK
EVAL GROUP = '1'
EVAL OTHER = '*GROUP'
IF WK = 'EVERYONE'
EVAL TTL = 'Group room EVERYONE - the whole office'
ELSE
EVAL TTL = 'Group room ' + %TRIM(WK)
ENDIF
 | ENDSR
* ---- every room, newest topic first, and one page of them ----
LOADR | BEGSR
EVAL WK = 'EVERYONE'
WK | CHAIN(N) | TOPREC
IF NOT %FOUND(OVCTOPP)
EVAL TPROOM = WK
EVAL TPTOPC = 'The whole office.  Say hello!'
EVAL TPBY = PGMUSR
EVAL TPOWN = *BLANKS
EXSR NEWTS
EVAL TPSTMP = TS
 | WRITE | TOPREC
ENDIF
EVAL NRM = 0
*LOVAL | SETLL | TOPREC
 | READ(N) | TOPREC
DOW NOT %EOF(OVCTOPP) AND NRM < 99
EVAL NRM = NRM + 1
EVAL RMK(NRM) = TPROOM
EVAL RMT(NRM) = TPSTMP
 | READ(N) | TOPREC
ENDDO
1 | DO | NRM | I
EVAL J = I + 1
DOW J <= NRM
IF RMT(J) > RMT(I)
EVAL WK = RMK(I)
EVAL WT = RMT(I)
EVAL RMK(I) = RMK(J)
EVAL RMT(I) = RMT(J)
EVAL RMK(J) = WK
EVAL RMT(J) = WT
ENDIF
EVAL J = J + 1
ENDDO
 | ENDDO
EVAL GLNA = *BLANKS
EVAL BASE = PGNO * 10
EVAL NSHOW = NRM - BASE
IF NSHOW > 10
EVAL NSHOW = 10
ENDIF
IF NSHOW < 0
EVAL NSHOW = 0
ENDIF
1 | DO | NSHOW | ROW
EVAL IDX = BASE + ROW
EVAL WK = RMK(IDX)
WK | CHAIN(N) | TOPREC
IF %FOUND(OVCTOPP)
 | MOVE | TPSTMP | WSTMP
EVAL WNAM = %SUBST(TPROOM:1:14)
EVAL GLN(ROW) = WNAM + ' ' + %SUBST(TPTOPC:1:34) + ' ' + TPBY + ' ' + %SUBST(WSTMP:6:2) + '/' + %SUBST(WSTMP:9:2) + ' ' + %SUBST(WSTMP:12:2) + ':' + %SUBST(WSTMP:15:2)
ENDIF
 | ENDDO
 | ENDSR
* ---- make a new group room ----
NEWRM | BEGSR
EVAL NROOM = *BLANKS
EVAL NTOPC = *BLANKS
EVAL NMSG = *BLANKS
DOW 1 = 1
""" + hdr('N', 'OFCNEWROOM', 'Enter=Create and join   F12=Cancel') + """
 | EXFMT | CHNEW
EVAL NMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
EVAL WNAM = %TRIML(NROOM)
LCASE:UCASE | XLATE | WNAM | WNAM
IF WNAM = *BLANKS
EVAL NMSG = 'Give the room a name.'
ITER
ENDIF
IF %SCAN(' ':%TRIMR(WNAM)) > 0
EVAL NMSG = 'The room name must be one word.'
ITER
ENDIF
IF NTOPC = *BLANKS
EVAL NMSG = 'Give the room a topic, so people know what it is about.'
ITER
ENDIF
EVAL WK = '#' + WNAM
IF WNAM = 'EVERYONE'
EVAL WK = 'EVERYONE'
ENDIF
WK | CHAIN(N) | TOPREC
IF %FOUND(OVCTOPP)
EVAL NMSG = 'There is already a room called that.  Join it from the list.'
ITER
ENDIF
EVAL TPROOM = WK
EVAL TPTOPC = %TRIML(NTOPC)
EVAL TPBY = PGMUSR
EVAL TPOWN = PGMUSR
EXSR NEWTS
EVAL TPSTMP = TS
 | WRITE | TOPREC
""" + log('NEWROOM', 'WK') + """
EXSR JOINR
LEAVE
ENDDO
""" + INDOFF + """
 | ENDSR
* ---- delete the room WK, by the person who made it or an administrator
DELRM | BEGSR
IF WK = 'EVERYONE'
EVAL MSG = 'The EVERYONE room cannot be deleted.'
ELSE
WK | CHAIN(N) | TOPREC
IF %FOUND(OVCTOPP)
IF TPOWN <> PGMUSR AND ISADM <> 'Y'
EVAL MSG = 'Only the person who made a room, or an administrator, can delete it.'
ELSE
WK | CHAIN | TOPREC
IF %FOUND(OVCTOPP)
 | DELETE | TOPREC
ENDIF
WK | SETLL | CHATREC
WK | READE | CHATREC
DOW NOT %EOF(OVCHATP)
 | DELETE | CHATREC
WK | READE | CHATREC
ENDDO
EVAL MSG = 'Room ' + %TRIM(WK) + ' deleted.'
""" + log('DELROOM', 'WK') + """
ENDIF
ENDIF
ENDIF
 | ENDSR
* ---- change the topic of the group room KROOM ----
SETTOP | BEGSR
IF GROUP = '0'
EVAL MSG = 'Only group rooms have a topic.  F6 shows the rooms.'
ELSE
EVAL TTOPC = *BLANKS
KROOM | CHAIN(N) | TOPREC
IF %FOUND(OVCTOPP)
EVAL TTOPC = TPTOPC
ENDIF
EVAL TROOM = 'Room ' + %TRIM(KROOM)
EVAL TMSG = *BLANKS
DOW 1 = 1
""" + hdr('T', 'OFCTOPIC', 'Enter=Set the topic   F12=Cancel') + """
 | EXFMT | CHTOPS
EVAL TMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF TTOPC = *BLANKS
EVAL TMSG = 'Type a topic.'
ITER
ENDIF
KROOM | CHAIN | TOPREC
IF %FOUND(OVCTOPP)
EVAL TPTOPC = %TRIML(TTOPC)
EVAL TPBY = PGMUSR
EXSR NEWTS
EVAL TPSTMP = TS
 | UPDATE | TOPREC
EVAL CHROOM = KROOM
EXSR NEWTS
EVAL CHSTMP = TS
EVAL CHFROM = PGMUSR
EVAL CHTEXT = '*** set the topic: ' + TPTOPC
 | WRITE | CHATREC
""" + log('TOPIC', 'KROOM') + """
ENDIF
LEAVE
ENDDO
ENDIF
""" + INDOFF + """
EVAL FULL = '1'
 | ENDSR
""", dspkw='MAXDEV(*FILE)')

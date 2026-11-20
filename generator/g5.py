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
s.f('CHHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.f('CHTTL', 60, 'O', 2, 3, 'DSPATR(HI)')
for i in range(1, 15): s.f('CH%02d' % i, 76, 'O', 3 + i, 3, 'OVRDTA')
s.t(19, 3, 'Say . . .'); s.f('CHSAY', 60, 'B', 19, 14, 'CHECK(LC)', 'DSPATR(UL)')
s.f('CHMSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f('CHFK', 78, 'O', 23, 2, 'COLOR(BLU)')
s.edit('CHWHO', 'W'); s.inp('Chat with', 'WWHO', 10, 4, lc=False); s.t(4, 37, 'A user ID, or EVERYONE.  F4 shows a list', 'COLOR(BLU)'); s.save()
prog('OVCHAT', [('OVCHATP', 'U'), ('OVUSERP', 'I')], 'OVCHAT', arrds('CHLA', 'CHL', 76, ['CH%02d' % i for i in range(1, 15)]) +
 [S('KROOM', 20), S('OTHER', 10), S('ANIM', 1), S('FULL', 1), S('NOTIFD', 1), S('TTL', 60)], """
EVAL LAPP = 'CHAT'
EXSR PICK
EVAL ANIM = '1'
EVAL FULL = '1'
DOW OTHER <> *BLANKS
EXSR LOADC
IF FULL = '1'
EVAL HDRID = 'OFCCHAT'
EXSR HDR
EVAL CHHDR = HDRLN
EVAL CHTTL = TTL
EVAL CHSAY = *BLANKS
EVAL CHMSG = MSG
EVAL MSG = *BLANKS
EVAL CHFK = 'F1=Help   Enter=Send   F5=Refresh   F6=Chat with someone else   F3=Exit'
ENDIF
IF ANIM = '1'
* sent with INVITE and read with a two second time-out, so new lines
* appear while the keyboard stays open
EVAL *IN45 = *ON
IF FULL = '1'
EVAL *IN46 = *OFF
 | WRITE | BLANK
ELSE
EVAL *IN46 = *ON
ENDIF
 | WRITE | CHATSCR
 | READ | OVCHAT | | 5152
IF *IN51 = *ON
IF DSPSTS = 1331
EVAL FULL = '0'
ELSE
EVAL ANIM = '0'
EVAL FULL = '1'
EVAL MSG = 'This display cannot refresh by itself.  Press F5 to see new lines.'
ENDIF
EVAL *IN51 = *OFF
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
IF *IN05 = *OFF AND CHSAY <> *BLANKS
EVAL CHROOM = KROOM
EXSR NEWTS
EVAL CHSTMP = TS
EVAL CHFROM = PGMUSR
EVAL CHTEXT = %TRIML(CHSAY)
 | WRITE | CHATREC
IF OTHER <> 'EVERYONE' AND NOTIFD = '0'
EVAL QSRC = %TRIM(PGMUSR) + ' is chatting with you in OfficeVibes.  Take option 14, Live chat.'
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
KROOM | SETGT | CHATREC
KROOM | READPE(N) | CHATREC
DOW NOT %EOF(OVCHATP) AND ROW >= 1
 | MOVE | CHSTMP | WSTMP
EVAL CHL(ROW) = %SUBST(WSTMP:12:2) + ':' + %SUBST(WSTMP:15:2) + ' ' + %TRIMR(CHFROM) + ': ' + CHTEXT
EVAL ROW = ROW - 1
KROOM | READPE(N) | CHATREC
ENDDO
 | ENDSR
* ---- choose who to chat with: sets OTHER, blank when cancelled ----
PICK | BEGSR
EVAL WWHO = *BLANKS
EVAL WMSG = *BLANKS
EVAL OTHER = *BLANKS
DOW 1 = 1
""" + hdr('W', 'OFCCHATWHO', 'Enter=Start   F4=List users   F12=Cancel') + """
 | EXFMT | CHWHO
EVAL WMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN04 = *ON
EXSR LOOKUP
IF SELUSR <> *BLANKS
EVAL WWHO = SELUSR
ENDIF
ITER
ENDIF
EVAL OTHER = %TRIML(WWHO)
IF OTHER = 'EVERYONE'
EVAL KROOM = 'EVERYONE'
EVAL TTL = 'Office chat room - everyone'
LEAVE
ENDIF
OTHER | CHAIN | USERREC
IF OTHER = *BLANKS OR OTHER = PGMUSR OR NOT %FOUND(OVUSERP)
EVAL OTHER = *BLANKS
EVAL WMSG = 'Type the ID of another enrolled user, or EVERYONE.  F4 lists users.'
ITER
ENDIF
IF PGMUSR < OTHER
EVAL KROOM = PGMUSR + OTHER
ELSE
EVAL KROOM = OTHER + PGMUSR
ENDIF
EVAL TTL = 'Chat with ' + %TRIMR(USNAME) + ' (' + %TRIM(OTHER) + ')'
LEAVE
ENDDO
EVAL NOTIFD = '0'
EVAL FULL = '1'
""" + INDOFF + """
 | ENDSR
""", dspkw='MAXDEV(*FILE)')

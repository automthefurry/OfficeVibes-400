MENUSEL = """
EVAL SEL = %TRIML(@F@)
EVAL SELN = 0
IF SEL = *BLANKS
IF CSRROW >= 6 AND CSRROW <= @LAST@
EVAL SELN = CSRROW - 5
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
"""
# ---------------- OVADM ----------------
s = Scr('OVADM'); s.rec('AMENU'); s.f('AHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.f('ABAR', 78, 'O', 2, 2, 'DSPATR(RI)', 'COLOR(RED)')
s.f('AINF1', 74, 'O', 4, 3, 'COLOR(TRQ)')
for i, tx in enumerate([' 1. Users', ' 2. Groups', ' 3. Activity log', ' 4. Statistics', ' 5. Clean up old items',
    ' 6. Send a notice to every display', ' 7. System status', ' 8. Active jobs', ' 9. Disk status', '10. All printed output',
    '11. System operator messages', '12. Start the reminder service', '13. Stop the reminder service']): s.t(6 + i, 6, tx)
s.t(20, 3, '===>'); s.f('ASEL', 3, 'B', 20, 8, 'DSPATR(UL)'); s.f('AMSG', 74, 'O', 22, 3, 'DSPATR(HI)'); s.f('AFK', 78, 'O', 23, 2, 'COLOR(BLU)')
s.edit('APURGE', 'P'); s.t(4, 3, 'Old items are deleted for every user.  This cannot be undone.', 'COLOR(RED)')
s.inp('Delete read messages and mail older than (days)', 'PDAYS', 3, 6, lc=False, pos=56)
s.inp('Delete activity log entries older than (days)', 'LDAYS', 3, 8, lc=False, pos=56)
s.edit('ANOTE', 'N'); s.t(4, 3, 'The notice appears on every display, with an alarm.', 'COLOR(BLU)')
s.f('NTEXT', 74, 'B', 7, 3, 'CHECK(LC)', 'DSPATR(UL)'); s.save()
def purge(rec, pfn, stmp, cond):
    c1 = ("IF %s\n" % cond) if cond else ''
    c2 = "ENDIF\n" if cond else ''
    return ("*LOVAL | SETLL | %s\n | READ | %s\nDOW NOT %%EOF(%s) AND %s < TS\n" % (rec, rec, pfn, stmp) + c1 +
            " | DELETE | %s\nEVAL DCNT = DCNT + 1\n" % rec + c2 + " | READ | %s\nENDDO\n | UNLOCK | %s\n" % (rec, pfn))
prog('OVADM', [('OVUSERP', 'I'), ('OVMSGP', 'U'), ('OVMAILP', 'U'), ('OVLOGP', 'U')], 'OVADM',
 [S('SEL', 3), S('SELN', 5, 0), S('PGMNAM', 10), S('DAYS1', 5, 0), S('DAYS2', 5, 0)], """
EVAL LAPP = 'ADMIN'
PGMUSR | CHAIN | USERREC
IF NOT %FOUND(OVUSERP) OR USADM <> 'Y'
EVAL *INLR = *ON
 | RETURN
ENDIF
DOW *IN03 = *OFF
EVAL HDRID = 'OFCADM'
EXSR HDR
EVAL AHDR = HDRLN
EVAL ABAR = *BLANKS
EVAL %SUBST(ABAR:27:25) = 'A D M I N I S T R A T O R'
 | TIME | | TS
 | MOVE | TS | WSTMP
EXSR FMTDT
EVAL AINF1 = 'Signed on as ' + %TRIM(PGMUSR) + ' on ' + %TRIM(SYSNAM) + ' at ' + WDT
EVAL ASEL = *BLANKS
EVAL AMSG = MSG
EVAL AFK = 'F1=Help  F3=Exit   Type a number, or put the cursor on a line, and press Enter'
EVAL MSG = *BLANKS
 | EXFMT | AMENU
EXSR CSR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
""" + MENUSEL.replace('@F@', 'ASEL').replace('@LAST@', '18') + """
EVAL PGMNAM = *BLANKS
EVAL CMD = *BLANKS
SELECT
WHEN SELN = 0
ITER
WHEN SELN = 1
EVAL PGMNAM = 'OVUSRM'
WHEN SELN = 2
EVAL PGMNAM = 'OVGRPM'
WHEN SELN = 3
EVAL PGMNAM = 'OVLOGV'
WHEN SELN = 4
EVAL PGMNAM = 'OVSTAT'
WHEN SELN = 5
EXSR PURGE
WHEN SELN = 6
EXSR NOTICE
WHEN SELN = 7
EVAL CMD = 'DSPSYSSTS'
WHEN SELN = 8
EVAL CMD = 'WRKACTJOB'
WHEN SELN = 9
EVAL CMD = 'WRKDSKSTS'
WHEN SELN = 10
EVAL CMD = 'WRKSPLF SELECT(*ALL)'
WHEN SELN = 11
EVAL CMD = 'DSPMSG MSGQ(QSYSOPR)'
WHEN SELN = 12
EXSR REMON
WHEN SELN = 13
EXSR REMOFF
OTHER
EVAL MSG = 'That is not one of the choices.'
ENDSL
IF PGMNAM <> *BLANKS
 | CALL | PGMNAM | | 50
IF *IN50 = *ON
EVAL MSG = 'Program ' + %TRIM(PGMNAM) + ' could not be run.'
ENDIF
EVAL *IN50 = *OFF
ENDIF
IF CMD <> *BLANKS
EXSR RUNCMD
IF *IN50 = *ON
EVAL MSG = 'That command could not be run.  You may lack authority.'
ENDIF
EVAL *IN50 = *OFF
ENDIF
ENDDO
EVAL *INLR = *ON
* ---- delete old items ----
* ---- the reminder service is a batch job called OVREMIND ----
REMON | BEGSR
EVAL CMD = 'SBMJOB CMD(CALL PGM(OFFICE/OVREMD)) JOB(OVREMIND) JOBQ(QSYSNOMAX) INLLIBL(*CURRENT)'
EXSR RUNCMD
IF *IN50 = *ON
EVAL *IN50 = *OFF
EVAL CMD = 'SBMJOB CMD(CALL PGM(OFFICE/OVREMD)) JOB(OVREMIND) INLLIBL(*CURRENT)'
EXSR RUNCMD
ENDIF
IF *IN50 = *ON
EVAL MSG = 'The reminder service could not be submitted.  You may lack authority.'
ELSE
EVAL MSG = 'Reminder service submitted.  WRKACTJOB shows it as OVREMIND.'
EVAL LACT = 'REMINDON'
EVAL LTXT = 'Reminder service started'
EXSR LOGIT
ENDIF
EVAL *IN50 = *OFF
EVAL CMD = *BLANKS
 | ENDSR
REMOFF | BEGSR
EVAL CMD = 'ENDJOB JOB(OVREMIND) OPTION(*CNTRLD) DELAY(60)'
EXSR RUNCMD
IF *IN50 = *ON
EVAL MSG = 'The reminder service does not seem to be running.'
ELSE
EVAL MSG = 'The reminder service will stop within a minute.'
EVAL LACT = 'REMINDOFF'
EVAL LTXT = 'Reminder service stopped'
EXSR LOGIT
ENDIF
EVAL *IN50 = *OFF
EVAL CMD = *BLANKS
 | ENDSR
PURGE | BEGSR
EVAL PDAYS = '30'
EVAL LDAYS = '90'
""" + hdr('P', 'OFCPURGE', 'Enter=Delete old items   F12=Cancel') + """
EVAL PMSG = *BLANKS
 | EXFMT | APURGE
IF *IN03 = *OFF AND *IN12 = *OFF
EVAL NERR = '0'
EVAL NSTR = %TRIML(PDAYS)
EXSR TONUM
EVAL DAYS1 = NVAL
EVAL NSTR = %TRIML(LDAYS)
EXSR TONUM
EVAL DAYS2 = NVAL
IF NERR = '1'
EVAL MSG = 'Nothing deleted.  The days must be numbers.'
ELSE
EVAL DCNT = 0
 | TIME | | TS
 | SUBDUR | DAYS1:*D | TS
""" + purge('MSGREC', 'OVMSGP', 'MGSTMP', "MGSTAT <> 'N'") + purge('MAILREC', 'OVMAILP', 'MMSTMP', "MMSTAT <> 'N'") + """
 | TIME | | TS
 | SUBDUR | DAYS2:*D | TS
""" + purge('LOGREC', 'OVLOGP', 'LGSTMP', '') + """
EVAL MSG = %CHAR(DCNT) + ' old item(s) removed.'
""" + log('PURGE', "%CHAR(DCNT) + ' item(s) removed'") + """
ENDIF
ENDIF
""" + INDOFF + """
 | ENDSR
* ---- break message to every display ----
NOTICE | BEGSR
""" + hdr('N', 'OFCNOTICE', 'Enter=Send   F12=Cancel') + """
EVAL NTEXT = *BLANKS
EVAL NMSG = *BLANKS
 | EXFMT | ANOTE
IF *IN03 = *OFF AND *IN12 = *OFF AND NTEXT <> *BLANKS
EVAL QSRC = %TRIML(NTEXT)
EXSR QUOTE
EVAL CMD = 'SNDBRKMSG MSG(''' + QTXT + ''') TOMSGQ(*ALLWS)'
EXSR RUNCMD
IF *IN50 = *ON
EVAL MSG = 'Could not send.  You may need *JOBCTL authority.'
ELSE
EVAL MSG = 'Notice sent to every display.'
""" + log('NOTICE', '%SUBST(NTEXT:1:60)') + """
ENDIF
EVAL *IN50 = *OFF
EVAL CMD = *BLANKS
ENDIF
""" + INDOFF + """
 | ENDSR
""")
# ---------------- OVUSRM ----------------
s = Scr('OVUSRM'); lay_users(s); s.edit('UEDIT', 'E')
s.inp('User ID', 'EUSER', 10, 4, lc=False); s.k('DSPATR(PR)', ' 40')
s.inp('Full name', 'ENAME', 30, 6); s.inp('Department', 'EDEPT', 20, 8); s.inp('Phone', 'EPHON', 20, 10)
s.inp('Administrator (Y/N)', 'EADM', 1, 12, lc=False)
s.t(14, 3, 'For a new user you can also create the OS/400 sign-on:', 'COLOR(BLU)')
s.inp('Create sign-on (Y/N)', 'ECRT', 1, 15, lc=False); s.t(16, 3, 'Password'); s.f('EPWD', 10, 'B', 16, 24, 'DSPATR(ND)')
s.t(16, 37, 'Not shown as you type', 'COLOR(BLU)'); s.save()
prog('OVUSRM', [('OVUSERP', 'U')], 'OVUSRM', listds('U') + [S('KU', 10, kw='DIM(10)'), S('KUID', 10), S('EDMODE', 1), S('ULINE', 80),
  S('ADMT', 5), S('STT', 8), S('NEWID', 10)] +
 DC('COLH', 'Opt  User ID    Name                   Department   Admin Status   Last on') +
 DC('FK1', '2=Change  4=Remove  5=Disable or enable   or cursor on a user and Enter') + DC('FK2', 'F1=Help  F3=Exit  F6=Add a user  F7/F8=Page'),
 "EVAL LAPP = 'USERS'\n" + listmain('U', 'ULIST', 'OFCUSERS', find=True, deflt='2', keys="""
IF *IN06 = *ON
EVAL EDMODE = 'A'
EXSR EDITU
ITER
ENDIF
""", acts="""
1 | DO | NSHOW | ROW
EVAL OP = %TRIM(UOP(ROW))
IF OP = '2' OR OP = '4' OR OP = '5'
EVAL KUID = KU(ROW)
SELECT
WHEN OP = '2'
EVAL EDMODE = 'C'
EXSR EDITU
WHEN KUID = PGMUSR
EVAL MSG = 'You cannot remove or disable yourself.'
OTHER
KUID | CHAIN | USERREC
IF %FOUND(OVUSERP)
IF OP = '4'
 | DELETE | USERREC
""" + log('RMVUSER', 'KUID') + """
ELSE
IF USSTAT = 'A'
EVAL USSTAT = 'D'
ELSE
EVAL USSTAT = 'A'
ENDIF
 | UPDATE | USERREC
""" + log('USRSTATUS', "%TRIMR(KUID) + ' is now ' + USSTAT") + """
ENDIF
ENDIF
ENDSL
ENDIF
 | ENDDO
""") + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL ULNA = *BLANKS
""" + CLRIND + """
EVAL NMATCH = 0
EVAL BASE = PGNO * 10
*LOVAL | SETLL | USERREC
 | READ(N) | USERREC
DOW NOT %EOF(OVUSERP)
EVAL ULINE = USUSER + ' ' + USNAME + ' ' + USDEPT
LCASE:UCASE | XLATE | ULINE | ULINE
IF UNEED = *BLANKS OR %SCAN(%TRIMR(UNEED):ULINE) > 0
EVAL NMATCH = NMATCH + 1
""" + PAGED + """
EVAL ADMT = *BLANKS
IF USADM = 'Y'
EVAL ADMT = 'Yes'
ENDIF
EVAL STT = 'Active'
IF USSTAT = 'D'
EVAL STT = 'Disabled'
ENDIF
 | MOVE | USLAST | WSTMP
EXSR FMTDT
EVAL ULN(ROW) = USUSER + ' ' + %SUBST(USNAME:1:22) + ' ' + %SUBST(USDEPT:1:12) + ' ' + ADMT + ' ' + STT + ' ' + %SUBST(WDT:1:10)
IF USSTAT = 'D'
EVAL *IN(60 + ROW) = *ON
ENDIF
IF USADM = 'Y'
EVAL *IN(70 + ROW) = *ON
ENDIF
EVAL KU(ROW) = USUSER
ENDIF
ENDIF
 | READ(N) | USERREC
ENDDO
""" + SHOWN + """
EVAL TTLW = %CHAR(NMATCH) + ' enrolled'
 | ENDSR
* ---- add or change a user ----
EDITU | BEGSR
EVAL EUSER = *BLANKS
EVAL ENAME = *BLANKS
EVAL EDEPT = *BLANKS
EVAL EPHON = *BLANKS
EVAL EADM = 'N'
EVAL ECRT = 'N'
EVAL EPWD = *BLANKS
EVAL EMSG = *BLANKS
EVAL *IN40 = *OFF
EVAL HDRID = 'OFCADDUSR'
IF EDMODE = 'C'
EVAL HDRID = 'OFCCHGUSR'
EVAL *IN40 = *ON
KUID | CHAIN(N) | USERREC
EVAL EUSER = USUSER
EVAL ENAME = USNAME
EVAL EDEPT = USDEPT
EVAL EPHON = USPHON
EVAL EADM = USADM
ENDIF
DOW 1 = 1
EXSR HDR
EVAL EHDR = HDRLN
EVAL EFK = 'Enter=Save   F12=Cancel'
 | EXFMT | UEDIT
EVAL EMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF EADM <> 'Y'
EVAL EADM = 'N'
ENDIF
IF EDMODE = 'C'
KUID | CHAIN | USERREC
IF %FOUND(OVUSERP)
EVAL USNAME = %TRIML(ENAME)
EVAL USDEPT = %TRIML(EDEPT)
EVAL USPHON = %TRIML(EPHON)
EVAL USADM = EADM
 | UPDATE | USERREC
EVAL MSG = 'User ' + %TRIM(KUID) + ' changed.'
""" + log('CHGUSER', 'KUID') + """
ENDIF
LEAVE
ENDIF
EVAL NEWID = %TRIML(EUSER)
IF NEWID = *BLANKS OR ENAME = *BLANKS
EVAL EMSG = 'The user ID and the full name are both needed.'
ITER
ENDIF
IF ECRT = 'Y' AND EPWD = *BLANKS
EVAL EMSG = 'Type a password for the new sign-on.'
ITER
ENDIF
NEWID | CHAIN(N) | USERREC
IF %FOUND(OVUSERP)
EVAL EMSG = 'That user is already enrolled.'
ITER
ENDIF
EVAL USUSER = NEWID
EVAL USNAME = %TRIML(ENAME)
EVAL USDEPT = %TRIML(EDEPT)
EVAL USPHON = %TRIML(EPHON)
EVAL USADM = EADM
EVAL USSTAT = 'A'
 | TIME | | USCRT
 | TIME | | USLAST
 | WRITE | USERREC
EVAL MSG = 'User ' + %TRIM(NEWID) + ' enrolled.'
""" + log('ADDUSER', 'NEWID') + """
IF ECRT = 'Y'
EVAL QSRC = USNAME
EXSR QUOTE
EVAL CMD = 'CRTUSRPRF USRPRF(' + %TRIM(NEWID) + ') PASSWORD(' + %TRIM(EPWD) + ') TEXT(''' + QTXT + ''') INLMNU(OFFICE/OFFICE)'
EXSR RUNCMD
IF *IN50 = *ON
EVAL MSG = 'Enrolled, but the sign-on was not created.  Check authority and password rules.'
ELSE
EVAL MSG = 'User ' + %TRIM(NEWID) + ' enrolled and sign-on created.'
""" + log('CRTUSRPRF', 'NEWID') + """
ENDIF
EVAL *IN50 = *OFF
EVAL CMD = *BLANKS
ENDIF
LEAVE
ENDDO
EVAL *IN40 = *OFF
""" + INDOFF + """
 | ENDSR
""")
# ---------------- OVGRPM ----------------
s = Scr('OVGRPM'); lay_groups(s); s.edit('GADD', 'A')
s.inp('Group name', 'AGRP', 10, 4, lc=False); s.inp('User to add', 'AUSR', 10, 6, lc=False); s.t(6, 37, 'F4 shows a list', 'COLOR(BLU)'); s.save()
prog('OVGRPM', [('OVGRPP', 'U'), ('OVUSERP', 'I')], 'OVGRPM', listds('G') + [S('PREVG', 10), S('WNAME', 30), S('KGN', 10, kw='DIM(10)'), S('KGU', 10, kw='DIM(10)'), S('KGRP', 10), S('KMBR', 10)] +
 DC('COLH', 'Opt  Group          Member     Name') + DC('FK1', '4=Remove member') + DC('FK2', 'F1=Help  F3=Exit  F6=Add a member  F7/F8=Page'), """
KEYG | KLIST
 | KFLD | | KGRP
 | KFLD | | KMBR
EVAL LAPP = 'GROUPS'
""" + listmain('G', 'GLIST', 'OFCGROUPS', keys="""
IF *IN06 = *ON
EXSR ADDG
ITER
ENDIF
""", acts="""
1 | DO | NSHOW | ROW
IF %TRIM(GOP(ROW)) = '4'
EVAL KGRP = KGN(ROW)
EVAL KMBR = KGU(ROW)
KEYG | CHAIN | GRPREC
IF %FOUND(OVGRPP)
 | DELETE | GRPREC
ENDIF
ENDIF
 | ENDDO
""") + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL GLNA = *BLANKS
EVAL PREVG = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 10
*LOVAL | SETLL | GRPREC
 | READ(N) | GRPREC
DOW NOT %EOF(OVGRPP)
EVAL NMATCH = NMATCH + 1
""" + PAGED + """
EVAL WNAME = *BLANKS
GRUSER | CHAIN | USERREC
IF %FOUND(OVUSERP)
EVAL WNAME = USNAME
ENDIF
IF GRNAME <> PREVG OR ROW = 1
EVAL GLN(ROW) = GRNAME + ' +-- ' + GRUSER + ' ' + WNAME
ELSE
EVAL GLN(ROW) = '           +-- ' + GRUSER + ' ' + WNAME
ENDIF
EVAL KGN(ROW) = GRNAME
EVAL KGU(ROW) = GRUSER
ENDIF
EVAL PREVG = GRNAME
 | READ(N) | GRPREC
ENDDO
""" + SHOWN + """
EVAL TTLW = %CHAR(NMATCH) + ' group member(s)'
 | ENDSR
ADDG | BEGSR
EVAL AGRP = *BLANKS
EVAL AUSR = *BLANKS
EVAL AMSG = 'Mail or a message sent to the group name goes to every member.'
DOW 1 = 1
""" + hdr('A', 'OFCADDGRP', 'Enter=Add   F4=List users   F12=Cancel') + """
 | EXFMT | GADD
EVAL AMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN04 = *ON
EXSR LOOKUP
IF SELUSR <> *BLANKS
EVAL AUSR = SELUSR
ENDIF
ITER
ENDIF
EVAL KGRP = %TRIML(AGRP)
EVAL KMBR = %TRIML(AUSR)
IF KGRP = *BLANKS OR KMBR = *BLANKS OR KGRP = 'ALL'
EVAL AMSG = 'Type a group name (not ALL) and a user.'
ITER
ENDIF
KMBR | CHAIN | USERREC
IF NOT %FOUND(OVUSERP)
EVAL AMSG = 'That user is not enrolled.  Press F4 for a list.'
ITER
ENDIF
KEYG | CHAIN(N) | GRPREC
IF NOT %FOUND(OVGRPP)
EVAL GRNAME = KGRP
EVAL GRUSER = KMBR
 | WRITE | GRPREC
""" + log('ADDGROUP', "%TRIMR(KGRP) + ' ' + KMBR") + """
ENDIF
EVAL AMSG = %TRIM(KMBR) + ' added to ' + %TRIM(KGRP) + '.  Add another, or F12.'
EVAL AUSR = *BLANKS
ENDDO
""" + INDOFF + """
 | ENDSR
""")
# ---------------- OVLOGV ----------------
s = Scr('OVLOGV'); lay_log(s); s.save()
VLINE = """
 | MOVE | LGSTMP | WSTMP
EXSR FMTDT
EVAL LINE = WDT + ' ' + LGUSER + ' ' + %SUBST(LGAPP:1:9) + ' ' + %SUBST(LGACT:1:9) + ' ' + LGTEXT
EVAL ULINE = LINE
LCASE:UCASE | XLATE | ULINE | ULINE
"""
prog('OVLOGV', [('OVLOGP', 'I')], 'OVLOGV', listds('V', 76) + [S('LINE', 100), S('ULINE', 100)] +
 DC('COLH', 'When             User       Area      Action    Details') + DC('FK1', 'Type part of a user, area or action in Find and press Enter') +
 DC('FK2', 'F1=Help  F3=Exit  F7/F8=Page  F9=Print what is listed'), listmain('V', 'VLIST', 'OFCLOG', find=True, lcol=3, keys="""
IF *IN09 = *ON
EXSR PRINTV
ITER
ENDIF
""") + """
EVAL *INLR = *ON
LOAD | BEGSR
EVAL VLNA = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 10
*HIVAL | SETGT | LOGREC
 | READP | LOGREC
DOW NOT %EOF(OVLOGP)
""" + VLINE + """
IF UNEED = *BLANKS OR %SCAN(%TRIMR(UNEED):ULINE) > 0
EVAL NMATCH = NMATCH + 1
""" + PAGED + """
EVAL VLN(ROW) = LINE
ENDIF
ENDIF
 | READP | LOGREC
ENDDO
""" + SHOWN + """
EVAL TTLW = %CHAR(NMATCH) + ' entries, newest first'
 | ENDSR
PRINTV | BEGSR
""" + popen("'OfficeVibes activity log'") + """
*HIVAL | SETGT | LOGREC
 | READP | LOGREC
DOW NOT %EOF(OVLOGP)
""" + VLINE + """
IF UNEED = *BLANKS OR %SCAN(%TRIMR(UNEED):ULINE) > 0
""" + pl('LINE') + """
ENDIF
 | READP | LOGREC
ENDDO
""" + PCLOSE + """
 | ENDSR
""")
# ---------------- OVSTAT ----------------
LBL = ['Enrolled users', 'Messages', 'Mail memos', 'Notes', 'Tasks', 'Phone book entries', 'Appointments', 'Documents', 'Log entries']
s = Scr('OVSTAT'); s.edit('SSTAT', 'S'); s.t(3, 3, 'What is stored in the office', 'DSPATR(HI)')
for i, tx in enumerate(LBL): s.t(5 + i, 3, tx); s.f('SC%d' % (i + 1), 7, 'O', 5 + i, 24); s.f('SB%d' % (i + 1), 40, 'O', 5 + i, 33, 'COLOR(GRN)')
s.t(15, 3, 'Most active users, by log entries', 'DSPATR(HI)')
for i in range(1, 6): s.f('SU%d' % i, 28, 'O', 15 + i, 3); s.f('SV%d' % i, 40, 'O', 15 + i, 33, 'COLOR(YLW)')
s.save()
STF = [('OVUSERP', 'USERREC'), ('OVMSGP', 'MSGREC'), ('OVMAILP', 'MAILREC'), ('OVNOTEP', 'NOTEREC'), ('OVTASKP', 'TASKREC'),
       ('OVPHONP', 'PHONREC'), ('OVCALP', 'CALREC'), ('OVDOCP', 'DOCREC')]
cntall = ''.join("*LOVAL | SETLL | %s\n | READ | %s\nDOW NOT %%EOF(%s)\nEVAL CT(%d) = CT(%d) + 1\n | READ | %s\nENDDO\n" % (r, r, f, i + 1, i + 1, r) for i, (f, r) in enumerate(STF))
prog('OVSTAT', [(f, 'I') for f, r in STF] + [('OVLOGP', 'I')], 'OVSTAT',
 arrds('SCA', 'SC', 7, ['SC%d' % i for i in range(1, 10)]) + arrds('SBA', 'SB', 40, ['SB%d' % i for i in range(1, 10)]) +
 arrds('SUA', 'SU', 28, ['SU%d' % i for i in range(1, 6)]) + arrds('SVA', 'SV', 40, ['SV%d' % i for i in range(1, 6)]) +
 [S('CT', 7, 0, 'DIM(9)'), S('UN', 10, kw='DIM(50)'), S('UC', 7, 0, 'DIM(50)'), S('NU', 5, 0), S('K', 5, 0), S('MX', 7, 0), S('BL', 5, 0), S('TOPC', 7, 0),
  D('HASHES', 'C', kw="'" + '#' * 30 + "-"), D('', '', kw='#' * 10 + "'")], """
EVAL CT = 0
EVAL UC = 0
EVAL UN = *BLANKS
EVAL NU = 0
""" + cntall + """
*LOVAL | SETLL | LOGREC
 | READ | LOGREC
DOW NOT %EOF(OVLOGP)
EVAL CT(9) = CT(9) + 1
EVAL K = 0
1 | DO | NU | J
IF UN(J) = LGUSER
EVAL K = J
ENDIF
 | ENDDO
IF K = 0 AND NU < 50
EVAL NU = NU + 1
EVAL UN(NU) = LGUSER
EVAL K = NU
ENDIF
IF K > 0
EVAL UC(K) = UC(K) + 1
ENDIF
 | READ | LOGREC
ENDDO
EVAL MX = 1
1 | DO | 9 | I
IF CT(I) > MX
EVAL MX = CT(I)
ENDIF
 | ENDDO
EVAL SBA = *BLANKS
1 | DO | 9 | I
EVAL SC(I) = %CHAR(CT(I))
EVAL BL = %DIV(CT(I) * 40:MX)
IF CT(I) > 0 AND BL = 0
EVAL BL = 1
ENDIF
IF BL > 0
EVAL SB(I) = %SUBST(HASHES:1:BL)
ENDIF
 | ENDDO
EVAL SUA = *BLANKS
EVAL SVA = *BLANKS
EVAL TOPC = 0
1 | DO | 5 | I
EVAL K = 0
EVAL MX = 0
1 | DO | NU | J
IF UC(J) > MX
EVAL MX = UC(J)
EVAL K = J
ENDIF
 | ENDDO
IF K > 0
IF TOPC = 0
EVAL TOPC = MX
ENDIF
EVAL SU(I) = UN(K) + ' ' + %CHAR(MX)
EVAL BL = %DIV(MX * 40:TOPC)
IF BL = 0
EVAL BL = 1
ENDIF
EVAL SV(I) = %SUBST(HASHES:1:BL)
EVAL UC(K) = 0
ENDIF
 | ENDDO
""" + hdr('S', 'OFCSTATS', 'Press Enter to go back') + """
EVAL SMSG = *BLANKS
 | EXFMT | SSTAT
EVAL *INLR = *ON
""")
# ---------------- OVCAT ----------------
s = Scr('OVCAT'); s.rec('CATSCR'); s.f('CHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.t(3, 28, 'T H E   O F F I C E   C A T', 'DSPATR(HI)')
for i in range(1, 6): s.f('CA%d' % i, 30, 'O', 4 + i, 26, 'COLOR(YLW)')
s.f('CSAY', 50, 'O', 11, 15, 'DSPATR(HI)')
s.t(13, 15, 'Name'); s.f('CNAME', 12, 'B', 13, 27, 'CHECK(LC)', 'DSPATR(UL)')
s.t(14, 15, 'Tummy'); s.f('CFOOD', 20, 'O', 14, 27, 'COLOR(GRN)'); s.t(15, 15, 'Happiness'); s.f('CJOY', 20, 'O', 15, 27, 'COLOR(PNK)')
s.f('CMSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f('CFK', 78, 'O', 23, 2, 'COLOR(BLU)'); s.save()
prog('OVCAT', [('OVCATP', 'U')], 'OVCAT', [S('HRS', 7, 0), S('FOOD', 7, 0), S('JOY', 7, 0), S('BL', 5, 0), S('SAY', 50),
  D('HASHES', 'C', kw="'" + '#' * 20 + "'")], """
PGMUSR | CHAIN | CATREC
IF NOT %FOUND(OVCATP)
EVAL CTUSER = PGMUSR
EVAL CTNAME = 'Whiskers'
EVAL CTFOOD = 70
EVAL CTJOY = 70
 | TIME | | CTSTMP
 | WRITE | CATREC
ELSE
 | UNLOCK | OVCATP
ENDIF
EVAL FOOD = CTFOOD
EVAL JOY = CTJOY
 | TIME | | TS
TS | SUBDUR | CTSTMP | HRS:*H
IF HRS > 0
EVAL FOOD = FOOD - HRS * 3
EVAL JOY = JOY - HRS * 2
ENDIF
EVAL CNAME = CTNAME
EVAL SAY = 'Your cat looks up as you arrive.'
DOW *IN03 = *OFF AND *IN12 = *OFF
IF FOOD < 0
EVAL FOOD = 0
ENDIF
IF JOY < 0
EVAL JOY = 0
ENDIF
IF FOOD > 100
EVAL FOOD = 100
ENDIF
IF JOY > 100
EVAL JOY = 100
ENDIF
EVAL CA1 = '    /|_/|'
EVAL CA3 = '    > w <'
EVAL CA4 = '   /|   |__'
EVAL CA5 = '  (_|___|__)~'
SELECT
WHEN FOOD < 30
EVAL CA2 = '   ( o.O )   MEOW!'
WHEN JOY < 30
EVAL CA2 = '   ( -.- )   zzz'
OTHER
EVAL CA2 = '   ( n.n )   purr'
ENDSL
EVAL CFOOD = *BLANKS
EVAL BL = %DIV(FOOD:5)
IF BL > 0
EVAL CFOOD = %SUBST(HASHES:1:BL)
ENDIF
EVAL CJOY = *BLANKS
EVAL BL = %DIV(JOY:5)
IF BL > 0
EVAL CJOY = %SUBST(HASHES:1:BL)
ENDIF
EVAL HDRID = 'OFCCAT'
EXSR HDR
EVAL CHDR = HDRLN
EVAL CSAY = SAY
EVAL CMSG = *BLANKS
EVAL CFK = 'F1=Help   F5=Pet   F6=Feed   F7=Play   Enter=Save name   F3=Exit'
 | EXFMT | CATSCR
SELECT
WHEN *IN03 = *ON OR *IN12 = *ON
LEAVE
WHEN *IN05 = *ON
EVAL JOY = JOY + 10
EVAL SAY = %TRIM(CNAME) + ' purrs and leans into your hand.'
WHEN *IN06 = *ON
IF FOOD >= 95
EVAL SAY = %TRIM(CNAME) + ' sniffs the bowl and walks away.  Full.'
ELSE
EVAL FOOD = FOOD + 25
EVAL SAY = %TRIM(CNAME) + ' eats happily.'
ENDIF
WHEN *IN07 = *ON
EVAL JOY = JOY + 15
EVAL FOOD = FOOD - 5
EVAL SAY = %TRIM(CNAME) + ' chases the cursor across the screen.'
OTHER
EVAL SAY = 'The name tag now says ' + %TRIM(CNAME) + '.'
ENDSL
EXSR SAVEC
ENDDO
EVAL *INLR = *ON
SAVEC | BEGSR
IF FOOD < 0
EVAL FOOD = 0
ENDIF
IF FOOD > 100
EVAL FOOD = 100
ENDIF
IF JOY > 100
EVAL JOY = 100
ENDIF
PGMUSR | CHAIN | CATREC
IF %FOUND(OVCATP)
EVAL CTNAME = %TRIML(CNAME)
EVAL CTFOOD = FOOD
EVAL CTJOY = JOY
 | TIME | | CTSTMP
 | UPDATE | CATREC
ENDIF
 | ENDSR
""")
# ---------------- OVGAME ----------------
s = Scr('OVGAME'); s.edit('GMENU', 'G'); s.t(3, 34, 'G A M E S', 'DSPATR(HI)')
s.t(6, 6, ' 1. Guess the number'); s.t(7, 6, ' 2. Tic-tac-toe'); s.t(8, 6, ' 3. Tetris')
s.t(10, 3, 'Your record', 'COLOR(BLU)'); s.f('GSC1', 60, 'O', 11, 6, 'COLOR(TRQ)'); s.f('GSC2', 60, 'O', 12, 6, 'COLOR(TRQ)')
s.f('GSC3', 60, 'O', 13, 6, 'COLOR(TRQ)')
s.t(20, 3, '===>'); s.f('GSEL', 3, 'B', 20, 8, 'DSPATR(UL)')
s.edit('GGUESS', 'U'); s.t(4, 3, 'I am thinking of a number from 1 to 100.', 'COLOR(BLU)'); s.f('UINF', 60, 'O', 6, 3, 'DSPATR(HI)')
s.inp('Your guess', 'UGUESS', 3, 8, lc=False)
s.edit('GTTT', 'T'); s.t(3, 3, 'You are X.  Put the cursor on a square and press Enter,', 'COLOR(BLU)'); s.t(4, 3, 'or type its number below.', 'COLOR(BLU)')
for r in range(3):
    for c in range(3): s.f('TC%d' % (r * 3 + c + 1), 1, 'O', 8 + 2 * r, 32 + 4 * c, 'DSPATR(HI)')
    s.t(8 + 2 * r, 34, '|', 'COLOR(BLU)'); s.t(8 + 2 * r, 38, '|', 'COLOR(BLU)')
    s.t(8 + 2 * r, 52, '%d | %d | %d' % (r * 3 + 1, r * 3 + 2, r * 3 + 3), 'COLOR(BLU)')
    if r < 2: s.t(9 + 2 * r, 31, '---+---+---', 'COLOR(BLU)')
s.inp('Square (1-9)', 'TMOVE', 1, 15, lc=False); s.f('TINF', 60, 'O', 17, 3, 'DSPATR(HI)')
s.rec('BLANK'); s.t(1, 2, ' ')
s.rec('TETRIS', 'OVERLAY'); s.reck('INVITE', ' 45'); s.reck('PUTOVR', ' 46')
s.f('XHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.ctr(2, 'T E T R I S', 'DSPATR(HI)')
for i in range(1, 21):
    s.t(2 + i, 27, '<!', 'COLOR(BLU)'); s.f('XB%02d' % i, 20, 'O', 2 + i, 30, 'OVRDTA', 'COLOR(YLW)'); s.t(2 + i, 51, '!>', 'COLOR(BLU)')
s.t(23, 27, '<!' + '=' * 22 + '!>', 'COLOR(BLU)')
for i, tx in enumerate(['F4      Left', 'F5      Right', 'Enter   Turn', 'F6      Turn', 'F7      Down one', 'F8      Drop', '', 'F9      New game', 'F3      Quit']):
    if tx: s.t(5 + i, 3, tx, 'COLOR(BLU)')
s.t(4, 56, 'Score'); s.f('XSCO', 8, 'O', 4, 64, 'OVRDTA', 'DSPATR(HI)')
s.t(5, 56, 'Lines'); s.f('XLIN', 8, 'O', 5, 64, 'OVRDTA', 'DSPATR(HI)')
s.t(6, 56, 'Best'); s.f('XBST', 8, 'O', 6, 64, 'OVRDTA')
s.t(8, 56, 'Next', 'COLOR(BLU)')
for i in range(1, 5): s.f('XN%d' % i, 8, 'O', 8 + i, 58, 'OVRDTA', 'COLOR(TRQ)')
s.f('XSTA', 22, 'O', 15, 56, 'OVRDTA', 'DSPATR(HI)'); s.f('XST2', 22, 'O', 16, 56, 'OVRDTA', 'DSPATR(HI)')
s.save()
prog('OVGAME', [('OVSCORP', 'U')], 'OVGAME', arrds('TCA', 'TC', 1, ['TC%d' % i for i in range(1, 10)]) +
 arrds('XBA', 'XB', 20, ['XB%02d' % i for i in range(1, 21)]) + arrds('XNA', 'XN', 8, ['XN%d' % i for i in range(1, 5)]) +
 [S('BRD', 1, kw='DIM(200)'), S('CR', 5, 0, 'DIM(4)'), S('CCL', 5, 0, 'DIM(4)'), S('TR', 5, 0, 'DIM(4)'), S('TT', 5, 0, 'DIM(4)'),
  S('PCUR', 5, 0), S('PNXT', 5, 0), S('ROWP', 5, 0), S('COLP', 5, 0), S('NR', 5, 0), S('NC', 5, 0), S('MDR', 5, 0), S('MDC', 5, 0),
  S('FITOK', 1), S('MOVED', 1), S('GOVER', 1), S('TPTS', 7, 0), S('LINES', 5, 0), S('NCL', 5, 0), S('LASTG', 'Z'), S('NOWT', 'Z'),
  S('SECS', 9, 0), S('ROWX', 5, 0), S('COLX', 5, 0), S('RR2', 5, 0), S('XLINE', 20), S('XCELL', 2), S('ROWFUL', 1), S('FULLW', 1),
  S('TANIM', 1), S('KQ', 5, 0), S('POSN', 5, 0), S('KBEST', 7, 0),
] + DC('CORN1', '1397') + DC('CORN2', '9731') + DC('SQORD', '13792468') + DC('PCS', '10111213111221221011122111122021101121221011122210111220') + [
  S('NTHR', 5, 0), S('TSQ', 5, 0), S('BSQ', 5, 0), S('MKC', 5, 0), S('BLC', 5, 0), S('FKN', 5, 0), S('FKSQ', 5, 0), S('S1', 5, 0), S('S2', 5, 0), S('W', 5, 0)] +
 [S('SEL', 3), S('SELN', 5, 0), S('KGAME', 10), S('SEED', 9, 0), S('W6', 6), S('SECRET', 5, 0), S('TRIES', 5, 0), S('RES', 1), S('MK', 1),
  S('WON', 1), S('BEST', 5, 0), S('K', 5, 0), S('L', 5, 0), S('C1', 5, 0), S('C2', 5, 0), S('C3', 5, 0), S('FULL', 1), S('OVER', 1),
  D('WINL', 'C', kw="'123456789147258369159357'")], """
KEYS | KLIST
 | KFLD | | KUSER
 | KFLD | | KGAME
 | TIME | | TS
 | MOVE | TS | WSTMP
EVAL W6 = %SUBST(WSTMP:12:2) + %SUBST(WSTMP:15:2) + %SUBST(WSTMP:18:2)
 | MOVE | W6 | SEED
DOW *IN03 = *OFF
EVAL KGAME = 'GUESS'
EVAL GSC1 = 'Guess the number: not played yet'
KEYS | CHAIN(N) | SCORREC
IF %FOUND(OVSCORP)
EVAL GSC1 = 'Guess the number: ' + %CHAR(SCWIN) + ' solved, best ' + %CHAR(SCBEST) + ' tries'
ENDIF
EVAL KGAME = 'TICTACTOE'
EVAL GSC2 = 'Tic-tac-toe: not played yet'
KEYS | CHAIN(N) | SCORREC
IF %FOUND(OVSCORP)
EVAL GSC2 = 'Tic-tac-toe: ' + %CHAR(SCWIN) + ' won, ' + %CHAR(SCLOSS) + ' lost, ' + %CHAR(SCDRAW) + ' drawn'
ENDIF
EVAL KGAME = 'TETRIS'
EVAL GSC3 = 'Tetris: not played yet'
KEYS | CHAIN(N) | SCORREC
IF %FOUND(OVSCORP)
EVAL GSC3 = 'Tetris: best ' + %CHAR(SCBEST) + ' points in ' + %CHAR(SCWIN) + ' games'
ENDIF
""" + hdr('G', 'OFCGAMES', 'F3=Exit   Type a number, or put the cursor on a game, and press Enter') + """
EVAL GSEL = *BLANKS
EVAL GMSG = MSG
EVAL MSG = *BLANKS
 | EXFMT | GMENU
EXSR CSR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
""" + MENUSEL.replace('@F@', 'GSEL').replace('@LAST@', '8') + """
SELECT
WHEN SELN = 1
EXSR GUESS
WHEN SELN = 2
EXSR TTT
WHEN SELN = 3
EXSR TETRS
WHEN SELN <> 0
EVAL MSG = 'That is not one of the choices.'
ENDSL
ENDDO
EVAL *INLR = *ON
RAND | BEGSR
EVAL SEED = %REM(SEED * 31 + 17:99991)
 | ENDSR
* ---- record a result: RES is W, L or D ----
SCORE | BEGSR
KEYS | CHAIN | SCORREC
IF NOT %FOUND(OVSCORP)
EVAL SCUSER = PGMUSR
EVAL SCGAME = KGAME
EVAL SCWIN = 0
EVAL SCLOSS = 0
EVAL SCDRAW = 0
EVAL SCBEST = 0
ENDIF
SELECT
WHEN RES = 'W'
EVAL SCWIN = SCWIN + 1
IF KGAME = 'GUESS' AND (SCBEST = 0 OR TRIES < SCBEST)
EVAL SCBEST = TRIES
ENDIF
WHEN RES = 'L'
EVAL SCLOSS = SCLOSS + 1
OTHER
EVAL SCDRAW = SCDRAW + 1
ENDSL
IF %FOUND(OVSCORP)
 | UPDATE | SCORREC
ELSE
 | WRITE | SCORREC
ENDIF
 | ENDSR
* ---- guess the number ----
GUESS | BEGSR
EXSR RAND
EVAL SECRET = %REM(SEED:100) + 1
EVAL TRIES = 0
EVAL UINF = 'Type a number and press Enter.'
DOW 1 = 1
""" + hdr('U', 'OFCGUESS', 'Enter=Guess   F12=Give up') + """
EVAL UGUESS = *BLANKS
EVAL UMSG = *BLANKS
 | EXFMT | GGUESS
IF *IN03 = *ON OR *IN12 = *ON
EVAL MSG = 'The number was ' + %CHAR(SECRET) + '.'
LEAVE
ENDIF
EVAL NERR = '0'
EVAL NSTR = %TRIML(UGUESS)
EXSR TONUM
IF NERR = '1' OR NVAL < 1 OR NVAL > 100
EVAL UINF = 'Please type a number from 1 to 100.'
ITER
ENDIF
EVAL TRIES = TRIES + 1
IF NVAL < SECRET
EVAL UINF = %CHAR(NVAL) + ' is too low.  Tries so far: ' + %CHAR(TRIES)
ITER
ENDIF
IF NVAL > SECRET
EVAL UINF = %CHAR(NVAL) + ' is too high.  Tries so far: ' + %CHAR(TRIES)
ITER
ENDIF
EVAL KGAME = 'GUESS'
EVAL RES = 'W'
EXSR SCORE
EVAL MSG = 'Yes, it was ' + %CHAR(SECRET) + '.  You took ' + %CHAR(TRIES) + ' tries.'
LEAVE
ENDDO
""" + INDOFF + """
 | ENDSR
* ---- the computer's move: win, block, fork, block a fork, centre,
* ---- opposite corner, corner, side.  It cannot be beaten.
OMOVE | BEGSR
EVAL MK = 'O'
EXSR TRYMV
IF BEST = 0
EVAL MK = 'X'
EXSR TRYMV
ENDIF
IF BEST = 0
EVAL MK = 'O'
EXSR FORKS
EVAL BEST = FKSQ
ENDIF
IF BEST = 0
EVAL MK = 'X'
EXSR FORKS
IF FKN = 1
EVAL BEST = FKSQ
ENDIF
IF FKN >= 2
1 | DO | 9 | S2
IF BEST = 0 AND TC(S2) = ' '
EVAL TC(S2) = 'O'
EVAL MK = 'O'
EXSR CNTTHR
IF NTHR = 1
EVAL W = TSQ
EVAL TC(W) = 'X'
EVAL MK = 'X'
EXSR CNTTHR
EVAL TC(W) = ' '
IF NTHR < 2
EVAL BEST = S2
ENDIF
ENDIF
EVAL TC(S2) = ' '
ENDIF
 | ENDDO
ENDIF
ENDIF
IF BEST = 0 AND TC(5) = ' '
EVAL BEST = 5
ENDIF
IF BEST = 0
1 | DO | 4 | S2
EVAL C1 = %SCAN(%SUBST(CORN1:S2:1):'123456789')
EVAL C2 = %SCAN(%SUBST(CORN2:S2:1):'123456789')
IF BEST = 0 AND TC(C1) = 'X' AND TC(C2) = ' '
EVAL BEST = C2
ENDIF
 | ENDDO
ENDIF
IF BEST = 0
1 | DO | 8 | S2
EVAL C1 = %SCAN(%SUBST(SQORD:S2:1):'123456789')
IF BEST = 0 AND TC(C1) = ' '
EVAL BEST = C1
ENDIF
 | ENDDO
ENDIF
 | ENDSR
* ---- lines where MK has two and one is empty: NTHR, TSQ
CNTTHR | BEGSR
EVAL NTHR = 0
1 | DO | 8 | L
EVAL C1 = %SCAN(%SUBST(WINL:L*3-2:1):'123456789')
EVAL C2 = %SCAN(%SUBST(WINL:L*3-1:1):'123456789')
EVAL C3 = %SCAN(%SUBST(WINL:L*3:1):'123456789')
EVAL MKC = 0
EVAL BLC = 0
IF TC(C1) = MK
EVAL MKC = MKC + 1
ENDIF
IF TC(C1) = ' '
EVAL BLC = BLC + 1
EVAL BSQ = C1
ENDIF
IF TC(C2) = MK
EVAL MKC = MKC + 1
ENDIF
IF TC(C2) = ' '
EVAL BLC = BLC + 1
EVAL BSQ = C2
ENDIF
IF TC(C3) = MK
EVAL MKC = MKC + 1
ENDIF
IF TC(C3) = ' '
EVAL BLC = BLC + 1
EVAL BSQ = C3
ENDIF
IF MKC = 2 AND BLC = 1
EVAL NTHR = NTHR + 1
EVAL TSQ = BSQ
ENDIF
 | ENDDO
 | ENDSR
* ---- squares where MK makes two threats at once: FKN, FKSQ
FORKS | BEGSR
EVAL FKN = 0
EVAL FKSQ = 0
1 | DO | 9 | S1
IF TC(S1) = ' '
EVAL TC(S1) = MK
EXSR CNTTHR
EVAL TC(S1) = ' '
IF NTHR >= 2
EVAL FKN = FKN + 1
IF FKSQ = 0
EVAL FKSQ = S1
ENDIF
ENDIF
ENDIF
 | ENDDO
 | ENDSR
* ---- Tetris ----
TETRS | BEGSR
EVAL KGAME = 'TETRIS'
EXSR NEWG
EVAL FULLW = '1'
EVAL TANIM = '1'
DOW 1 = 1
 | TIME | | NOWT
IF GOVER = '0'
NOWT | SUBDUR | LASTG | SECS:*S
IF SECS >= 1
EVAL LASTG = NOWT
EXSR GRAV
ENDIF
ENDIF
EXSR DRAWT
IF TANIM = '1'
EVAL *IN45 = *ON
IF FULLW = '1'
EVAL *IN46 = *OFF
 | WRITE | BLANK
ELSE
EVAL *IN46 = *ON
ENDIF
 | WRITE | TETRIS
EVAL FULLW = '0'
 | READ | OVGAME | | 5152
IF *IN51 = *ON
EVAL *IN51 = *OFF
IF DSPSTS <> 1331
EVAL TANIM = '0'
EVAL FULLW = '1'
ENDIF
ITER
ENDIF
ELSE
EVAL *IN45 = *OFF
EVAL *IN46 = *OFF
 | EXFMT | TETRIS
ENDIF
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN09 = *ON
EXSR NEWG
ITER
ENDIF
IF GOVER = '1'
ITER
ENDIF
SELECT
WHEN *IN04 = *ON
EVAL MDR = 0
EVAL MDC = -1
EXSR TRYMOV
WHEN *IN05 = *ON
EVAL MDR = 0
EVAL MDC = 1
EXSR TRYMOV
WHEN *IN07 = *ON
EXSR GRAV
EVAL LASTG = NOWT
WHEN *IN08 = *ON
EVAL MDR = 1
EVAL MDC = 0
EVAL MOVED = '1'
DOW MOVED = '1'
EXSR TRYMOV
ENDDO
EXSR LOCK
EVAL LASTG = NOWT
OTHER
EXSR ROTATE
ENDSL
ENDDO
EVAL *IN45 = *OFF
EVAL *IN46 = *OFF
""" + INDOFF + """
 | ENDSR
NEWG | BEGSR
EVAL BRD = *BLANK
EVAL TPTS = 0
EVAL LINES = 0
EVAL GOVER = '0'
EVAL XSTA = *BLANKS
EVAL XST2 = *BLANKS
EVAL KBEST = 0
KEYS | CHAIN(N) | SCORREC
IF %FOUND(OVSCORP)
EVAL KBEST = SCBEST
ENDIF
EVAL XBST = %CHAR(KBEST)
EXSR RAND
EVAL PNXT = %REM(SEED:7) + 1
EXSR SPAWN
 | TIME | | LASTG
EVAL HDRID = 'OFCTETRIS'
EXSR HDR
EVAL XHDR = HDRLN
EVAL FULLW = '1'
 | ENDSR
* ---- piece PCUR into CR and CCL (rows and columns 0 to 3)
LOADP | BEGSR
1 | DO | 4 | KQ
EVAL POSN = (PCUR - 1) * 8 + KQ * 2 - 1
EVAL CR(KQ) = %SCAN(%SUBST(PCS:POSN:1):'0123456789') - 1
EVAL CCL(KQ) = %SCAN(%SUBST(PCS:POSN+1:1):'0123456789') - 1
 | ENDDO
 | ENDSR
SPAWN | BEGSR
EVAL PCUR = PNXT
EXSR RAND
EVAL PNXT = %REM(SEED:7) + 1
EXSR LOADP
EVAL ROWP = 0
EVAL COLP = 4
1 | DO | 4 | KQ
EVAL TR(KQ) = CR(KQ)
EVAL TT(KQ) = CCL(KQ)
 | ENDDO
EVAL NR = ROWP
EVAL NC = COLP
EXSR FITS
IF FITOK = '0'
EVAL GOVER = '1'
EVAL XSTA = '   G A M E   O V E R'
EVAL XST2 = '   F9 plays again'
EXSR TSCORE
ENDIF
 | ENDSR
* ---- do TR and TT fit at row NR, column NC: FITOK ----
FITS | BEGSR
EVAL FITOK = '1'
1 | DO | 4 | KQ
EVAL ROWX = NR + TR(KQ)
EVAL COLX = NC + TT(KQ)
IF COLX < 1 OR COLX > 10 OR ROWX > 20
EVAL FITOK = '0'
ELSE
IF ROWX >= 1
IF BRD((ROWX - 1) * 10 + COLX) <> ' '
EVAL FITOK = '0'
ENDIF
ENDIF
ENDIF
 | ENDDO
 | ENDSR
* ---- move by MDR rows and MDC columns if it fits: MOVED ----
TRYMOV | BEGSR
1 | DO | 4 | KQ
EVAL TR(KQ) = CR(KQ)
EVAL TT(KQ) = CCL(KQ)
 | ENDDO
EVAL NR = ROWP + MDR
EVAL NC = COLP + MDC
EXSR FITS
EVAL MOVED = FITOK
IF FITOK = '1'
EVAL ROWP = NR
EVAL COLP = NC
ENDIF
 | ENDSR
ROTATE | BEGSR
1 | DO | 4 | KQ
EVAL TR(KQ) = CCL(KQ)
EVAL TT(KQ) = 3 - CR(KQ)
 | ENDDO
EVAL NR = ROWP
EVAL NC = COLP
EXSR FITS
IF FITOK = '0'
EVAL NC = COLP - 1
EXSR FITS
ENDIF
IF FITOK = '0'
EVAL NC = COLP + 1
EXSR FITS
ENDIF
IF FITOK = '1'
EVAL COLP = NC
1 | DO | 4 | KQ
EVAL CR(KQ) = TR(KQ)
EVAL CCL(KQ) = TT(KQ)
 | ENDDO
ENDIF
 | ENDSR
GRAV | BEGSR
EVAL MDR = 1
EVAL MDC = 0
EXSR TRYMOV
IF MOVED = '0'
EXSR LOCK
ENDIF
 | ENDSR
* ---- fix the piece, clear full rows, bring the next piece
LOCK | BEGSR
1 | DO | 4 | KQ
EVAL ROWX = ROWP + CR(KQ)
EVAL COLX = COLP + CCL(KQ)
IF ROWX >= 1
EVAL BRD((ROWX - 1) * 10 + COLX) = 'X'
ENDIF
 | ENDDO
EVAL NCL = 0
EVAL ROWX = 20
DOW ROWX >= 1
EVAL ROWFUL = '1'
1 | DO | 10 | COLX
IF BRD((ROWX - 1) * 10 + COLX) = ' '
EVAL ROWFUL = '0'
ENDIF
 | ENDDO
IF ROWFUL = '1'
EVAL NCL = NCL + 1
EVAL RR2 = ROWX
DOW RR2 >= 2
1 | DO | 10 | COLX
EVAL BRD((RR2 - 1) * 10 + COLX) = BRD((RR2 - 2) * 10 + COLX)
 | ENDDO
EVAL RR2 = RR2 - 1
ENDDO
1 | DO | 10 | COLX
EVAL BRD(COLX) = ' '
 | ENDDO
ELSE
EVAL ROWX = ROWX - 1
ENDIF
ENDDO
SELECT
WHEN NCL = 1
EVAL TPTS = TPTS + 100
WHEN NCL = 2
EVAL TPTS = TPTS + 300
WHEN NCL = 3
EVAL TPTS = TPTS + 500
WHEN NCL = 4
EVAL TPTS = TPTS + 800
ENDSL
IF TPTS > 99999
EVAL TPTS = 99999
ENDIF
EVAL LINES = LINES + NCL
EXSR SPAWN
 | ENDSR
DRAWT | BEGSR
1 | DO | 20 | ROWX
EVAL XLINE = *BLANKS
1 | DO | 10 | COLX
EVAL XCELL = ' .'
IF BRD((ROWX - 1) * 10 + COLX) <> ' '
EVAL XCELL = '[]'
ENDIF
IF GOVER = '0'
1 | DO | 4 | KQ
IF ROWP + CR(KQ) = ROWX AND COLP + CCL(KQ) = COLX
EVAL XCELL = '[]'
ENDIF
 | ENDDO
ENDIF
EVAL %SUBST(XLINE:COLX * 2 - 1:2) = XCELL
 | ENDDO
EVAL XB(ROWX) = XLINE
 | ENDDO
EVAL XNA = *BLANKS
1 | DO | 4 | KQ
EVAL POSN = (PNXT - 1) * 8 + KQ * 2 - 1
EVAL ROWX = %SCAN(%SUBST(PCS:POSN:1):'0123456789')
EVAL COLX = %SCAN(%SUBST(PCS:POSN+1:1):'0123456789') - 1
EVAL %SUBST(XN(ROWX):COLX * 2 + 1:2) = '[]'
 | ENDDO
EVAL XSCO = %CHAR(TPTS)
EVAL XLIN = %CHAR(LINES)
 | ENDSR
* ---- a finished game: SCWIN counts games, SCBEST is the top score
TSCORE | BEGSR
KEYS | CHAIN | SCORREC
IF NOT %FOUND(OVSCORP)
EVAL SCUSER = PGMUSR
EVAL SCGAME = KGAME
EVAL SCWIN = 0
EVAL SCLOSS = 0
EVAL SCDRAW = 0
EVAL SCBEST = 0
ENDIF
EVAL SCWIN = SCWIN + 1
IF TPTS > SCBEST
EVAL SCBEST = TPTS
EVAL XST2 = '   A new best score!'
ENDIF
IF %FOUND(OVSCORP)
 | UPDATE | SCORREC
ELSE
 | WRITE | SCORREC
ENDIF
 | ENDSR
* ---- does MK hold a full line: sets WON ----
CHKWIN | BEGSR
EVAL WON = '0'
1 | DO | 8 | L
EVAL C1 = %SCAN(%SUBST(WINL:L*3-2:1):'123456789')
EVAL C2 = %SCAN(%SUBST(WINL:L*3-1:1):'123456789')
EVAL C3 = %SCAN(%SUBST(WINL:L*3:1):'123456789')
IF TC(C1) = MK AND TC(C2) = MK AND TC(C3) = MK
EVAL WON = '1'
ENDIF
 | ENDDO
 | ENDSR
* ---- find a square that completes a line for MK: sets BEST ----
TRYMV | BEGSR
EVAL BEST = 0
1 | DO | 9 | K
IF TC(K) = ' ' AND BEST = 0
EVAL TC(K) = MK
EXSR CHKWIN
IF WON = '1'
EVAL BEST = K
ENDIF
EVAL TC(K) = ' '
ENDIF
 | ENDDO
 | ENDSR
ISFULL | BEGSR
EVAL FULL = '1'
1 | DO | 9 | K
IF TC(K) = ' '
EVAL FULL = '0'
ENDIF
 | ENDDO
 | ENDSR
* ---- tic-tac-toe ----
TTT | BEGSR
EVAL TCA = *BLANKS
EVAL OVER = '0'
EVAL TINF = 'Your move.'
EVAL KGAME = 'TICTACTOE'
DOW 1 = 1
""" + hdr('T', 'OFCTTT', 'Enter=Move   F5=New game   F12=Back') + """
EVAL TMOVE = *BLANK
EVAL TMSG = *BLANKS
 | EXFMT | GTTT
EXSR CSR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN05 = *ON OR OVER = '1'
EVAL TCA = *BLANKS
EVAL OVER = '0'
EVAL TINF = 'New game.  Your move.'
ITER
ENDIF
EVAL K = %SCAN(TMOVE:'123456789')
IF TMOVE = ' '
EVAL K = 0
IF (CSRROW = 8 OR CSRROW = 10 OR CSRROW = 12) AND CSRCOL >= 31 AND CSRCOL <= 41
EVAL K = %DIV(CSRROW - 8:2) * 3 + %DIV(CSRCOL - 31:4) + 1
ENDIF
ENDIF
IF K < 1 OR K > 9
EVAL TINF = 'Pick a square with the cursor, or type 1 to 9.'
ITER
ENDIF
IF TC(K) <> ' '
EVAL TINF = 'That square is taken.'
ITER
ENDIF
EVAL TC(K) = 'X'
EVAL MK = 'X'
EXSR CHKWIN
IF WON = '1'
EVAL RES = 'W'
EXSR SCORE
EVAL OVER = '1'
EVAL TINF = 'You win!  Press Enter for a new game.'
ITER
ENDIF
EXSR ISFULL
IF FULL = '1'
EVAL RES = 'D'
EXSR SCORE
EVAL OVER = '1'
EVAL TINF = 'A draw.  Press Enter for a new game.'
ITER
ENDIF
EXSR OMOVE
EVAL TC(BEST) = 'O'
EVAL MK = 'O'
EXSR CHKWIN
IF WON = '1'
EVAL RES = 'L'
EXSR SCORE
EVAL OVER = '1'
EVAL TINF = 'The computer wins.  Press Enter for a new game.'
ITER
ENDIF
EXSR ISFULL
IF FULL = '1'
EVAL RES = 'D'
EXSR SCORE
EVAL OVER = '1'
EVAL TINF = 'A draw.  Press Enter for a new game.'
ITER
ENDIF
EVAL TINF = 'The computer took square ' + %CHAR(BEST) + '.  Your move.'
ENDDO
""" + INDOFF + """
 | ENDSR
""", dspkw='MAXDEV(*FILE)')
# ---------------- CL ----------------
SRC['OVSYSN.CLLE'] = ["/* OVSYSN - return the system name for the banner */", "PGM        PARM(&N)", "  DCL        VAR(&N) TYPE(*CHAR) LEN(8)", "  RTVNETA    SYSNAME(&N)", "ENDPGM"]
SRC['OVTZC.CLLE'] = ["/* OVTZC - the system's offset from UTC, such as -0500 */", "PGM        PARM(&OFF)", "  DCL        VAR(&OFF) TYPE(*CHAR) LEN(5)",
  "  RTVSYSVAL  SYSVAL(QUTCOFFSET) RTNVAR(&OFF)", "  MONMSG     MSGID(CPF0000) EXEC(CHGVAR VAR(&OFF) VALUE('+0000'))", "ENDPGM"]
SRC['OFFMNUC.CLLE'] = ["/* OFFMNUC - program behind the GO OFFICE menu */", "PGM        PARM(&MNU &MNULIB &RTNCDE)",
 "  DCL        VAR(&MNU)    TYPE(*CHAR) LEN(10)", "  DCL        VAR(&MNULIB) TYPE(*CHAR) LEN(10)", "  DCL        VAR(&RTNCDE) TYPE(*CHAR) LEN(2)",
 "  ADDLIBLE   LIB(OFFICE)", "  MONMSG     MSGID(CPF0000)", "  CALL       PGM(OFFICE/OFFMENU)", "  MONMSG     MSGID(CPF0000)",
 "  CHGVAR     VAR(&RTNCDE) VALUE(X'FFFF')", "ENDPGM"]
PFS = ['OVUSERP', 'OVLOGP', 'OVGRPP', 'OVMSGP', 'OVMAILP', 'OVNOTEP', 'OVTASKP', 'OVPHONP', 'OVCALP', 'OVDOCP', 'OVDOCLP', 'OVCATP', 'OVSCORP', 'OVPREFP', 'OVCHATP', 'OVSHTP', 'OVSHCP', 'OVCAUTP', 'OVROOMP', 'OVHOLP', 'OVSETUP', 'OVCTOPP']
DSP = ['OFFMNU', 'OVUSRL', 'OVMSGS', 'OVMAIL', 'OVNOTE', 'OVTASK', 'OVPHON', 'OVCAL', 'OVDOC', 'OVADM', 'OVUSRM', 'OVGRPM', 'OVLOGV', 'OVSTAT', 'OVCAT', 'OVGAME', 'OVFIND', 'OVCHAT', 'OVSHEET', 'OVROOM', 'OVCAUT', 'OVHOLI', 'OVCSRC', 'OVMEET']
PG = ['OVLOG', 'OVPRT', 'OVGSET', 'OVREMD', 'OVUSRL', 'OFFMENU', 'OVMSGS', 'OVMAIL', 'OVNOTE', 'OVTASK', 'OVPHON', 'OVCAL', 'OVDOC', 'OVADM', 'OVUSRM', 'OVGRPM', 'OVLOGV', 'OVSTAT', 'OVCAT', 'OVGAME', 'OVFIND', 'OVCHAT', 'OVSHEET', 'OVROOM', 'OVCAUT', 'OVHOLI', 'OVCSRC', 'OVMEET']
B = ["/* BLDOFF - build OfficeVibes/400 (RPG IV).  Re-runnable.           */",
 "/* It carries on past a failed compile and lists every failure.      */", "PGM", "",
 "  DCL        VAR(&FAIL) TYPE(*CHAR) LEN(400)", "  DCL        VAR(&MSG) TYPE(*CHAR) LEN(500)", "  DCL        VAR(&INUSE) TYPE(*CHAR) LEN(1)", "",
 "  CRTLIB     LIB(OFFICE)", "  MONMSG     MSGID(CPF0000)", "  ADDLIBLE   LIB(OFFICE)", "  MONMSG     MSGID(CPF0000)",
 "  CRTSRCPF   FILE(OFFICE/QDDSSRC) RCDLEN(92)", "  MONMSG     MSGID(CPF0000)",
 "  CRTSRCPF   FILE(OFFICE/QRPGLESRC) RCDLEN(112)", "  MONMSG     MSGID(CPF0000)", ""]
def cp(stmf, srcf, mbr):
    B.extend(["  CPYFRMSTMF FROMSTMF('/home/office/%s') +" % stmf, "               TOMBR('/QSYS.LIB/OFFICE.LIB/%s.FILE/%s.MBR') +" % (srcf, mbr),
              "               MBROPT(*REPLACE)", "  MONMSG     MSGID(CPF0000) EXEC(CHGVAR VAR(&FAIL) +", "               VALUE(&FAIL *BCAT '%s'))" % stmf])
MON = lambda n: ["  MONMSG     MSGID(CPF0000 RNS0000 MCH0000) EXEC(CHGVAR VAR(&FAIL) +", "               VALUE(&FAIL *BCAT '%s'))" % n]
for n in PFS + DSP + ['OVPRTF']: cp(n + '.DDS', 'QDDSSRC', n)
for n in ['OVSYSN', 'OVTZC', 'OFFMNUC']: cp(n + '.CLLE', 'QCLSRC', n)
for n in PG: cp(n + '.RPGLE', 'QRPGLESRC', n)
B += ["", "  /* The data layout changed in version 3.  The first build of this   */", "  /* version replaces the old (empty) data files; later builds keep   */",
      "  /* every data file, so rebuilding never loses anything.             */",
      "  CHKOBJ     OBJ(OFFICE/OVDBV3) OBJTYPE(*DTAARA)", "  MONMSG     MSGID(CPF9801) EXEC(DO)"]
for n in PFS: B += ["    DLTF       FILE(OFFICE/%s)" % n, "    MONMSG     MSGID(CPF0000)"]
B += ["    CRTDTAARA  DTAARA(OFFICE/OVDBV3) TYPE(*CHAR) LEN(10) VALUE('V3')", "  ENDDO", ""]
for n in PFS:
    B += ["  CHKOBJ     OBJ(OFFICE/%s) OBJTYPE(*FILE)" % n, "  MONMSG     MSGID(CPF9801) EXEC(DO)",
          "    CRTPF      FILE(OFFICE/%s) SRCFILE(OFFICE/QDDSSRC) SRCMBR(%s)" % (n, n)] + ['  ' + x for x in MON(n)] + ["  ENDDO"]
B += [""]
for n in DSP:
    B += ["  /* a screen file that someone has open cannot be replaced */",
          "  CHGVAR     VAR(&INUSE) VALUE('0')",
          "  ALCOBJ     OBJ((OFFICE/%s *FILE *EXCL)) WAIT(0)" % n,
          "  MONMSG     MSGID(CPF1002) EXEC(CHGVAR VAR(&INUSE) VALUE('1'))",
          "  MONMSG     MSGID(CPF0000)",
          "  IF         COND(&INUSE *EQ '1') THEN(CHGVAR VAR(&FAIL) +",
          "               VALUE(&FAIL *BCAT '%s(IN-USE)'))" % n,
          "  DLCOBJ     OBJ((OFFICE/%s *FILE *EXCL))" % n,
          "  MONMSG     MSGID(CPF0000)",
          "  IF         COND(&INUSE *EQ '1') THEN(GOTO CMDLBL(S%s))" % n]
    B += ["  CRTDSPF    FILE(OFFICE/%s) SRCFILE(OFFICE/QDDSSRC) SRCMBR(%s)" % (n, n) + (' +' if n in ('OVCAL', 'OVCHAT', 'OVGAME') else '')]
    if n in ('OVCAL', 'OVGAME'): B += ["               WAITRCD(1) DFRWRT(*NO)"]
    if n == 'OVCHAT': B += ["               WAITRCD(2) DFRWRT(*NO)"]
    B += MON(n + ' screens') + [" S%s:" % n + ' ' * (11 - len(n)) + "CHGVAR     VAR(&INUSE) VALUE('0')"]
B += ["  CRTPRTF    FILE(OFFICE/OVPRTF) SRCFILE(OFFICE/QDDSSRC) SRCMBR(OVPRTF)"] + MON('OVPRTF') + [""]
for n in ['OVSYSN', 'OVTZC', 'OFFMNUC']: B += ["  CRTBNDCL   PGM(OFFICE/%s) SRCFILE(OFFICE/QCLSRC) SRCMBR(%s)" % (n, n)] + MON(n)
for n in PG: B += ["  CRTBNDRPG  PGM(OFFICE/%s) SRCFILE(OFFICE/QRPGLESRC) SRCMBR(%s)" % (n, n)] + MON(n)
B += ["", "  GRTOBJAUT  OBJ(OFFICE/*ALL) OBJTYPE(*ALL) USER(*PUBLIC) AUT(*CHANGE)", "  MONMSG     MSGID(CPF0000)",
 "  DLTMNU     MENU(OFFICE/OFFICE)", "  MONMSG     MSGID(CPF0000)", "  CRTMNU     MENU(OFFICE/OFFICE) TYPE(*PGM) PGM(OFFICE/OFFMNUC)",
 "  MONMSG     MSGID(CPF0000) EXEC(CHGVAR VAR(&FAIL) +", "               VALUE(&FAIL *BCAT 'OFFICE menu'))", "",
 "  IF         COND(&FAIL *EQ ' ') THEN(CHGVAR VAR(&MSG) +", "               VALUE('OfficeVibes/400 built.  Type GO OFFICE/OFFICE'))",
 "  ELSE       CMD(CHGVAR VAR(&MSG) VALUE('Build FAILED for:' *BCAT &FAIL))",
 "  SNDPGMMSG  MSG(&MSG) MSGTYPE(*COMP)", "", "ENDPGM"]
SRC['BLDOFF.CLLE'] = B

# ---------------- OVREMD: reminder service (batch) ----------------
prog('OVREMD', [('OVCALP', 'I')], None, [S('TGTN', 8, 0), S('TGTT', 5, 0), S('LASTT', 5, 0), S('W4', 4), S('NSENT', 7, 0)], """
EVAL LASTT = -1
DOW 1 = 1
 | SHTDN | | | ^52
IF *IN52 = *ON
LEAVE
ENDIF
* the minute that is fifteen minutes from now
 | TIME | | TS
 | ADDDUR | 15:*MN | TS
 | MOVE | TS | WSTMP
EVAL W8 = %SUBST(WSTMP:1:4) + %SUBST(WSTMP:6:2) + %SUBST(WSTMP:9:2)
 | MOVE | W8 | TGTN
EVAL W4 = %SUBST(WSTMP:12:2) + %SUBST(WSTMP:15:2)
 | MOVE | W4 | TGTT
IF TGTT <> LASTT
EVAL LASTT = TGTT
*LOVAL | SETLL | CALREC
 | READ | CALREC
DOW NOT %EOF(OVCALP)
IF CLDATE = TGTN AND CLTIME = TGTT AND %SUBST(CLUSER:1:1) <> '#'
EVAL QSRC = 'Reminder: ' + %SUBST(W4:1:2) + ':' + %SUBST(W4:3:2) + '  ' + %TRIMR(CLTEXT) + '  (in 15 minutes)'
EXSR QUOTE
EVAL CMD = 'SNDMSG MSG(''' + QTXT + ''') TOUSR(' + %TRIM(CLUSER) + ')'
EXSR RUNCMD
EVAL *IN50 = *OFF
EVAL NSENT = NSENT + 1
ENDIF
 | READ | CALREC
ENDDO
ENDIF
EVAL CMD = 'DLYJOB DLY(20)'
EXSR RUNCMD
EVAL *IN50 = *OFF
ENDDO
EVAL *INLR = *ON
""")

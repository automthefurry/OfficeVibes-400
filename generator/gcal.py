SETN = " | MOVE | CURN | W8\nEVAL DTXT = %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2) + '/' + %SUBST(W8:1:4)\n"
# ================= Calendar, OfficeVision style =================
pf('OVCAUTP', 'AUTHREC', [A('CAOWN', 10), A('CAUSER', 10), A('CAVIEW', 1), A('CACHG', 1)], ['CAOWN', 'CAUSER'])
pf('OVROOMP', 'ROOMREC', [A('RMID', 9), A('RMNAME', 30), N('RMSEAT', 3)], ['RMID'])
pf('OVHOLP', 'HOLREC', [N('HLDATE', 8), A('HLNAME', 30)], ['HLDATE'])
DNAMES = 'Sunday   Monday   Tuesday  WednesdayThursday Friday   Saturday '
CHKDT = """
CHKDT | BEGSR
EXSR PARSED
IF NERR = '0' AND DUEVAL <> 0
*ISO | TEST(D) | | DUEVAL | 51
IF *IN51 = *ON
EVAL NERR = '1'
EVAL *IN51 = *OFF
ENDIF
ENDIF
IF DUEVAL = 0
EVAL NERR = '1'
ENDIF
 | ENDSR
"""
PARSETM = """
* ---- TM holds HH:MM or blank: sets CLT (-1 is all day) or NERR ----
PARSTM | BEGSR
EVAL NERR = '0'
EVAL CLT = -1
EVAL TM = %TRIML(TM)
IF TM <> *BLANKS
EVAL P1 = %SCAN(':':TM)
IF P1 >= 2 AND P1 <= 3
EVAL NSTR = %SUBST(TM:1:P1-1)
EXSR TONUM
EVAL HH = NVAL
EVAL NSTR = %SUBST(TM:P1+1:2)
EXSR TONUM
EVAL MI = NVAL
ELSE
EVAL NERR = '1'
ENDIF
IF NERR = '0' AND (HH > 23 OR MI > 59)
EVAL NERR = '1'
ENDIF
IF NERR = '0'
EVAL CLT = HH * 100 + MI
ENDIF
ENDIF
 | ENDSR
"""
TMVARS = [S('TM', 5), S('HH', 5, 0), S('MI', 5, 0), S('CLT', 5, 0)]

H('PMENU', 'Process calendars', 'Type the number of what you want to do and press Enter.  You can also put',
  'the cursor on a line and press Enter.', '',
  'Calendar for: type another user ID to look at their calendar, if they have',
  'allowed it.  A conference room calendar starts with #, such as #ROOM1.',
  'Date: type a date to work with, or put the cursor on a day in the small',
  'calendar and press Enter.  F10 and F11 move a month at a time.', '',
  ' 1, 4, 5  The schedule for the chosen day, the next day or the day before.',
  ' 2, 8     Type how many days to view or print, from 1 to 31.',
  ' 3        Conference rooms, and what is booked in them.',
  ' 6, 9, 10 The month, the business week, or six months at a glance.',
  ' 7        Book a meeting with other users and a room, and invite them.',
  '11        Who may look at or change your calendar.',
  '12        Find an appointment by a word in it.',
  '13        Company holidays, shown on every calendar.', '',
  'F6 adds an appointment.  F5 changes the character beside the calendar.')
H('DAYV', 'Schedule for the day', 'Every appointment on the chosen day, earliest first.', '',
  'Type 2 beside an appointment to change it, or 4 to delete it.',
  'F6 adds an appointment.  F7 and F8 go to the day before and the day after.',
  'F9 prints the day.  F11 shows more when there are over twelve.', '',
  'You can only look at another calendar, unless its owner has allowed',
  'you to change it.')
H('NDVR', 'Several days of the calendar', 'Each day is shown in white, with its appointments beneath it.', '',
  'F7 and F8 page up and down.  F9 prints these days.')
H('MONV', 'The month', 'Each box is one day.  The dots stand for the hours from 8 to 4: a letter',
  'in place of a dot is the first letter of an appointment in that hour.', '',
  '<  something before 8 in the morning     >  something after 4',
  '*  an appointment that lasts all day      Hol  a company holiday',
  '>  before the day number marks the chosen day', '',
  'Put the cursor on a day and press Enter to work with it.',
  'F10 and F11 go to the next and previous month.')
H('WEEKVR', 'The business week', 'Monday to Friday of the chosen week, one row for each hour from 8 to 5.',
  'All day, early and late appointments have rows of their own.', '',
  'A + at the end of a box means there is more than one appointment there.', '',
  'Put the cursor in a day column and press Enter to work with that day.',
  'F7 and F8 go to the previous and next week.')
H('SIXVR', 'Six months', 'Six months at a glance.  > marks the chosen day, * a day with',
  'appointments and H a company holiday.', '', 'F7 and F8 move six months back or forward.')
# ---------------- screens ----------------
s = Scr('OVCAL'); s.rec('BLANK'); s.t(1, 2, ' ')
s.rec('PMENU', 'OVERLAY'); s.reck('INVITE', ' 45'); s.reck('PUTOVR', ' 46')
s.f('PHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.ctr(2, 'P R O C E S S   C A L E N D A R S', 'DSPATR(HI)')
s.t(3, 3, 'Calendar for'); s.f('POWN', 10, 'B', 3, 17, 'DSPATR(UL)'); s.f('PONM', 30, 'O', 3, 29, 'COLOR(PNK)')
s.t(4, 3, 'Date . . . .'); s.f('PDATE', 10, 'B', 4, 17, 'DSPATR(UL)'); s.f('PDNM', 12, 'O', 4, 29, 'COLOR(WHT)')
s.t(5, 3, 'Select one of the following.  Then press Enter.', 'COLOR(BLU)'); s.f('PTIM', 18, 'O', 5, 58, 'OVRDTA', 'COLOR(TRQ)')
s.f('PSEL', 2, 'B', 7, 3, 'DSPATR(UL)')
OPTS = [' 1. Work with the schedule for the day', None, ' 3. View the conference room schedules', ' 4. Work with the next day',
        ' 5. Work with the previous day', ' 6. View the month', ' 7. Schedule a meeting', None, ' 9. View the business week',
        '10. View six months', '11. Manage the list of authorized users', '12. Search the calendar', '13. Company holidays']
for i, tx in enumerate(OPTS):
    if tx: s.t(7 + i, 7, tx)
s.t(8, 7, ' 2. View'); s.f('PNDV', 2, 'B', 8, 16, 'DSPATR(UL)'); s.t(8, 19, 'days of the calendar')
s.t(14, 7, ' 8. Print'); s.f('PNDP', 2, 'B', 14, 17, 'DSPATR(UL)'); s.t(14, 20, 'days of the calendar')
s.f('PMCT', 22, 'O', 6, 55, 'COLOR(TRQ)'); s.t(7, 55, ' Su Mo Tu We Th Fr Sa', 'COLOR(TRQ)')
for i in range(1, 7): s.f('PMC%d' % i, 21, 'O', 7 + i, 55, 'COLOR(TRQ)')
s.f('PDOY', 22, 'O', 14, 55, 'COLOR(TRQ)')
for i in range(1, 7): s.f('CS%d' % i, 12, 'O', 14 + i, 62, 'OVRDTA', 'COLOR(YLW)')
s.f('PMSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f('PFK1', 78, 'O', 22, 2, 'COLOR(BLU)'); s.f('PFK2', 78, 'O', 23, 2, 'COLOR(BLU)')
# day schedule
s.rec('DAYV'); s.f('DHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.ctr(2, 'W O R K   W I T H   T H E   D A Y', 'DSPATR(HI)')
s.f('DTTL', 60, 'O', 3, 3, 'COLOR(PNK)'); s.f('DDTE', 40, 'O', 4, 3, 'COLOR(WHT)'); s.f('DHOL', 32, 'O', 4, 46, 'COLOR(RED)')
s.t(6, 3, 'Opt  Time     What', 'COLOR(BLU)')
for i in range(1, 13): s.f('DOP%02d' % i, 2, 'I', 6 + i, 3, 'DSPATR(UL)'); s.f('DLN%02d' % i, 70, 'O', 6 + i, 8, 'COLOR(TRQ)')
s.f('DMSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f('DFK1', 78, 'O', 22, 2, 'COLOR(BLU)'); s.f('DFK2', 78, 'O', 23, 2, 'COLOR(BLU)')
# add or change
s.edit('CADD', 'A')
s.inp('Date', 'ADATE', 10, 4, lc=False); s.t(4, 37, 'M/D or M/D/YYYY', 'COLOR(BLU)')
ND42 = (' 42', 'DSPATR(ND)')
s.f('ALB1', 19, 'O', 5, 3); s.f('AEND', 10, 'B', 5, 24, 'DSPATR(UL)', ND42, (' 42', 'DSPATR(PR)'))
s.f('ALB2', 36, 'O', 5, 37, 'COLOR(BLU)')
s.inp('Time', 'ATIME', 5, 6, lc=False); s.t(6, 37, 'HH:MM, 24-hour.  Blank = all day', 'COLOR(BLU)')
s.t(7, 37, '00:00 is midnight', 'COLOR(BLU)')
s.t(8, 3, 'What'); s.f('ATEXT', 60, 'B', 9, 3, 'CHECK(LC)', 'DSPATR(UL)')
# n days
s.rec('NDVR'); s.f('NHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.f('NTTL', 74, 'O', 2, 3, 'COLOR(PNK)')
for i in range(1, 17): s.f('NL%02d' % i, 76, 'O', 3 + i, 3, ('N%02d' % (60 + i), 'COLOR(TRQ)'), (' %02d' % (60 + i), 'COLOR(WHT)'))
s.f('NMSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f('NFK', 78, 'O', 23, 2, 'COLOR(BLU)')
# month
s.rec('MONV'); s.f('MHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.f('MTTL', 76, 'O', 2, 3, 'COLOR(PNK)')
s.t(3, 2, ''.join(n.strip().center(11) for n in [DNAMES[i:i + 9] for i in range(0, 63, 9)]).rstrip(), 'COLOR(WHT)')
BORDER = '+' + ('-' * 10 + '+') * 7
for w in range(7): s.t(4 + 3 * w, 2, BORDER, 'COLOR(TRQ)')
for w in range(1, 7):
    s.f('MDL%d' % w, 78, 'O', 2 + 3 * w, 2, 'COLOR(TRQ)'); s.f('MVL%d' % w, 78, 'O', 3 + 3 * w, 2, 'COLOR(TRQ)')
s.f('MFK', 78, 'O', 23, 2, 'COLOR(BLU)')
# business week
s.rec('WEEKVR'); s.f('WHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.f('WTTL', 76, 'O', 2, 3, 'COLOR(PNK)')
s.f('WCOL', 78, 'O', 4, 2, 'COLOR(WHT)')
for i in range(1, 15): s.f('WL%02d' % i, 78, 'O', 4 + i, 2, 'COLOR(TRQ)')
s.f('WMSG', 74, 'O', 21, 3, 'DSPATR(HI)'); s.f('WFK', 78, 'O', 23, 2, 'COLOR(BLU)')
# six months
s.rec('SIXVR'); s.f('SHDR', 78, 'O', 1, 2, 'DSPATR(HI)'); s.f('STTL', 76, 'O', 2, 3, 'COLOR(PNK)')
for i in range(1, 17): s.f('SX%02d' % i, 76, 'O', 3 + i + (1 if i > 8 else 0), 3, 'COLOR(TRQ)' if (i - 1) % 8 > 1 else 'COLOR(WHT)')
s.t(21, 3, '> the chosen day     * appointments     H company holiday', 'COLOR(BLU)')
s.f('SFK', 78, 'O', 23, 2, 'COLOR(BLU)')
s.save()

MV = ['MDL%d' % i for i in range(1, 7)]
prog('OVCAL', [('OVCALP', 'U'), ('OVPREFP', 'U'), ('OVUSERP', 'I'), ('OVCAUTP', 'I'), ('OVROOMP', 'I'), ('OVHOLP', 'I')], 'OVCAL',
 arrds('CSA', 'CS', 12, ['CS%d' % i for i in range(1, 7)]) + arrds('PMCA', 'PMC', 21, ['PMC%d' % i for i in range(1, 7)]) +
 arrds('DLNA', 'DLN', 70, ['DLN%02d' % i for i in range(1, 13)]) + arrds('DOPA', 'DOP', 2, ['DOP%02d' % i for i in range(1, 13)]) +
 arrds('NLA', 'NL', 76, ['NL%02d' % i for i in range(1, 17)]) + arrds('MDLA', 'MDL', 78, MV) +
 arrds('MVLA', 'MVL', 78, ['MVL%d' % i for i in range(1, 7)]) + arrds('WLA', 'WL', 78, ['WL%02d' % i for i in range(1, 15)]) +
 arrds('SXA', 'SX', 76, ['SX%02d' % i for i in range(1, 17)]) + artdc() + DC('MNAMES', MNAMES) + DC('DNAMES', DNAMES) + DC('BORDER', BORDER) + DC('ROWL', '|' + ('          |') * 7) + [S('WOFF', 5, 0)] +
 TMVARS + [S('ART', 72), S('MIDX', 5, 0), S('ANIM', 1), S('FRAME', 5, 0), S('FULL', 1),
  S('CURD', 'D'), S('TODD', 'D'), S('BASEDT', 'D', kw="INZ(D'2000-01-02')"), S('F1', 'D'), S('NXT', 'D'), S('D1', 'D'), S('D2', 'D'),
  S('JAN1', 'D'), S('MOND', 'D'), S('SXD', 'D'), S('NDAYS', 7, 0), S('FDOW', 5, 0), S('MDAYS', 5, 0), S('WKD', 5, 0), S('DOYN', 5, 0),
  S('CURN', 8, 0), S('TODN', 8, 0), S('FIRSTN', 8, 0), S('KDATE', 8, 0), S('KTIME', 4, 0), S('KTM', 4, 0, 'DIM(12)'),
  S('KSD', 'Z', kw='DIM(12)'), S('DTXT', 10), S('W4', 4), S('TTXT', 7), S('HAS', 1, kw='DIM(31)'), S('HOL', 1, kw='DIM(31)'),
  S('DOTS', 10, kw='DIM(31)'), S('ML', 21, kw='DIM(6)'), S('MTT', 22), S('DY', 5, 0), S('DAY2', 2, 0), S('CELL', 5, 0),
  S('RW', 5, 0), S('CC', 5, 0), S('MARK', 1), S('EDMODE', 1), S('STARTV', 8, 0), S('ENDV', 8, 0), S('NDAY', 5, 0), S('KK', 5, 0),
  S('CHGR', 5, 0), S('OWN', 10), S('OWNNM', 30), S('CANCHG', 1), S('WOWN', 10), S('SWOK', 1), S('VW', 1), S('CG', 1),
  S('KAOWN', 10), S('KAUSR', 10), S('KRM', 9), S('PDSHOW', 10), S('SELN', 5, 0), S('NDV', 5, 0), S('NLX', 76, kw='DIM(300)'),
  S('NLH', 1, kw='DIM(300)'), S('NLN', 5, 0), S('XOWN', 10), S('XDATE', 8), S('HOUR', 5, 0), S('SLOT', 5, 0), S('WCELL', 10),
  S('WDAY', 5, 0), S('WROW', 5, 0), S('WPOS', 5, 0), S('H12', 5, 0), S('AMPM', 2), S('SXN', 8, 0), S('KM', 5, 0), S('BAND', 5, 0),
  S('MCOL', 5, 0), S('HOLNM', 30), S('WSAVE', 'D'), S('CNTN', 5, 0)] +
 DC('DK1', '2=Change  4=Delete     F6=Add   F7=Previous day   F8=Next day') +
 DC('DK2', 'F1=Help  F3=Exit  F9=Print the day  F11=More  F12=Return'), ("""
KEYD | KLIST
 | KFLD | | KUSER
 | KFLD | | KDATE
KEYF | KLIST
 | KFLD | | KUSER
 | KFLD | | KDATE
 | KFLD | | KTIME
 | KFLD | | KSTMP
KEYA | KLIST
 | KFLD | | KAOWN
 | KFLD | | KAUSR
EVAL LAPP = 'CALENDAR'
 | TIME | | TS
 | MOVE | TS | TODD
*ISO | MOVE | TODD | TODN
EVAL CURD = TODD
EVAL CURN = TODN
EVAL WOWN = PGMUSR
EXSR SWITCH
@GETPREF@
EVAL ANIM = '1'
IF MIDX = 6
EVAL ANIM = '0'
ENDIF
EVAL FRAME = 0
EVAL FULL = '1'
EVAL PNDV = '7'
EVAL PNDP = '7'
DOW 1 = 1
IF FULL = '1'
EXSR BUILDM
ENDIF
EXSR SETART
EXSR CLOCK
IF ANIM = '1'
EVAL *IN45 = *ON
IF FULL = '1'
EVAL *IN46 = *OFF
 | WRITE | BLANK
ELSE
EVAL *IN46 = *ON
ENDIF
 | WRITE | PMENU
 | READ | OVCAL | | 5152
IF *IN51 = *ON
EVAL *IN51 = *OFF
IF DSPSTS = 1331
EVAL FRAME = 1 - FRAME
EVAL FULL = '0'
ELSE
EVAL ANIM = '0'
EVAL FULL = '1'
EVAL MSG = 'The character cannot move on this display.'
ENDIF
ITER
ENDIF
ELSE
EVAL *IN45 = *OFF
EVAL *IN46 = *OFF
 | WRITE | BLANK
 | EXFMT | PMENU
ENDIF
EVAL FULL = '1'
EXSR CSR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
SELECT
WHEN *IN05 = *ON
EXSR NEXTCH
WHEN *IN06 = *ON
EVAL EDMODE = 'A'
EXSR ADDC
WHEN *IN10 = *ON
EVAL CURD = F1
 | ADDDUR | 1:*M | CURD
*ISO | MOVE | CURD | CURN
WHEN *IN11 = *ON
EVAL CURD = F1
 | SUBDUR | 1:*M | CURD
*ISO | MOVE | CURD | CURN
OTHER
EXSR ENTER
ENDSL
ENDDO
EVAL *IN45 = *OFF
EVAL *IN46 = *OFF
EVAL *INLR = *ON
* ---- Enter on the Process Calendars menu ----
ENTER | BEGSR
EVAL WOWN = %TRIML(POWN)
LCASE:UCASE | XLATE | WOWN | WOWN
IF WOWN <> OWN AND WOWN <> *BLANKS
EXSR SWITCH
ENDIF
IF PDATE <> PDSHOW
EVAL DUE = PDATE
EXSR CHKDT
IF NERR = '1'
EVAL MSG = 'That date is not valid.  Use M/D or M/D/YYYY.'
ELSE
EVAL CURN = DUEVAL
*ISO | MOVE | CURN | CURD
ENDIF
ENDIF
EVAL SELN = 0
EVAL NERR = '0'
IF PSEL <> *BLANKS
EVAL NSTR = %TRIML(PSEL)
EXSR TONUM
EVAL SELN = NVAL
IF NERR = '1'
EVAL SELN = 99
ENDIF
ELSE
IF CSRROW >= 7 AND CSRROW <= 19 AND CSRCOL >= 6 AND CSRCOL <= 50
EVAL SELN = CSRROW - 6
ENDIF
IF CSRROW >= 8 AND CSRROW <= 13 AND CSRCOL >= 55 AND CSRCOL <= 75
EVAL DY = (CSRROW - 8) * 7 + %DIV(CSRCOL - 55:3) + 1 - FDOW
IF DY >= 1 AND DY <= MDAYS
EVAL CURN = FIRSTN + DY - 1
*ISO | MOVE | CURN | CURD
ENDIF
ENDIF
ENDIF
EVAL NERR = '0'
EVAL NSTR = %TRIML(PNDV)
EXSR TONUM
EVAL NDV = NVAL
IF NERR = '1' OR NDV < 1 OR NDV > 31
EVAL NDV = 7
EVAL PNDV = '7'
ENDIF
SELECT
WHEN SELN = 0
EVAL SELN = 0
WHEN SELN = 1
EXSR DAYVW
WHEN SELN = 2
EXSR NDAYVW
WHEN SELN = 3
EVAL XOWN = OWN
 | MOVE | CURN | XDATE
 | CALL | 'OVROOM' | | 50
 | PARM | | XOWN
 | PARM | | XDATE
EVAL *IN50 = *OFF
IF XOWN <> OWN
EVAL WOWN = XOWN
EXSR SWITCH
EXSR DAYVW
ENDIF
WHEN SELN = 4
 | ADDDUR | 1:*D | CURD
*ISO | MOVE | CURD | CURN
EXSR DAYVW
WHEN SELN = 5
 | SUBDUR | 1:*D | CURD
*ISO | MOVE | CURD | CURN
EXSR DAYVW
WHEN SELN = 6
EXSR MONTHV
WHEN SELN = 7
 | MOVE | CURN | XDATE
 | CALL | 'OVMEET' | | 50
 | PARM | | XDATE
EVAL *IN50 = *OFF
WHEN SELN = 8
EVAL NERR = '0'
EVAL NSTR = %TRIML(PNDP)
EXSR TONUM
EVAL NDV = NVAL
IF NERR = '1' OR NDV < 1 OR NDV > 31
EVAL NDV = 7
EVAL PNDP = '7'
ENDIF
EXSR PRINTN
WHEN SELN = 9
EXSR WEEKV
WHEN SELN = 10
EXSR SIXVW
WHEN SELN = 11
 | CALL | 'OVCAUT' | | 50
EVAL *IN50 = *OFF
WHEN SELN = 12
EVAL XOWN = OWN
EVAL XDATE = *BLANKS
 | CALL | 'OVCSRC' | | 50
 | PARM | | XOWN
 | PARM | | XDATE
EVAL *IN50 = *OFF
IF XDATE <> *BLANKS
 | MOVE | XDATE | CURN
*ISO | MOVE | CURN | CURD
EXSR DAYVW
ENDIF
WHEN SELN = 13
 | CALL | 'OVHOLI' | | 50
EVAL *IN50 = *OFF
OTHER
EVAL MSG = 'Type a number from 1 to 13.'
ENDSL
""" + INDOFF + """
 | ENDSR
* ---- make WOWN the calendar shown, if this user may see it ----
SWITCH | BEGSR
EVAL SWOK = '0'
SELECT
WHEN %SUBST(WOWN:1:1) = '#'
EVAL KRM = %SUBST(WOWN:2:9)
KRM | CHAIN | ROOMREC
IF %FOUND(OVROOMP)
EVAL SWOK = '1'
EVAL OWNNM = 'Room: ' + RMNAME
EVAL CANCHG = '1'
ELSE
EVAL MSG = 'There is no conference room ' + %SUBST(WOWN:2:9)
ENDIF
OTHER
WOWN | CHAIN | USERREC
IF NOT %FOUND(OVUSERP)
EVAL MSG = %TRIM(WOWN) + ' is not an office user.'
ELSE
EVAL VW = 'Y'
EVAL CG = 'N'
IF WOWN = PGMUSR
EVAL CG = 'Y'
ELSE
EVAL KAOWN = WOWN
EVAL KAUSR = PGMUSR
KEYA | CHAIN | AUTHREC
IF NOT %FOUND(OVCAUTP)
EVAL KAUSR = '*STD'
KEYA | CHAIN | AUTHREC
ENDIF
IF %FOUND(OVCAUTP)
EVAL VW = CAVIEW
EVAL CG = CACHG
ENDIF
ENDIF
IF VW <> 'Y'
EVAL MSG = %TRIM(WOWN) + ' has not let you see their calendar.'
ELSE
EVAL SWOK = '1'
EVAL OWNNM = USNAME
EVAL CANCHG = '0'
IF CG = 'Y'
EVAL CANCHG = '1'
ENDIF
ENDIF
ENDIF
ENDSL
IF SWOK = '1'
EVAL OWN = WOWN
EVAL KUSER = OWN
EVAL PGNO = 0
ENDIF
 | ENDSR
* ---- fill the Process Calendars menu ----
BUILDM | BEGSR
EVAL HDRID = 'CALMAIN'
EXSR HDR
EVAL PHDR = HDRLN
EVAL POWN = OWN
EVAL PONM = OWNNM
""" + SETN + """
EVAL PDATE = DTXT
EVAL PDSHOW = DTXT
EXSR GETWKD
EVAL PDNM = %TRIMR(%SUBST(DNAMES:WKD*9+1:9))
 | MOVE | CURN | W8
EVAL W8 = %SUBST(W8:1:6) + '01'
 | MOVE | W8 | FIRSTN
EXSR MKMON
1 | DO | 6 | I
EVAL PMC(I) = ML(I)
 | ENDDO
EVAL PMCT = MTT
EXSR GETDOY
EVAL PDOY = '   Day of year: ' + %CHAR(DOYN)
EVAL PSEL = *BLANKS
EVAL PMSG = MSG
EVAL MSG = *BLANKS
EVAL PFK1 = 'F1=Help  F3=Exit  F5=Character  F6=Add an appointment'
EVAL PFK2 = 'F10=Next month   F11=Previous month   Cursor on a day + Enter picks it'
 | ENDSR
CLOCK | BEGSR
 | TIME | | TS
 | MOVE | TS | WSTMP
EVAL NERR = '0'
EVAL NSTR = %SUBST(WSTMP:12:2)
EXSR TONUM
EVAL H12 = NVAL
EVAL AMPM = 'AM'
IF H12 >= 12
EVAL AMPM = 'PM'
ENDIF
IF H12 > 12
EVAL H12 = H12 - 12
ENDIF
IF H12 = 0
EVAL H12 = 12
ENDIF
EVAL PTIM = 'Time:  ' + %CHAR(H12) + ':' + %SUBST(WSTMP:15:2) + ' ' + AMPM
 | ENDSR
* ---- day of the week of CURD (0 is Sunday), day of the year
GETWKD | BEGSR
CURD | SUBDUR | BASEDT | NDAYS:*D
EVAL WKD = %REM(%REM(NDAYS:7) + 7:7)
 | ENDSR
GETDOY | BEGSR
 | MOVE | CURN | W8
EVAL W8 = %SUBST(W8:1:4) + '0101'
 | MOVE | W8 | N8
*ISO | MOVE | N8 | JAN1
CURD | SUBDUR | JAN1 | DOYN:*D
EVAL DOYN = DOYN + 1
 | ENDSR
* ---- one month as six lines (FIRSTN is the first of the month)
MKMON | BEGSR
*ISO | MOVE | FIRSTN | F1
F1 | ADDDUR | 1:*M | NXT
NXT | SUBDUR | F1 | MDAYS:*D
F1 | SUBDUR | BASEDT | NDAYS:*D
EVAL FDOW = %REM(%REM(NDAYS:7) + 7:7)
EVAL HAS = *BLANK
EVAL HOL = *BLANK
EVAL KDATE = FIRSTN
KEYD | SETLL | CALREC
KUSER | READE(N) | CALREC
DOW NOT %EOF(OVCALP) AND CLDATE < FIRSTN + MDAYS
EVAL HAS(CLDATE - FIRSTN + 1) = '*'
KUSER | READE(N) | CALREC
ENDDO
FIRSTN | SETLL | HOLREC
 | READ(N) | HOLREC
DOW NOT %EOF(OVHOLP) AND HLDATE < FIRSTN + MDAYS
EVAL HOL(HLDATE - FIRSTN + 1) = 'H'
 | READ(N) | HOLREC
ENDDO
EVAL ML = *BLANKS
1 | DO | MDAYS | DY
EVAL CELL = FDOW + DY
EVAL RW = %DIV(CELL - 1:7) + 1
EVAL CC = %REM(CELL - 1:7)
EVAL DAY2 = DY
EVAL MARK = HAS(DY)
IF HOL(DY) = 'H'
EVAL MARK = 'H'
ENDIF
IF FIRSTN + DY - 1 = CURN
EVAL MARK = '>'
ENDIF
EVAL %SUBST(ML(RW):CC*3+1:3) = MARK + %EDITC(DAY2:'Z')
 | ENDDO
 | MOVE | FIRSTN | W8
EVAL MM = %DIV(%REM(FIRSTN:10000):100)
EVAL MTT = %SUBST(W8:1:4) + '   ' + %TRIMR(%SUBST(MNAMES:(MM-1)*9+1:9)) + '   ' + %SUBST(W8:1:4)
 | ENDSR
* ---- the character beside the calendar ----
SETART | BEGSR
@ARTSEL@ | ENDSR
NEXTCH | BEGSR
EVAL MIDX = MIDX + 1
IF MIDX > 6
EVAL MIDX = 1
ENDIF
EVAL ANIM = '1'
IF MIDX = 6
EVAL ANIM = '0'
ENDIF
PGMUSR | CHAIN | PREFREC
EVAL PRUSER = PGMUSR
EVAL PRMASC = %SUBST(MNAMEL:MIDX*7-6:7)
IF %FOUND(OVPREFP)
 | UPDATE | PREFREC
ELSE
 | WRITE | PREFREC
ENDIF
EVAL MSG = 'Character: ' + %TRIM(PRMASC) + '.  F5 for the next one.'
 | ENDSR
* ---- work with the schedule for one day ----
DAYVW | BEGSR
EVAL PGNO = 0
DOW 1 = 1
EXSR LOADD
EVAL HDRID = 'CALDAY'
EXSR HDR
EVAL DHDR = HDRLN
EVAL DTTL = 'Schedule for ' + OWNNM
""" + SETN + """
EXSR GETWKD
EXSR GETDOY
EVAL DDTE = %TRIMR(%SUBST(DNAMES:WKD*9+1:9)) + ', ' + DTXT + '   day ' + %CHAR(DOYN)
EVAL DHOL = *BLANKS
CURN | CHAIN(N) | HOLREC
IF %FOUND(OVHOLP)
EVAL DHOL = 'Holiday: ' + HLNAME
ENDIF
EVAL DMSG = MSG
EVAL MSG = *BLANKS
EVAL DFK1 = DK1
EVAL DFK2 = DK2
 | EXFMT | DAYV
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
SELECT
WHEN *IN06 = *ON
EVAL EDMODE = 'A'
EXSR ADDC
WHEN *IN07 = *ON
 | SUBDUR | 1:*D | CURD
*ISO | MOVE | CURD | CURN
EVAL PGNO = 0
WHEN *IN08 = *ON
 | ADDDUR | 1:*D | CURD
*ISO | MOVE | CURD | CURN
EVAL PGNO = 0
WHEN *IN09 = *ON
EVAL NDV = 1
EXSR PRINTN
WHEN *IN11 = *ON
EVAL PGNO = PGNO + 1
IF PGNO * 12 >= NMATCH
EVAL PGNO = 0
ENDIF
OTHER
EXSR DAYOPT
ENDSL
ENDDO
""" + INDOFF + """
 | ENDSR
LOADD | BEGSR
EVAL DLNA = *BLANKS
EVAL DOPA = *BLANKS
EVAL NMATCH = 0
EVAL BASE = PGNO * 12
EVAL KDATE = CURN
KEYD | SETLL | CALREC
KEYD | READE(N) | CALREC
DOW NOT %EOF(OVCALP)
EVAL NMATCH = NMATCH + 1
IF NMATCH > BASE AND NMATCH <= BASE + 12
EVAL ROW = NMATCH - BASE
EXSR FMTTM
EVAL DLN(ROW) = TTXT + '  ' + CLTEXT
EVAL KTM(ROW) = CLTIME
EVAL KSD(ROW) = CLSTMP
ENDIF
KEYD | READE(N) | CALREC
ENDDO
EVAL NSHOW = NMATCH - BASE
IF NSHOW > 12
EVAL NSHOW = 12
ENDIF
IF NMATCH = 0
EVAL DLN(1) = '(nothing scheduled)'
ENDIF
 | ENDSR
DAYOPT | BEGSR
EVAL DCNT = 0
EVAL CHGR = 0
1 | DO | NSHOW | ROW
EVAL OP = %TRIM(DOP(ROW))
IF OP = '2' OR OP = '4'
IF CANCHG = '0'
EVAL MSG = 'You may look at this calendar but not change it.'
ELSE
IF OP = '2' AND CHGR = 0
EVAL CHGR = ROW
ENDIF
IF OP = '4'
EVAL KDATE = CURN
EVAL KTIME = KTM(ROW)
EVAL KSTMP = KSD(ROW)
KEYF | CHAIN | CALREC
IF %FOUND(OVCALP)
 | DELETE | CALREC
EVAL DCNT = DCNT + 1
ENDIF
ENDIF
ENDIF
ENDIF
 | ENDDO
IF CHGR > 0 AND DCNT = 0
EVAL KDATE = CURN
EVAL KTIME = KTM(CHGR)
EVAL KSTMP = KSD(CHGR)
EVAL EDMODE = 'C'
EXSR ADDC
ENDIF
IF DCNT > 0
EVAL MSG = %CHAR(DCNT) + ' appointment(s) deleted.'
ENDIF
 | ENDSR
FMTTM | BEGSR
EVAL TTXT = 'all day'
IF CLTIME >= 0
 | MOVE | CLTIME | W4
EVAL TTXT = %SUBST(W4:1:2) + ':' + %SUBST(W4:3:2)
ENDIF
 | ENDSR
* ---- N days, as lines in NLX ----
BLDND | BEGSR
EVAL NLN = 0
EVAL D1 = CURD
1 | DO | NDV | KK
*ISO | MOVE | D1 | KDATE
 | MOVE | KDATE | W8
EVAL WSAVE = CURD
EVAL CURD = D1
EXSR GETWKD
EVAL CURD = WSAVE
EVAL HOLNM = *BLANKS
KDATE | CHAIN(N) | HOLREC
IF %FOUND(OVHOLP)
EVAL HOLNM = '   Holiday: ' + HLNAME
ENDIF
IF NLN < 300
EVAL NLN = NLN + 1
EVAL NLX(NLN) = %TRIMR(%SUBST(DNAMES:WKD*9+1:9)) + ', ' + %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2) + '/' + %SUBST(W8:1:4) + HOLNM
EVAL NLH(NLN) = '1'
ENDIF
EVAL CNTN = 0
KEYD | SETLL | CALREC
KEYD | READE(N) | CALREC
DOW NOT %EOF(OVCALP)
EVAL CNTN = CNTN + 1
EXSR FMTTM
IF NLN < 300
EVAL NLN = NLN + 1
EVAL NLX(NLN) = '     ' + TTXT + '  ' + CLTEXT
EVAL NLH(NLN) = '0'
ENDIF
KEYD | READE(N) | CALREC
ENDDO
IF CNTN = 0 AND NLN < 300
EVAL NLN = NLN + 1
EVAL NLX(NLN) = '     (nothing scheduled)'
EVAL NLH(NLN) = '0'
ENDIF
 | ADDDUR | 1:*D | D1
 | ENDDO
 | ENDSR
NDAYVW | BEGSR
EXSR BLDND
EVAL PGNO = 0
DOW 1 = 1
EVAL NLA = *BLANKS
1 | DO | 16 | I
EVAL J = PGNO * 16 + I
EVAL *IN(60 + I) = *OFF
IF J <= NLN
EVAL NL(I) = NLX(J)
EVAL *IN(60 + I) = (NLH(J) = '1')
ENDIF
 | ENDDO
EVAL HDRID = 'CALDAYS'
EXSR HDR
EVAL NHDR = HDRLN
EVAL NTTL = %CHAR(NDV) + ' days of the calendar for ' + OWNNM
EVAL NMSG = MSG
EVAL MSG = *BLANKS
EVAL NFK = 'F1=Help  F3=Exit  F7=Page up  F8=Page down  F9=Print these days  F12=Return'
 | EXFMT | NDVR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
SELECT
WHEN *IN07 = *ON AND PGNO > 0
EVAL PGNO = PGNO - 1
WHEN *IN08 = *ON AND (PGNO + 1) * 16 < NLN
EVAL PGNO = PGNO + 1
WHEN *IN09 = *ON
EXSR PRINTN
ENDSL
ENDDO
""" + INDOFF + """
 | ENDSR
PRINTN | BEGSR
EXSR BLDND
""" + popen("%CHAR(NDV) + ' days of the calendar for ' + OWNNM") + """
1 | DO | NLN | J
""" + pl('NLX(J)') + """
 | ENDDO
""" + PCLOSE + """
 | ENDSR
* ---- the month, boxed ----
MONTHV | BEGSR
DOW 1 = 1
 | MOVE | CURN | W8
EVAL W8 = %SUBST(W8:1:6) + '01'
 | MOVE | W8 | FIRSTN
EXSR MKMON
EVAL DOTS = ' ........ '
EVAL KDATE = FIRSTN
KEYD | SETLL | CALREC
KUSER | READE(N) | CALREC
DOW NOT %EOF(OVCALP) AND CLDATE < FIRSTN + MDAYS
EVAL DY = CLDATE - FIRSTN + 1
SELECT
WHEN CLTIME < 0
IF %SUBST(DOTS(DY):1:1) = ' '
EVAL %SUBST(DOTS(DY):1:1) = '*'
ENDIF
WHEN CLTIME < 800
EVAL %SUBST(DOTS(DY):1:1) = '<'
WHEN CLTIME >= 1600
EVAL %SUBST(DOTS(DY):10:1) = '>'
OTHER
EVAL SLOT = %DIV(CLTIME:100) - 6
EVAL %SUBST(DOTS(DY):SLOT:1) = %SUBST(CLTEXT:1:1)
ENDSL
KUSER | READE(N) | CALREC
ENDDO
1 | DO | 6 | I
EVAL MDL(I) = ROWL
EVAL MVL(I) = ROWL
 | ENDDO
1 | DO | MDAYS | DY
EVAL CELL = FDOW + DY
EVAL RW = %DIV(CELL - 1:7) + 1
EVAL CC = %REM(CELL - 1:7)
EVAL WCELL = *BLANKS
IF HOL(DY) = 'H'
EVAL WCELL = 'Hol'
ENDIF
EVAL DAY2 = DY
EVAL MARK = ' '
IF FIRSTN + DY - 1 = CURN
EVAL MARK = '>'
ENDIF
EVAL %SUBST(WCELL:7:3) = MARK + %EDITC(DAY2:'Z')
EVAL %SUBST(MDL(RW):CC*11+2:10) = WCELL
EVAL %SUBST(MVL(RW):CC*11+2:10) = DOTS(DY)
 | ENDDO
EVAL HDRID = 'CALMONTH'
EXSR HDR
EVAL MHDR = HDRLN
EVAL MTTL = 'Calendar for ' + %TRIMR(OWNNM) + '     ' + %TRIM(%SUBST(MTT:5:16))
EVAL MFK = 'F1=Help  F3=Exit  F10=Next month  F11=Previous month  Cursor+Enter opens a day'
 | EXFMT | MONV
EXSR CSR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
SELECT
WHEN *IN10 = *ON
EVAL CURD = F1
 | ADDDUR | 1:*M | CURD
*ISO | MOVE | CURD | CURN
WHEN *IN11 = *ON
EVAL CURD = F1
 | SUBDUR | 1:*M | CURD
*ISO | MOVE | CURD | CURN
WHEN CSRROW >= 5 AND CSRROW <= 21 AND CSRCOL >= 2 AND CSRCOL <= 78
EVAL RW = %DIV(CSRROW - 5:3) + 1
EVAL CC = %DIV(CSRCOL - 2:11)
EVAL DY = (RW - 1) * 7 + CC + 1 - FDOW
IF DY >= 1 AND DY <= MDAYS
EVAL CURN = FIRSTN + DY - 1
*ISO | MOVE | CURN | CURD
EXSR DAYVW
ENDIF
ENDSL
ENDDO
""" + INDOFF + """
 | ENDSR
* ---- the business week, Monday to Friday, by the hour ----
WEEKV | BEGSR
DOW 1 = 1
EXSR GETWKD
EVAL MOND = CURD
EVAL WOFF = %REM(WKD + 6:7)
 | SUBDUR | WOFF:*D | MOND
EVAL WLA = *BLANKS
1 | DO | 13 | WROW
SELECT
WHEN WROW = 1
EVAL WL(WROW) = 'All day'
WHEN WROW = 2
EVAL WL(WROW) = 'Early'
WHEN WROW = 13
EVAL WL(WROW) = 'Later'
OTHER
EVAL HOUR = WROW + 5
EVAL DAY2 = HOUR
EVAL WL(WROW) = %EDITC(DAY2:'Z') + ':00'
ENDSL
1 | DO | 6 | WDAY
EVAL %SUBST(WL(WROW):(WDAY-1)*14+8:1) = '|'
 | ENDDO
 | ENDDO
EVAL WL(14) = '       +-------------+-------------+-------------+-------------+-------------+'
EVAL WCOL = *BLANKS
EVAL D1 = MOND
1 | DO | 5 | WDAY
*ISO | MOVE | D1 | KDATE
 | MOVE | KDATE | W8
EVAL %SUBST(WCOL:(WDAY-1)*14+8:14) = '| ' + %SUBST(DNAMES:WDAY*9+1:3) + ' ' + %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2)
KDATE | CHAIN(N) | HOLREC
IF %FOUND(OVHOLP)
EVAL %SUBST(WL(1):(WDAY-1)*14+9:13) = HLNAME
ENDIF
KEYD | SETLL | CALREC
KEYD | READE(N) | CALREC
DOW NOT %EOF(OVCALP)
SELECT
WHEN CLTIME < 0
EVAL WROW = 1
WHEN CLTIME < 800
EVAL WROW = 2
WHEN CLTIME >= 1800
EVAL WROW = 13
OTHER
EVAL WROW = %DIV(CLTIME:100) - 5
ENDSL
EVAL WPOS = (WDAY-1)*14+9
IF %SUBST(WL(WROW):WPOS:13) = *BLANKS
EVAL %SUBST(WL(WROW):WPOS:13) = CLTEXT
ELSE
EVAL %SUBST(WL(WROW):WPOS+12:1) = '+'
ENDIF
KEYD | READE(N) | CALREC
ENDDO
 | ADDDUR | 1:*D | D1
 | ENDDO
EVAL %SUBST(WCOL:78:1) = '|'
EVAL HDRID = 'CALWEEK'
EXSR HDR
EVAL WHDR = HDRLN
EVAL WTTL = 'Business week for ' + OWNNM
EVAL WMSG = MSG
EVAL MSG = *BLANKS
EVAL WFK = 'F1=Help  F3=Exit  F7=Previous week  F8=Next week  Cursor on a day + Enter opens it'
 | EXFMT | WEEKVR
EXSR CSR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
SELECT
WHEN *IN07 = *ON
 | SUBDUR | 7:*D | CURD
*ISO | MOVE | CURD | CURN
WHEN *IN08 = *ON
 | ADDDUR | 7:*D | CURD
*ISO | MOVE | CURD | CURN
WHEN CSRCOL >= 9 AND CSRCOL <= 77 AND CSRROW >= 4 AND CSRROW <= 18
EVAL WDAY = %DIV(CSRCOL - 9:14)
EVAL CURD = MOND
 | ADDDUR | WDAY:*D | CURD
*ISO | MOVE | CURD | CURN
EXSR DAYVW
ENDSL
ENDDO
""" + INDOFF + """
 | ENDSR
* ---- six months at a glance ----
SIXVW | BEGSR
 | MOVE | CURN | W8
EVAL W8 = %SUBST(W8:1:6) + '01'
 | MOVE | W8 | N8
*ISO | MOVE | N8 | SXD
DOW 1 = 1
EVAL SXA = *BLANKS
EVAL D2 = SXD
1 | DO | 6 | KM
EVAL BAND = %DIV(KM - 1:3)
EVAL MCOL = %REM(KM - 1:3) * 25 + 1
*ISO | MOVE | D2 | FIRSTN
EXSR MKMON
EVAL %SUBST(SX(BAND*8+1):MCOL:21) = %SUBST(MTT:5:18)
EVAL %SUBST(SX(BAND*8+2):MCOL:21) = ' Su Mo Tu We Th Fr Sa'
1 | DO | 6 | I
EVAL %SUBST(SX(BAND*8+2+I):MCOL:21) = ML(I)
 | ENDDO
 | ADDDUR | 1:*M | D2
 | ENDDO
EVAL HDRID = 'CALSIX'
EXSR HDR
EVAL SHDR = HDRLN
EVAL STTL = 'Six months of the calendar for ' + OWNNM
EVAL SFK = 'F1=Help  F3=Exit  F7=Back six months  F8=Forward six months  F12=Return'
 | EXFMT | SIXVR
IF *IN03 = *ON OR *IN12 = *ON
LEAVE
ENDIF
IF *IN07 = *ON
 | SUBDUR | 6:*M | SXD
ENDIF
IF *IN08 = *ON
 | ADDDUR | 6:*M | SXD
ENDIF
ENDDO
""" + INDOFF + """
 | ENDSR
* ---- add (EDMODE A) or change (EDMODE C) an appointment ----
ADDC | BEGSR
IF CANCHG = '0'
EVAL MSG = 'You may look at this calendar but not change it.'
ELSE
""" + SETN + """
EVAL ADATE = DTXT
EVAL AEND = *BLANKS
EVAL ATIME = *BLANKS
EVAL ATEXT = *BLANKS
EVAL AMSG = *BLANKS
EVAL *IN42 = *OFF
EVAL HDRID = 'CALADD'
IF EDMODE = 'C'
KEYF | CHAIN(N) | CALREC
IF %FOUND(OVCALP)
EVAL *IN42 = *ON
EVAL HDRID = 'CALCHANGE'
EXSR FMTTM
IF CLTIME >= 0
EVAL ATIME = TTXT
ENDIF
EVAL ATEXT = CLTEXT
ELSE
EVAL EDMODE = 'A'
ENDIF
ENDIF
EVAL ALB1 = 'Last day (optional)'
EVAL ALB2 = 'For an event that lasts several days'
IF *IN42 = *ON
EVAL ALB1 = *BLANKS
EVAL ALB2 = *BLANKS
ENDIF
DOW 1 = 1
EXSR HDR
EVAL AHDR = HDRLN
EVAL AFK = 'F1=Help   Enter=Save   F12=Cancel'
 | EXFMT | CADD
EVAL AMSG = *BLANKS
IF *IN03 = *ON OR *IN12 = *ON OR ATEXT = *BLANKS
LEAVE
ENDIF
EVAL DUE = ADATE
EXSR CHKDT
IF NERR = '1'
EVAL AMSG = 'That date is not valid.  Use M/D or M/D/YYYY.'
ITER
ENDIF
EVAL STARTV = DUEVAL
EVAL NDAY = 1
IF EDMODE = 'A' AND AEND <> *BLANKS
EVAL DUE = AEND
EXSR CHKDT
IF NERR = '1'
EVAL AMSG = 'The last day is not a valid date.'
ITER
ENDIF
EVAL ENDV = DUEVAL
IF ENDV < STARTV
EVAL AMSG = 'The last day is before the first day.'
ITER
ENDIF
*ISO | MOVE | STARTV | D1
*ISO | MOVE | ENDV | D2
D2 | SUBDUR | D1 | NDAY:*D
EVAL NDAY = NDAY + 1
IF NDAY > 31
EVAL AMSG = 'An event can last at most 31 days.'
ITER
ENDIF
ENDIF
EVAL TM = ATIME
EXSR PARSTM
IF NERR = '1'
EVAL AMSG = 'That time is not valid.  Use HH:MM, such as 14:30.'
ITER
ENDIF
IF EDMODE = 'C'
KEYF | CHAIN | CALREC
IF %FOUND(OVCALP)
 | DELETE | CALREC
ENDIF
EVAL CLUSER = OWN
EVAL CLDATE = STARTV
EVAL CLTIME = CLT
EVAL CLSTMP = KSTMP
EVAL CLTEXT = %TRIML(ATEXT)
 | WRITE | CALREC
EVAL MSG = 'Appointment changed.'
ELSE
*ISO | MOVE | STARTV | D1
1 | DO | NDAY | KK
EVAL CLUSER = OWN
*ISO | MOVE | D1 | CLDATE
EVAL CLTIME = CLT
EXSR NEWTS
EVAL CLSTMP = TS
EVAL CLTEXT = %TRIML(ATEXT)
IF NDAY > 1
EVAL CLTEXT = %TRIMR(%SUBST(CLTEXT:1:50)) + ' (' + %CHAR(KK) + '/' + %CHAR(NDAY) + ')'
ENDIF
 | WRITE | CALREC
 | ADDDUR | 1:*D | D1
 | ENDDO
EVAL MSG = 'Appointment added.'
IF NDAY > 1
EVAL MSG = 'Appointment added to ' + %CHAR(NDAY) + ' days.'
ENDIF
ENDIF
EVAL CURN = STARTV
*ISO | MOVE | CURN | CURD
EVAL PGNO = 0
LEAVE
ENDDO
EVAL *IN42 = *OFF
""" + INDOFF + """
ENDIF
 | ENDSR
""" + CHKDT + PARSETM).replace('@ARTSEL@', artsel('CS')).replace('@GETPREF@', GETPREF), hx=' DATFMT(*ISO)', dspkw='MAXDEV(*FILE)')

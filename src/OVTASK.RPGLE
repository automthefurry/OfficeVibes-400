     H DFTACTGRP(*YES)
      * OVTASK - OfficeVibes/400
     FOVTASKP   UF A E           K DISK
     FOVTASK    CF   E             WORKSTN INFDS(DSPINF)
     DPSDS            SDS
     D PGMUSR                254    263
     DDSPINF           DS
     D DSPSTS            *STATUS
     D CSRLOC                370    371B 0
     DHTS              S               Z
     DHSTMP            S             26A
     DHW8              S              8A
     DHN8              S              8  0
     DHDT              S             10A
     DHDRID            S             10A
     DHDRLN            S             78A
     DSYSNAM           S              8A
     DWNODE            S             20A
     DNLEN             S              5  0
     DTS               S               Z
     DWSTMP            S             26A
     DWDT              S             16A
     DI                S              5  0
     DJ                S              5  0
     DROW              S              5  0
     DMSG              S             74A
     DCMD              S            300A
     DCMDLEN           S             15  5 INZ(300)
     DQSRC             S            100A
     DQTXT             S            200A   VARYING
     DQLEN             S              5  0
     DKS               S               Z   DIM(10)
     DKSTMP            S               Z
     DKUSER            S             10A
     DPGNO             S              5  0
     DBASE             S              5  0
     DNMATCH           S              5  0
     DNSHOW            S              5  0
     DDCNT             S              5  0
     DOP               S              2A
     DCSRROW           S              5  0
     DCSRCOL           S              5  0
     DCSRSEL           S              5  0
     DANYOP            S              5  0
     DSEQ              S              5  0
     DLAPP             S             10A
     DLACT             S             10A
     DLTXT             S             60A
     DPACT             S              1A
     DPTXT             S            100A
     DSELUSR           S             10A
     DUNEED            S             30A
     DTTLW             S             50A
     DW8               S              8A
     DN8               S              8  0
     DDUE              S             10A
     DDLEN             S              5  0
     DP1               S              5  0
     DP2               S              5  0
     DMM               S              5  0
     DDD               S              5  0
     DYY               S              5  0
     DDUEVAL           S              8  0
     DNSTR             S              6A
     DNVAL             S              9  0
     DNERR             S              1A
     DCH               S              1A
     DPOS              S              5  0
     DDOTF             S              1A
     DUSET             S             40A
     DUNITS            S              1A
     DUWEEK            S              1A
     DUDBEG            S              4  0
     DUDEND            S              4  0
     DUZONE            S              6A
     DUOFFS            S              5A
     DUOFFZ            S              6A
     DLCASE            C                   'abcdefghijklmnopqrstuvwxyz'
     DUCASE            C                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     D                 DS
     DTLNA                          720A
     D TLN                           72A   DIM(10) OVERLAY(TLNA)
     D TLN01                         72A   OVERLAY(TLNA:1)
     D TLN02                         72A   OVERLAY(TLNA:73)
     D TLN03                         72A   OVERLAY(TLNA:145)
     D TLN04                         72A   OVERLAY(TLNA:217)
     D TLN05                         72A   OVERLAY(TLNA:289)
     D TLN06                         72A   OVERLAY(TLNA:361)
     D TLN07                         72A   OVERLAY(TLNA:433)
     D TLN08                         72A   OVERLAY(TLNA:505)
     D TLN09                         72A   OVERLAY(TLNA:577)
     D TLN10                         72A   OVERLAY(TLNA:649)
     D                 DS
     DTOPA                           20A
     D TOP                            2A   DIM(10) OVERLAY(TOPA)
     D TOP01                          2A   OVERLAY(TOPA:1)
     D TOP02                          2A   OVERLAY(TOPA:3)
     D TOP03                          2A   OVERLAY(TOPA:5)
     D TOP04                          2A   OVERLAY(TOPA:7)
     D TOP05                          2A   OVERLAY(TOPA:9)
     D TOP06                          2A   OVERLAY(TOPA:11)
     D TOP07                          2A   OVERLAY(TOPA:13)
     D TOP08                          2A   OVERLAY(TOPA:15)
     D TOP09                          2A   OVERLAY(TOPA:17)
     D TOP10                          2A   OVERLAY(TOPA:19)
     DPCT              S              5  0
     DBL               S              5  0
     DHASHES           C                   '##############################'
     DDOTS             C                   '..............................'
     DTODAY            S              8  0
     DOPENC            S              5  0
     DDONEC            S              5  0
     DLATEC            S              5  0
     DDUETXT           S             10A
     DTAIL             S             30A
     DBOX              S              4A
     DLINE             S            100A
     DCOLH             C                   'Opt  Done Pri Task'
     DFK1              C                   '2=Done  4=Delete  9=Reopen   o-
     D                                     r cursor on a task and Enter t-
     D                                     o finish it'
     DFK2              C                   'F1=Help  F3=Exit  F6=Add  F7/F-
     D                                     8=Page  F9=Print  F11=Remove f-
     D                                     inished'
     C     KEY1          KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KSTMP
     C                   EVAL      LAPP = 'TASKS'
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCTASK'
     C                   EXSR      HDR
     C                   EVAL      THDR = HDRLN
     C                   EVAL      TTTL = TTLW
     C                   EVAL      TCOL = COLH
     C                   EVAL      TMSG = MSG
     C                   EVAL      TFK1 = FK1
     C                   EVAL      TFK2 = FK2
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     TLIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 6
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 7
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EXSR      ADDT
     C                   EVAL      PGNO = 0
     C                   ITER
     C                   ENDIF
     C                   IF        *IN09 = *ON
     C                   EXSR      PRINTT
     C                   ITER
     C                   ENDIF
     C                   IF        *IN11 = *ON
     C                   EXSR      CLRDON
     C                   EVAL      PGNO = 0
     C                   ITER
     C                   ENDIF
     C                   IF        *IN07 = *ON
     C                   IF        PGNO > 0
     C                   EVAL      PGNO = PGNO - 1
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   IF        *IN08 = *ON
     C                   IF        BASE + 10 < NMATCH
     C                   EVAL      PGNO = PGNO + 1
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   EVAL      ANYOP = 0
     C     1             DO        NSHOW         ROW
     C                   IF        TOP(ROW) <> *BLANKS
     C                   EVAL      ANYOP = 1
     C                   ENDIF
     C                   ENDDO
     C                   IF        ANYOP = 0 AND CSRSEL > 0
     C                   EVAL      TOP(CSRSEL) = '2'
     C                   ENDIF
     C     1             DO        NSHOW         ROW
     C                   EVAL      OP = %TRIM(TOP(ROW))
     C                   IF        OP = '2' OR OP = '4' OR OP = '9'
     C                   EVAL      KSTMP = KS(ROW)
     C     KEY1          CHAIN     TASKREC
     C                   IF        %FOUND(OVTASKP)
     C                   SELECT
     C                   WHEN      OP = '2'
     C                   EVAL      TKSTAT = 'X'
     C                   UPDATE    TASKREC
     C                   WHEN      OP = '9'
     C                   EVAL      TKSTAT = 'O'
     C                   UPDATE    TASKREC
     C                   OTHER
     C                   DELETE    TASKREC
     C                   ENDSL
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     LOAD          BEGSR
     C                   TIME                    TS
     C                   MOVE      TS            WSTMP
     C                   EVAL      W8 = %SUBST(WSTMP:1:4) + %SUBST(WSTMP:6:2) +
     C                             %SUBST(WSTMP:9:2)
     C                   MOVE      W8            TODAY
     C                   EVAL      TLNA = *BLANKS
     C     1             DO        20            I
     C                   EVAL      *IN(60 + I) = *OFF
     C                   ENDDO
     C                   EVAL      NMATCH = 0
     C                   EVAL      OPENC = 0
     C                   EVAL      DONEC = 0
     C                   EVAL      LATEC = 0
     C                   EVAL      BASE = PGNO * 10
     C     KUSER         SETLL     TASKREC
     C     KUSER         READE(N)  TASKREC
     C                   DOW       NOT %EOF(OVTASKP)
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        TKSTAT = 'X'
     C                   EVAL      DONEC = DONEC + 1
     C                   ELSE
     C                   EVAL      OPENC = OPENC + 1
     C                   IF        TKDUE <> 0 AND TKDUE < TODAY
     C                   EVAL      LATEC = LATEC + 1
     C                   ENDIF
     C                   ENDIF
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      BOX = '[ ]'
     C                   IF        TKSTAT = 'X'
     C                   EVAL      BOX = '[X]'
     C                   ENDIF
     C                   EVAL      TAIL = *BLANKS
     C                   IF        TKDUE <> 0
     C                   MOVE      TKDUE         W8
     C                   EVAL      DUETXT = %SUBST(W8:5:2) + '/' +
     C                             %SUBST(W8:7:2) + '/' + %SUBST(W8:1:4)
     C                   SELECT
     C                   WHEN      TKSTAT <> 'X' AND TKDUE < TODAY
     C                   EVAL      TAIL = '  OVERDUE ' + DUETXT
     C                   WHEN      TKSTAT <> 'X' AND TKDUE = TODAY
     C                   EVAL      TAIL = '  due TODAY'
     C                   OTHER
     C                   EVAL      TAIL = '  due ' + DUETXT
     C                   ENDSL
     C                   ENDIF
     C                   EVAL      LINE = BOX + TKPRI + ' ' + %TRIMR(TKTEXT) +
     C                             TAIL
     C                   EVAL      TLN(ROW) = LINE
     C                   IF        TKSTAT = 'X'
     C                   EVAL      *IN(70 + ROW) = *ON
     C                   ELSE
     C                   IF        TKDUE <> 0 AND TKDUE < TODAY
     C                   EVAL      *IN(60 + ROW) = *ON
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      KS(ROW) = TKSTMP
     C                   ENDIF
     C     KUSER         READE(N)  TASKREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C                   EVAL      TTLW = %CHAR(OPENC) + ' open, ' +
     C                             %CHAR(DONEC) + ' done'
     C                   EVAL      PCT = 0
     C                   IF        OPENC + DONEC > 0
     C                   EVAL      PCT = %DIV(DONEC * 100:OPENC + DONEC)
     C                   ENDIF
     C                   EVAL      BL = %DIV(PCT * 30:100)
     C                   EVAL      TBAR = '[' + DOTS + ']'
     C                   IF        BL > 0
     C                   EVAL      %SUBST(TBAR:2:BL) = %SUBST(HASHES:1:BL)
     C                   ENDIF
     C                   EVAL      TPCT = %CHAR(PCT) + '% done'
     C                   IF        LATEC > 0
     C                   EVAL      TTLW = %TRIMR(TTLW) + ', ' + %CHAR(LATEC) +
     C                             ' OVERDUE'
     C                   ENDIF
     C                   ENDSR
     C     CLRDON        BEGSR
     C                   EVAL      DCNT = 0
     C     KUSER         SETLL     TASKREC
     C     KUSER         READE     TASKREC
     C                   DOW       NOT %EOF(OVTASKP)
     C                   IF        TKSTAT = 'X'
     C                   DELETE    TASKREC
     C                   EVAL      DCNT = DCNT + 1
     C                   ENDIF
     C     KUSER         READE     TASKREC
     C                   ENDDO
     C                   UNLOCK    OVTASKP
     C                   EVAL      MSG = %CHAR(DCNT) +
     C                             ' finished task(s) removed.'
     C                   ENDSR
     C     ADDT          BEGSR
     C                   EVAL      ATEXT = *BLANKS
     C                   EVAL      ADUE = *BLANKS
     C                   EVAL      APRI = 'M'
     C                   EVAL      AMSG = *BLANKS
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCADDTASK'
     C                   EXSR      HDR
     C                   EVAL      AHDR = HDRLN
     C                   EVAL      AFK = 'F1=Help   Enter=Save   F12=Cancel'
     C                   EXFMT     TADD
     C                   EVAL      AMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON OR ATEXT = *BLANKS
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      DUE = ADUE
     C                   EXSR      PARSED
     C                   IF        NERR = '1'
     C                   EVAL      AMSG = 'That date is not M/D or M/D/YY' +
     C                             'YY.  Try again.'
     C                   ITER
     C                   ENDIF
     C                   IF        APRI <> 'H' AND APRI <> 'L'
     C                   EVAL      APRI = 'M'
     C                   ENDIF
     C                   EVAL      TKUSER = PGMUSR
     C                   EXSR      NEWTS
     C                   EVAL      TKSTMP = TS
     C                   EVAL      TKSTAT = 'O'
     C                   EVAL      TKPRI = APRI
     C                   EVAL      TKDUE = DUEVAL
     C                   EVAL      TKTEXT = %TRIML(ATEXT)
     C                   WRITE     TASKREC
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
     C     PRINTT        BEGSR
     C                   EVAL      PACT = 'O'
     C                   EVAL      PTXT = 'Tasks for ' + PGMUSR
     C                   EXSR      PRT
     C     KUSER         SETLL     TASKREC
     C     KUSER         READE(N)  TASKREC
     C                   DOW       NOT %EOF(OVTASKP)
     C                   EVAL      BOX = '[ ]'
     C                   IF        TKSTAT = 'X'
     C                   EVAL      BOX = '[X]'
     C                   ENDIF
     C                   EVAL      TAIL = *BLANKS
     C                   IF        TKDUE <> 0
     C                   MOVE      TKDUE         W8
     C                   EVAL      DUETXT = %SUBST(W8:5:2) + '/' +
     C                             %SUBST(W8:7:2) + '/' + %SUBST(W8:1:4)
     C                   SELECT
     C                   WHEN      TKSTAT <> 'X' AND TKDUE < TODAY
     C                   EVAL      TAIL = '  OVERDUE ' + DUETXT
     C                   WHEN      TKSTAT <> 'X' AND TKDUE = TODAY
     C                   EVAL      TAIL = '  due TODAY'
     C                   OTHER
     C                   EVAL      TAIL = '  due ' + DUETXT
     C                   ENDSL
     C                   ENDIF
     C                   EVAL      LINE = BOX + TKPRI + ' ' + %TRIMR(TKTEXT) +
     C                             TAIL
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = LINE
     C                   EXSR      PRT
     C     KUSER         READE(N)  TASKREC
     C                   ENDDO
     C                   EVAL      PACT = 'C'
     C                   EXSR      PRT
     C                   EVAL      MSG = 'Printed.  See Printed output o' +
     C                             'n the main menu.'
     C                   ENDSR
      * ---- shared routines ----
     C     *INZSR        BEGSR
     C                   CALL      'OVSYSN'                             50
     C                   PARM                    SYSNAM
     C                   IF        *IN50 = *ON OR SYSNAM = *BLANKS
     C                   EVAL      SYSNAM = 'AS400'
     C                   ENDIF
     C                   EVAL      *IN50 = *OFF
     C                   EVAL      KUSER = PGMUSR
     C                   EXSR      LOADSET
     C                   ENDSR
      * ---- this person's settings: units, week start, working day, time zone
     C     LOADSET       BEGSR
     C                   EVAL      USET = 'IS08001700      +0000'
     C                   CALL      'OVGSET'                             50
     C                   PARM                    USET
     C                   EVAL      *IN50 = *OFF
     C                   EVAL      UNITS = %SUBST(USET:1:1)
     C                   EVAL      UWEEK = %SUBST(USET:2:1)
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = %SUBST(USET:3:4)
     C                   EXSR      TONUM
     C                   EVAL      UDBEG = 800
     C                   IF        NERR = '0' AND NVAL <= 2359
     C                   EVAL      UDBEG = NVAL
     C                   ENDIF
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = %SUBST(USET:7:4)
     C                   EXSR      TONUM
     C                   EVAL      UDEND = 1700
     C                   IF        NERR = '0' AND NVAL <= 2359 AND NVAL > UDBEG
     C                   EVAL      UDEND = NVAL
     C                   ENDIF
     C                   EVAL      UZONE = %SUBST(USET:11:6)
     C                   EVAL      UOFFS = %SUBST(USET:17:5)
     C                   IF        %SUBST(UOFFS:1:1) <> '+' AND
     C                             %SUBST(UOFFS:1:1) <> '-'
     C                   EVAL      UOFFS = '+0000'
     C                   ENDIF
     C                   EVAL      UOFFZ = %SUBST(UOFFS:1:3) + ':' +
     C                             %SUBST(UOFFS:4:2)
     C                   ENDSR
     C     HDR           BEGSR
     C                   TIME                    HTS
     C                   MOVE      HTS           HSTMP
     C                   EVAL      HW8 = %SUBST(HSTMP:1:4) + %SUBST(HSTMP:6:2) +
     C                             %SUBST(HSTMP:9:2)
     C                   MOVE      HW8           HN8
     C                   EVAL      HDT = %CHAR(%DIV(%REM(HN8:10000):100)) + '/'
     C                             + %CHAR(%REM(HN8:100)) + '/' +
     C                             %SUBST(HSTMP:1:4)
     C                   IF        UNITS = 'M'
     C                   EVAL      HDT = %SUBST(HSTMP:9:2) + '.' +
     C                             %SUBST(HSTMP:6:2) + '.' + %SUBST(HSTMP:1:4)
     C                   ENDIF
     C                   EVAL      HDRLN = *BLANKS
     C                   EVAL      %SUBST(HDRLN:2:10) = HDRID
     C                   EVAL      %SUBST(HDRLN:33:15) = 'OfficeVibes/400'
     C                   EVAL      NLEN = %LEN(%TRIMR(HDT))
     C                   EVAL      %SUBST(HDRLN:79-NLEN:NLEN) = %TRIMR(HDT)
     C                   ENDSR
     C     FMTDT         BEGSR
     C                   EVAL      WDT = %SUBST(WSTMP:6:2) + '/' +
     C                             %SUBST(WSTMP:9:2) + '/' + %SUBST(WSTMP:1:4) +
     C                             ' ' + %SUBST(WSTMP:12:2) + ':' +
     C                             %SUBST(WSTMP:15:2)
     C                   IF        UNITS = 'M'
     C                   EVAL      WDT = %SUBST(WSTMP:9:2) + '.' +
     C                             %SUBST(WSTMP:6:2) + '.' + %SUBST(WSTMP:1:4) +
     C                             ' ' + %SUBST(WSTMP:12:2) + ':' +
     C                             %SUBST(WSTMP:15:2)
     C                   ENDIF
     C                   ENDSR
     C     CSR           BEGSR
     C                   EVAL      CSRROW = %DIV(CSRLOC:256)
     C                   EVAL      CSRCOL = %REM(CSRLOC:256)
     C                   ENDSR
     C     NEWTS         BEGSR
     C                   TIME                    TS
     C                   EVAL      SEQ = SEQ + 1
     C                   ADDDUR    SEQ:*MS       TS
     C                   ENDSR
     C     RUNCMD        BEGSR
     C                   CALL      'QCMDEXC'                            50
     C                   PARM                    CMD
     C                   PARM                    CMDLEN
     C                   ENDSR
     C     LOGIT         BEGSR
     C                   CALL      'OVLOG'                              50
     C                   PARM                    LAPP
     C                   PARM                    LACT
     C                   PARM                    LTXT
     C                   EVAL      *IN50 = *OFF
     C                   ENDSR
     C     PRT           BEGSR
     C                   CALL      'OVPRT'                              50
     C                   PARM                    PACT
     C                   PARM                    PTXT
     C                   EVAL      *IN50 = *OFF
     C                   ENDSR
     C     LOOKUP        BEGSR
     C                   EVAL      SELUSR = *BLANKS
     C                   CALL      'OVUSRL'                             50
     C                   PARM                    SELUSR
     C                   EVAL      *IN50 = *OFF
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
     C     QUOTE         BEGSR
     C                   CLEAR                   QTXT
     C                   EVAL      QLEN = %LEN(%TRIMR(QSRC))
     C     1             DO        QLEN          I
     C                   EVAL      QTXT = QTXT + %SUBST(QSRC:I:1)
     C                   IF        %SUBST(QSRC:I:1) = ''''
     C                   EVAL      QTXT = QTXT + ''''
     C                   ENDIF
     C                   ENDDO
     C                   ENDSR
     C     TONUM         BEGSR
     C                   EVAL      NVAL = 0
     C                   EVAL      POS = 0
     C     1             DO        6             I
     C                   EVAL      CH = %SUBST(NSTR:I:1)
     C                   IF        CH = ' '
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      POS = %SCAN(CH:'0123456789')
     C                   IF        POS = 0
     C                   EVAL      NERR = '1'
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      NVAL = NVAL * 10 + POS - 1
     C                   ENDDO
     C                   IF        POS = 0
     C                   EVAL      NERR = '1'
     C                   ENDIF
     C                   ENDSR
      * ---- DUE (M/D or M/D/YYYY) into DUEVAL as YYYYMMDD ----
     C     PARSED        BEGSR
     C                   EVAL      NERR = '0'
     C                   EVAL      DUEVAL = 0
     C                   EVAL      DUE = %TRIML(DUE)
      * day.month.year with dots is read the European way round
     C                   EVAL      DOTF = '0'
     C                   IF        %SCAN('.':DUE) > 0
     C                   EVAL      DOTF = '1'
     C     '.':'/'       XLATE     DUE           DUE
     C                   ENDIF
     C                   EVAL      DLEN = %LEN(%TRIMR(DUE))
     C                   IF        DLEN > 0
     C                   EVAL      P1 = %SCAN('/':DUE)
     C                   IF        P1 < 2 OR P1 > 3 OR P1 >= DLEN
     C                   EVAL      NERR = '1'
     C                   ELSE
     C                   EVAL      NSTR = %SUBST(DUE:1:P1-1)
     C                   EXSR      TONUM
     C                   EVAL      MM = NVAL
     C                   EVAL      P2 = %SCAN('/':DUE:P1+1)
     C                   IF        P2 = 0
     C                   IF        DLEN - P1 > 2
     C                   EVAL      NERR = '1'
     C                   ELSE
     C                   EVAL      NSTR = %SUBST(DUE:P1+1:DLEN-P1)
     C                   EXSR      TONUM
     C                   EVAL      DD = NVAL
     C                   ENDIF
     C                   TIME                    TS
     C                   MOVE      TS            WSTMP
     C                   EVAL      NSTR = %SUBST(WSTMP:1:4)
     C                   EXSR      TONUM
     C                   EVAL      YY = NVAL
     C                   ELSE
     C                   IF        P2 = P1 + 1 OR P2 - P1 > 3 OR P2 >= DLEN OR
     C                             DLEN - P2 > 4
     C                   EVAL      NERR = '1'
     C                   ELSE
     C                   EVAL      NSTR = %SUBST(DUE:P1+1:P2-P1-1)
     C                   EXSR      TONUM
     C                   EVAL      DD = NVAL
     C                   EVAL      NSTR = %SUBST(DUE:P2+1:DLEN-P2)
     C                   EXSR      TONUM
     C                   EVAL      YY = NVAL
     C                   ENDIF
     C                   ENDIF
     C                   IF        NERR = '0' AND DOTF = '1'
     C                   EVAL      P1 = MM
     C                   EVAL      MM = DD
     C                   EVAL      DD = P1
     C                   ENDIF
     C                   IF        NERR = '0'
     C                   IF        YY < 100
     C                   EVAL      YY = YY + 2000
     C                   ENDIF
     C                   IF        MM < 1 OR MM > 12 OR DD < 1 OR DD > 31
     C                   EVAL      NERR = '1'
     C                   ELSE
     C                   EVAL      DUEVAL = YY * 10000 + MM * 100 + DD
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDSR

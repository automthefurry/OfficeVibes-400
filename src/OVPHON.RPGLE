     H DFTACTGRP(*YES)
      * OVPHON - OfficeVibes/400
     FOVPHONP   UF A E           K DISK
     FOVPHON    CF   E             WORKSTN INFDS(DSPINF)
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
     DPLNA                          320A
     D PLN                           32A   DIM(10) OVERLAY(PLNA)
     D PLN01                         32A   OVERLAY(PLNA:1)
     D PLN02                         32A   OVERLAY(PLNA:33)
     D PLN03                         32A   OVERLAY(PLNA:65)
     D PLN04                         32A   OVERLAY(PLNA:97)
     D PLN05                         32A   OVERLAY(PLNA:129)
     D PLN06                         32A   OVERLAY(PLNA:161)
     D PLN07                         32A   OVERLAY(PLNA:193)
     D PLN08                         32A   OVERLAY(PLNA:225)
     D PLN09                         32A   OVERLAY(PLNA:257)
     D PLN10                         32A   OVERLAY(PLNA:289)
     D                 DS
     DPOPA                           20A
     D POP                            2A   DIM(10) OVERLAY(POPA)
     D POP01                          2A   OVERLAY(POPA:1)
     D POP02                          2A   OVERLAY(POPA:3)
     D POP03                          2A   OVERLAY(POPA:5)
     D POP04                          2A   OVERLAY(POPA:7)
     D POP05                          2A   OVERLAY(POPA:9)
     D POP06                          2A   OVERLAY(POPA:11)
     D POP07                          2A   OVERLAY(POPA:13)
     D POP08                          2A   OVERLAY(POPA:15)
     D POP09                          2A   OVERLAY(POPA:17)
     D POP10                          2A   OVERLAY(POPA:19)
     DLTR              S              1A
     DK                S              5  0
     DCARDSET          S              1A   INZ('0')
     DULINE            S            140A
     DKN               S             30A   DIM(10)
     DKUNAM            S             30A
     DNTOT             S              5  0
     DEDMODE           S              1A
     DCOLH             C                   'Opt  Name               Phone'
     DFK1              C                   '2=Change  4=Delete  5=Show car-
     D                                     d   Cursor on a letter + Enter-
     D                                      jumps to it'
     DFK2              C                   'F1=Help  F3=Exit  F6=Add  F7/F-
     D                                     8=Page  F9=Print'
     C     KEY3          KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KUNAM
     C                   KFLD                    KSTMP
     C                   EVAL      LAPP = 'PHONE'
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCPHONE'
     C                   EXSR      HDR
     C                   EVAL      PHDR = HDRLN
     C                   EVAL      PTTL = TTLW
     C                   EVAL      PCOL = COLH
     C                   EVAL      PMSG = MSG
     C                   EVAL      PFK1 = FK1
     C                   EVAL      PFK2 = FK2
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     PLIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 5
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 7
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   EVAL      UNEED = %TRIML(PFND)
     C     LCASE:UCASE   XLATE     UNEED         UNEED
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        CSRROW = 4 AND CSRCOL >= 3 AND CSRCOL <= 55
     C                   EVAL      K = %DIV(CSRCOL - 3:2) + 1
     C                   EVAL      LTR = ' '
     C                   IF        K <= 26
     C                   EVAL      LTR = %SUBST(UCASE:K:1)
     C                   ENDIF
     C                   EVAL      PGNO = 0
     C                   EVAL      CARDSET = '0'
     C                   ITER
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EVAL      EDMODE = 'A'
     C                   EXSR      EDITP
     C                   EVAL      PGNO = 0
     C                   ITER
     C                   ENDIF
     C                   IF        *IN09 = *ON
     C                   EXSR      PRINTP
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
     C                   IF        POP(ROW) <> *BLANKS
     C                   EVAL      ANYOP = 1
     C                   ENDIF
     C                   ENDDO
     C                   IF        ANYOP = 0 AND CSRSEL > 0
     C                   EVAL      POP(CSRSEL) = '5'
     C                   ENDIF
     C                   EVAL      DCNT = 0
     C     1             DO        NSHOW         ROW
     C                   EVAL      OP = %TRIM(POP(ROW))
     C                   IF        OP = '2' OR OP = '4' OR OP = '5'
     C                   EVAL      KUNAM = KN(ROW)
     C                   EVAL      KSTMP = KS(ROW)
     C                   IF        OP = '5'
     C                   EXSR      SHOWC
     C                   ENDIF
     C                   IF        OP = '2'
     C                   EVAL      EDMODE = 'C'
     C                   EXSR      EDITP
     C                   EVAL      CARDSET = '0'
     C                   ENDIF
     C                   IF        OP = '4'
     C                   EVAL      CARDSET = '0'
     C     KEY3          CHAIN     PHONREC
     C                   IF        %FOUND(OVPHONP)
     C                   DELETE    PHONREC
     C                   EVAL      DCNT = DCNT + 1
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   IF        DCNT > 0
     C                   EVAL      MSG = %CHAR(DCNT) + ' entries deleted.'
     C                   EVAL      LACT = 'DELETE'
     C                   EVAL      LTXT = %CHAR(DCNT) + ' entries'
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     LOAD          BEGSR
     C                   EVAL      PLNA = *BLANKS
     C                   EVAL      NMATCH = 0
     C                   EVAL      NTOT = 0
     C                   EVAL      BASE = PGNO * 10
     C     KUSER         SETLL     PHONREC
     C     KUSER         READE(N)  PHONREC
     C                   DOW       NOT %EOF(OVPHONP)
     C                   EVAL      NTOT = NTOT + 1
     C                   EVAL      ULINE = PHNAME + ' ' + PHPHON + ' ' + PHMAIL
     C                             + ' ' + PHNOTE
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        (UNEED = *BLANKS OR
     C                             %SCAN(%TRIMR(UNEED):ULINE) > 0) AND (LTR =
     C                             ' ' OR %SUBST(PHUNAM:1:1) = LTR)
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      PLN(ROW) = %SUBST(PHNAME:1:18) + ' ' + PHPHON
     C                   EVAL      KN(ROW) = PHUNAM
     C                   EVAL      KS(ROW) = PHSTMP
     C                   ENDIF
     C                   ENDIF
     C     KUSER         READE(N)  PHONREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C                   EVAL      TTLW = %CHAR(NTOT) + ' entries'
     C                   IF        LTR <> ' '
     C                   EVAL      TTLW = %CHAR(NMATCH) +
     C                             ' names starting with ' + LTR
     C                   ENDIF
     C                   IF        CARDSET = '0'
     C                   EVAL      PCNM = 'No entry chosen'
     C                   EVAL      PCPH = *BLANKS
     C                   EVAL      PCML = *BLANKS
     C                   EVAL      PCNT = *BLANKS
     C                   IF        NSHOW > 0
     C                   EVAL      KUNAM = KN(1)
     C                   EVAL      KSTMP = KS(1)
     C                   EXSR      SHOWC
     C                   ENDIF
     C                   ENDIF
     C                   ENDSR
     C     SHOWC         BEGSR
     C     KEY3          CHAIN(N)  PHONREC
     C                   IF        %FOUND(OVPHONP)
     C                   EVAL      PCNM = PHNAME
     C                   EVAL      PCPH = PHPHON
     C                   EVAL      PCML = PHMAIL
     C                   EVAL      PCNT = PHNOTE
     C                   EVAL      CARDSET = '1'
     C                   ENDIF
     C                   ENDSR
     C     EDITP         BEGSR
     C                   EVAL      ANAME = *BLANKS
     C                   EVAL      APHONE = *BLANKS
     C                   EVAL      AEMAIL = *BLANKS
     C                   EVAL      ANOTE = *BLANKS
     C                   EVAL      HDRID = 'OFCADDPHN'
     C                   IF        EDMODE = 'C'
     C                   EVAL      HDRID = 'OFCCHGPHN'
     C     KEY3          CHAIN(N)  PHONREC
     C                   IF        %FOUND(OVPHONP)
     C                   EVAL      ANAME = PHNAME
     C                   EVAL      APHONE = PHPHON
     C                   EVAL      AEMAIL = PHMAIL
     C                   EVAL      ANOTE = PHNOTE
     C                   ENDIF
     C                   ENDIF
     C                   EXSR      HDR
     C                   EVAL      AHDR = HDRLN
     C                   EVAL      AMSG = 'Only the name is required.'
     C                   EVAL      AFK = 'Enter=Save   F12=Cancel'
     C                   EXFMT     PADD
     C                   IF        *IN03 = *OFF AND *IN12 = *OFF AND ANAME <>
     C                             *BLANKS
     C                   IF        EDMODE = 'C'
     C     KEY3          CHAIN     PHONREC
     C                   ENDIF
     C                   EVAL      PHUSER = PGMUSR
     C                   EVAL      PHNAME = %TRIML(ANAME)
     C                   EVAL      PHUNAM = PHNAME
     C     LCASE:UCASE   XLATE     PHUNAM        PHUNAM
     C                   EVAL      PHPHON = %TRIML(APHONE)
     C                   EVAL      PHMAIL = %TRIML(AEMAIL)
     C                   EVAL      PHNOTE = %TRIML(ANOTE)
     C                   IF        EDMODE = 'C' AND %FOUND(OVPHONP)
     C                   UPDATE    PHONREC
     C                   ELSE
     C                   EXSR      NEWTS
     C                   EVAL      PHSTMP = TS
     C                   WRITE     PHONREC
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
     C     PRINTP        BEGSR
     C                   EVAL      PACT = 'O'
     C                   EVAL      PTXT = 'Phone book for ' + PGMUSR
     C                   EXSR      PRT
     C     KUSER         SETLL     PHONREC
     C     KUSER         READE(N)  PHONREC
     C                   DOW       NOT %EOF(OVPHONP)
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = PHNAME + ' ' + PHPHON + ' ' + PHMAIL
     C                   EXSR      PRT
     C     KUSER         READE(N)  PHONREC
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

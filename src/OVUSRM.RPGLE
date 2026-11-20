     H DFTACTGRP(*YES)
      * OVUSRM - OfficeVibes/400
     FOVUSERP   UF A E           K DISK
     FOVUSRM    CF   E             WORKSTN INFDS(DSPINF)
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
     DULNA                          700A
     D ULN                           70A   DIM(10) OVERLAY(ULNA)
     D ULN01                         70A   OVERLAY(ULNA:1)
     D ULN02                         70A   OVERLAY(ULNA:71)
     D ULN03                         70A   OVERLAY(ULNA:141)
     D ULN04                         70A   OVERLAY(ULNA:211)
     D ULN05                         70A   OVERLAY(ULNA:281)
     D ULN06                         70A   OVERLAY(ULNA:351)
     D ULN07                         70A   OVERLAY(ULNA:421)
     D ULN08                         70A   OVERLAY(ULNA:491)
     D ULN09                         70A   OVERLAY(ULNA:561)
     D ULN10                         70A   OVERLAY(ULNA:631)
     D                 DS
     DUOPA                           20A
     D UOP                            2A   DIM(10) OVERLAY(UOPA)
     D UOP01                          2A   OVERLAY(UOPA:1)
     D UOP02                          2A   OVERLAY(UOPA:3)
     D UOP03                          2A   OVERLAY(UOPA:5)
     D UOP04                          2A   OVERLAY(UOPA:7)
     D UOP05                          2A   OVERLAY(UOPA:9)
     D UOP06                          2A   OVERLAY(UOPA:11)
     D UOP07                          2A   OVERLAY(UOPA:13)
     D UOP08                          2A   OVERLAY(UOPA:15)
     D UOP09                          2A   OVERLAY(UOPA:17)
     D UOP10                          2A   OVERLAY(UOPA:19)
     DKU               S             10A   DIM(10)
     DKUID             S             10A
     DEDMODE           S              1A
     DULINE            S             80A
     DADMT             S              5A
     DSTT              S              8A
     DNEWID            S             10A
     DCOLH             C                   'Opt  User ID    Name          -
     D                                              Department   Admin St-
     D                                     atus   Last on'
     DFK1              C                   '2=Change  4=Remove  5=Disable -
     D                                     or enable   or cursor on a use-
     D                                     r and Enter'
     DFK2              C                   'F1=Help  F3=Exit  F6=Add a use-
     D                                     r  F7/F8=Page'
     C                   EVAL      LAPP = 'USERS'
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCUSERS'
     C                   EXSR      HDR
     C                   EVAL      UHDR = HDRLN
     C                   EVAL      UTTL = TTLW
     C                   EVAL      UCOL = COLH
     C                   EVAL      UMSG = MSG
     C                   EVAL      UFK1 = FK1
     C                   EVAL      UFK2 = FK2
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     ULIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 5
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 8
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   EVAL      UNEED = %TRIML(UFND)
     C     LCASE:UCASE   XLATE     UNEED         UNEED
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EVAL      EDMODE = 'A'
     C                   EXSR      EDITU
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
     C                   IF        UOP(ROW) <> *BLANKS
     C                   EVAL      ANYOP = 1
     C                   ENDIF
     C                   ENDDO
     C                   IF        ANYOP = 0 AND CSRSEL > 0
     C                   EVAL      UOP(CSRSEL) = '2'
     C                   ENDIF
     C     1             DO        NSHOW         ROW
     C                   EVAL      OP = %TRIM(UOP(ROW))
     C                   IF        OP = '2' OR OP = '4' OR OP = '5'
     C                   EVAL      KUID = KU(ROW)
     C                   SELECT
     C                   WHEN      OP = '2'
     C                   EVAL      EDMODE = 'C'
     C                   EXSR      EDITU
     C                   WHEN      KUID = PGMUSR
     C                   EVAL      MSG = 'You cannot remove or disable y' +
     C                             'ourself.'
     C                   OTHER
     C     KUID          CHAIN     USERREC
     C                   IF        %FOUND(OVUSERP)
     C                   IF        OP = '4'
     C                   DELETE    USERREC
     C                   EVAL      LACT = 'RMVUSER'
     C                   EVAL      LTXT = KUID
     C                   EXSR      LOGIT
     C                   ELSE
     C                   IF        USSTAT = 'A'
     C                   EVAL      USSTAT = 'D'
     C                   ELSE
     C                   EVAL      USSTAT = 'A'
     C                   ENDIF
     C                   UPDATE    USERREC
     C                   EVAL      LACT = 'USRSTATUS'
     C                   EVAL      LTXT = %TRIMR(KUID) + ' is now ' + USSTAT
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   ENDIF
     C                   ENDSL
     C                   ENDIF
     C                   ENDDO
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     LOAD          BEGSR
     C                   EVAL      ULNA = *BLANKS
     C     1             DO        20            I
     C                   EVAL      *IN(60 + I) = *OFF
     C                   ENDDO
     C                   EVAL      NMATCH = 0
     C                   EVAL      BASE = PGNO * 10
     C     *LOVAL        SETLL     USERREC
     C                   READ(N)   USERREC
     C                   DOW       NOT %EOF(OVUSERP)
     C                   EVAL      ULINE = USUSER + ' ' + USNAME + ' ' + USDEPT
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        UNEED = *BLANKS OR %SCAN(%TRIMR(UNEED):ULINE)
     C                             > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      ADMT = *BLANKS
     C                   IF        USADM = 'Y'
     C                   EVAL      ADMT = 'Yes'
     C                   ENDIF
     C                   EVAL      STT = 'Active'
     C                   IF        USSTAT = 'D'
     C                   EVAL      STT = 'Disabled'
     C                   ENDIF
     C                   MOVE      USLAST        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      ULN(ROW) = USUSER + ' ' + %SUBST(USNAME:1:22)
     C                             + ' ' + %SUBST(USDEPT:1:12) + ' ' + ADMT +
     C                             ' ' + STT + ' ' + %SUBST(WDT:1:10)
     C                   IF        USSTAT = 'D'
     C                   EVAL      *IN(60 + ROW) = *ON
     C                   ENDIF
     C                   IF        USADM = 'Y'
     C                   EVAL      *IN(70 + ROW) = *ON
     C                   ENDIF
     C                   EVAL      KU(ROW) = USUSER
     C                   ENDIF
     C                   ENDIF
     C                   READ(N)   USERREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C                   EVAL      TTLW = %CHAR(NMATCH) + ' enrolled'
     C                   ENDSR
      * ---- add or change a user ----
     C     EDITU         BEGSR
     C                   EVAL      EUSER = *BLANKS
     C                   EVAL      ENAME = *BLANKS
     C                   EVAL      EDEPT = *BLANKS
     C                   EVAL      EPHON = *BLANKS
     C                   EVAL      EADM = 'N'
     C                   EVAL      ECRT = 'N'
     C                   EVAL      EPWD = *BLANKS
     C                   EVAL      EMSG = *BLANKS
     C                   EVAL      *IN40 = *OFF
     C                   EVAL      HDRID = 'OFCADDUSR'
     C                   IF        EDMODE = 'C'
     C                   EVAL      HDRID = 'OFCCHGUSR'
     C                   EVAL      *IN40 = *ON
     C     KUID          CHAIN(N)  USERREC
     C                   EVAL      EUSER = USUSER
     C                   EVAL      ENAME = USNAME
     C                   EVAL      EDEPT = USDEPT
     C                   EVAL      EPHON = USPHON
     C                   EVAL      EADM = USADM
     C                   ENDIF
     C                   DOW       1 = 1
     C                   EXSR      HDR
     C                   EVAL      EHDR = HDRLN
     C                   EVAL      EFK = 'Enter=Save   F12=Cancel'
     C                   EXFMT     UEDIT
     C                   EVAL      EMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        EADM <> 'Y'
     C                   EVAL      EADM = 'N'
     C                   ENDIF
     C                   IF        EDMODE = 'C'
     C     KUID          CHAIN     USERREC
     C                   IF        %FOUND(OVUSERP)
     C                   EVAL      USNAME = %TRIML(ENAME)
     C                   EVAL      USDEPT = %TRIML(EDEPT)
     C                   EVAL      USPHON = %TRIML(EPHON)
     C                   EVAL      USADM = EADM
     C                   UPDATE    USERREC
     C                   EVAL      MSG = 'User ' + %TRIM(KUID) + ' changed.'
     C                   EVAL      LACT = 'CHGUSER'
     C                   EVAL      LTXT = KUID
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      NEWID = %TRIML(EUSER)
     C                   IF        NEWID = *BLANKS OR ENAME = *BLANKS
     C                   EVAL      EMSG = 'The user ID and the full name ' +
     C                             'are both needed.'
     C                   ITER
     C                   ENDIF
     C                   IF        ECRT = 'Y' AND EPWD = *BLANKS
     C                   EVAL      EMSG = 'Type a password for the new si' +
     C                             'gn-on.'
     C                   ITER
     C                   ENDIF
     C     NEWID         CHAIN(N)  USERREC
     C                   IF        %FOUND(OVUSERP)
     C                   EVAL      EMSG = 'That user is already enrolled.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      USUSER = NEWID
     C                   EVAL      USNAME = %TRIML(ENAME)
     C                   EVAL      USDEPT = %TRIML(EDEPT)
     C                   EVAL      USPHON = %TRIML(EPHON)
     C                   EVAL      USADM = EADM
     C                   EVAL      USSTAT = 'A'
     C                   TIME                    USCRT
     C                   TIME                    USLAST
     C                   WRITE     USERREC
     C                   EVAL      MSG = 'User ' + %TRIM(NEWID) + ' enrolled.'
     C                   EVAL      LACT = 'ADDUSER'
     C                   EVAL      LTXT = NEWID
     C                   EXSR      LOGIT
     C                   IF        ECRT = 'Y'
     C                   EVAL      QSRC = USNAME
     C                   EXSR      QUOTE
     C                   EVAL      CMD = 'CRTUSRPRF USRPRF(' + %TRIM(NEWID) +
     C                             ') PASSWORD(' + %TRIM(EPWD) + ') TEXT(''' +
     C                             QTXT + ''') INLMNU(OFFICE/OFFICE)'
     C                   EXSR      RUNCMD
     C                   IF        *IN50 = *ON
     C                   EVAL      MSG = 'Enrolled, but the sign-on was ' +
     C                             'not created.  Check authority ' +
     C                             'and password rules.'
     C                   ELSE
     C                   EVAL      MSG = 'User ' + %TRIM(NEWID) +
     C                             ' enrolled and sign-on created.'
     C                   EVAL      LACT = 'CRTUSRPRF'
     C                   EVAL      LTXT = NEWID
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   EVAL      *IN50 = *OFF
     C                   EVAL      CMD = *BLANKS
     C                   ENDIF
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      *IN40 = *OFF
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
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

     H DFTACTGRP(*YES)
      * OVREMD - OfficeVibes/400
     FOVCALP    IF   E           K DISK
     DPSDS            SDS
     D PGMUSR                254    263
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
     DDSPSTS           S              5  0
     DCSRLOC           S              5  0
     DTGTN             S              8  0
     DTGTT             S              5  0
     DLASTT            S              5  0
     DW4               S              4A
     DNSENT            S              7  0
     C                   EVAL      LASTT = -1
     C                   DOW       1 = 1
     C                   SHTDN                                        52
     C                   IF        *IN52 = *ON
     C                   LEAVE
     C                   ENDIF
      * the minute that is fifteen minutes from now
     C                   TIME                    TS
     C                   ADDDUR    15:*MN        TS
     C                   MOVE      TS            WSTMP
     C                   EVAL      W8 = %SUBST(WSTMP:1:4) + %SUBST(WSTMP:6:2) +
     C                             %SUBST(WSTMP:9:2)
     C                   MOVE      W8            TGTN
     C                   EVAL      W4 = %SUBST(WSTMP:12:2) + %SUBST(WSTMP:15:2)
     C                   MOVE      W4            TGTT
     C                   IF        TGTT <> LASTT
     C                   EVAL      LASTT = TGTT
     C     *LOVAL        SETLL     CALREC
     C                   READ      CALREC
     C                   DOW       NOT %EOF(OVCALP)
     C                   IF        CLDATE = TGTN AND CLTIME = TGTT AND
     C                             %SUBST(CLUSER:1:1) <> '#'
     C                   EVAL      QSRC = 'Reminder: ' + %SUBST(W4:1:2) + ':' +
     C                             %SUBST(W4:3:2) + '  ' + %TRIMR(CLTEXT) +
     C                             '  (in 15 minutes)'
     C                   EXSR      QUOTE
     C                   EVAL      CMD = 'SNDMSG MSG(''' + QTXT + ''') TOUSR(' +
     C                             %TRIM(CLUSER) + ')'
     C                   EXSR      RUNCMD
     C                   EVAL      *IN50 = *OFF
     C                   EVAL      NSENT = NSENT + 1
     C                   ENDIF
     C                   READ      CALREC
     C                   ENDDO
     C                   ENDIF
     C                   EVAL      CMD = 'DLYJOB DLY(20)'
     C                   EXSR      RUNCMD
     C                   EVAL      *IN50 = *OFF
     C                   ENDDO
     C                   EVAL      *INLR = *ON
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

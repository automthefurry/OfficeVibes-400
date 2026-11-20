     H DFTACTGRP(*YES)
      * OVCAT - OfficeVibes/400
     FOVCATP    UF A E           K DISK
     FOVCAT     CF   E             WORKSTN INFDS(DSPINF)
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
     DLCASE            C                   'abcdefghijklmnopqrstuvwxyz'
     DUCASE            C                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     DHRS              S              7  0
     DFOOD             S              7  0
     DJOY              S              7  0
     DBL               S              5  0
     DSAY              S             50A
     DHASHES           C                   '####################'
     C     PGMUSR        CHAIN     CATREC
     C                   IF        NOT %FOUND(OVCATP)
     C                   EVAL      CTUSER = PGMUSR
     C                   EVAL      CTNAME = 'Whiskers'
     C                   EVAL      CTFOOD = 70
     C                   EVAL      CTJOY = 70
     C                   TIME                    CTSTMP
     C                   WRITE     CATREC
     C                   ELSE
     C                   UNLOCK    OVCATP
     C                   ENDIF
     C                   EVAL      FOOD = CTFOOD
     C                   EVAL      JOY = CTJOY
     C                   TIME                    TS
     C     TS            SUBDUR    CTSTMP        HRS:*H
     C                   IF        HRS > 0
     C                   EVAL      FOOD = FOOD - HRS * 3
     C                   EVAL      JOY = JOY - HRS * 2
     C                   ENDIF
     C                   EVAL      CNAME = CTNAME
     C                   EVAL      SAY = 'Your cat looks up as you arrive.'
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   IF        FOOD < 0
     C                   EVAL      FOOD = 0
     C                   ENDIF
     C                   IF        JOY < 0
     C                   EVAL      JOY = 0
     C                   ENDIF
     C                   IF        FOOD > 100
     C                   EVAL      FOOD = 100
     C                   ENDIF
     C                   IF        JOY > 100
     C                   EVAL      JOY = 100
     C                   ENDIF
     C                   EVAL      CA1 = '    /|_/|'
     C                   EVAL      CA3 = '    > w <'
     C                   EVAL      CA4 = '   /|   |__'
     C                   EVAL      CA5 = '  (_|___|__)~'
     C                   SELECT
     C                   WHEN      FOOD < 30
     C                   EVAL      CA2 = '   ( o.O )   MEOW!'
     C                   WHEN      JOY < 30
     C                   EVAL      CA2 = '   ( -.- )   zzz'
     C                   OTHER
     C                   EVAL      CA2 = '   ( n.n )   purr'
     C                   ENDSL
     C                   EVAL      CFOOD = *BLANKS
     C                   EVAL      BL = %DIV(FOOD:5)
     C                   IF        BL > 0
     C                   EVAL      CFOOD = %SUBST(HASHES:1:BL)
     C                   ENDIF
     C                   EVAL      CJOY = *BLANKS
     C                   EVAL      BL = %DIV(JOY:5)
     C                   IF        BL > 0
     C                   EVAL      CJOY = %SUBST(HASHES:1:BL)
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCCAT'
     C                   EXSR      HDR
     C                   EVAL      CHDR = HDRLN
     C                   EVAL      CSAY = SAY
     C                   EVAL      CMSG = *BLANKS
     C                   EVAL      CFK = 'F1=Help   F5=Pet   F6=Feed   F' +
     C                             '7=Play   Enter=Save name   F3=' + 'Exit'
     C                   EXFMT     CATSCR
     C                   SELECT
     C                   WHEN      *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   WHEN      *IN05 = *ON
     C                   EVAL      JOY = JOY + 10
     C                   EVAL      SAY = %TRIM(CNAME) +
     C                             ' purrs and leans into your hand.'
     C                   WHEN      *IN06 = *ON
     C                   IF        FOOD >= 95
     C                   EVAL      SAY = %TRIM(CNAME) +
     C                             ' sniffs the bowl and walks awa' +
     C                             'y.  Full.'
     C                   ELSE
     C                   EVAL      FOOD = FOOD + 25
     C                   EVAL      SAY = %TRIM(CNAME) + ' eats happily.'
     C                   ENDIF
     C                   WHEN      *IN07 = *ON
     C                   EVAL      JOY = JOY + 15
     C                   EVAL      FOOD = FOOD - 5
     C                   EVAL      SAY = %TRIM(CNAME) +
     C                             ' chases the cursor across the ' + 'screen.'
     C                   OTHER
     C                   EVAL      SAY = 'The name tag now says ' + %TRIM(CNAME)
     C                             + '.'
     C                   ENDSL
     C                   EXSR      SAVEC
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     SAVEC         BEGSR
     C                   IF        FOOD < 0
     C                   EVAL      FOOD = 0
     C                   ENDIF
     C                   IF        FOOD > 100
     C                   EVAL      FOOD = 100
     C                   ENDIF
     C                   IF        JOY > 100
     C                   EVAL      JOY = 100
     C                   ENDIF
     C     PGMUSR        CHAIN     CATREC
     C                   IF        %FOUND(OVCATP)
     C                   EVAL      CTNAME = %TRIML(CNAME)
     C                   EVAL      CTFOOD = FOOD
     C                   EVAL      CTJOY = JOY
     C                   TIME                    CTSTMP
     C                   UPDATE    CATREC
     C                   ENDIF
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

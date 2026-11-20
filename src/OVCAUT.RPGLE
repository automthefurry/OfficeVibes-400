     H DFTACTGRP(*YES)
      * OVCAUT - OfficeVibes/400
     FOVCAUTP   UF A E           K DISK
     FOVUSERP   IF   E           K DISK
     FOVCAUT    CF   E             WORKSTN INFDS(DSPINF)
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
     D                 DS
     DALNA                          500A
     D ALN                           50A   DIM(10) OVERLAY(ALNA)
     D ALN01                         50A   OVERLAY(ALNA:1)
     D ALN02                         50A   OVERLAY(ALNA:51)
     D ALN03                         50A   OVERLAY(ALNA:101)
     D ALN04                         50A   OVERLAY(ALNA:151)
     D ALN05                         50A   OVERLAY(ALNA:201)
     D ALN06                         50A   OVERLAY(ALNA:251)
     D ALN07                         50A   OVERLAY(ALNA:301)
     D ALN08                         50A   OVERLAY(ALNA:351)
     D ALN09                         50A   OVERLAY(ALNA:401)
     D ALN10                         50A   OVERLAY(ALNA:451)
     D                 DS
     DAOPA                           20A
     D AOP                            2A   DIM(10) OVERLAY(AOPA)
     D AOP01                          2A   OVERLAY(AOPA:1)
     D AOP02                          2A   OVERLAY(AOPA:3)
     D AOP03                          2A   OVERLAY(AOPA:5)
     D AOP04                          2A   OVERLAY(AOPA:7)
     D AOP05                          2A   OVERLAY(AOPA:9)
     D AOP06                          2A   OVERLAY(AOPA:11)
     D AOP07                          2A   OVERLAY(AOPA:13)
     D AOP08                          2A   OVERLAY(AOPA:15)
     D AOP09                          2A   OVERLAY(AOPA:17)
     D AOP10                          2A   OVERLAY(AOPA:19)
     D                 DS
     DAVA                            10A
     D AV                             1A   DIM(10) OVERLAY(AVA)
     D AV01                           1A   OVERLAY(AVA:1)
     D AV02                           1A   OVERLAY(AVA:2)
     D AV03                           1A   OVERLAY(AVA:3)
     D AV04                           1A   OVERLAY(AVA:4)
     D AV05                           1A   OVERLAY(AVA:5)
     D AV06                           1A   OVERLAY(AVA:6)
     D AV07                           1A   OVERLAY(AVA:7)
     D AV08                           1A   OVERLAY(AVA:8)
     D AV09                           1A   OVERLAY(AVA:9)
     D AV10                           1A   OVERLAY(AVA:10)
     D                 DS
     DACA                            10A
     D AC                             1A   DIM(10) OVERLAY(ACA)
     D AC01                           1A   OVERLAY(ACA:1)
     D AC02                           1A   OVERLAY(ACA:2)
     D AC03                           1A   OVERLAY(ACA:3)
     D AC04                           1A   OVERLAY(ACA:4)
     D AC05                           1A   OVERLAY(ACA:5)
     D AC06                           1A   OVERLAY(ACA:6)
     D AC07                           1A   OVERLAY(ACA:7)
     D AC08                           1A   OVERLAY(ACA:8)
     D AC09                           1A   OVERLAY(ACA:9)
     D AC10                           1A   OVERLAY(ACA:10)
     DOAV              S              1A   DIM(10)
     DOAC              S              1A   DIM(10)
     DKAU              S             10A   DIM(10)
     DKAOWN            S             10A
     DKAUSR            S             10A
     DWNAME            S             30A
     DNSAVE            S              5  0
     DCOLH             C                   'Opt  User       Name          -
     D                                                                   -
     D                                      View     Change'
     DFK1              C                   '4=Take off the list    Type Y -
     D                                     or N under View and Change'
     DFK2              C                   'F1=Help  F3=Exit  F6=Add a per-
     D                                     son  F7/F8=Page'
     C     KEYA          KLIST
     C                   KFLD                    KAOWN
     C                   KFLD                    KAUSR
     C                   EVAL      LAPP = 'CALAUTH'
     C                   EVAL      KAOWN = PGMUSR
     C                   EVAL      KAUSR = '*STD'
     C     KEYA          CHAIN(N)  AUTHREC
     C                   IF        NOT %FOUND(OVCAUTP)
     C                   EVAL      CAOWN = PGMUSR
     C                   EVAL      CAUSER = '*STD'
     C                   EVAL      CAVIEW = 'Y'
     C                   EVAL      CACHG = 'N'
     C                   WRITE     AUTHREC
     C                   ENDIF
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'CALAUTH'
     C                   EXSR      HDR
     C                   EVAL      AHDR = HDRLN
     C                   EVAL      ATTL = TTLW
     C                   EVAL      ACOL = COLH
     C                   EVAL      AMSG = MSG
     C                   EVAL      AFK1 = FK1
     C                   EVAL      AFK2 = FK2
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     AULIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 6
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 7
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EXSR      ADDA
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
     C                   EVAL      NSAVE = 0
     C     1             DO        NSHOW         ROW
     C                   EVAL      KAUSR = KAU(ROW)
     C                   IF        %TRIM(AOP(ROW)) = '4' AND KAUSR <> '*STD'
     C     KEYA          CHAIN     AUTHREC
     C                   IF        %FOUND(OVCAUTP)
     C                   DELETE    AUTHREC
     C                   EVAL      NSAVE = NSAVE + 1
     C                   ENDIF
     C                   ELSE
     C                   IF        AV(ROW) <> OAV(ROW) OR AC(ROW) <> OAC(ROW)
     C     KEYA          CHAIN     AUTHREC
     C                   IF        %FOUND(OVCAUTP)
     C                   EVAL      CAVIEW = 'N'
     C                   IF        AV(ROW) = 'Y' OR AV(ROW) = 'y'
     C                   EVAL      CAVIEW = 'Y'
     C                   ENDIF
     C                   EVAL      CACHG = 'N'
     C                   IF        AC(ROW) = 'Y' OR AC(ROW) = 'y'
     C                   EVAL      CACHG = 'Y'
     C                   EVAL      CAVIEW = 'Y'
     C                   ENDIF
     C                   UPDATE    AUTHREC
     C                   EVAL      NSAVE = NSAVE + 1
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   IF        NSAVE > 0
     C                   EVAL      MSG = 'Saved.'
     C                   EVAL      LACT = 'CALAUTH'
     C                   EVAL      LTXT = 'Changed who may see the calendar'
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     LOAD          BEGSR
     C                   EVAL      ALNA = *BLANKS
     C                   EVAL      AVA = *BLANKS
     C                   EVAL      ACA = *BLANKS
     C                   EVAL      NMATCH = 0
     C                   EVAL      BASE = PGNO * 10
     C     KAOWN         SETLL     AUTHREC
     C     KAOWN         READE(N)  AUTHREC
     C                   DOW       NOT %EOF(OVCAUTP)
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      WNAME = 'Everyone else (standard)'
     C                   IF        CAUSER <> '*STD'
     C                   EVAL      WNAME = '(no longer enrolled)'
     C     CAUSER        CHAIN     USERREC
     C                   IF        %FOUND(OVUSERP)
     C                   EVAL      WNAME = USNAME
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      ALN(ROW) = CAUSER + ' ' + WNAME
     C                   EVAL      AV(ROW) = CAVIEW
     C                   EVAL      AC(ROW) = CACHG
     C                   EVAL      OAV(ROW) = CAVIEW
     C                   EVAL      OAC(ROW) = CACHG
     C                   EVAL      KAU(ROW) = CAUSER
     C                   ENDIF
     C     KAOWN         READE(N)  AUTHREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C                   EVAL      TTLW = 'Who may use the calendar of ' +
     C                             PGMUSR
     C                   ENDSR
     C     ADDA          BEGSR
     C                   EVAL      NUSR = *BLANKS
     C                   EVAL      NVW = 'Y'
     C                   EVAL      NCG = 'N'
     C                   EVAL      NMSG = *BLANKS
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'CALADDAUTH'
     C                   EXSR      HDR
     C                   EVAL      NHDR = HDRLN
     C                   EVAL      NFK = 'F1=Help   Enter=Add   F4=List ' +
     C                             'users   F12=Cancel'
     C                   EXFMT     AUADD
     C                   EVAL      NMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN04 = *ON
     C                   EXSR      LOOKUP
     C                   IF        SELUSR <> *BLANKS
     C                   EVAL      NUSR = SELUSR
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   EVAL      KAUSR = %TRIML(NUSR)
     C     KAUSR         CHAIN     USERREC
     C                   IF        KAUSR = *BLANKS OR KAUSR = PGMUSR OR NOT
     C                             %FOUND(OVUSERP)
     C                   EVAL      NMSG = 'Type the ID of another enrolle' +
     C                             'd user.  F4 shows a list.'
     C                   ITER
     C                   ENDIF
     C     KEYA          CHAIN     AUTHREC
     C                   EVAL      CAOWN = PGMUSR
     C                   EVAL      CAUSER = KAUSR
     C                   EVAL      CAVIEW = 'N'
     C                   IF        NVW = 'Y'
     C                   EVAL      CAVIEW = 'Y'
     C                   ENDIF
     C                   EVAL      CACHG = 'N'
     C                   IF        NCG = 'Y'
     C                   EVAL      CACHG = 'Y'
     C                   EVAL      CAVIEW = 'Y'
     C                   ENDIF
     C                   IF        %FOUND(OVCAUTP)
     C                   UPDATE    AUTHREC
     C                   ELSE
     C                   WRITE     AUTHREC
     C                   ENDIF
     C                   EVAL      MSG = %TRIM(KAUSR) + ' added to the list.'
     C                   LEAVE
     C                   ENDDO
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

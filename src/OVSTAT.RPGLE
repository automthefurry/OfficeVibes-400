     H DFTACTGRP(*YES)
      * OVSTAT - OfficeVibes/400
     FOVUSERP   IF   E           K DISK
     FOVMSGP    IF   E           K DISK
     FOVMAILP   IF   E           K DISK
     FOVNOTEP   IF   E           K DISK
     FOVTASKP   IF   E           K DISK
     FOVPHONP   IF   E           K DISK
     FOVCALP    IF   E           K DISK
     FOVDOCP    IF   E           K DISK
     FOVLOGP    IF   E           K DISK
     FOVSTAT    CF   E             WORKSTN INFDS(DSPINF)
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
     DSCA                            63A
     D SC                             7A   DIM(9) OVERLAY(SCA)
     D SC1                            7A   OVERLAY(SCA:1)
     D SC2                            7A   OVERLAY(SCA:8)
     D SC3                            7A   OVERLAY(SCA:15)
     D SC4                            7A   OVERLAY(SCA:22)
     D SC5                            7A   OVERLAY(SCA:29)
     D SC6                            7A   OVERLAY(SCA:36)
     D SC7                            7A   OVERLAY(SCA:43)
     D SC8                            7A   OVERLAY(SCA:50)
     D SC9                            7A   OVERLAY(SCA:57)
     D                 DS
     DSBA                           360A
     D SB                            40A   DIM(9) OVERLAY(SBA)
     D SB1                           40A   OVERLAY(SBA:1)
     D SB2                           40A   OVERLAY(SBA:41)
     D SB3                           40A   OVERLAY(SBA:81)
     D SB4                           40A   OVERLAY(SBA:121)
     D SB5                           40A   OVERLAY(SBA:161)
     D SB6                           40A   OVERLAY(SBA:201)
     D SB7                           40A   OVERLAY(SBA:241)
     D SB8                           40A   OVERLAY(SBA:281)
     D SB9                           40A   OVERLAY(SBA:321)
     D                 DS
     DSUA                           140A
     D SU                            28A   DIM(5) OVERLAY(SUA)
     D SU1                           28A   OVERLAY(SUA:1)
     D SU2                           28A   OVERLAY(SUA:29)
     D SU3                           28A   OVERLAY(SUA:57)
     D SU4                           28A   OVERLAY(SUA:85)
     D SU5                           28A   OVERLAY(SUA:113)
     D                 DS
     DSVA                           200A
     D SV                            40A   DIM(5) OVERLAY(SVA)
     D SV1                           40A   OVERLAY(SVA:1)
     D SV2                           40A   OVERLAY(SVA:41)
     D SV3                           40A   OVERLAY(SVA:81)
     D SV4                           40A   OVERLAY(SVA:121)
     D SV5                           40A   OVERLAY(SVA:161)
     DCT               S              7  0 DIM(9)
     DUN               S             10A   DIM(50)
     DUC               S              7  0 DIM(50)
     DNU               S              5  0
     DK                S              5  0
     DMX               S              7  0
     DBL               S              5  0
     DTOPC             S              7  0
     DHASHES           C                   '##############################-
     D                                     ##########'
     C                   EVAL      CT = 0
     C                   EVAL      UC = 0
     C                   EVAL      UN = *BLANKS
     C                   EVAL      NU = 0
     C     *LOVAL        SETLL     USERREC
     C                   READ      USERREC
     C                   DOW       NOT %EOF(OVUSERP)
     C                   EVAL      CT(1) = CT(1) + 1
     C                   READ      USERREC
     C                   ENDDO
     C     *LOVAL        SETLL     MSGREC
     C                   READ      MSGREC
     C                   DOW       NOT %EOF(OVMSGP)
     C                   EVAL      CT(2) = CT(2) + 1
     C                   READ      MSGREC
     C                   ENDDO
     C     *LOVAL        SETLL     MAILREC
     C                   READ      MAILREC
     C                   DOW       NOT %EOF(OVMAILP)
     C                   EVAL      CT(3) = CT(3) + 1
     C                   READ      MAILREC
     C                   ENDDO
     C     *LOVAL        SETLL     NOTEREC
     C                   READ      NOTEREC
     C                   DOW       NOT %EOF(OVNOTEP)
     C                   EVAL      CT(4) = CT(4) + 1
     C                   READ      NOTEREC
     C                   ENDDO
     C     *LOVAL        SETLL     TASKREC
     C                   READ      TASKREC
     C                   DOW       NOT %EOF(OVTASKP)
     C                   EVAL      CT(5) = CT(5) + 1
     C                   READ      TASKREC
     C                   ENDDO
     C     *LOVAL        SETLL     PHONREC
     C                   READ      PHONREC
     C                   DOW       NOT %EOF(OVPHONP)
     C                   EVAL      CT(6) = CT(6) + 1
     C                   READ      PHONREC
     C                   ENDDO
     C     *LOVAL        SETLL     CALREC
     C                   READ      CALREC
     C                   DOW       NOT %EOF(OVCALP)
     C                   EVAL      CT(7) = CT(7) + 1
     C                   READ      CALREC
     C                   ENDDO
     C     *LOVAL        SETLL     DOCREC
     C                   READ      DOCREC
     C                   DOW       NOT %EOF(OVDOCP)
     C                   EVAL      CT(8) = CT(8) + 1
     C                   READ      DOCREC
     C                   ENDDO
     C     *LOVAL        SETLL     LOGREC
     C                   READ      LOGREC
     C                   DOW       NOT %EOF(OVLOGP)
     C                   EVAL      CT(9) = CT(9) + 1
     C                   EVAL      K = 0
     C     1             DO        NU            J
     C                   IF        UN(J) = LGUSER
     C                   EVAL      K = J
     C                   ENDIF
     C                   ENDDO
     C                   IF        K = 0 AND NU < 50
     C                   EVAL      NU = NU + 1
     C                   EVAL      UN(NU) = LGUSER
     C                   EVAL      K = NU
     C                   ENDIF
     C                   IF        K > 0
     C                   EVAL      UC(K) = UC(K) + 1
     C                   ENDIF
     C                   READ      LOGREC
     C                   ENDDO
     C                   EVAL      MX = 1
     C     1             DO        9             I
     C                   IF        CT(I) > MX
     C                   EVAL      MX = CT(I)
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      SBA = *BLANKS
     C     1             DO        9             I
     C                   EVAL      SC(I) = %CHAR(CT(I))
     C                   EVAL      BL = %DIV(CT(I) * 40:MX)
     C                   IF        CT(I) > 0 AND BL = 0
     C                   EVAL      BL = 1
     C                   ENDIF
     C                   IF        BL > 0
     C                   EVAL      SB(I) = %SUBST(HASHES:1:BL)
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      SUA = *BLANKS
     C                   EVAL      SVA = *BLANKS
     C                   EVAL      TOPC = 0
     C     1             DO        5             I
     C                   EVAL      K = 0
     C                   EVAL      MX = 0
     C     1             DO        NU            J
     C                   IF        UC(J) > MX
     C                   EVAL      MX = UC(J)
     C                   EVAL      K = J
     C                   ENDIF
     C                   ENDDO
     C                   IF        K > 0
     C                   IF        TOPC = 0
     C                   EVAL      TOPC = MX
     C                   ENDIF
     C                   EVAL      SU(I) = UN(K) + ' ' + %CHAR(MX)
     C                   EVAL      BL = %DIV(MX * 40:TOPC)
     C                   IF        BL = 0
     C                   EVAL      BL = 1
     C                   ENDIF
     C                   EVAL      SV(I) = %SUBST(HASHES:1:BL)
     C                   EVAL      UC(K) = 0
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      HDRID = 'OFCSTATS'
     C                   EXSR      HDR
     C                   EVAL      SHDR = HDRLN
     C                   EVAL      SFK = 'F1=Help   Press Enter to go back'
     C                   EVAL      SMSG = *BLANKS
     C                   EXFMT     SSTAT
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

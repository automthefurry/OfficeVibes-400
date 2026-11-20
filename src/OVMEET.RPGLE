     H DFTACTGRP(*YES)
      * OVMEET - OfficeVibes/400
     FOVCALP    UF A E           K DISK
     FOVUSERP   IF   E           K DISK
     FOVROOMP   IF   E           K DISK
     FOVMEET    CF   E             WORKSTN INFDS(DSPINF)
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
     DMPA                            60A
     D MP                            10A   DIM(6) OVERLAY(MPA)
     D MP1                           10A   OVERLAY(MPA:1)
     D MP2                           10A   OVERLAY(MPA:11)
     D MP3                           10A   OVERLAY(MPA:21)
     D MP4                           10A   OVERLAY(MPA:31)
     D MP5                           10A   OVERLAY(MPA:41)
     D MP6                           10A   OVERLAY(MPA:51)
     D                 DS
     DMCA                           444A
     D MC                            74A   DIM(6) OVERLAY(MCA)
     D MC1                           74A   OVERLAY(MCA:1)
     D MC2                           74A   OVERLAY(MCA:75)
     D MC3                           74A   OVERLAY(MCA:149)
     D MC4                           74A   OVERLAY(MCA:223)
     D MC5                           74A   OVERLAY(MCA:297)
     D MC6                           74A   OVERLAY(MCA:371)
     DTM               S              5A
     DHH               S              5  0
     DMI               S              5  0
     DCLT              S              5  0
     DXDATE            S              8A
     DPEOP             S             10A   DIM(8)
     DNPEOP            S              5  0
     DWHO              S             10A
     DKRM              S              9A
     DNCLASH           S              5  0
     DDUP              S              1A
     DBAD              S              1A
     DKDATE            S              8  0
     DMTXT             S             60A
     DDTXT             S             10A
     DW4               S              4A
     DTTXT             S              7A
     DK                S              5  0
     DHOUR             S              5  0
     C     *ENTRY        PLIST
     C                   PARM                    XDATE
     C     KEYD          KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KDATE
     C                   EVAL      LAPP = 'MEETING'
     C                   EVAL      MSUBJ = *BLANKS
     C                   EVAL      MDATE = %SUBST(XDATE:5:2) + '/' +
     C                             %SUBST(XDATE:7:2) + '/' + %SUBST(XDATE:1:4)
     C                   EVAL      MTIME = *BLANKS
     C                   EVAL      MROOM = *BLANKS
     C                   EVAL      MPA = *BLANKS
     C                   EVAL      MCA = *BLANKS
     C                   EVAL      MMSG = *BLANKS
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'CALMEET'
     C                   EXSR      HDR
     C                   EVAL      MHDR = HDRLN
     C                   EVAL      MFK = 'F1=Help   Enter=Check and book' +
     C                             '  F4=List users  F10=Book anyw' +
     C                             'ay  F12=Cancel'
     C                   EXFMT     MEET
     C                   EXSR      CSR
     C                   EVAL      MMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN04 = *ON
     C                   EXSR      LOOKUP
     C                   IF        SELUSR <> *BLANKS
     C                   EVAL      K = 0
     C                   IF        CSRROW = 11 AND CSRCOL >= 4
     C                   EVAL      K = %DIV(CSRCOL - 4:13) + 1
     C                   ENDIF
     C                   IF        K < 1 OR K > 6
     C                   EVAL      K = 1
     C                   DOW       K < 6 AND MP(K) <> *BLANKS
     C                   EVAL      K = K + 1
     C                   ENDDO
     C                   ENDIF
     C                   EVAL      MP(K) = SELUSR
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   IF        MSUBJ = *BLANKS
     C                   EVAL      MMSG = 'Type a subject for the meeting.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      DUE = MDATE
     C                   EXSR      CHKDT
     C                   IF        NERR = '1'
     C                   EVAL      MMSG = 'That date is not valid.  Use M' +
     C                             '/D or M/D/YYYY.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      TM = MTIME
     C                   EXSR      PARSTM
     C                   IF        NERR = '1' OR CLT < 0
     C                   EVAL      MMSG = 'Type a time such as 14:30.'
     C                   ITER
     C                   ENDIF
     C                   EXSR      PEOPLE
     C                   IF        BAD = '1'
     C                   ITER
     C                   ENDIF
     C                   EXSR      CLASH
     C                   IF        NCLASH > 0 AND *IN10 = *OFF
     C                   EVAL      MMSG = 'Some are busy then.  Change th' +
     C                             'e time, or press F10 to book i' +
     C                             't anyway.'
     C                   ITER
     C                   ENDIF
     C                   EXSR      BOOK
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   EVAL      *INLR = *ON
      * ---- everyone taking part: sets PEOP and NPEOP, or BAD ----
     C     PEOPLE        BEGSR
     C                   EVAL      BAD = '0'
     C                   EVAL      PEOP = *BLANKS
     C                   EVAL      NPEOP = 1
     C                   EVAL      PEOP(1) = PGMUSR
     C     1             DO        6             I
     C                   EVAL      WHO = %TRIML(MP(I))
     C     LCASE:UCASE   XLATE     WHO           WHO
     C                   IF        WHO <> *BLANKS
     C     WHO           CHAIN     USERREC
     C                   IF        NOT %FOUND(OVUSERP)
     C                   EVAL      MMSG = %TRIM(WHO) +
     C                             ' is not an office user.  F4 sh' +
     C                             'ows a list.'
     C                   EVAL      BAD = '1'
     C                   ELSE
     C                   EVAL      DUP = '0'
     C     1             DO        NPEOP         J
     C                   IF        PEOP(J) = WHO
     C                   EVAL      DUP = '1'
     C                   ENDIF
     C                   ENDDO
     C                   IF        DUP = '0'
     C                   EVAL      NPEOP = NPEOP + 1
     C                   EVAL      PEOP(NPEOP) = WHO
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      KRM = %TRIML(MROOM)
     C                   IF        KRM <> *BLANKS AND BAD = '0'
     C     KRM           CHAIN     ROOMREC
     C                   IF        NOT %FOUND(OVROOMP)
     C                   EVAL      MMSG = 'There is no conference room ' +
     C                             %TRIM(KRM) + '.'
     C                   EVAL      BAD = '1'
     C                   ELSE
     C                   EVAL      NPEOP = NPEOP + 1
     C                   EVAL      PEOP(NPEOP) = '#' + KRM
     C                   ENDIF
     C                   ENDIF
     C                   ENDSR
      * ---- anything in the same hour on any of those calendars ----
     C     CLASH         BEGSR
     C                   EVAL      MCA = *BLANKS
     C                   EVAL      NCLASH = 0
     C                   EVAL      HOUR = %DIV(CLT:100)
     C                   EVAL      KDATE = DUEVAL
     C     1             DO        NPEOP         J
     C                   EVAL      KUSER = PEOP(J)
     C     KEYD          SETLL     CALREC
     C     KEYD          READE     CALREC
     C                   DOW       NOT %EOF(OVCALP)
     C                   IF        CLTIME < 0 OR %DIV(CLTIME:100) = HOUR
     C                   EVAL      NCLASH = NCLASH + 1
     C                   IF        NCLASH <= 6
     C                   EXSR      FMTTM
     C                   EVAL      MC(NCLASH) = %TRIMR(PEOP(J)) +
     C                             ' already has  ' + TTXT + '  ' + CLTEXT
     C                   ENDIF
     C                   ENDIF
     C     KEYD          READE     CALREC
     C                   ENDDO
     C                   ENDDO
     C                   EVAL      KUSER = PGMUSR
     C                   ENDSR
     C     BOOK          BEGSR
     C                   EVAL      MTXT = %TRIMR(MSUBJ) + ' (meeting, ' +
     C                             %TRIM(PGMUSR) + ')'
     C                   IF        KRM <> *BLANKS
     C                   EVAL      MTXT = %TRIMR(MSUBJ) + ' (meeting in ' +
     C                             %TRIM(KRM) + ')'
     C                   ENDIF
     C     1             DO        NPEOP         J
     C                   EVAL      CLUSER = PEOP(J)
     C                   EVAL      CLDATE = DUEVAL
     C                   EVAL      CLTIME = CLT
     C                   EXSR      NEWTS
     C                   EVAL      CLSTMP = TS
     C                   EVAL      CLTEXT = MTXT
     C                   WRITE     CALREC
     C                   IF        J > 1 AND %SUBST(PEOP(J):1:1) <> '#'
     C                   EVAL      QSRC = %TRIM(PGMUSR) + ' invited you to: ' +
     C                             %TRIMR(MSUBJ) + ' on ' + %TRIM(MDATE) +
     C                             ' at ' + %TRIM(MTIME)
     C                   EXSR      QUOTE
     C                   EVAL      CMD = 'SNDMSG MSG(''' + QTXT + ''') TOUSR(' +
     C                             %TRIM(PEOP(J)) + ')'
     C                   EXSR      RUNCMD
     C                   EVAL      *IN50 = *OFF
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      LACT = 'MEETING'
     C                   EVAL      LTXT = %TRIMR(MSUBJ) + ', ' + %CHAR(NPEOP) +
     C                             ' calendars'
     C                   EXSR      LOGIT
     C                   ENDSR
     C     CHKDT         BEGSR
     C                   EXSR      PARSED
     C                   IF        NERR = '0' AND DUEVAL <> 0
     C     *ISO          TEST(D)                 DUEVAL                 51
     C                   IF        *IN51 = *ON
     C                   EVAL      NERR = '1'
     C                   EVAL      *IN51 = *OFF
     C                   ENDIF
     C                   ENDIF
     C                   IF        DUEVAL = 0
     C                   EVAL      NERR = '1'
     C                   ENDIF
     C                   ENDSR
      * ---- TM holds HH:MM or blank: sets CLT (-1 is all day) or NERR ----
     C     PARSTM        BEGSR
     C                   EVAL      NERR = '0'
     C                   EVAL      CLT = -1
     C                   EVAL      TM = %TRIML(TM)
     C                   IF        TM <> *BLANKS
     C                   EVAL      P1 = %SCAN(':':TM)
     C                   IF        P1 >= 2 AND P1 <= 3
     C                   EVAL      NSTR = %SUBST(TM:1:P1-1)
     C                   EXSR      TONUM
     C                   EVAL      HH = NVAL
     C                   EVAL      NSTR = %SUBST(TM:P1+1:2)
     C                   EXSR      TONUM
     C                   EVAL      MI = NVAL
     C                   ELSE
     C                   EVAL      NERR = '1'
     C                   ENDIF
     C                   IF        NERR = '0' AND (HH > 23 OR MI > 59)
     C                   EVAL      NERR = '1'
     C                   ENDIF
     C                   IF        NERR = '0'
     C                   EVAL      CLT = HH * 100 + MI
     C                   ENDIF
     C                   ENDIF
     C                   ENDSR
     C     FMTTM         BEGSR
     C                   EVAL      TTXT = 'all day'
     C                   IF        CLTIME >= 0
     C                   MOVE      CLTIME        W4
     C                   EVAL      TTXT = %SUBST(W4:1:2) + ':' + %SUBST(W4:3:2)
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

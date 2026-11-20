     H DFTACTGRP(*YES)
      * OVFIND - OfficeVibes/400
     FOVMSGP    IF   E           K DISK
     FOVMAILP   IF   E           K DISK
     FOVCALP    IF   E           K DISK
     FOVNOTEP   IF   E           K DISK
     FOVTASKP   IF   E           K DISK
     FOVPHONP   IF   E           K DISK
     FOVDOCP    IF   E           K DISK
     FOVDOCLP   IF   E           K DISK
     FOVUSERP   IF   E           K DISK
     FOVFIND    CF   E             WORKSTN INFDS(DSPINF)
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
     DFLNA                          720A
     D FLN                           72A   DIM(10) OVERLAY(FLNA)
     D FLN01                         72A   OVERLAY(FLNA:1)
     D FLN02                         72A   OVERLAY(FLNA:73)
     D FLN03                         72A   OVERLAY(FLNA:145)
     D FLN04                         72A   OVERLAY(FLNA:217)
     D FLN05                         72A   OVERLAY(FLNA:289)
     D FLN06                         72A   OVERLAY(FLNA:361)
     D FLN07                         72A   OVERLAY(FLNA:433)
     D FLN08                         72A   OVERLAY(FLNA:505)
     D FLN09                         72A   OVERLAY(FLNA:577)
     D FLN10                         72A   OVERLAY(FLNA:649)
     D                 DS
     DFOPA                           20A
     D FOP                            2A   DIM(10) OVERLAY(FOPA)
     D FOP01                          2A   OVERLAY(FOPA:1)
     D FOP02                          2A   OVERLAY(FOPA:3)
     D FOP03                          2A   OVERLAY(FOPA:5)
     D FOP04                          2A   OVERLAY(FOPA:7)
     D FOP05                          2A   OVERLAY(FOPA:9)
     D FOP06                          2A   OVERLAY(FOPA:11)
     D FOP07                          2A   OVERLAY(FOPA:13)
     D FOP08                          2A   OVERLAY(FOPA:15)
     D FOP09                          2A   OVERLAY(FOPA:17)
     D FOP10                          2A   OVERLAY(FOPA:19)
     DDTL              S            700A
     DULINE            S            700A
     DDT               S            222A   DIM(10)
     DSHOWN            S            222A
     DCOLH             C                   'Opt  Kind     Date       What'
     DFK1              C                   '5=Show the whole item   or put-
     D                                      the cursor on a result and pr-
     D                                     ess Enter'
     DFK2              C                   'F1=Help  F3=Exit  F7/F8=Page'
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCFIND'
     C                   EXSR      HDR
     C                   EVAL      FHDR = HDRLN
     C                   EVAL      FTTL = TTLW
     C                   EVAL      FCOL = COLH
     C                   EVAL      FMSG = MSG
     C                   EVAL      FFK1 = FK1
     C                   EVAL      FFK2 = FK2
     C                   EVAL      FINF = %SUBST(SHOWN:1:74)
     C                   EVAL      FIN2 = %SUBST(SHOWN:75:74)
     C                   EVAL      FIN3 = %SUBST(SHOWN:149:74)
     C                   EVAL      SHOWN = *BLANKS
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     FLIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 7
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 7
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   EVAL      UNEED = %TRIML(FFND)
     C     LCASE:UCASE   XLATE     UNEED         UNEED
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
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
     C                   IF        FOP(ROW) <> *BLANKS
     C                   EVAL      ANYOP = 1
     C                   ENDIF
     C                   ENDDO
     C                   IF        ANYOP = 0 AND CSRSEL > 0
     C                   EVAL      FOP(CSRSEL) = '5'
     C                   ENDIF
     C     1             DO        NSHOW         ROW
     C                   IF        %TRIM(FOP(ROW)) = '5' AND SHOWN = *BLANKS
     C                   EVAL      SHOWN = DT(ROW)
     C                   ENDIF
     C                   ENDDO
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     LOAD          BEGSR
     C                   EVAL      FLNA = *BLANKS
     C                   EVAL      NMATCH = 0
     C                   EVAL      BASE = PGNO * 10
     C                   EVAL      TTLW = 'Search everything.  Type what ' +
     C                             'to look for and press Enter.'
     C                   IF        UNEED <> *BLANKS
     C     *LOVAL        SETLL     MSGREC
     C                   READ      MSGREC
     C                   DOW       NOT %EOF(OVMSGP)
     C                   IF        MGTO = PGMUSR OR MGFROM = PGMUSR
     C                   MOVE      MGSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      DTL = 'From ' + %TRIMR(MGFROM) + ' to ' +
     C                             %TRIMR(MGTO) + ': ' + MGTEXT
     C                   EVAL      ULINE = DTL
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        %SCAN(%TRIMR(UNEED):ULINE) > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      FLN(ROW) = 'Message  ' + %SUBST(WDT:1:10) +
     C                             ' ' + DTL
     C                   EVAL      DT(ROW) = DTL
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   READ      MSGREC
     C                   ENDDO
     C     *LOVAL        SETLL     MAILREC
     C                   READ      MAILREC
     C                   DOW       NOT %EOF(OVMAILP)
     C                   IF        MMTO = PGMUSR OR MMFROM = PGMUSR
     C                   MOVE      MMSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      DTL = 'From ' + %TRIMR(MMFROM) + ' to ' +
     C                             %TRIMR(MMTO) + ': ' + %TRIMR(MMSUBJ) + ' / '
     C                             + %TRIMR(MMB1) + ' ' + %TRIMR(MMB2) + ' ' +
     C                             %TRIMR(MMB3) + ' ' + %TRIMR(MMB4) + ' ' +
     C                             %TRIMR(MMB5) + ' ' + %TRIMR(MMB6) + ' ' +
     C                             %TRIMR(MMB7) + ' ' + MMB8
     C                   EVAL      ULINE = DTL
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        %SCAN(%TRIMR(UNEED):ULINE) > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      FLN(ROW) = 'Mail     ' + %SUBST(WDT:1:10) +
     C                             ' ' + DTL
     C                   EVAL      DT(ROW) = DTL
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   READ      MAILREC
     C                   ENDDO
     C     KUSER         SETLL     CALREC
     C     KUSER         READE     CALREC
     C                   DOW       NOT %EOF(OVCALP)
     C                   MOVE      CLDATE        W8
     C                   EVAL      WDT = %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2) +
     C                             '/' + %SUBST(W8:1:4)
     C                   EVAL      DTL = CLTEXT
     C                   EVAL      ULINE = DTL
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        %SCAN(%TRIMR(UNEED):ULINE) > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      FLN(ROW) = 'Event    ' + %SUBST(WDT:1:10) +
     C                             ' ' + DTL
     C                   EVAL      DT(ROW) = DTL
     C                   ENDIF
     C                   ENDIF
     C     KUSER         READE     CALREC
     C                   ENDDO
     C     KUSER         SETLL     NOTEREC
     C     KUSER         READE     NOTEREC
     C                   DOW       NOT %EOF(OVNOTEP)
     C                   MOVE      NTSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      DTL = NTTEXT
     C                   EVAL      ULINE = DTL
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        %SCAN(%TRIMR(UNEED):ULINE) > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      FLN(ROW) = 'Note     ' + %SUBST(WDT:1:10) +
     C                             ' ' + DTL
     C                   EVAL      DT(ROW) = DTL
     C                   ENDIF
     C                   ENDIF
     C     KUSER         READE     NOTEREC
     C                   ENDDO
     C     KUSER         SETLL     TASKREC
     C     KUSER         READE     TASKREC
     C                   DOW       NOT %EOF(OVTASKP)
     C                   MOVE      TKSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      DTL = TKTEXT
     C                   EVAL      ULINE = DTL
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        %SCAN(%TRIMR(UNEED):ULINE) > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      FLN(ROW) = 'Task     ' + %SUBST(WDT:1:10) +
     C                             ' ' + DTL
     C                   EVAL      DT(ROW) = DTL
     C                   ENDIF
     C                   ENDIF
     C     KUSER         READE     TASKREC
     C                   ENDDO
     C     KUSER         SETLL     PHONREC
     C     KUSER         READE     PHONREC
     C                   DOW       NOT %EOF(OVPHONP)
     C                   EVAL      WDT = *BLANKS
     C                   EVAL      DTL = %TRIMR(PHNAME) + '  ' + %TRIMR(PHPHON)
     C                             + '  ' + %TRIMR(PHMAIL) + '  ' + PHNOTE
     C                   EVAL      ULINE = DTL
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        %SCAN(%TRIMR(UNEED):ULINE) > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      FLN(ROW) = 'Phone    ' + %SUBST(WDT:1:10) +
     C                             ' ' + DTL
     C                   EVAL      DT(ROW) = DTL
     C                   ENDIF
     C                   ENDIF
     C     KUSER         READE     PHONREC
     C                   ENDDO
     C     KUSER         SETLL     DOCREC
     C     KUSER         READE     DOCREC
     C                   DOW       NOT %EOF(OVDOCP)
     C                   MOVE      DCSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      DTL = %TRIMR(DCNAME) + ': ' + DCTITL
     C                   EVAL      ULINE = DTL
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        %SCAN(%TRIMR(UNEED):ULINE) > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      FLN(ROW) = 'Document ' + %SUBST(WDT:1:10) +
     C                             ' ' + DTL
     C                   EVAL      DT(ROW) = DTL
     C                   ENDIF
     C                   ENDIF
     C     KUSER         READE     DOCREC
     C                   ENDDO
     C     KUSER         SETLL     DOCLREC
     C     KUSER         READE     DOCLREC
     C                   DOW       NOT %EOF(OVDOCLP)
     C                   EVAL      WDT = *BLANKS
     C                   EVAL      DTL = %TRIMR(DLNAME) + ' line ' +
     C                             %CHAR(DLSEQ) + ': ' + DLTEXT
     C                   EVAL      ULINE = DTL
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        %SCAN(%TRIMR(UNEED):ULINE) > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      FLN(ROW) = 'Doc line ' + %SUBST(WDT:1:10) +
     C                             ' ' + DTL
     C                   EVAL      DT(ROW) = DTL
     C                   ENDIF
     C                   ENDIF
     C     KUSER         READE     DOCLREC
     C                   ENDDO
     C     *LOVAL        SETLL     USERREC
     C                   READ      USERREC
     C                   DOW       NOT %EOF(OVUSERP)
     C                   IF        USSTAT = 'A'
     C                   EVAL      WDT = *BLANKS
     C                   EVAL      DTL = %TRIMR(USUSER) + '  ' + %TRIMR(USNAME)
     C                             + '  ' + %TRIMR(USDEPT) + '  ' + USPHON
     C                   EVAL      ULINE = DTL
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        %SCAN(%TRIMR(UNEED):ULINE) > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      FLN(ROW) = 'User     ' + %SUBST(WDT:1:10) +
     C                             ' ' + DTL
     C                   EVAL      DT(ROW) = DTL
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   READ      USERREC
     C                   ENDDO
     C                   EVAL      TTLW = 'Search everything - ' + %CHAR(NMATCH)
     C                             + ' found'
     C                   ENDIF
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
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

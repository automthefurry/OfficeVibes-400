     H DFTACTGRP(*YES)
      * OVNOTE - OfficeVibes/400
     FOVNOTEP   UF A E           K DISK
     FOVNOTE    CF   E             WORKSTN INFDS(DSPINF)
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
     DNLNA                          660A
     D NLN                           66A   DIM(10) OVERLAY(NLNA)
     D NLN01                         66A   OVERLAY(NLNA:1)
     D NLN02                         66A   OVERLAY(NLNA:67)
     D NLN03                         66A   OVERLAY(NLNA:133)
     D NLN04                         66A   OVERLAY(NLNA:199)
     D NLN05                         66A   OVERLAY(NLNA:265)
     D NLN06                         66A   OVERLAY(NLNA:331)
     D NLN07                         66A   OVERLAY(NLNA:397)
     D NLN08                         66A   OVERLAY(NLNA:463)
     D NLN09                         66A   OVERLAY(NLNA:529)
     D NLN10                         66A   OVERLAY(NLNA:595)
     D                 DS
     DNOPA                           20A
     D NOP                            2A   DIM(10) OVERLAY(NOPA)
     D NOP01                          2A   OVERLAY(NOPA:1)
     D NOP02                          2A   OVERLAY(NOPA:3)
     D NOP03                          2A   OVERLAY(NOPA:5)
     D NOP04                          2A   OVERLAY(NOPA:7)
     D NOP05                          2A   OVERLAY(NOPA:9)
     D NOP06                          2A   OVERLAY(NOPA:11)
     D NOP07                          2A   OVERLAY(NOPA:13)
     D NOP08                          2A   OVERLAY(NOPA:15)
     D NOP09                          2A   OVERLAY(NOPA:17)
     D NOP10                          2A   OVERLAY(NOPA:19)
     DLINE             S             70A
     DULINE            S             70A
     DEDMODE           S              1A
     DCOLH             C                   'Opt  When              Note'
     DFK1              C                   '2=Change  4=Delete   or put th-
     D                                     e cursor on a note and press E-
     D                                     nter'
     DFK2              C                   'F1=Help  F3=Exit  F6=Add  F7/F-
     D                                     8=Page  F9=Print'
     C     KEY1          KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KSTMP
     C                   EVAL      LAPP = 'NOTES'
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCNOTE'
     C                   EXSR      HDR
     C                   EVAL      NHDR = HDRLN
     C                   EVAL      NTTL = TTLW
     C                   EVAL      NCOL = COLH
     C                   EVAL      NMSG = MSG
     C                   EVAL      NFK1 = FK1
     C                   EVAL      NFK2 = FK2
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     NLIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 6
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 9
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   EVAL      UNEED = %TRIML(NFND)
     C     LCASE:UCASE   XLATE     UNEED         UNEED
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EVAL      EDMODE = 'A'
     C                   EXSR      EDITN
     C                   EVAL      PGNO = 0
     C                   ITER
     C                   ENDIF
     C                   IF        *IN09 = *ON
     C                   EXSR      PRINTN
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
     C                   IF        NOP(ROW) <> *BLANKS
     C                   EVAL      ANYOP = 1
     C                   ENDIF
     C                   ENDDO
     C                   IF        ANYOP = 0 AND CSRSEL > 0
     C                   EVAL      NOP(CSRSEL) = '2'
     C                   ENDIF
     C                   EVAL      DCNT = 0
     C     1             DO        NSHOW         ROW
     C                   EVAL      OP = %TRIM(NOP(ROW))
     C                   IF        OP = '2' OR OP = '4'
     C                   EVAL      KSTMP = KS(ROW)
     C                   IF        OP = '2'
     C                   EVAL      EDMODE = 'C'
     C                   EXSR      EDITN
     C                   ELSE
     C     KEY1          CHAIN     NOTEREC
     C                   IF        %FOUND(OVNOTEP)
     C                   DELETE    NOTEREC
     C                   EVAL      DCNT = DCNT + 1
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   IF        DCNT > 0
     C                   EVAL      MSG = %CHAR(DCNT) + ' note(s) deleted.'
     C                   EVAL      LACT = 'DELETE'
     C                   EVAL      LTXT = %CHAR(DCNT) + ' note(s)'
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     LOAD          BEGSR
     C                   EVAL      NLNA = *BLANKS
     C                   EVAL      NMATCH = 0
     C                   EVAL      BASE = PGNO * 10
     C     KUSER         SETLL     NOTEREC
     C     KUSER         READE(N)  NOTEREC
     C                   DOW       NOT %EOF(OVNOTEP)
     C                   MOVE      NTSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      LINE = WDT + '  ' + NTTEXT
     C                   EVAL      ULINE = LINE
     C     LCASE:UCASE   XLATE     ULINE         ULINE
     C                   IF        UNEED = *BLANKS OR %SCAN(%TRIMR(UNEED):ULINE)
     C                             > 0
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      NLN(ROW) = LINE
     C                   EVAL      KS(ROW) = NTSTMP
     C                   ENDIF
     C                   ENDIF
     C     KUSER         READE(N)  NOTEREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C                   EVAL      TTLW = %CHAR(NMATCH) + ' note(s) on the pad'
     C                   ENDSR
     C     EDITN         BEGSR
     C                   EVAL      ENOTE = *BLANKS
     C                   IF        EDMODE = 'C'
     C     KEY1          CHAIN(N)  NOTEREC
     C                   IF        %FOUND(OVNOTEP)
     C                   EVAL      ENOTE = NTTEXT
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCWRTNOTE'
     C                   EXSR      HDR
     C                   EVAL      EHDR = HDRLN
     C                   EVAL      EFK = 'F1=Help   Enter=Save   F12=Cancel'
     C                   EVAL      EMSG = *BLANKS
     C                   EXFMT     NEDIT
     C                   IF        *IN03 = *OFF AND *IN12 = *OFF AND ENOTE <>
     C                             *BLANKS
     C                   IF        EDMODE = 'C'
     C     KEY1          CHAIN     NOTEREC
     C                   ENDIF
     C                   IF        EDMODE = 'C' AND %FOUND(OVNOTEP)
     C                   EVAL      NTTEXT = %TRIML(ENOTE)
     C                   UPDATE    NOTEREC
     C                   ELSE
     C                   EVAL      NTUSER = PGMUSR
     C                   EXSR      NEWTS
     C                   EVAL      NTSTMP = TS
     C                   EVAL      NTTEXT = %TRIML(ENOTE)
     C                   WRITE     NOTEREC
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
     C     PRINTN        BEGSR
     C                   EVAL      PACT = 'O'
     C                   EVAL      PTXT = 'Notes for ' + PGMUSR
     C                   EXSR      PRT
     C     KUSER         SETLL     NOTEREC
     C     KUSER         READE(N)  NOTEREC
     C                   DOW       NOT %EOF(OVNOTEP)
     C                   MOVE      NTSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = WDT + '  ' + NTTEXT
     C                   EXSR      PRT
     C     KUSER         READE(N)  NOTEREC
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

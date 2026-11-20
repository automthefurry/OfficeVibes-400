     H DFTACTGRP(*YES)
      * OVGRPM - OfficeVibes/400
     FOVGRPP    UF A E           K DISK
     FOVUSERP   IF   E           K DISK
     FOVGRPM    CF   E             WORKSTN INFDS(DSPINF)
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
     DGLNA                          700A
     D GLN                           70A   DIM(10) OVERLAY(GLNA)
     D GLN01                         70A   OVERLAY(GLNA:1)
     D GLN02                         70A   OVERLAY(GLNA:71)
     D GLN03                         70A   OVERLAY(GLNA:141)
     D GLN04                         70A   OVERLAY(GLNA:211)
     D GLN05                         70A   OVERLAY(GLNA:281)
     D GLN06                         70A   OVERLAY(GLNA:351)
     D GLN07                         70A   OVERLAY(GLNA:421)
     D GLN08                         70A   OVERLAY(GLNA:491)
     D GLN09                         70A   OVERLAY(GLNA:561)
     D GLN10                         70A   OVERLAY(GLNA:631)
     D                 DS
     DGOPA                           20A
     D GOP                            2A   DIM(10) OVERLAY(GOPA)
     D GOP01                          2A   OVERLAY(GOPA:1)
     D GOP02                          2A   OVERLAY(GOPA:3)
     D GOP03                          2A   OVERLAY(GOPA:5)
     D GOP04                          2A   OVERLAY(GOPA:7)
     D GOP05                          2A   OVERLAY(GOPA:9)
     D GOP06                          2A   OVERLAY(GOPA:11)
     D GOP07                          2A   OVERLAY(GOPA:13)
     D GOP08                          2A   OVERLAY(GOPA:15)
     D GOP09                          2A   OVERLAY(GOPA:17)
     D GOP10                          2A   OVERLAY(GOPA:19)
     DPREVG            S             10A
     DWNAME            S             30A
     DKGN              S             10A   DIM(10)
     DKGU              S             10A   DIM(10)
     DKGRP             S             10A
     DKMBR             S             10A
     DCOLH             C                   'Opt  Group          Member    -
     D                                      Name'
     DFK1              C                   '4=Remove member'
     DFK2              C                   'F1=Help  F3=Exit  F6=Add a mem-
     D                                     ber  F7/F8=Page'
     C     KEYG          KLIST
     C                   KFLD                    KGRP
     C                   KFLD                    KMBR
     C                   EVAL      LAPP = 'GROUPS'
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCGROUPS'
     C                   EXSR      HDR
     C                   EVAL      GHDR = HDRLN
     C                   EVAL      GTTL = TTLW
     C                   EVAL      GCOL = COLH
     C                   EVAL      GMSG = MSG
     C                   EVAL      GFK1 = FK1
     C                   EVAL      GFK2 = FK2
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     GLIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 5
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 8
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EXSR      ADDG
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
     C     1             DO        NSHOW         ROW
     C                   IF        %TRIM(GOP(ROW)) = '4'
     C                   EVAL      KGRP = KGN(ROW)
     C                   EVAL      KMBR = KGU(ROW)
     C     KEYG          CHAIN     GRPREC
     C                   IF        %FOUND(OVGRPP)
     C                   DELETE    GRPREC
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     LOAD          BEGSR
     C                   EVAL      GLNA = *BLANKS
     C                   EVAL      PREVG = *BLANKS
     C                   EVAL      NMATCH = 0
     C                   EVAL      BASE = PGNO * 10
     C     *LOVAL        SETLL     GRPREC
     C                   READ(N)   GRPREC
     C                   DOW       NOT %EOF(OVGRPP)
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      WNAME = *BLANKS
     C     GRUSER        CHAIN     USERREC
     C                   IF        %FOUND(OVUSERP)
     C                   EVAL      WNAME = USNAME
     C                   ENDIF
     C                   IF        GRNAME <> PREVG OR ROW = 1
     C                   EVAL      GLN(ROW) = GRNAME + ' +-- ' + GRUSER + ' ' +
     C                             WNAME
     C                   ELSE
     C                   EVAL      GLN(ROW) = '           +-- ' + GRUSER + ' ' +
     C                             WNAME
     C                   ENDIF
     C                   EVAL      KGN(ROW) = GRNAME
     C                   EVAL      KGU(ROW) = GRUSER
     C                   ENDIF
     C                   EVAL      PREVG = GRNAME
     C                   READ(N)   GRPREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C                   EVAL      TTLW = %CHAR(NMATCH) + ' group member(s)'
     C                   ENDSR
     C     ADDG          BEGSR
     C                   EVAL      AGRP = *BLANKS
     C                   EVAL      AUSR = *BLANKS
     C                   EVAL      AMSG = 'Mail or a message sent to the ' +
     C                             'group name goes to every membe' + 'r.'
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCADDGRP'
     C                   EXSR      HDR
     C                   EVAL      AHDR = HDRLN
     C                   EVAL      AFK = 'F1=Help   Enter=Add   F4=List ' +
     C                             'users   F12=Cancel'
     C                   EXFMT     GADD
     C                   EVAL      AMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN04 = *ON
     C                   EXSR      LOOKUP
     C                   IF        SELUSR <> *BLANKS
     C                   EVAL      AUSR = SELUSR
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   EVAL      KGRP = %TRIML(AGRP)
     C                   EVAL      KMBR = %TRIML(AUSR)
     C                   IF        KGRP = *BLANKS OR KMBR = *BLANKS OR KGRP =
     C                             'ALL'
     C                   EVAL      AMSG = 'Type a group name (not ALL) an' +
     C                             'd a user.'
     C                   ITER
     C                   ENDIF
     C     KMBR          CHAIN     USERREC
     C                   IF        NOT %FOUND(OVUSERP)
     C                   EVAL      AMSG = 'That user is not enrolled.  Pr' +
     C                             'ess F4 for a list.'
     C                   ITER
     C                   ENDIF
     C     KEYG          CHAIN(N)  GRPREC
     C                   IF        NOT %FOUND(OVGRPP)
     C                   EVAL      GRNAME = KGRP
     C                   EVAL      GRUSER = KMBR
     C                   WRITE     GRPREC
     C                   EVAL      LACT = 'ADDGROUP'
     C                   EVAL      LTXT = %TRIMR(KGRP) + ' ' + KMBR
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   EVAL      AMSG = %TRIM(KMBR) + ' added to ' +
     C                             %TRIM(KGRP) + '.  Add another, or F12.'
     C                   EVAL      AUSR = *BLANKS
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

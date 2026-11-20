     H DFTACTGRP(*YES)
      * OVROOM - OfficeVibes/400
     FOVROOMP   UF A E           K DISK
     FOVCALP    IF   E           K DISK
     FOVUSERP   IF   E           K DISK
     FOVROOM    CF   E             WORKSTN INFDS(DSPINF)
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
     DRLNA                          720A
     D RLN                           72A   DIM(10) OVERLAY(RLNA)
     D RLN01                         72A   OVERLAY(RLNA:1)
     D RLN02                         72A   OVERLAY(RLNA:73)
     D RLN03                         72A   OVERLAY(RLNA:145)
     D RLN04                         72A   OVERLAY(RLNA:217)
     D RLN05                         72A   OVERLAY(RLNA:289)
     D RLN06                         72A   OVERLAY(RLNA:361)
     D RLN07                         72A   OVERLAY(RLNA:433)
     D RLN08                         72A   OVERLAY(RLNA:505)
     D RLN09                         72A   OVERLAY(RLNA:577)
     D RLN10                         72A   OVERLAY(RLNA:649)
     D                 DS
     DROPA                           20A
     D ROP                            2A   DIM(10) OVERLAY(ROPA)
     D ROP01                          2A   OVERLAY(ROPA:1)
     D ROP02                          2A   OVERLAY(ROPA:3)
     D ROP03                          2A   OVERLAY(ROPA:5)
     D ROP04                          2A   OVERLAY(ROPA:7)
     D ROP05                          2A   OVERLAY(ROPA:9)
     D ROP06                          2A   OVERLAY(ROPA:11)
     D ROP07                          2A   OVERLAY(ROPA:13)
     D ROP08                          2A   OVERLAY(ROPA:15)
     D ROP09                          2A   OVERLAY(ROPA:17)
     D ROP10                          2A   OVERLAY(ROPA:19)
     DXOWN             S             10A
     DXDATE            S              8A
     DSAVOWN           S             10A
     DKRMS             S              9A   DIM(10)
     DISADM            S              1A
     DDATEN            S              8  0
     DBOOK             S              5  0
     DKDATE            S              8  0
     DKRM              S              9A
     DSEATS            S              3  0
     DCOLH             C                   'Opt  Room      Name           -
     D                                                     Seats  Booked -
     D                                     that day'
     DFK1              C                   '5=View and book the room sched-
     D                                     ule    4=Delete (administrator-
     D                                     s)'
     DFK2              C                   'F1=Help  F3=Exit  F6=Add a roo-
     D                                     m (administrators)  F7/F8=Page'
     C     *ENTRY        PLIST
     C                   PARM                    XOWN
     C                   PARM                    XDATE
     C     KEYD          KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KDATE
     C                   EVAL      LAPP = 'ROOMS'
     C                   EVAL      SAVOWN = XOWN
     C                   MOVE      XDATE         DATEN
     C     PGMUSR        CHAIN(N)  USERREC
     C                   EVAL      ISADM = 'N'
     C                   IF        %FOUND(OVUSERP)
     C                   EVAL      ISADM = USADM
     C                   ENDIF
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'CALROOMS'
     C                   EXSR      HDR
     C                   EVAL      RHDR = HDRLN
     C                   EVAL      RTTL = TTLW
     C                   EVAL      RCOL = COLH
     C                   EVAL      RMSG = MSG
     C                   EVAL      RFK1 = FK1
     C                   EVAL      RFK2 = FK2
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     RMLIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 5
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 7
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EXSR      ADDR
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
     C                   IF        ROP(ROW) <> *BLANKS
     C                   EVAL      ANYOP = 1
     C                   ENDIF
     C                   ENDDO
     C                   IF        ANYOP = 0 AND CSRSEL > 0
     C                   EVAL      ROP(CSRSEL) = '5'
     C                   ENDIF
     C     1             DO        NSHOW         ROW
     C                   EVAL      OP = %TRIM(ROP(ROW))
     C                   IF        OP = '5' AND XOWN = SAVOWN
     C                   EVAL      XOWN = '#' + KRMS(ROW)
     C                   ENDIF
     C                   IF        OP = '4'
     C                   IF        ISADM <> 'Y'
     C                   EVAL      MSG = 'Only office administrators can' +
     C                             ' do that.'
     C                   ELSE
     C     KRMS(ROW)     CHAIN     ROOMREC
     C                   IF        %FOUND(OVROOMP)
     C                   DELETE    ROOMREC
     C                   EVAL      MSG = 'Room deleted.  Its old booking' +
     C                             's stay on its calendar.'
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   IF        XOWN <> SAVOWN
     C                   LEAVE
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     LOAD          BEGSR
     C                   EVAL      RLNA = *BLANKS
     C                   EVAL      NMATCH = 0
     C                   EVAL      BASE = PGNO * 10
     C     *LOVAL        SETLL     ROOMREC
     C                   READ(N)   ROOMREC
     C                   DOW       NOT %EOF(OVROOMP)
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      BOOK = 0
     C                   EVAL      KUSER = '#' + RMID
     C                   EVAL      KDATE = DATEN
     C     KEYD          SETLL     CALREC
     C     KEYD          READE     CALREC
     C                   DOW       NOT %EOF(OVCALP)
     C                   EVAL      BOOK = BOOK + 1
     C     KEYD          READE     CALREC
     C                   ENDDO
     C                   EVAL      RLN(ROW) = RMID + ' ' + RMNAME + ' ' +
     C                             %EDITC(RMSEAT:'Z') + '    ' + %CHAR(BOOK)
     C                   EVAL      KRMS(ROW) = RMID
     C                   ENDIF
     C                   READ(N)   ROOMREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C                   EVAL      KUSER = PGMUSR
     C                   EVAL      TTLW = %CHAR(NMATCH) +
     C                             ' room(s).  Bookings are for ' +
     C                             %SUBST(XDATE:5:2) + '/' + %SUBST(XDATE:7:2) +
     C                             '/' + %SUBST(XDATE:1:4)
     C                   ENDSR
     C     ADDR          BEGSR
     C                   IF        ISADM <> 'Y'
     C                   EVAL      MSG = 'Only office administrators can' +
     C                             ' do that.'
     C                   ELSE
     C                   EVAL      ARID = *BLANKS
     C                   EVAL      ARNM = *BLANKS
     C                   EVAL      ARST = *BLANKS
     C                   EVAL      AMSG = *BLANKS
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'CALADDROOM'
     C                   EXSR      HDR
     C                   EVAL      AHDR = HDRLN
     C                   EVAL      AFK = 'F1=Help   Enter=Add   F12=Cancel'
     C                   EXFMT     RMADD
     C                   EVAL      AMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      KRM = %TRIML(ARID)
     C                   IF        KRM = *BLANKS OR ARNM = *BLANKS
     C                   EVAL      AMSG = 'Type a room code and a name.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = %TRIML(ARST)
     C                   EXSR      TONUM
     C                   IF        NERR = '1' AND ARST <> *BLANKS
     C                   EVAL      AMSG = 'Seats must be a number.'
     C                   ITER
     C                   ENDIF
     C     KRM           CHAIN     ROOMREC
     C                   IF        %FOUND(OVROOMP)
     C                   EVAL      AMSG = 'There is already a room ' +
     C                             %TRIM(KRM) + '.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      RMID = KRM
     C                   EVAL      RMNAME = %TRIML(ARNM)
     C                   EVAL      RMSEAT = 0
     C                   IF        NERR = '0'
     C                   EVAL      RMSEAT = NVAL
     C                   ENDIF
     C                   WRITE     ROOMREC
     C                   EVAL      MSG = 'Room ' + %TRIM(KRM) +
     C                             ' added.  Its calendar is #' + %TRIM(KRM) +
     C                             '.'
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
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

     H DFTACTGRP(*YES)
      * OVADM - OfficeVibes/400
     FOVUSERP   IF   E           K DISK
     FOVMSGP    UF A E           K DISK
     FOVMAILP   UF A E           K DISK
     FOVLOGP    UF A E           K DISK
     FOVADM     CF   E             WORKSTN INFDS(DSPINF)
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
     DSEL              S              3A
     DSELN             S              5  0
     DPGMNAM           S             10A
     DDAYS1            S              5  0
     DDAYS2            S              5  0
     C                   EVAL      LAPP = 'ADMIN'
     C     PGMUSR        CHAIN     USERREC
     C                   IF        NOT %FOUND(OVUSERP) OR USADM <> 'Y'
     C                   EVAL      *INLR = *ON
     C                   RETURN
     C                   ENDIF
     C                   DOW       *IN03 = *OFF
     C                   EVAL      HDRID = 'OFCADM'
     C                   EXSR      HDR
     C                   EVAL      AHDR = HDRLN
     C                   EVAL      ABAR = *BLANKS
     C                   EVAL      %SUBST(ABAR:27:25) =
     C                             'A D M I N I S T R A T O R'
     C                   TIME                    TS
     C                   MOVE      TS            WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      AINF1 = 'Signed on as ' + %TRIM(PGMUSR) +
     C                             ' on ' + %TRIM(SYSNAM) + ' at ' + WDT
     C                   EVAL      ASEL = *BLANKS
     C                   EVAL      AMSG = MSG
     C                   EVAL      AFK = 'F1=Help  F3=Exit   Type a numb' +
     C                             'er, or put the cursor on a lin' +
     C                             'e, and press Enter'
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     AMENU
     C                   EXSR      CSR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      SEL = %TRIML(ASEL)
     C                   EVAL      SELN = 0
     C                   IF        SEL = *BLANKS
     C                   IF        CSRROW >= 6 AND CSRROW <= 18
     C                   EVAL      SELN = CSRROW - 5
     C                   ENDIF
     C                   ELSE
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = SEL
     C                   EXSR      TONUM
     C                   EVAL      SELN = NVAL
     C                   IF        NERR = '1'
     C                   EVAL      SELN = 999
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      PGMNAM = *BLANKS
     C                   EVAL      CMD = *BLANKS
     C                   SELECT
     C                   WHEN      SELN = 0
     C                   ITER
     C                   WHEN      SELN = 1
     C                   EVAL      PGMNAM = 'OVUSRM'
     C                   WHEN      SELN = 2
     C                   EVAL      PGMNAM = 'OVGRPM'
     C                   WHEN      SELN = 3
     C                   EVAL      PGMNAM = 'OVLOGV'
     C                   WHEN      SELN = 4
     C                   EVAL      PGMNAM = 'OVSTAT'
     C                   WHEN      SELN = 5
     C                   EXSR      PURGE
     C                   WHEN      SELN = 6
     C                   EXSR      NOTICE
     C                   WHEN      SELN = 7
     C                   EVAL      CMD = 'DSPSYSSTS'
     C                   WHEN      SELN = 8
     C                   EVAL      CMD = 'WRKACTJOB'
     C                   WHEN      SELN = 9
     C                   EVAL      CMD = 'WRKDSKSTS'
     C                   WHEN      SELN = 10
     C                   EVAL      CMD = 'WRKSPLF SELECT(*ALL)'
     C                   WHEN      SELN = 11
     C                   EVAL      CMD = 'DSPMSG MSGQ(QSYSOPR)'
     C                   WHEN      SELN = 12
     C                   EXSR      REMON
     C                   WHEN      SELN = 13
     C                   EXSR      REMOFF
     C                   OTHER
     C                   EVAL      MSG = 'That is not one of the choices.'
     C                   ENDSL
     C                   IF        PGMNAM <> *BLANKS
     C                   CALL      PGMNAM                               50
     C                   IF        *IN50 = *ON
     C                   EVAL      MSG = 'Program ' + %TRIM(PGMNAM) +
     C                             ' could not be run.'
     C                   ENDIF
     C                   EVAL      *IN50 = *OFF
     C                   ENDIF
     C                   IF        CMD <> *BLANKS
     C                   EXSR      RUNCMD
     C                   IF        *IN50 = *ON
     C                   EVAL      MSG = 'That command could not be run.' +
     C                             '  You may lack authority.'
     C                   ENDIF
     C                   EVAL      *IN50 = *OFF
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *INLR = *ON
      * ---- delete old items ----
      * ---- the reminder service is a batch job called OVREMIND ----
     C     REMON         BEGSR
     C                   EVAL      CMD = 'SBMJOB CMD(CALL PGM(OFFICE/OVR' +
     C                             'EMD)) JOB(OVREMIND) JOBQ(QSYSN' +
     C                             'OMAX) INLLIBL(*CURRENT)'
     C                   EXSR      RUNCMD
     C                   IF        *IN50 = *ON
     C                   EVAL      *IN50 = *OFF
     C                   EVAL      CMD = 'SBMJOB CMD(CALL PGM(OFFICE/OVR' +
     C                             'EMD)) JOB(OVREMIND) INLLIBL(*C' + 'URRENT)'
     C                   EXSR      RUNCMD
     C                   ENDIF
     C                   IF        *IN50 = *ON
     C                   EVAL      MSG = 'The reminder service could not' +
     C                             ' be submitted.  You may lack a' +
     C                             'uthority.'
     C                   ELSE
     C                   EVAL      MSG = 'Reminder service submitted.  W' +
     C                             'RKACTJOB shows it as OVREMIND.'
     C                   EVAL      LACT = 'REMINDON'
     C                   EVAL      LTXT = 'Reminder service started'
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   EVAL      *IN50 = *OFF
     C                   EVAL      CMD = *BLANKS
     C                   ENDSR
     C     REMOFF        BEGSR
     C                   EVAL      CMD = 'ENDJOB JOB(OVREMIND) OPTION(*C' +
     C                             'NTRLD) DELAY(60)'
     C                   EXSR      RUNCMD
     C                   IF        *IN50 = *ON
     C                   EVAL      MSG = 'The reminder service does not ' +
     C                             'seem to be running.'
     C                   ELSE
     C                   EVAL      MSG = 'The reminder service will stop' +
     C                             ' within a minute.'
     C                   EVAL      LACT = 'REMINDOFF'
     C                   EVAL      LTXT = 'Reminder service stopped'
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   EVAL      *IN50 = *OFF
     C                   EVAL      CMD = *BLANKS
     C                   ENDSR
     C     PURGE         BEGSR
     C                   EVAL      PDAYS = '30'
     C                   EVAL      LDAYS = '90'
     C                   EVAL      HDRID = 'OFCPURGE'
     C                   EXSR      HDR
     C                   EVAL      PHDR = HDRLN
     C                   EVAL      PFK = 'F1=Help   Enter=Delete old ite' +
     C                             'ms   F12=Cancel'
     C                   EVAL      PMSG = *BLANKS
     C                   EXFMT     APURGE
     C                   IF        *IN03 = *OFF AND *IN12 = *OFF
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = %TRIML(PDAYS)
     C                   EXSR      TONUM
     C                   EVAL      DAYS1 = NVAL
     C                   EVAL      NSTR = %TRIML(LDAYS)
     C                   EXSR      TONUM
     C                   EVAL      DAYS2 = NVAL
     C                   IF        NERR = '1'
     C                   EVAL      MSG = 'Nothing deleted.  The days mus' +
     C                             't be numbers.'
     C                   ELSE
     C                   EVAL      DCNT = 0
     C                   TIME                    TS
     C                   SUBDUR    DAYS1:*D      TS
     C     *LOVAL        SETLL     MSGREC
     C                   READ      MSGREC
     C                   DOW       NOT %EOF(OVMSGP) AND MGSTMP < TS
     C                   IF        MGSTAT <> 'N'
     C                   DELETE    MSGREC
     C                   EVAL      DCNT = DCNT + 1
     C                   ENDIF
     C                   READ      MSGREC
     C                   ENDDO
     C                   UNLOCK    OVMSGP
     C     *LOVAL        SETLL     MAILREC
     C                   READ      MAILREC
     C                   DOW       NOT %EOF(OVMAILP) AND MMSTMP < TS
     C                   IF        MMSTAT <> 'N'
     C                   DELETE    MAILREC
     C                   EVAL      DCNT = DCNT + 1
     C                   ENDIF
     C                   READ      MAILREC
     C                   ENDDO
     C                   UNLOCK    OVMAILP
     C                   TIME                    TS
     C                   SUBDUR    DAYS2:*D      TS
     C     *LOVAL        SETLL     LOGREC
     C                   READ      LOGREC
     C                   DOW       NOT %EOF(OVLOGP) AND LGSTMP < TS
     C                   DELETE    LOGREC
     C                   EVAL      DCNT = DCNT + 1
     C                   READ      LOGREC
     C                   ENDDO
     C                   UNLOCK    OVLOGP
     C                   EVAL      MSG = %CHAR(DCNT) + ' old item(s) removed.'
     C                   EVAL      LACT = 'PURGE'
     C                   EVAL      LTXT = %CHAR(DCNT) + ' item(s) removed'
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- break message to every display ----
     C     NOTICE        BEGSR
     C                   EVAL      HDRID = 'OFCNOTICE'
     C                   EXSR      HDR
     C                   EVAL      NHDR = HDRLN
     C                   EVAL      NFK = 'F1=Help   Enter=Send   F12=Cancel'
     C                   EVAL      NTEXT = *BLANKS
     C                   EVAL      NMSG = *BLANKS
     C                   EXFMT     ANOTE
     C                   IF        *IN03 = *OFF AND *IN12 = *OFF AND NTEXT <>
     C                             *BLANKS
     C                   EVAL      QSRC = %TRIML(NTEXT)
     C                   EXSR      QUOTE
     C                   EVAL      CMD = 'SNDBRKMSG MSG(''' + QTXT +
     C                             ''') TOMSGQ(*ALLWS)'
     C                   EXSR      RUNCMD
     C                   IF        *IN50 = *ON
     C                   EVAL      MSG = 'Could not send.  You may need ' +
     C                             '*JOBCTL authority.'
     C                   ELSE
     C                   EVAL      MSG = 'Notice sent to every display.'
     C                   EVAL      LACT = 'NOTICE'
     C                   EVAL      LTXT = %SUBST(NTEXT:1:60)
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   EVAL      *IN50 = *OFF
     C                   EVAL      CMD = *BLANKS
     C                   ENDIF
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

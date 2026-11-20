     H DFTACTGRP(*YES)
      * OVMAIL - OfficeVibes/400
     FOVMAILP   UF A E           K DISK
     FOVUSERP   IF   E           K DISK
     FOVGRPP    IF   E           K DISK
     FOVMAIL    CF   E             WORKSTN INFDS(DSPINF)
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
     DLLNA                          720A
     D LLN                           72A   DIM(10) OVERLAY(LLNA)
     D LLN01                         72A   OVERLAY(LLNA:1)
     D LLN02                         72A   OVERLAY(LLNA:73)
     D LLN03                         72A   OVERLAY(LLNA:145)
     D LLN04                         72A   OVERLAY(LLNA:217)
     D LLN05                         72A   OVERLAY(LLNA:289)
     D LLN06                         72A   OVERLAY(LLNA:361)
     D LLN07                         72A   OVERLAY(LLNA:433)
     D LLN08                         72A   OVERLAY(LLNA:505)
     D LLN09                         72A   OVERLAY(LLNA:577)
     D LLN10                         72A   OVERLAY(LLNA:649)
     D                 DS
     DLOPA                           20A
     D LOP                            2A   DIM(10) OVERLAY(LOPA)
     D LOP01                          2A   OVERLAY(LOPA:1)
     D LOP02                          2A   OVERLAY(LOPA:3)
     D LOP03                          2A   OVERLAY(LOPA:5)
     D LOP04                          2A   OVERLAY(LOPA:7)
     D LOP05                          2A   OVERLAY(LOPA:9)
     D LOP06                          2A   OVERLAY(LOPA:11)
     D LOP07                          2A   OVERLAY(LOPA:13)
     D LOP08                          2A   OVERLAY(LOPA:15)
     D LOP09                          2A   OVERLAY(LOPA:17)
     D LOP10                          2A   OVERLAY(LOPA:19)
     DSENT             S              1A   INZ('0')
     DNEWC             S              5  0
     DFLAG             S              1A
     DWHO              S             10A
     DTOU              S             10A
     DPREFTO           S             10A
     DRCPT             S             10A
     DNSENT            S              5  0
     DKT               S             10A   DIM(10)
     DKTO              S             10A
     DNTFY             S            100A
     DCOLH             S             74A
     D                 DS
     DMBA                           576A
     D MB                            72A   DIM(8) OVERLAY(MBA)
     D MMB1                          72A   OVERLAY(MBA:1)
     D MMB2                          72A   OVERLAY(MBA:73)
     D MMB3                          72A   OVERLAY(MBA:145)
     D MMB4                          72A   OVERLAY(MBA:217)
     D MMB5                          72A   OVERLAY(MBA:289)
     D MMB6                          72A   OVERLAY(MBA:361)
     D MMB7                          72A   OVERLAY(MBA:433)
     D MMB8                          72A   OVERLAY(MBA:505)
     D                 DS
     DRBA                           576A
     D RB                            72A   DIM(8) OVERLAY(RBA)
     D RB1                           72A   OVERLAY(RBA:1)
     D RB2                           72A   OVERLAY(RBA:73)
     D RB3                           72A   OVERLAY(RBA:145)
     D RB4                           72A   OVERLAY(RBA:217)
     D RB5                           72A   OVERLAY(RBA:289)
     D RB6                           72A   OVERLAY(RBA:361)
     D RB7                           72A   OVERLAY(RBA:433)
     D RB8                           72A   OVERLAY(RBA:505)
     D                 DS
     DCBA                           576A
     D CB                            72A   DIM(8) OVERLAY(CBA)
     D CB1                           72A   OVERLAY(CBA:1)
     D CB2                           72A   OVERLAY(CBA:73)
     D CB3                           72A   OVERLAY(CBA:145)
     D CB4                           72A   OVERLAY(CBA:217)
     D CB5                           72A   OVERLAY(CBA:289)
     D CB6                           72A   OVERLAY(CBA:361)
     D CB7                           72A   OVERLAY(CBA:433)
     D CB8                           72A   OVERLAY(CBA:505)
     DPB               S             72A   DIM(8)
     DPSUBJ            S             50A
     DWFROM            S             10A
     DWSUBJ            S             50A
     DCOLHS            C                   'Opt  To         Date/time     -
     D                                         Subject'
     DCOLHI            C                   'Opt  From       Date/time     -
     D                                         Subject'
     DFK1              C                   '4=Delete  5=Read   or put the -
     D                                     cursor on a memo and press Ent-
     D                                     er'
     DFK2              C                   'F1=Help  F3=Exit  F4=Search  F-
     D                                     6=Compose  F7/F8=Page  F10=Mai-
     D                                     lbox/Sent'
     C     KEY2          KLIST
     C                   KFLD                    KSTMP
     C                   KFLD                    KTO
     C                   EVAL      LAPP = 'MAIL'
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCMAIL'
     C                   EXSR      HDR
     C                   EVAL      LHDR = HDRLN
     C                   EVAL      LTTL = TTLW
     C                   EVAL      LCOL = COLH
     C                   EVAL      LMSG = MSG
     C                   EVAL      LFK1 = FK1
     C                   EVAL      LFK2 = FK2
     C                   EVAL      *IN41 = (SENT = '1')
     C                   EVAL      LTB1 = ' Mailbox '
     C                   IF        SENT = '0'
     C                   EVAL      LTB1 = ' Mailbox (' + %CHAR(NEWC) + ' new) '
     C                   ENDIF
     C                   EVAL      LTB2 = ' Sent '
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     LLIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 8
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 7
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN05 = *ON
     C                   ITER
     C                   ENDIF
     C                   IF        *IN04 = *ON
     C                   CALL      'OVFIND'                             50
     C                   EVAL      *IN50 = *OFF
     C                   ITER
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EVAL      PREFTO = *BLANKS
     C                   EVAL      PSUBJ = *BLANKS
     C                   EVAL      PB = *BLANKS
     C                   EXSR      COMPOS
     C                   ITER
     C                   ENDIF
     C                   IF        *IN10 = *ON
     C                   IF        SENT = '1'
     C                   EVAL      SENT = '0'
     C                   ELSE
     C                   EVAL      SENT = '1'
     C                   ENDIF
     C                   EVAL      PGNO = 0
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
     C                   IF        LOP(ROW) <> *BLANKS
     C                   EVAL      ANYOP = 1
     C                   ENDIF
     C                   ENDDO
     C                   IF        ANYOP = 0 AND CSRSEL > 0
     C                   EVAL      LOP(CSRSEL) = '5'
     C                   ENDIF
     C                   EVAL      DCNT = 0
     C     1             DO        NSHOW         ROW
     C                   EVAL      OP = %TRIM(LOP(ROW))
     C     LCASE:UCASE   XLATE     OP            OP
     C                   IF        OP <> *BLANKS
     C                   EVAL      KSTMP = KS(ROW)
     C                   EVAL      KTO = KT(ROW)
     C                   SELECT
     C                   WHEN      OP = '4'
     C     KEY2          CHAIN     MAILREC
     C                   IF        %FOUND(OVMAILP)
     C                   DELETE    MAILREC
     C                   EVAL      DCNT = DCNT + 1
     C                   ENDIF
     C                   WHEN      OP = '5'
     C                   EXSR      SHOW
     C                   ENDSL
     C                   ENDIF
     C                   ENDDO
     C                   IF        DCNT > 0
     C                   EVAL      MSG = %CHAR(DCNT) + ' deleted.'
     C                   EVAL      LACT = 'DELETE'
     C                   EVAL      LTXT = %CHAR(DCNT) + ' item(s)'
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *INLR = *ON
      * ---- newest first, one page ----
     C     LOAD          BEGSR
     C                   EVAL      LLNA = *BLANKS
     C     1             DO        20            I
     C                   EVAL      *IN(60 + I) = *OFF
     C                   ENDDO
     C                   EVAL      NMATCH = 0
     C                   EVAL      NEWC = 0
     C                   EVAL      BASE = PGNO * 10
     C     *HIVAL        SETGT     MAILREC
     C                   READP(N)  MAILREC
     C                   DOW       NOT %EOF(OVMAILP)
     C                   IF        (SENT = '1' AND MMFROM = PGMUSR) OR (SENT =
     C                             '0' AND MMTO = PGMUSR)
     C                   EVAL      NMATCH = NMATCH + 1
     C                   EVAL      FLAG = ' '
     C                   IF        SENT = '0' AND MMSTAT = 'N'
     C                   EVAL      NEWC = NEWC + 1
     C                   EVAL      FLAG = '*'
     C                   ENDIF
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   EVAL      WHO = MMFROM
     C                   IF        SENT = '1'
     C                   EVAL      WHO = MMTO
     C                   ENDIF
     C                   MOVE      MMSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      LLN(ROW) = FLAG + ' ' + WHO + ' ' + WDT +
     C                             '  ' + MMSUBJ
     C                   EVAL      KS(ROW) = MMSTMP
     C                   EVAL      KT(ROW) = MMTO
     C                   IF        FLAG = '*'
     C                   EVAL      *IN(60 + ROW) = *ON
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   READP(N)  MAILREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C                   IF        SENT = '1'
     C                   EVAL      TTLW = 'Mail I have sent - ' + %CHAR(NMATCH)
     C                   EVAL      COLH = COLHS
     C                   ELSE
     C                   EVAL      TTLW = 'Mailbox - ' + %CHAR(NMATCH) + ', ' +
     C                             %CHAR(NEWC) + ' new'
     C                   EVAL      COLH = COLHI
     C                   ENDIF
     C                   ENDSR
      * ---- send to a user, a group or everyone ----
     C     SENDTO        BEGSR
     C                   EVAL      NSENT = 0
     C                   IF        TOU = 'ALL'
     C     *LOVAL        SETLL     USERREC
     C                   READ      USERREC
     C                   DOW       NOT %EOF(OVUSERP)
     C                   IF        USSTAT = 'A' AND USUSER <> PGMUSR
     C                   EVAL      RCPT = USUSER
     C                   EXSR      WR1
     C                   ENDIF
     C                   READ      USERREC
     C                   ENDDO
     C                   ELSE
     C     TOU           SETLL     GRPREC
     C                   IF        %EQUAL(OVGRPP)
     C     TOU           READE     GRPREC
     C                   DOW       NOT %EOF(OVGRPP)
     C                   EVAL      RCPT = GRUSER
     C                   EXSR      WR1
     C     TOU           READE     GRPREC
     C                   ENDDO
     C                   ELSE
     C     TOU           CHAIN     USERREC
     C                   IF        %FOUND(OVUSERP)
     C                   EVAL      RCPT = TOU
     C                   EXSR      WR1
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   IF        NSENT = 0
     C                   EVAL      MSG = %TRIM(TOU) +
     C                             ' is not a user or group.  Pres' +
     C                             's F4 for a list.'
     C                   ELSE
     C                   EVAL      MSG = 'Sent to ' + %CHAR(NSENT) +
     C                             ' recipient(s).'
     C                   EVAL      LACT = 'SEND'
     C                   EVAL      LTXT = 'To ' + %TRIM(TOU) + ', ' +
     C                             %CHAR(NSENT) + ' copies'
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   ENDSR
     C     WR1           BEGSR
     C                   EVAL      MMTO = RCPT
     C                   EXSR      NEWTS
     C                   EVAL      MMSTMP = TS
     C                   WRITE     MAILREC
     C                   EVAL      NSENT = NSENT + 1
     C                   EVAL      QSRC = NTFY
     C                   EXSR      QUOTE
     C                   EVAL      CMD = 'SNDMSG MSG(''' + QTXT + ''') TOUSR(' +
     C                             %TRIM(RCPT) + ')'
     C                   EXSR      RUNCMD
     C                   EVAL      *IN50 = *OFF
     C                   ENDSR
     C     SHOW          BEGSR
     C     KEY2          CHAIN     MAILREC
     C                   IF        %FOUND(OVMAILP)
     C                   IF        MMTO = PGMUSR AND MMSTAT = 'N'
     C                   EVAL      MMSTAT = 'Y'
     C                   UPDATE    MAILREC
     C                   ELSE
     C                   UNLOCK    OVMAILP
     C                   ENDIF
     C                   MOVE      MMSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      RINF1 = 'From: ' + %TRIMR(MMFROM) +
     C                             '    To: ' + MMTO
     C                   EVAL      RINF2 = 'Date: ' + WDT
     C                   EVAL      RSUBJ = 'Subject: ' + MMSUBJ
     C                   EVAL      RB = MB
     C                   EVAL      RMSG = *BLANKS
     C                   EVAL      WFROM = MMFROM
     C                   EVAL      WSUBJ = MMSUBJ
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCMAILRD'
     C                   EXSR      HDR
     C                   EVAL      RHDR = HDRLN
     C                   EVAL      RFK = 'F1=Help   F6=Reply   F9=Forwar' +
     C                             'd   F10=Print   F12=Back'
     C                   EXFMT     LREAD
     C                   EVAL      RMSG = *BLANKS
     C                   SELECT
     C                   WHEN      *IN06 = *ON
     C                   EVAL      PREFTO = WFROM
     C                   EVAL      PSUBJ = 'Re: ' + WSUBJ
     C                   EVAL      PB = *BLANKS
     C                   EXSR      COMPOS
     C                   LEAVE
     C                   WHEN      *IN09 = *ON
     C                   EVAL      PREFTO = *BLANKS
     C                   EVAL      PSUBJ = 'Fw: ' + WSUBJ
     C                   EVAL      PB = RB
     C                   EXSR      COMPOS
     C                   LEAVE
     C                   WHEN      *IN10 = *ON
     C                   EVAL      PACT = 'O'
     C                   EVAL      PTXT = 'Mail memo'
     C                   EXSR      PRT
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = RINF1
     C                   EXSR      PRT
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = RINF2
     C                   EXSR      PRT
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = RSUBJ
     C                   EXSR      PRT
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = *BLANKS
     C                   EXSR      PRT
     C     1             DO        8             J
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = RB(J)
     C                   EXSR      PRT
     C                   ENDDO
     C                   EVAL      PACT = 'C'
     C                   EXSR      PRT
     C                   EVAL      MSG = 'Printed.  See Printed output o' +
     C                             'n the main menu.'
     C                   EVAL      RMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   OTHER
     C                   LEAVE
     C                   ENDSL
     C                   ENDDO
     C                   ENDIF
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
     C     COMPOS        BEGSR
     C                   EVAL      CTO = PREFTO
     C                   EVAL      CSUBJ = PSUBJ
     C                   EVAL      CB = PB
     C                   EVAL      CMSG = 'Fill in the memo, then press E' +
     C                             'nter to send.'
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCMAILNEW'
     C                   EXSR      HDR
     C                   EVAL      CHDR = HDRLN
     C                   EVAL      CFK = 'F1=Help   Enter=Send   F4=List' +
     C                             ' users   F12=Cancel'
     C                   EXFMT     LCOMP
     C                   EVAL      CMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN04 = *ON
     C                   EXSR      LOOKUP
     C                   IF        SELUSR <> *BLANKS
     C                   EVAL      CTO = SELUSR
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   EVAL      TOU = %TRIML(CTO)
     C     LCASE:UCASE   XLATE     TOU           TOU
     C                   IF        TOU = *BLANKS OR CSUBJ = *BLANKS
     C                   EVAL      CMSG = 'Both the recipient and the sub' +
     C                             'ject are needed.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      MMFROM = PGMUSR
     C                   EVAL      MMSTAT = 'N'
     C                   EVAL      MMSUBJ = %TRIML(CSUBJ)
     C                   EVAL      MB = CB
     C                   EVAL      NTFY = 'You have OfficeVibes mail from ' +
     C                             %TRIM(PGMUSR) + ': ' + MMSUBJ
     C                   EXSR      SENDTO
     C                   IF        NSENT = 0
     C                   EVAL      CMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   ITER
     C                   ENDIF
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

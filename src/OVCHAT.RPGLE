     H DFTACTGRP(*YES)
      * OVCHAT - OfficeVibes/400
     FOVCHATP   UF A E           K DISK
     FOVUSERP   IF   E           K DISK
     FOVCHAT    CF   E             WORKSTN INFDS(DSPINF) MAXDEV(*FILE)
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
     DCHLA                         1064A
     D CHL                           76A   DIM(14) OVERLAY(CHLA)
     D CH01                          76A   OVERLAY(CHLA:1)
     D CH02                          76A   OVERLAY(CHLA:77)
     D CH03                          76A   OVERLAY(CHLA:153)
     D CH04                          76A   OVERLAY(CHLA:229)
     D CH05                          76A   OVERLAY(CHLA:305)
     D CH06                          76A   OVERLAY(CHLA:381)
     D CH07                          76A   OVERLAY(CHLA:457)
     D CH08                          76A   OVERLAY(CHLA:533)
     D CH09                          76A   OVERLAY(CHLA:609)
     D CH10                          76A   OVERLAY(CHLA:685)
     D CH11                          76A   OVERLAY(CHLA:761)
     D CH12                          76A   OVERLAY(CHLA:837)
     D CH13                          76A   OVERLAY(CHLA:913)
     D CH14                          76A   OVERLAY(CHLA:989)
     DKROOM            S             20A
     DOTHER            S             10A
     DANIM             S              1A
     DFULL             S              1A
     DNOTIFD           S              1A
     DTTL              S             60A
     C                   EVAL      LAPP = 'CHAT'
     C                   EXSR      PICK
     C                   EVAL      ANIM = '1'
     C                   EVAL      FULL = '1'
     C                   DOW       OTHER <> *BLANKS
     C                   EXSR      LOADC
     C                   IF        FULL = '1'
     C                   EVAL      HDRID = 'OFCCHAT'
     C                   EXSR      HDR
     C                   EVAL      CHHDR = HDRLN
     C                   EVAL      CHTTL = TTL
     C                   EVAL      CHSAY = *BLANKS
     C                   EVAL      CHMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   EVAL      CHFK = 'F1=Help   Enter=Send   F5=Refr' +
     C                             'esh   F6=Chat with someone els' +
     C                             'e   F3=Exit'
     C                   ENDIF
     C                   IF        ANIM = '1'
      * sent with INVITE and read with a two second time-out, so new lines
      * appear while the keyboard stays open
     C                   EVAL      *IN45 = *ON
     C                   IF        FULL = '1'
     C                   EVAL      *IN46 = *OFF
     C                   WRITE     BLANK
     C                   ELSE
     C                   EVAL      *IN46 = *ON
     C                   ENDIF
     C                   WRITE     CHATSCR
     C                   READ      OVCHAT                               5152
     C                   IF        *IN51 = *ON
     C                   IF        DSPSTS = 1331
     C                   EVAL      FULL = '0'
     C                   ELSE
     C                   EVAL      ANIM = '0'
     C                   EVAL      FULL = '1'
     C                   EVAL      MSG = 'This display cannot refresh by' +
     C                             ' itself.  Press F5 to see new ' + 'lines.'
     C                   ENDIF
     C                   EVAL      *IN51 = *OFF
     C                   ITER
     C                   ENDIF
     C                   ELSE
     C                   EVAL      *IN45 = *OFF
     C                   EVAL      *IN46 = *OFF
     C                   WRITE     BLANK
     C                   EXFMT     CHATSCR
     C                   ENDIF
     C                   EVAL      FULL = '1'
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EXSR      PICK
     C                   ITER
     C                   ENDIF
     C                   IF        *IN05 = *OFF AND CHSAY <> *BLANKS
     C                   EVAL      CHROOM = KROOM
     C                   EXSR      NEWTS
     C                   EVAL      CHSTMP = TS
     C                   EVAL      CHFROM = PGMUSR
     C                   EVAL      CHTEXT = %TRIML(CHSAY)
     C                   WRITE     CHATREC
     C                   IF        OTHER <> 'EVERYONE' AND NOTIFD = '0'
     C                   EVAL      QSRC = %TRIM(PGMUSR) +
     C                             ' is chatting with you in Offic' +
     C                             'eVibes.  Take option 14, Live ' + 'chat.'
     C                   EXSR      QUOTE
     C                   EVAL      CMD = 'SNDMSG MSG(''' + QTXT + ''') TOUSR(' +
     C                             %TRIM(OTHER) + ')'
     C                   EXSR      RUNCMD
     C                   EVAL      *IN50 = *OFF
     C                   EVAL      NOTIFD = '1'
     C                   EVAL      LACT = 'CHAT'
     C                   EVAL      LTXT = 'Started a chat with ' + OTHER
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *INLR = *ON
      * ---- the latest fourteen lines of the room ----
     C     LOADC         BEGSR
     C                   EVAL      CHLA = *BLANKS
     C                   EVAL      ROW = 14
     C     KROOM         SETGT     CHATREC
     C     KROOM         READPE(N) CHATREC
     C                   DOW       NOT %EOF(OVCHATP) AND ROW >= 1
     C                   MOVE      CHSTMP        WSTMP
     C                   EVAL      CHL(ROW) = %SUBST(WSTMP:12:2) + ':' +
     C                             %SUBST(WSTMP:15:2) + ' ' + %TRIMR(CHFROM) +
     C                             ': ' + CHTEXT
     C                   EVAL      ROW = ROW - 1
     C     KROOM         READPE(N) CHATREC
     C                   ENDDO
     C                   ENDSR
      * ---- choose who to chat with: sets OTHER, blank when cancelled ----
     C     PICK          BEGSR
     C                   EVAL      WWHO = *BLANKS
     C                   EVAL      WMSG = *BLANKS
     C                   EVAL      OTHER = *BLANKS
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCCHATWHO'
     C                   EXSR      HDR
     C                   EVAL      WHDR = HDRLN
     C                   EVAL      WFK = 'F1=Help   Enter=Start   F4=Lis' +
     C                             't users   F12=Cancel'
     C                   EXFMT     CHWHO
     C                   EVAL      WMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN04 = *ON
     C                   EXSR      LOOKUP
     C                   IF        SELUSR <> *BLANKS
     C                   EVAL      WWHO = SELUSR
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   EVAL      OTHER = %TRIML(WWHO)
     C                   IF        OTHER = 'EVERYONE'
     C                   EVAL      KROOM = 'EVERYONE'
     C                   EVAL      TTL = 'Office chat room - everyone'
     C                   LEAVE
     C                   ENDIF
     C     OTHER         CHAIN     USERREC
     C                   IF        OTHER = *BLANKS OR OTHER = PGMUSR OR NOT
     C                             %FOUND(OVUSERP)
     C                   EVAL      OTHER = *BLANKS
     C                   EVAL      WMSG = 'Type the ID of another enrolle' +
     C                             'd user, or EVERYONE.  F4 lists' + ' users.'
     C                   ITER
     C                   ENDIF
     C                   IF        PGMUSR < OTHER
     C                   EVAL      KROOM = PGMUSR + OTHER
     C                   ELSE
     C                   EVAL      KROOM = OTHER + PGMUSR
     C                   ENDIF
     C                   EVAL      TTL = 'Chat with ' + %TRIMR(USNAME) + ' (' +
     C                             %TRIM(OTHER) + ')'
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      NOTIFD = '0'
     C                   EVAL      FULL = '1'
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

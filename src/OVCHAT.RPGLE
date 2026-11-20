     H DFTACTGRP(*YES)
      * OVCHAT - OfficeVibes/400
     FOVCHATP   UF A E           K DISK
     FOVUSERP   IF   E           K DISK
     FOVSETUP   IF   E           K DISK
     FOVCTOPP   UF A E           K DISK
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
     D                 DS
     DGLNA                          720A
     D GLN                           72A   DIM(10) OVERLAY(GLNA)
     D GLN01                         72A   OVERLAY(GLNA:1)
     D GLN02                         72A   OVERLAY(GLNA:73)
     D GLN03                         72A   OVERLAY(GLNA:145)
     D GLN04                         72A   OVERLAY(GLNA:217)
     D GLN05                         72A   OVERLAY(GLNA:289)
     D GLN06                         72A   OVERLAY(GLNA:361)
     D GLN07                         72A   OVERLAY(GLNA:433)
     D GLN08                         72A   OVERLAY(GLNA:505)
     D GLN09                         72A   OVERLAY(GLNA:577)
     D GLN10                         72A   OVERLAY(GLNA:649)
     D                 DS
     DGOPA                           10A
     D GOP                            1A   DIM(10) OVERLAY(GOPA)
     D GOP01                          1A   OVERLAY(GOPA:1)
     D GOP02                          1A   OVERLAY(GOPA:2)
     D GOP03                          1A   OVERLAY(GOPA:3)
     D GOP04                          1A   OVERLAY(GOPA:4)
     D GOP05                          1A   OVERLAY(GOPA:5)
     D GOP06                          1A   OVERLAY(GOPA:6)
     D GOP07                          1A   OVERLAY(GOPA:7)
     D GOP08                          1A   OVERLAY(GOPA:8)
     D GOP09                          1A   OVERLAY(GOPA:9)
     D GOP10                          1A   OVERLAY(GOPA:10)
     DRMK              S             20A   DIM(99)
     DRMT              S               Z   DIM(99)
     DNRM              S              5  0
     DWK               S             20A
     DWT               S               Z
     DIDX              S              5  0
     DK                S              5  0
     DGROUP            S              1A
     DISADM            S              1A
     DWNAM             S             14A
     DANIMON           S              1A
     DSAVMIN           S              3  0
     DCHATAU           S              1A
     DGOTKEY           S              1A
     DNEWST            S               Z
     DLASTST           S               Z
     DKROOM            S             20A
     DOTHER            S             10A
     DANIM             S              1A
     DFULL             S              1A
     DNOTIFD           S              1A
     DTTL              S             60A
     C                   EVAL      LAPP = 'CHAT'
     C                   EVAL      ANIMON = 'Y'
     C                   EVAL      SAVMIN = 2
     C                   EVAL      CHATAU = 'A'
     C     PGMUSR        CHAIN(N)  SETREC
     C                   IF        %FOUND(OVSETUP)
     C                   EVAL      ANIMON = STANIM
     C                   EVAL      SAVMIN = STSAVE
     C                   EVAL      CHATAU = STCHAT
     C                   ENDIF
     C                   EVAL      ISADM = 'N'
     C     PGMUSR        CHAIN(N)  USERREC
     C                   IF        %FOUND(OVUSERP) AND USADM = 'Y'
     C                   EVAL      ISADM = 'Y'
     C                   ENDIF
     C                   EVAL      GROUP = '0'
     C                   EXSR      PICK
     C                   EVAL      ANIM = '1'
     C                   IF        CHATAU = 'M' OR ANIMON = 'N'
     C                   EVAL      ANIM = '0'
     C                   ENDIF
     C                   EVAL      FULL = '1'
     C                   DOW       OTHER <> *BLANKS
     C                   EXSR      LOADC
     C                   IF        FULL = '1'
     C                   EVAL      HDRID = 'OFCCHAT'
     C                   EXSR      HDR
     C                   EVAL      CHHDR = HDRLN
     C                   EVAL      CHTTL = TTL
     C                   EVAL      CHTOP = *BLANKS
     C                   IF        GROUP = '1'
     C     KROOM         CHAIN(N)  TOPREC
     C                   IF        %FOUND(OVCTOPP) AND TPTOPC <> *BLANKS
     C                   EVAL      CHTOP = 'Topic: ' + %TRIMR(TPTOPC) + '   (' +
     C                             %TRIM(TPBY) + ')'
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      CHSAY = *BLANKS
     C                   EVAL      CHMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   EVAL      CHFK = 'F1=Help  Enter=Send  F5=Refres' +
     C                             'h  F6=Rooms  F9=Set the topic ' + ' F3=Exit'
     C                   ENDIF
     C                   IF        ANIM = '1'
      * sent with INVITE.  The screen is only redrawn when a new line
      * arrives, so the cursor is left alone while you type.
     C                   EVAL      *IN45 = *ON
     C                   IF        FULL = '1'
     C                   EVAL      *IN46 = *OFF
     C                   WRITE     BLANK
     C                   ELSE
     C                   EVAL      *IN46 = *ON
     C                   ENDIF
     C                   WRITE     CHATSCR
     C                   EVAL      GOTKEY = '0'
     C                   DOW       GOTKEY = '0' AND ANIM = '1'
     C                   READ      OVCHAT                               5152
     C                   IF        *IN51 = *ON
     C                   EVAL      *IN51 = *OFF
     C                   IF        DSPSTS = 1331
     C                   EXSR      NEWEST
     C                   IF        NEWST <> LASTST
     C                   LEAVE
     C                   ENDIF
     C                   ELSE
     C                   EVAL      ANIM = '0'
     C                   EVAL      MSG = 'This display cannot refresh by' +
     C                             ' itself.  Press F5 to see new ' + 'lines.'
     C                   ENDIF
     C                   ELSE
     C                   EVAL      GOTKEY = '1'
     C                   ENDIF
     C                   ENDDO
     C                   IF        GOTKEY = '0'
     C                   EVAL      FULL = '0'
     C                   IF        ANIM = '0'
     C                   EVAL      FULL = '1'
     C                   ENDIF
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
     C                   IF        *IN09 = *ON
     C                   EXSR      SETTOP
     C                   ITER
     C                   ENDIF
     C                   IF        *IN05 = *OFF AND CHSAY <> *BLANKS
     C                   EVAL      CHROOM = KROOM
     C                   EXSR      NEWTS
     C                   EVAL      CHSTMP = TS
     C                   EVAL      CHFROM = PGMUSR
     C                   EVAL      CHTEXT = %TRIML(CHSAY)
     C                   WRITE     CHATREC
     C                   IF        GROUP = '0' AND NOTIFD = '0'
     C                   EVAL      QSRC = %TRIM(PGMUSR) +
     C                             ' is chatting with you in Offic' +
     C                             'eVibes.  Main menu 2, then 3.'
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
     C                   EVAL      LASTST = *LOVAL
     C     KROOM         SETGT     CHATREC
     C     KROOM         READPE(N) CHATREC
     C                   IF        NOT %EOF(OVCHATP)
     C                   EVAL      LASTST = CHSTMP
     C                   ENDIF
     C                   DOW       NOT %EOF(OVCHATP) AND ROW >= 1
     C                   MOVE      CHSTMP        WSTMP
     C                   EVAL      CHL(ROW) = %SUBST(WSTMP:12:2) + ':' +
     C                             %SUBST(WSTMP:15:2) + ' ' + %TRIMR(CHFROM) +
     C                             ': ' + CHTEXT
     C                   EVAL      ROW = ROW - 1
     C     KROOM         READPE(N) CHATREC
     C                   ENDDO
     C                   ENDSR
      * ---- the time of the newest line in the room: NEWST ----
     C     NEWEST        BEGSR
     C                   EVAL      NEWST = *LOVAL
     C     KROOM         SETGT     CHATREC
     C     KROOM         READPE(N) CHATREC
     C                   IF        NOT %EOF(OVCHATP)
     C                   EVAL      NEWST = CHSTMP
     C                   ENDIF
     C                   ENDSR
      * ---- the room list: sets OTHER and KROOM, OTHER blank when cancelled
     C     PICK          BEGSR
     C                   EVAL      GWHO = *BLANKS
     C                   EVAL      OTHER = *BLANKS
     C                   EVAL      PGNO = 0
     C                   DOW       1 = 1
     C                   EXSR      LOADR
     C                   IF        PGNO > 0 AND BASE >= NRM
     C                   EVAL      PGNO = 0
     C                   EXSR      LOADR
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCCHATRM'
     C                   EXSR      HDR
     C                   EVAL      GHDR = HDRLN
     C                   EVAL      GFK = 'F1=Help   Enter=Join   F4=List' +
     C                             ' users   F6=New room   F7/F8=P' +
     C                             'age   F3=Exit'
     C                   EVAL      GMSG = MSG
     C                   IF        MSG = *BLANKS
     C                   EVAL      GMSG = %CHAR(NRM) +
     C                             ' room(s).  Type 1 beside a roo' +
     C                             'm, or put the cursor on it.'
     C                   ENDIF
     C                   EVAL      MSG = *BLANKS
     C                   EVAL      GOPA = *BLANKS
     C                   EXFMT     CHLST
     C                   EXSR      CSR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN04 = *ON
     C                   EXSR      LOOKUP
     C                   IF        SELUSR <> *BLANKS
     C                   EVAL      GWHO = SELUSR
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EXSR      NEWRM
     C                   IF        OTHER <> *BLANKS
     C                   LEAVE
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   IF        *IN07 = *ON
     C                   IF        PGNO > 0
     C                   EVAL      PGNO = PGNO - 1
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   IF        *IN08 = *ON
     C                   IF        BASE + 10 < NRM
     C                   EVAL      PGNO = PGNO + 1
     C                   ENDIF
     C                   ITER
     C                   ENDIF
      * a private chat with one person
     C                   IF        GWHO <> *BLANKS
     C                   EVAL      OTHER = %TRIML(GWHO)
     C                   EVAL      GWHO = *BLANKS
     C                   IF        OTHER = 'EVERYONE'
     C                   EVAL      WK = 'EVERYONE'
     C                   EXSR      JOINR
     C                   LEAVE
     C                   ENDIF
     C     OTHER         CHAIN(N)  USERREC
     C                   IF        OTHER = PGMUSR OR NOT %FOUND(OVUSERP)
     C                   EVAL      OTHER = *BLANKS
     C                   EVAL      MSG = 'Type the ID of another enrolle' +
     C                             'd user.  F4 lists users.'
     C                   ITER
     C                   ENDIF
     C                   IF        PGMUSR < OTHER
     C                   EVAL      KROOM = PGMUSR + OTHER
     C                   ELSE
     C                   EVAL      KROOM = OTHER + PGMUSR
     C                   ENDIF
     C                   EVAL      GROUP = '0'
     C                   EVAL      TTL = 'Chat with ' + %TRIMR(USNAME) + ' (' +
     C                             %TRIM(OTHER) + ')'
     C                   LEAVE
     C                   ENDIF
      * a group room, by option or by cursor
     C                   EVAL      K = 0
     C                   EVAL      OP = '1'
     C     1             DO        NSHOW         ROW
     C                   IF        GOP(ROW) <> *BLANK AND K = 0
     C                   EVAL      K = ROW
     C                   EVAL      OP = GOP(ROW)
     C                   ENDIF
     C                   ENDDO
     C                   IF        K = 0
     C                   EVAL      CSRSEL = CSRROW - 7
     C                   IF        CSRSEL >= 1 AND CSRSEL <= NSHOW
     C                   EVAL      K = CSRSEL
     C                   ENDIF
     C                   ENDIF
     C                   IF        K = 0
     C                   ITER
     C                   ENDIF
     C                   EVAL      WK = RMK(BASE + K)
     C                   IF        OP = '4'
     C                   EXSR      DELRM
     C                   ITER
     C                   ENDIF
     C                   IF        OP <> '1'
     C                   EVAL      MSG = 'Type 1 to join a room, or 4 to' +
     C                             ' delete one.'
     C                   ITER
     C                   ENDIF
     C                   EXSR      JOINR
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      NOTIFD = '0'
     C                   EVAL      FULL = '1'
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- go into the group room WK ----
     C     JOINR         BEGSR
     C                   EVAL      KROOM = WK
     C                   EVAL      GROUP = '1'
     C                   EVAL      OTHER = '*GROUP'
     C                   IF        WK = 'EVERYONE'
     C                   EVAL      TTL = 'Group room EVERYONE - the whol' +
     C                             'e office'
     C                   ELSE
     C                   EVAL      TTL = 'Group room ' + %TRIM(WK)
     C                   ENDIF
     C                   ENDSR
      * ---- every room, newest topic first, and one page of them ----
     C     LOADR         BEGSR
     C                   EVAL      WK = 'EVERYONE'
     C     WK            CHAIN(N)  TOPREC
     C                   IF        NOT %FOUND(OVCTOPP)
     C                   EVAL      TPROOM = WK
     C                   EVAL      TPTOPC = 'The whole office.  Say hello!'
     C                   EVAL      TPBY = PGMUSR
     C                   EVAL      TPOWN = *BLANKS
     C                   EXSR      NEWTS
     C                   EVAL      TPSTMP = TS
     C                   WRITE     TOPREC
     C                   ENDIF
     C                   EVAL      NRM = 0
     C     *LOVAL        SETLL     TOPREC
     C                   READ(N)   TOPREC
     C                   DOW       NOT %EOF(OVCTOPP) AND NRM < 99
     C                   EVAL      NRM = NRM + 1
     C                   EVAL      RMK(NRM) = TPROOM
     C                   EVAL      RMT(NRM) = TPSTMP
     C                   READ(N)   TOPREC
     C                   ENDDO
     C     1             DO        NRM           I
     C                   EVAL      J = I + 1
     C                   DOW       J <= NRM
     C                   IF        RMT(J) > RMT(I)
     C                   EVAL      WK = RMK(I)
     C                   EVAL      WT = RMT(I)
     C                   EVAL      RMK(I) = RMK(J)
     C                   EVAL      RMT(I) = RMT(J)
     C                   EVAL      RMK(J) = WK
     C                   EVAL      RMT(J) = WT
     C                   ENDIF
     C                   EVAL      J = J + 1
     C                   ENDDO
     C                   ENDDO
     C                   EVAL      GLNA = *BLANKS
     C                   EVAL      BASE = PGNO * 10
     C                   EVAL      NSHOW = NRM - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C     1             DO        NSHOW         ROW
     C                   EVAL      IDX = BASE + ROW
     C                   EVAL      WK = RMK(IDX)
     C     WK            CHAIN(N)  TOPREC
     C                   IF        %FOUND(OVCTOPP)
     C                   MOVE      TPSTMP        WSTMP
     C                   EVAL      WNAM = %SUBST(TPROOM:1:14)
     C                   EVAL      GLN(ROW) = WNAM + ' ' + %SUBST(TPTOPC:1:34) +
     C                             ' ' + TPBY + ' ' + %SUBST(WSTMP:6:2) + '/' +
     C                             %SUBST(WSTMP:9:2) + ' ' + %SUBST(WSTMP:12:2)
     C                             + ':' + %SUBST(WSTMP:15:2)
     C                   ENDIF
     C                   ENDDO
     C                   ENDSR
      * ---- make a new group room ----
     C     NEWRM         BEGSR
     C                   EVAL      NROOM = *BLANKS
     C                   EVAL      NTOPC = *BLANKS
     C                   EVAL      NMSG = *BLANKS
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCNEWROOM'
     C                   EXSR      HDR
     C                   EVAL      NHDR = HDRLN
     C                   EVAL      NFK = 'F1=Help   Enter=Create and joi' +
     C                             'n   F12=Cancel'
     C                   EXFMT     CHNEW
     C                   EVAL      NMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      WNAM = %TRIML(NROOM)
     C     LCASE:UCASE   XLATE     WNAM          WNAM
     C                   IF        WNAM = *BLANKS
     C                   EVAL      NMSG = 'Give the room a name.'
     C                   ITER
     C                   ENDIF
     C                   IF        %SCAN(' ':%TRIMR(WNAM)) > 0
     C                   EVAL      NMSG = 'The room name must be one word.'
     C                   ITER
     C                   ENDIF
     C                   IF        NTOPC = *BLANKS
     C                   EVAL      NMSG = 'Give the room a topic, so peop' +
     C                             'le know what it is about.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      WK = '#' + WNAM
     C                   IF        WNAM = 'EVERYONE'
     C                   EVAL      WK = 'EVERYONE'
     C                   ENDIF
     C     WK            CHAIN(N)  TOPREC
     C                   IF        %FOUND(OVCTOPP)
     C                   EVAL      NMSG = 'There is already a room called' +
     C                             ' that.  Join it from the list.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      TPROOM = WK
     C                   EVAL      TPTOPC = %TRIML(NTOPC)
     C                   EVAL      TPBY = PGMUSR
     C                   EVAL      TPOWN = PGMUSR
     C                   EXSR      NEWTS
     C                   EVAL      TPSTMP = TS
     C                   WRITE     TOPREC
     C                   EVAL      LACT = 'NEWROOM'
     C                   EVAL      LTXT = WK
     C                   EXSR      LOGIT
     C                   EXSR      JOINR
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- delete the room WK, by the person who made it or an administrator
     C     DELRM         BEGSR
     C                   IF        WK = 'EVERYONE'
     C                   EVAL      MSG = 'The EVERYONE room cannot be de' +
     C                             'leted.'
     C                   ELSE
     C     WK            CHAIN(N)  TOPREC
     C                   IF        %FOUND(OVCTOPP)
     C                   IF        TPOWN <> PGMUSR AND ISADM <> 'Y'
     C                   EVAL      MSG = 'Only the person who made a roo' +
     C                             'm, or an administrator, can de' + 'lete it.'
     C                   ELSE
     C     WK            CHAIN     TOPREC
     C                   IF        %FOUND(OVCTOPP)
     C                   DELETE    TOPREC
     C                   ENDIF
     C     WK            SETLL     CHATREC
     C     WK            READE     CHATREC
     C                   DOW       NOT %EOF(OVCHATP)
     C                   DELETE    CHATREC
     C     WK            READE     CHATREC
     C                   ENDDO
     C                   EVAL      MSG = 'Room ' + %TRIM(WK) + ' deleted.'
     C                   EVAL      LACT = 'DELROOM'
     C                   EVAL      LTXT = WK
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDSR
      * ---- change the topic of the group room KROOM ----
     C     SETTOP        BEGSR
     C                   IF        GROUP = '0'
     C                   EVAL      MSG = 'Only group rooms have a topic.' +
     C                             '  F6 shows the rooms.'
     C                   ELSE
     C                   EVAL      TTOPC = *BLANKS
     C     KROOM         CHAIN(N)  TOPREC
     C                   IF        %FOUND(OVCTOPP)
     C                   EVAL      TTOPC = TPTOPC
     C                   ENDIF
     C                   EVAL      TROOM = 'Room ' + %TRIM(KROOM)
     C                   EVAL      TMSG = *BLANKS
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCTOPIC'
     C                   EXSR      HDR
     C                   EVAL      THDR = HDRLN
     C                   EVAL      TFK = 'F1=Help   Enter=Set the topic ' +
     C                             '  F12=Cancel'
     C                   EXFMT     CHTOPS
     C                   EVAL      TMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        TTOPC = *BLANKS
     C                   EVAL      TMSG = 'Type a topic.'
     C                   ITER
     C                   ENDIF
     C     KROOM         CHAIN     TOPREC
     C                   IF        %FOUND(OVCTOPP)
     C                   EVAL      TPTOPC = %TRIML(TTOPC)
     C                   EVAL      TPBY = PGMUSR
     C                   EXSR      NEWTS
     C                   EVAL      TPSTMP = TS
     C                   UPDATE    TOPREC
     C                   EVAL      CHROOM = KROOM
     C                   EXSR      NEWTS
     C                   EVAL      CHSTMP = TS
     C                   EVAL      CHFROM = PGMUSR
     C                   EVAL      CHTEXT = '*** set the topic: ' + TPTOPC
     C                   WRITE     CHATREC
     C                   EVAL      LACT = 'TOPIC'
     C                   EVAL      LTXT = KROOM
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   LEAVE
     C                   ENDDO
     C                   ENDIF
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   EVAL      FULL = '1'
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

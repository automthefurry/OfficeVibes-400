     H DFTACTGRP(*YES) DATFMT(*ISO)
      * OFFMENU - OfficeVibes/400
     FOVUSERP   UF A E           K DISK
     FOVMSGP    IF   E           K DISK
     FOVMAILP   IF   E           K DISK
     FOVTASKP   IF   E           K DISK
     FOVCALP    IF   E           K DISK
     FOVPREFP   UF A E           K DISK
     FOVSETUP   UF A E           K DISK
     FOFFMNU    CF   E             WORKSTN INFDS(DSPINF)
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
     DANIMON           S              1A
     DSAVMIN           S              3  0
     DCHATAU           S              1A
     DZTX              S              6A
     DZT               S              6A
     DZOUT             S              6A
     DZSG              S              3  0
     DZL               S              5  0
     DZH               S              2  0
     DZM               S              2  0
     DZHV              S              9  0
     DZMV              S              9  0
     DZMIN             S              5  0
     DTM               S              5A
     DHH               S              5  0
     DMI               S              5  0
     DCLT              S              5  0
     DWCHR             S              7A
     DWBEG             S              5  0
     DWSAV             S              5  0
     D                 DS
     DMCA                           126A
     D MC                            21A   DIM(6) OVERLAY(MCA)
     D MC1                           21A   OVERLAY(MCA:1)
     D MC2                           21A   OVERLAY(MCA:22)
     D MC3                           21A   OVERLAY(MCA:43)
     D MC4                           21A   OVERLAY(MCA:64)
     D MC5                           21A   OVERLAY(MCA:85)
     D MC6                           21A   OVERLAY(MCA:106)
     D                 DS
     DMAA                            72A
     D MA                            12A   DIM(6) OVERLAY(MAA)
     D MA1                           12A   OVERLAY(MAA:1)
     D MA2                           12A   OVERLAY(MAA:13)
     D MA3                           12A   OVERLAY(MAA:25)
     D MA4                           12A   OVERLAY(MAA:37)
     D MA5                           12A   OVERLAY(MAA:49)
     D MA6                           12A   OVERLAY(MAA:61)
     DMNAMES           C                   'January  February March    Apr-
     D                                     il    May      June     July  -
     D                                        August   SeptemberOctober  -
     D                                     November December '
     DACOFA            C                   '  (  )  (      )  (  )   _____-
     D                                     ___   |        |__|        |_|-
     D                                     (________)  '
     DACATA            C                   '              /|_/|      ( o.o-
     D                                      )      > w <      /|   |__   -
     D                                     (_|___|__)~ '
     DADOGA            C                   '               __         /  |-
     D                                     ____   ( o      )/  |  __  |  -
     D                                       |_|  |_|  '
     DAROBA            C                   '    _|_        [o o]      /[ =-
     D                                      ]/      [___]        | |     -
     D                                        _| |_    '
     DAFISA            C                   '                  o       ><((-
     D                                     (">      o                    -
     D                                       ~~~~~~~~  '
     DMNAMEL           C                   'COFFEE CAT    DOG    ROBOT  FI-
     D                                     SH   NONE   '
     D                 DS
     DSOA                           216A
     D SO                            36A   DIM(6) OVERLAY(SOA)
     D SO1                           36A   OVERLAY(SOA:1)
     D SO2                           36A   OVERLAY(SOA:37)
     D SO3                           36A   OVERLAY(SOA:73)
     D SO4                           36A   OVERLAY(SOA:109)
     D SO5                           36A   OVERLAY(SOA:145)
     D SO6                           36A   OVERLAY(SOA:181)
     D                 DS
     DSCA                            96A
     D SC                            16A   DIM(6) OVERLAY(SCA)
     D SC1                           16A   OVERLAY(SCA:1)
     D SC2                           16A   OVERLAY(SCA:17)
     D SC3                           16A   OVERLAY(SCA:33)
     D SC4                           16A   OVERLAY(SCA:49)
     D SC5                           16A   OVERLAY(SCA:65)
     D SC6                           16A   OVERLAY(SCA:81)
     DSP               S             10A   DIM(6)
     DSUBK             S              5  0
     DNOPT             S              5  0
     DWTITL            S             40A
     DNMSGN            S              5  0
     DNMAILN           S              5  0
     DNTASKN           S              5  0
     DNTODAY           S              5  0
     DK                S              5  0
     DART              S             72A
     DMIDX             S              5  0
     DSEL              S              3A
     DSELN             S              5  0
     DPGMNAM           S             10A
     DISADM            S              1A
     DWADM             S              1A
     DDMSG             S             52A
     DCNT              S              5  0
     DKDATE            S              8  0
     DTODD             S               D
     DF1               S               D
     DNXT              S               D
     DBASEDT           S               D   INZ(D'2000-01-02')
     DNDAYS            S              7  0
     DFDOW             S              5  0
     DMDAYS            S              5  0
     DTODN             S              8  0
     DFIRSTN           S              8  0
     DDY               S              5  0
     DDAY2             S              2  0
     DCELL             S              5  0
     DRW               S              5  0
     DCC               S              5  0
     DMARK             S              1A
     DACC              S             14A
     C                   EXSR      MINCAL
     C     KEYD          KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KDATE
     C                   EVAL      LAPP = 'MENU'
     C     PGMUSR        CHAIN     USERREC
     C                   IF        NOT %FOUND(OVUSERP)
     C     *LOVAL        SETLL     USERREC
     C                   READ(N)   USERREC
     C                   EVAL      WADM = 'N'
     C                   IF        %EOF(OVUSERP) OR PGMUSR = 'QSECOFR'
     C                   EVAL      WADM = 'Y'
     C                   ENDIF
     C                   EVAL      USUSER = PGMUSR
     C                   EVAL      USNAME = PGMUSR
     C                   EVAL      USDEPT = *BLANKS
     C                   EVAL      USPHON = *BLANKS
     C                   EVAL      USADM = WADM
     C                   EVAL      USSTAT = 'A'
     C                   TIME                    USCRT
     C                   TIME                    USLAST
     C                   WRITE     USERREC
     C                   EVAL      LACT = 'ENROLL'
     C                   EVAL      LTXT = 'Enrolled at first use'
     C                   EXSR      LOGIT
     C                   ELSE
     C                   IF        USSTAT = 'D'
     C                   UNLOCK    OVUSERP
     C                   EVAL      DMSG = 'Your office access has been di' +
     C                             'sabled.'
     C     DMSG          DSPLY
     C                   EVAL      *INLR = *ON
     C                   RETURN
     C                   ENDIF
     C                   TIME                    USLAST
     C                   UPDATE    USERREC
     C                   ENDIF
     C                   EVAL      ISADM = USADM
     C                   EVAL      LACT = 'SIGNON'
     C                   EVAL      LTXT = 'Opened the office menu'
     C                   EXSR      LOGIT
     C                   DOW       *IN03 = *OFF
     C                   EXSR      COUNTS
     C                   EVAL      HDRID = 'OFCMAIN'
     C                   EXSR      HDR
     C                   EVAL      MHDR = HDRLN
     C                   EVAL      ACC = 'user'
     C                   IF        ISADM = 'Y'
     C                   EVAL      ACC = 'administrator'
     C                   ENDIF
     C                   EVAL      MSGN = 'Signed on as ' + %TRIM(PGMUSR) +
     C                             '.  Access: ' + %TRIM(ACC) + '.'
     C                   EVAL      MSEL = *BLANKS
     C                   EVAL      MMSG = MSG
     C                   EVAL      MFKEY = 'F1=Help   F3=Sign off this men' +
     C                             'u   F5=Refresh'
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     MNUREC
     C                   EXSR      CSR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      SEL = %TRIML(MSEL)
     C     LCASE:UCASE   XLATE     SEL           SEL
     C                   IF        SEL = 'X'
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      SELN = 0
     C                   IF        SEL = *BLANKS
     C                   IF        CSRROW >= 6 AND CSRROW <= 15
     C                   EVAL      SELN = CSRROW - 5
     C                   ENDIF
     C                   IF        CSRROW = 17
     C                   EVAL      SELN = 90
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
     C                   SELECT
     C                   WHEN      SELN = 0
     C                   ITER
     C                   WHEN      SELN = 1
     C                   EVAL      PGMNAM = 'OVCAL'
     C                   WHEN      SELN = 2 OR SELN = 3 OR SELN = 4 OR SELN = 7
     C                   EVAL      SUBK = SELN
     C                   EXSR      SUBMNU
     C                   WHEN      SELN = 5
     C                   EVAL      PGMNAM = 'OVFIND'
     C                   WHEN      SELN = 6
     C                   EXSR      LOOKUP
     C                   IF        SELUSR <> *BLANKS
     C     SELUSR        CHAIN(N)  USERREC
     C                   IF        %FOUND(OVUSERP)
     C                   EVAL      MSG = %TRIMR(USUSER) + ': ' + %TRIMR(USNAME)
     C                   IF        USDEPT <> *BLANKS
     C                   EVAL      MSG = %TRIMR(MSG) + ', ' + %TRIMR(USDEPT)
     C                   ENDIF
     C                   IF        USPHON <> *BLANKS
     C                   EVAL      MSG = %TRIMR(MSG) + ', phone ' +
     C                             %TRIMR(USPHON)
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   WHEN      SELN = 8
     C                   EVAL      CMD = 'WRKSPLF'
     C                   EXSR      RUNCMD
     C                   EVAL      *IN50 = *OFF
     C                   WHEN      SELN = 9
     C                   EXSR      PROFIL
     C                   WHEN      SELN = 10
     C                   IF        ISADM = 'Y'
     C                   EVAL      PGMNAM = 'OVADM'
     C                   ELSE
     C                   EVAL      MSG = 'Administration is for office a' +
     C                             'dministrators only.'
     C                   ENDIF
     C                   WHEN      SELN = 90
     C                   LEAVE
     C                   OTHER
     C                   EVAL      MSG = 'That is not one of the choices.'
     C                   ENDSL
     C                   IF        PGMNAM <> *BLANKS
     C                   CALL      PGMNAM                               50
     C                   IF        *IN50 = *ON
     C                   EVAL      MSG = 'Program ' + %TRIM(PGMNAM) +
     C                             ' could not be run.'
     C                   EVAL      *IN50 = *OFF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      LACT = 'SIGNOFF'
     C                   EVAL      LTXT = 'Left the office menu'
     C                   EXSR      LOGIT
     C                   EVAL      *INLR = *ON
      * ---- counts shown beside the menu lines ----
     C     COUNTS        BEGSR
     C                   EVAL      NMSGN = 0
     C     *LOVAL        SETLL     MSGREC
     C                   READ      MSGREC
     C                   DOW       NOT %EOF(OVMSGP)
     C                   IF        MGTO = PGMUSR AND MGSTAT = 'N'
     C                   EVAL      NMSGN = NMSGN + 1
     C                   ENDIF
     C                   READ      MSGREC
     C                   ENDDO
     C                   EVAL      NMAILN = 0
     C     *LOVAL        SETLL     MAILREC
     C                   READ      MAILREC
     C                   DOW       NOT %EOF(OVMAILP)
     C                   IF        MMTO = PGMUSR AND MMSTAT = 'N'
     C                   EVAL      NMAILN = NMAILN + 1
     C                   ENDIF
     C                   READ      MAILREC
     C                   ENDDO
     C                   EVAL      NTASKN = 0
     C     KUSER         SETLL     TASKREC
     C     KUSER         READE     TASKREC
     C                   DOW       NOT %EOF(OVTASKP)
     C                   IF        TKSTAT <> 'X'
     C                   EVAL      NTASKN = NTASKN + 1
     C                   ENDIF
     C     KUSER         READE     TASKREC
     C                   ENDDO
     C                   EVAL      KDATE = TODN
     C                   EVAL      NTODAY = 0
     C     KEYD          SETLL     CALREC
     C     KEYD          READE     CALREC
     C                   DOW       NOT %EOF(OVCALP)
     C                   IF        CLDATE = KDATE
     C                   EVAL      NTODAY = NTODAY + 1
     C                   ENDIF
     C     KEYD          READE     CALREC
     C                   ENDDO
     C                   EVAL      MIDX = 1
     C     PGMUSR        CHAIN(N)  PREFREC
     C                   IF        %FOUND(OVPREFP)
     C     1             DO        6             I
     C                   IF        PRMASC = %SUBST(MNAMEL:I*7-6:7)
     C                   EVAL      MIDX = I
     C                   ENDIF
     C                   ENDDO
     C                   ENDIF
     C                   EVAL      ART = *BLANKS
     C                   SELECT
     C                   WHEN      MIDX = 1
     C                   EVAL      ART = ACOFA
     C                   WHEN      MIDX = 2
     C                   EVAL      ART = ACATA
     C                   WHEN      MIDX = 3
     C                   EVAL      ART = ADOGA
     C                   WHEN      MIDX = 4
     C                   EVAL      ART = AROBA
     C                   WHEN      MIDX = 5
     C                   EVAL      ART = AFISA
     C                   ENDSL
     C     1             DO        6             I
     C                   EVAL      MA(I) = %SUBST(ART:I*12-11:12)
     C                   ENDDO
     C                   EVAL      MI01 = *BLANKS
     C                   EVAL      MI02 = *BLANKS
     C                   EVAL      MI03 = *BLANKS
     C                   IF        NTODAY > 0
     C                   EVAL      MI01 = %CHAR(NTODAY) + ' today'
     C                   ENDIF
     C                   IF        NMSGN + NMAILN > 0
     C                   EVAL      MI02 = %CHAR(NMSGN + NMAILN) + ' new'
     C                   ENDIF
     C                   IF        NTASKN > 0
     C                   EVAL      MI03 = %CHAR(NTASKN) + ' open'
     C                   ENDIF
     C                   ENDSR
      * ---- a submenu: SUBK is the main menu option ----
     C     SUBMNU        BEGSR
     C                   DOW       1 = 1
     C                   EXSR      COUNTS
     C                   EVAL      SOA = *BLANKS
     C                   EVAL      SCA = *BLANKS
     C                   EVAL      SP = *BLANKS
     C                   SELECT
     C                   WHEN      SUBK = 2
     C                   EVAL      WTITL = 'Mail, messages and chat'
     C                   EVAL      SO(1) = ' 1. Messages'
     C                   EVAL      SP(1) = 'OVMSGS'
     C                   EVAL      SO(2) = ' 2. Mail'
     C                   EVAL      SP(2) = 'OVMAIL'
     C                   EVAL      SO(3) = ' 3. Live chat'
     C                   EVAL      SP(3) = 'OVCHAT'
     C                   EVAL      NOPT = 3
     C                   IF        NMSGN > 0
     C                   EVAL      SC(1) = %CHAR(NMSGN) + ' new'
     C                   ENDIF
     C                   IF        NMAILN > 0
     C                   EVAL      SC(2) = %CHAR(NMAILN) + ' new'
     C                   ENDIF
     C                   WHEN      SUBK = 3
     C                   EVAL      WTITL = 'Notes, tasks and phone book'
     C                   EVAL      SO(1) = ' 1. Notes'
     C                   EVAL      SP(1) = 'OVNOTE'
     C                   EVAL      SO(2) = ' 2. Tasks'
     C                   EVAL      SP(2) = 'OVTASK'
     C                   EVAL      SO(3) = ' 3. Phone book'
     C                   EVAL      SP(3) = 'OVPHON'
     C                   EVAL      NOPT = 3
     C                   IF        NTASKN > 0
     C                   EVAL      SC(2) = %CHAR(NTASKN) + ' open'
     C                   ENDIF
     C                   WHEN      SUBK = 4
     C                   EVAL      WTITL = 'Documents and spreadsheets'
     C                   EVAL      SO(1) = ' 1. Documents'
     C                   EVAL      SP(1) = 'OVDOC'
     C                   EVAL      SO(2) = ' 2. Spreadsheets'
     C                   EVAL      SP(2) = 'OVSHEET'
     C                   EVAL      SO(3) = ' 3. Printed output'
     C                   EVAL      SP(3) = '*SPLF'
     C                   EVAL      NOPT = 3
     C                   OTHER
     C                   EVAL      WTITL = 'Games and the office cat'
     C                   EVAL      SO(1) = ' 1. Games'
     C                   EVAL      SP(1) = 'OVGAME'
     C                   EVAL      SO(2) = ' 2. The office cat'
     C                   EVAL      SP(2) = 'OVCAT'
     C                   EVAL      NOPT = 2
     C                   ENDSL
     C                   EVAL      NLEN = %LEN(%TRIM(WTITL))
     C                   EVAL      SBTTL = *BLANKS
     C                   EVAL      %SUBST(SBTTL:%DIV(40 - NLEN:2) + 1:NLEN) =
     C                             %TRIM(WTITL)
     C                   EVAL      HDRID = 'OFCSUB'
     C                   EXSR      HDR
     C                   EVAL      SBHDR = HDRLN
     C                   EVAL      SSEL = *BLANKS
     C                   EVAL      SBMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   EVAL      SBFK = 'F1=Help   F3=Exit   F12=Back t' +
     C                             'o the main menu'
     C                   EXFMT     SUBM
     C                   EXSR      CSR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      K = 0
     C                   IF        SSEL <> *BLANKS
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = %TRIML(SSEL)
     C                   EXSR      TONUM
     C                   EVAL      K = NVAL
     C                   IF        NERR = '1'
     C                   EVAL      K = 99
     C                   ENDIF
     C                   ELSE
     C                   IF        CSRROW >= 7 AND CSRROW <= 6 + NOPT
     C                   EVAL      K = CSRROW - 6
     C                   ENDIF
     C                   ENDIF
     C                   IF        K = 0
     C                   ITER
     C                   ENDIF
     C                   IF        K > NOPT
     C                   EVAL      MSG = 'That is not one of the choices.'
     C                   ITER
     C                   ENDIF
     C                   IF        SP(K) = '*SPLF'
     C                   EVAL      CMD = 'WRKSPLF'
     C                   EXSR      RUNCMD
     C                   EVAL      *IN50 = *OFF
     C                   ELSE
     C                   CALL      SP(K)                                50
     C                   IF        *IN50 = *ON
     C                   EVAL      MSG = 'Program ' + %TRIM(SP(K)) +
     C                             ' could not be run.'
     C                   EVAL      *IN50 = *OFF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- the small month calendar ----
     C     MINCAL        BEGSR
     C                   TIME                    TS
     C                   MOVE      TS            TODD
     C     *ISO          MOVE      TODD          TODN
     C                   MOVE      TODN          W8
     C                   EVAL      W8 = %SUBST(W8:1:6) + '01'
     C                   MOVE      W8            FIRSTN
     C     *ISO          MOVE      FIRSTN        F1
     C     F1            ADDDUR    1:*M          NXT
     C     NXT           SUBDUR    F1            MDAYS:*D
     C     F1            SUBDUR    BASEDT        NDAYS:*D
     C                   EVAL      FDOW = %REM(%REM(NDAYS:7) + 7:7)
     C                   EVAL      MWK = 'Su Mo Tu We Th Fr Sa'
     C                   IF        UWEEK = 'M'
     C                   EVAL      FDOW = %REM(FDOW + 6:7)
     C                   EVAL      MWK = 'Mo Tu We Th Fr Sa Su'
     C                   ENDIF
     C                   EVAL      MCA = *BLANKS
     C     1             DO        MDAYS         DY
     C                   EVAL      CELL = FDOW + DY
     C                   EVAL      RW = %DIV(CELL - 1:7) + 1
     C                   EVAL      CC = %REM(CELL - 1:7)
     C                   EVAL      DAY2 = DY
     C                   EVAL      MARK = ' '
     C                   IF        FIRSTN + DY - 1 = TODN
     C                   EVAL      MARK = '>'
     C                   ENDIF
     C                   EVAL      %SUBST(MC(RW):CC*3+1:3) = MARK +
     C                             %EDITC(DAY2:'Z')
     C                   ENDDO
     C                   EVAL      MM = %DIV(%REM(FIRSTN:10000):100)
     C                   EVAL      MCT = %TRIMR(%SUBST(MNAMES:(MM-1)*9+1:9)) +
     C                             ' ' + %SUBST(W8:1:4)
     C                   ENDSR
      * ---- my profile ----
     C     PROFIL        BEGSR
     C     PGMUSR        CHAIN(N)  USERREC
     C                   EVAL      PNAME = USNAME
     C                   EVAL      PDEPT = USDEPT
     C                   EVAL      PPHON = USPHON
     C                   EVAL      PPOP = *BLANK
     C                   EVAL      ANIMON = 'Y'
     C                   EVAL      SAVMIN = 2
     C                   EVAL      CHATAU = 'A'
     C     PGMUSR        CHAIN(N)  SETREC
     C                   IF        %FOUND(OVSETUP)
     C                   EVAL      ANIMON = STANIM
     C                   EVAL      SAVMIN = STSAVE
     C                   EVAL      CHATAU = STCHAT
     C                   ENDIF
     C                   EVAL      PANIM = ANIMON
     C                   EVAL      PSAVE = %CHAR(SAVMIN)
     C                   EVAL      PCHAT = CHATAU
     C                   EVAL      PCHAR = %SUBST(MNAMEL:MIDX*7-6:7)
     C                   EVAL      PZONE = UZONE
     C                   EVAL      PZH = 'Blank = office time, UTC' + UOFFZ
     C                   EVAL      PWEEK = UWEEK
     C                   EVAL      PDBEG = %SUBST(%EDITC(UDBEG:'X'):1:2) + ':' +
     C                             %SUBST(%EDITC(UDBEG:'X'):3:2)
     C                   EVAL      PDEND = %SUBST(%EDITC(UDEND:'X'):1:2) + ':' +
     C                             %SUBST(%EDITC(UDEND:'X'):3:2)
     C                   EVAL      PUNIT = UNITS
     C                   EVAL      PMSG = *BLANKS
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCSETTING'
     C                   EXSR      HDR
     C                   EVAL      PHDR = HDRLN
     C                   EVAL      PFK = 'F1=Help   Enter=Save   F12=Cancel'
     C                   EXFMT     PROF
     C                   EVAL      PMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      WCHR = %TRIML(PCHAR)
     C     LCASE:UCASE   XLATE     WCHR          WCHR
     C                   EVAL      K = 0
     C     1             DO        6             I
     C                   IF        %SUBST(MNAMEL:I*7-6:7) = WCHR
     C                   EVAL      K = I
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = %TRIML(PSAVE)
     C                   EXSR      TONUM
     C                   SELECT
     C                   WHEN      PANIM <> 'Y' AND PANIM <> 'N'
     C                   EVAL      PMSG = 'Animations must be Y or N.'
     C                   WHEN      K = 0
     C                   EVAL      PMSG = 'Character must be COFFEE, CAT,' +
     C                             ' DOG, ROBOT, FISH or NONE.'
     C                   WHEN      NERR = '1' OR NVAL > 999
     C                   EVAL      PMSG = 'Screen saver must be a number ' +
     C                             'of minutes, 0 for never.'
     C                   WHEN      PCHAT <> 'A' AND PCHAT <> 'M'
     C                   EVAL      PMSG = 'Chat refresh must be A or M.'
     C                   WHEN      PNAME = *BLANKS
     C                   EVAL      PMSG = 'Type your name.'
     C                   ENDSL
     C                   IF        PMSG <> *BLANKS
     C                   ITER
     C                   ENDIF
     C                   EVAL      WSAV = NVAL
      * the calendar and clock part
     C                   EVAL      ZOUT = *BLANKS
     C                   IF        PZONE <> *BLANKS
     C                   EVAL      ZTX = PZONE
     C                   EXSR      PARSZN
     C                   IF        NERR = '1'
     C                   EVAL      PMSG = 'Time zone is hours from UTC, s' +
     C                             'uch as -05:00 or +01:00, or bl' + 'ank.'
     C                   ITER
     C                   ENDIF
     C                   ENDIF
     C                   IF        PWEEK <> 'S' AND PWEEK <> 'M'
     C                   EVAL      PMSG = 'Week starts on must be S or M.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      TM = PDBEG
     C                   EXSR      PARSTM
     C                   IF        NERR = '1' OR CLT < 0
     C                   EVAL      PMSG = 'Type the start of your working' +
     C                             ' day as HH:MM, such as 08:00.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      WBEG = CLT
     C                   EVAL      TM = PDEND
     C                   EXSR      PARSTM
     C                   IF        NERR = '1' OR CLT <= WBEG
     C                   EVAL      PMSG = 'The end of your working day mu' +
     C                             'st be HH:MM, after the start.'
     C                   ITER
     C                   ENDIF
     C                   IF        PUNIT <> 'I' AND PUNIT <> 'M'
     C                   EVAL      PMSG = 'Units must be I or M.'
     C                   ITER
     C                   ENDIF
     C     PGMUSR        CHAIN     SETREC
     C                   EVAL      STUSER = PGMUSR
     C                   EVAL      STANIM = PANIM
     C                   EVAL      STCHAT = PCHAT
     C                   EVAL      STSAVE = WSAV
     C                   EVAL      STZONE = ZOUT
     C                   EVAL      STWEEK = PWEEK
     C                   EVAL      STDBEG = WBEG
     C                   EVAL      STDEND = CLT
     C                   EVAL      STUNIT = PUNIT
     C                   IF        %FOUND(OVSETUP)
     C                   UPDATE    SETREC
     C                   ELSE
     C                   WRITE     SETREC
     C                   ENDIF
     C                   EVAL      MIDX = K
     C     PGMUSR        CHAIN     PREFREC
     C                   EVAL      PRUSER = PGMUSR
     C                   EVAL      PRMASC = %SUBST(MNAMEL:K*7-6:7)
     C                   IF        %FOUND(OVPREFP)
     C                   UPDATE    PREFREC
     C                   ELSE
     C                   WRITE     PREFREC
     C                   ENDIF
     C                   LEAVE
     C                   ENDDO
     C                   IF        *IN03 = *OFF AND *IN12 = *OFF
     C     PGMUSR        CHAIN     USERREC
     C                   IF        %FOUND(OVUSERP)
     C                   EVAL      USNAME = %TRIML(PNAME)
     C                   EVAL      USDEPT = %TRIML(PDEPT)
     C                   EVAL      USPHON = %TRIML(PPHON)
     C                   IF        PPOP = 'Y' OR PPOP = 'N'
     C                   EVAL      CMD = 'CHGMSGQ MSGQ(*USRPRF) DLVRY(*N' +
     C                             'OTIFY)'
     C                   IF        PPOP = 'Y'
     C                   EVAL      CMD = 'CHGMSGQ MSGQ(*USRPRF) DLVRY(*B' +
     C                             'REAK)'
     C                   ENDIF
     C                   EXSR      RUNCMD
     C                   EVAL      *IN50 = *OFF
     C                   ENDIF
     C                   UPDATE    USERREC
     C                   EVAL      MSG = 'Settings saved.'
     C                   EXSR      LOADSET
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- ZTX such as -05:00 into ZMIN minutes from UTC and ZOUT, or NERR
     C     PARSZN        BEGSR
     C                   EVAL      NERR = '0'
     C                   EVAL      ZMIN = 0
     C                   EVAL      ZH = 0
     C                   EVAL      ZM = 0
     C                   EVAL      ZSG = 1
     C                   EVAL      ZT = %TRIM(ZTX)
     C                   EVAL      CH = %SUBST(ZT:1:1)
     C                   IF        CH = '+' OR CH = '-'
     C                   IF        CH = '-'
     C                   EVAL      ZSG = -1
     C                   ENDIF
     C                   EVAL      ZT = %TRIM(%SUBST(ZT:2:5))
     C                   ENDIF
     C                   EVAL      ZL = %LEN(%TRIMR(ZT))
     C                   EVAL      P1 = %SCAN(':':ZT)
     C                   SELECT
     C                   WHEN      ZL = 0 OR P1 = 1
     C                   EVAL      NERR = '1'
     C                   WHEN      P1 > 1
     C                   EVAL      NSTR = %SUBST(ZT:1:P1-1)
     C                   EXSR      TONUM
     C                   EVAL      ZHV = NVAL
     C                   EVAL      ZMV = 0
     C                   IF        P1 < ZL
     C                   EVAL      NSTR = %SUBST(ZT:P1+1:ZL-P1)
     C                   EXSR      TONUM
     C                   EVAL      ZMV = NVAL
     C                   ENDIF
     C                   WHEN      ZL <= 2
     C                   EVAL      NSTR = %SUBST(ZT:1:ZL)
     C                   EXSR      TONUM
     C                   EVAL      ZHV = NVAL
     C                   EVAL      ZMV = 0
     C                   WHEN      ZL = 4
     C                   EVAL      NSTR = %SUBST(ZT:1:2)
     C                   EXSR      TONUM
     C                   EVAL      ZHV = NVAL
     C                   EVAL      NSTR = %SUBST(ZT:3:2)
     C                   EXSR      TONUM
     C                   EVAL      ZMV = NVAL
     C                   OTHER
     C                   EVAL      NERR = '1'
     C                   ENDSL
     C                   IF        NERR = '0' AND (ZHV > 14 OR ZMV > 59)
     C                   EVAL      NERR = '1'
     C                   ENDIF
     C                   IF        NERR = '0'
     C                   EVAL      ZH = ZHV
     C                   EVAL      ZM = ZMV
     C                   EVAL      ZMIN = ZSG * (ZHV * 60 + ZMV)
     C                   EVAL      ZOUT = '+' + %EDITC(ZH:'X') + ':' +
     C                             %EDITC(ZM:'X')
     C                   IF        ZMIN < 0
     C                   EVAL      ZOUT = '-' + %EDITC(ZH:'X') + ':' +
     C                             %EDITC(ZM:'X')
     C                   ENDIF
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

     H DFTACTGRP(*YES) DATFMT(*ISO)
      * OVCAL - OfficeVibes/400
     FOVCALP    UF A E           K DISK
     FOVPREFP   UF A E           K DISK
     FOVUSERP   IF   E           K DISK
     FOVCAUTP   IF   E           K DISK
     FOVROOMP   IF   E           K DISK
     FOVHOLP    IF   E           K DISK
     FOVCAL     CF   E             WORKSTN INFDS(DSPINF) MAXDEV(*FILE)
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
     DCSA                            72A
     D CS                            12A   DIM(6) OVERLAY(CSA)
     D CS1                           12A   OVERLAY(CSA:1)
     D CS2                           12A   OVERLAY(CSA:13)
     D CS3                           12A   OVERLAY(CSA:25)
     D CS4                           12A   OVERLAY(CSA:37)
     D CS5                           12A   OVERLAY(CSA:49)
     D CS6                           12A   OVERLAY(CSA:61)
     D                 DS
     DPMCA                          126A
     D PMC                           21A   DIM(6) OVERLAY(PMCA)
     D PMC1                          21A   OVERLAY(PMCA:1)
     D PMC2                          21A   OVERLAY(PMCA:22)
     D PMC3                          21A   OVERLAY(PMCA:43)
     D PMC4                          21A   OVERLAY(PMCA:64)
     D PMC5                          21A   OVERLAY(PMCA:85)
     D PMC6                          21A   OVERLAY(PMCA:106)
     D                 DS
     DDLNA                          840A
     D DLN                           70A   DIM(12) OVERLAY(DLNA)
     D DLN01                         70A   OVERLAY(DLNA:1)
     D DLN02                         70A   OVERLAY(DLNA:71)
     D DLN03                         70A   OVERLAY(DLNA:141)
     D DLN04                         70A   OVERLAY(DLNA:211)
     D DLN05                         70A   OVERLAY(DLNA:281)
     D DLN06                         70A   OVERLAY(DLNA:351)
     D DLN07                         70A   OVERLAY(DLNA:421)
     D DLN08                         70A   OVERLAY(DLNA:491)
     D DLN09                         70A   OVERLAY(DLNA:561)
     D DLN10                         70A   OVERLAY(DLNA:631)
     D DLN11                         70A   OVERLAY(DLNA:701)
     D DLN12                         70A   OVERLAY(DLNA:771)
     D                 DS
     DDOPA                           24A
     D DOP                            2A   DIM(12) OVERLAY(DOPA)
     D DOP01                          2A   OVERLAY(DOPA:1)
     D DOP02                          2A   OVERLAY(DOPA:3)
     D DOP03                          2A   OVERLAY(DOPA:5)
     D DOP04                          2A   OVERLAY(DOPA:7)
     D DOP05                          2A   OVERLAY(DOPA:9)
     D DOP06                          2A   OVERLAY(DOPA:11)
     D DOP07                          2A   OVERLAY(DOPA:13)
     D DOP08                          2A   OVERLAY(DOPA:15)
     D DOP09                          2A   OVERLAY(DOPA:17)
     D DOP10                          2A   OVERLAY(DOPA:19)
     D DOP11                          2A   OVERLAY(DOPA:21)
     D DOP12                          2A   OVERLAY(DOPA:23)
     D                 DS
     DNLA                          1216A
     D NL                            76A   DIM(16) OVERLAY(NLA)
     D NL01                          76A   OVERLAY(NLA:1)
     D NL02                          76A   OVERLAY(NLA:77)
     D NL03                          76A   OVERLAY(NLA:153)
     D NL04                          76A   OVERLAY(NLA:229)
     D NL05                          76A   OVERLAY(NLA:305)
     D NL06                          76A   OVERLAY(NLA:381)
     D NL07                          76A   OVERLAY(NLA:457)
     D NL08                          76A   OVERLAY(NLA:533)
     D NL09                          76A   OVERLAY(NLA:609)
     D NL10                          76A   OVERLAY(NLA:685)
     D NL11                          76A   OVERLAY(NLA:761)
     D NL12                          76A   OVERLAY(NLA:837)
     D NL13                          76A   OVERLAY(NLA:913)
     D NL14                          76A   OVERLAY(NLA:989)
     D NL15                          76A   OVERLAY(NLA:1065)
     D NL16                          76A   OVERLAY(NLA:1141)
     D                 DS
     DMDLA                          468A
     D MDL                           78A   DIM(6) OVERLAY(MDLA)
     D MDL1                          78A   OVERLAY(MDLA:1)
     D MDL2                          78A   OVERLAY(MDLA:79)
     D MDL3                          78A   OVERLAY(MDLA:157)
     D MDL4                          78A   OVERLAY(MDLA:235)
     D MDL5                          78A   OVERLAY(MDLA:313)
     D MDL6                          78A   OVERLAY(MDLA:391)
     D                 DS
     DMVLA                          468A
     D MVL                           78A   DIM(6) OVERLAY(MVLA)
     D MVL1                          78A   OVERLAY(MVLA:1)
     D MVL2                          78A   OVERLAY(MVLA:79)
     D MVL3                          78A   OVERLAY(MVLA:157)
     D MVL4                          78A   OVERLAY(MVLA:235)
     D MVL5                          78A   OVERLAY(MVLA:313)
     D MVL6                          78A   OVERLAY(MVLA:391)
     D                 DS
     DWLA                          1092A
     D WL                            78A   DIM(14) OVERLAY(WLA)
     D WL01                          78A   OVERLAY(WLA:1)
     D WL02                          78A   OVERLAY(WLA:79)
     D WL03                          78A   OVERLAY(WLA:157)
     D WL04                          78A   OVERLAY(WLA:235)
     D WL05                          78A   OVERLAY(WLA:313)
     D WL06                          78A   OVERLAY(WLA:391)
     D WL07                          78A   OVERLAY(WLA:469)
     D WL08                          78A   OVERLAY(WLA:547)
     D WL09                          78A   OVERLAY(WLA:625)
     D WL10                          78A   OVERLAY(WLA:703)
     D WL11                          78A   OVERLAY(WLA:781)
     D WL12                          78A   OVERLAY(WLA:859)
     D WL13                          78A   OVERLAY(WLA:937)
     D WL14                          78A   OVERLAY(WLA:1015)
     D                 DS
     DSXA                          1216A
     D SX                            76A   DIM(16) OVERLAY(SXA)
     D SX01                          76A   OVERLAY(SXA:1)
     D SX02                          76A   OVERLAY(SXA:77)
     D SX03                          76A   OVERLAY(SXA:153)
     D SX04                          76A   OVERLAY(SXA:229)
     D SX05                          76A   OVERLAY(SXA:305)
     D SX06                          76A   OVERLAY(SXA:381)
     D SX07                          76A   OVERLAY(SXA:457)
     D SX08                          76A   OVERLAY(SXA:533)
     D SX09                          76A   OVERLAY(SXA:609)
     D SX10                          76A   OVERLAY(SXA:685)
     D SX11                          76A   OVERLAY(SXA:761)
     D SX12                          76A   OVERLAY(SXA:837)
     D SX13                          76A   OVERLAY(SXA:913)
     D SX14                          76A   OVERLAY(SXA:989)
     D SX15                          76A   OVERLAY(SXA:1065)
     D SX16                          76A   OVERLAY(SXA:1141)
     DACOFA            C                   '  (  )  (      )  (  )   _____-
     D                                     ___   |        |__|        |_|-
     D                                     (________)  '
     DACOFB            C                   '   )  (  )    (  )  (    _____-
     D                                     ___   |        |__|        |_|-
     D                                     (________)  '
     DACATA            C                   '              /|_/|      ( o.o-
     D                                      )      > w <      /|   |__   -
     D                                     (_|___|__)~ '
     DACATB            C                   '       z      /|_/|      ( -.--
     D                                      )      > w <      /|   |__   -
     D                                     (_|___|__)_ '
     DADOGA            C                   '               __         /  |-
     D                                     ____   ( o      )/  |  __  |  -
     D                                       |_|  |_|  '
     DADOGB            C                   '               __         /  |-
     D                                     ____   ( o      )-  |  __  |  -
     D                                        |_| |_|  '
     DAROBA            C                   '    _|_        [o o]      /[ =-
     D                                      ]/      [___]        | |     -
     D                                        _| |_    '
     DAROBB            C                   '    _|_        [- -]      -[ =-
     D                                      ]-      [___]        | |     -
     D                                        _| |_    '
     DAFISA            C                   '                  o       ><((-
     D                                     (">      o                    -
     D                                       ~~~~~~~~  '
     DAFISB            C                   '     o                     ><(-
     D                                     ((">                o         -
     D                                       ~ ~~~~ ~~ '
     DMNAMEL           C                   'COFFEE CAT    DOG    ROBOT  FI-
     D                                     SH   NONE   '
     DMNAMES           C                   'January  February March    Apr-
     D                                     il    May      June     July  -
     D                                        August   SeptemberOctober  -
     D                                     November December '
     DDNAMES           C                   'Sunday   Monday   Tuesday  Wed-
     D                                     nesdayThursday Friday   Saturd-
     D                                     ay '
     DBORDER           C                   '+----------+----------+--------
     D                                     ---+----------+----------+-----
     D                                     ------+----------+'
     DROWL             C                   '|          |          |       -
     D                                        |          |          |    -
     D                                           |          |'
     DWOFF             S              5  0
     DTM               S              5A
     DHH               S              5  0
     DMI               S              5  0
     DCLT              S              5  0
     DART              S             72A
     DMIDX             S              5  0
     DANIM             S              1A
     DFRAME            S              5  0
     DFULL             S              1A
     DCURD             S               D
     DTODD             S               D
     DBASEDT           S               D   INZ(D'2000-01-02')
     DF1               S               D
     DNXT              S               D
     DD1               S               D
     DD2               S               D
     DJAN1             S               D
     DMOND             S               D
     DSXD              S               D
     DNDAYS            S              7  0
     DFDOW             S              5  0
     DMDAYS            S              5  0
     DWKD              S              5  0
     DDOYN             S              5  0
     DCURN             S              8  0
     DTODN             S              8  0
     DFIRSTN           S              8  0
     DKDATE            S              8  0
     DKTIME            S              4  0
     DKTM              S              4  0 DIM(12)
     DKSD              S               Z   DIM(12)
     DDTXT             S             10A
     DW4               S              4A
     DTTXT             S              7A
     DHAS              S              1A   DIM(31)
     DHOL              S              1A   DIM(31)
     DDOTS             S             10A   DIM(31)
     DML               S             21A   DIM(6)
     DMTT              S             22A
     DDY               S              5  0
     DDAY2             S              2  0
     DCELL             S              5  0
     DRW               S              5  0
     DCC               S              5  0
     DMARK             S              1A
     DEDMODE           S              1A
     DSTARTV           S              8  0
     DENDV             S              8  0
     DNDAY             S              5  0
     DKK               S              5  0
     DCHGR             S              5  0
     DOWN              S             10A
     DOWNNM            S             30A
     DCANCHG           S              1A
     DWOWN             S             10A
     DSWOK             S              1A
     DVW               S              1A
     DCG               S              1A
     DKAOWN            S             10A
     DKAUSR            S             10A
     DKRM              S              9A
     DPDSHOW           S             10A
     DSELN             S              5  0
     DNDV              S              5  0
     DNLX              S             76A   DIM(300)
     DNLH              S              1A   DIM(300)
     DNLN              S              5  0
     DXOWN             S             10A
     DXDATE            S              8A
     DHOUR             S              5  0
     DSLOT             S              5  0
     DWCELL            S             10A
     DWDAY             S              5  0
     DWROW             S              5  0
     DWPOS             S              5  0
     DH12              S              5  0
     DAMPM             S              2A
     DSXN              S              8  0
     DKM               S              5  0
     DBAND             S              5  0
     DMCOL             S              5  0
     DHOLNM            S             30A
     DWSAVE            S               D
     DCNTN             S              5  0
     DDK1              C                   '2=Change  4=Delete     F6=Add -
     D                                       F7=Previous day   F8=Next da-
     D                                     y'
     DDK2              C                   'F1=Help  F3=Exit  F9=Print the-
     D                                      day  F11=More  F12=Return'
     C     KEYD          KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KDATE
     C     KEYF          KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KDATE
     C                   KFLD                    KTIME
     C                   KFLD                    KSTMP
     C     KEYA          KLIST
     C                   KFLD                    KAOWN
     C                   KFLD                    KAUSR
     C                   EVAL      LAPP = 'CALENDAR'
     C                   TIME                    TS
     C                   MOVE      TS            TODD
     C     *ISO          MOVE      TODD          TODN
     C                   EVAL      CURD = TODD
     C                   EVAL      CURN = TODN
     C                   EVAL      WOWN = PGMUSR
     C                   EXSR      SWITCH
     C                   EVAL      MIDX = 1
     C     PGMUSR        CHAIN(N)  PREFREC
     C                   IF        %FOUND(OVPREFP)
     C     1             DO        6             I
     C                   IF        PRMASC = %SUBST(MNAMEL:I*7-6:7)
     C                   EVAL      MIDX = I
     C                   ENDIF
     C                   ENDDO
     C                   ENDIF
     C                   EVAL      ANIM = '1'
     C                   IF        MIDX = 6
     C                   EVAL      ANIM = '0'
     C                   ENDIF
     C                   EVAL      FRAME = 0
     C                   EVAL      FULL = '1'
     C                   EVAL      PNDV = '7'
     C                   EVAL      PNDP = '7'
     C                   DOW       1 = 1
     C                   IF        FULL = '1'
     C                   EXSR      BUILDM
     C                   ENDIF
     C                   EXSR      SETART
     C                   EXSR      CLOCK
     C                   IF        ANIM = '1'
     C                   EVAL      *IN45 = *ON
     C                   IF        FULL = '1'
     C                   EVAL      *IN46 = *OFF
     C                   WRITE     BLANK
     C                   ELSE
     C                   EVAL      *IN46 = *ON
     C                   ENDIF
     C                   WRITE     PMENU
     C                   READ      OVCAL                                5152
     C                   IF        *IN51 = *ON
     C                   EVAL      *IN51 = *OFF
     C                   IF        DSPSTS = 1331
     C                   EVAL      FRAME = 1 - FRAME
     C                   EVAL      FULL = '0'
     C                   ELSE
     C                   EVAL      ANIM = '0'
     C                   EVAL      FULL = '1'
     C                   EVAL      MSG = 'The character cannot move on t' +
     C                             'his display.'
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   ELSE
     C                   EVAL      *IN45 = *OFF
     C                   EVAL      *IN46 = *OFF
     C                   WRITE     BLANK
     C                   EXFMT     PMENU
     C                   ENDIF
     C                   EVAL      FULL = '1'
     C                   EXSR      CSR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   SELECT
     C                   WHEN      *IN05 = *ON
     C                   EXSR      NEXTCH
     C                   WHEN      *IN06 = *ON
     C                   EVAL      EDMODE = 'A'
     C                   EXSR      ADDC
     C                   WHEN      *IN10 = *ON
     C                   EVAL      CURD = F1
     C                   ADDDUR    1:*M          CURD
     C     *ISO          MOVE      CURD          CURN
     C                   WHEN      *IN11 = *ON
     C                   EVAL      CURD = F1
     C                   SUBDUR    1:*M          CURD
     C     *ISO          MOVE      CURD          CURN
     C                   OTHER
     C                   EXSR      ENTER
     C                   ENDSL
     C                   ENDDO
     C                   EVAL      *IN45 = *OFF
     C                   EVAL      *IN46 = *OFF
     C                   EVAL      *INLR = *ON
      * ---- Enter on the Process Calendars menu ----
     C     ENTER         BEGSR
     C                   EVAL      WOWN = %TRIML(POWN)
     C     LCASE:UCASE   XLATE     WOWN          WOWN
     C                   IF        WOWN <> OWN AND WOWN <> *BLANKS
     C                   EXSR      SWITCH
     C                   ENDIF
     C                   IF        PDATE <> PDSHOW
     C                   EVAL      DUE = PDATE
     C                   EXSR      CHKDT
     C                   IF        NERR = '1'
     C                   EVAL      MSG = 'That date is not valid.  Use M' +
     C                             '/D or M/D/YYYY.'
     C                   ELSE
     C                   EVAL      CURN = DUEVAL
     C     *ISO          MOVE      CURN          CURD
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      SELN = 0
     C                   EVAL      NERR = '0'
     C                   IF        PSEL <> *BLANKS
     C                   EVAL      NSTR = %TRIML(PSEL)
     C                   EXSR      TONUM
     C                   EVAL      SELN = NVAL
     C                   IF        NERR = '1'
     C                   EVAL      SELN = 99
     C                   ENDIF
     C                   ELSE
     C                   IF        CSRROW >= 7 AND CSRROW <= 19 AND CSRCOL >= 6
     C                             AND CSRCOL <= 50
     C                   EVAL      SELN = CSRROW - 6
     C                   ENDIF
     C                   IF        CSRROW >= 8 AND CSRROW <= 13 AND CSRCOL >= 55
     C                             AND CSRCOL <= 75
     C                   EVAL      DY = (CSRROW - 8) * 7 + %DIV(CSRCOL - 55:3) +
     C                             1 - FDOW
     C                   IF        DY >= 1 AND DY <= MDAYS
     C                   EVAL      CURN = FIRSTN + DY - 1
     C     *ISO          MOVE      CURN          CURD
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = %TRIML(PNDV)
     C                   EXSR      TONUM
     C                   EVAL      NDV = NVAL
     C                   IF        NERR = '1' OR NDV < 1 OR NDV > 31
     C                   EVAL      NDV = 7
     C                   EVAL      PNDV = '7'
     C                   ENDIF
     C                   SELECT
     C                   WHEN      SELN = 0
     C                   EVAL      SELN = 0
     C                   WHEN      SELN = 1
     C                   EXSR      DAYVW
     C                   WHEN      SELN = 2
     C                   EXSR      NDAYVW
     C                   WHEN      SELN = 3
     C                   EVAL      XOWN = OWN
     C                   MOVE      CURN          XDATE
     C                   CALL      'OVROOM'                             50
     C                   PARM                    XOWN
     C                   PARM                    XDATE
     C                   EVAL      *IN50 = *OFF
     C                   IF        XOWN <> OWN
     C                   EVAL      WOWN = XOWN
     C                   EXSR      SWITCH
     C                   EXSR      DAYVW
     C                   ENDIF
     C                   WHEN      SELN = 4
     C                   ADDDUR    1:*D          CURD
     C     *ISO          MOVE      CURD          CURN
     C                   EXSR      DAYVW
     C                   WHEN      SELN = 5
     C                   SUBDUR    1:*D          CURD
     C     *ISO          MOVE      CURD          CURN
     C                   EXSR      DAYVW
     C                   WHEN      SELN = 6
     C                   EXSR      MONTHV
     C                   WHEN      SELN = 7
     C                   MOVE      CURN          XDATE
     C                   CALL      'OVMEET'                             50
     C                   PARM                    XDATE
     C                   EVAL      *IN50 = *OFF
     C                   WHEN      SELN = 8
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = %TRIML(PNDP)
     C                   EXSR      TONUM
     C                   EVAL      NDV = NVAL
     C                   IF        NERR = '1' OR NDV < 1 OR NDV > 31
     C                   EVAL      NDV = 7
     C                   EVAL      PNDP = '7'
     C                   ENDIF
     C                   EXSR      PRINTN
     C                   WHEN      SELN = 9
     C                   EXSR      WEEKV
     C                   WHEN      SELN = 10
     C                   EXSR      SIXVW
     C                   WHEN      SELN = 11
     C                   CALL      'OVCAUT'                             50
     C                   EVAL      *IN50 = *OFF
     C                   WHEN      SELN = 12
     C                   EVAL      XOWN = OWN
     C                   EVAL      XDATE = *BLANKS
     C                   CALL      'OVCSRC'                             50
     C                   PARM                    XOWN
     C                   PARM                    XDATE
     C                   EVAL      *IN50 = *OFF
     C                   IF        XDATE <> *BLANKS
     C                   MOVE      XDATE         CURN
     C     *ISO          MOVE      CURN          CURD
     C                   EXSR      DAYVW
     C                   ENDIF
     C                   WHEN      SELN = 13
     C                   CALL      'OVHOLI'                             50
     C                   EVAL      *IN50 = *OFF
     C                   OTHER
     C                   EVAL      MSG = 'Type a number from 1 to 13.'
     C                   ENDSL
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- make WOWN the calendar shown, if this user may see it ----
     C     SWITCH        BEGSR
     C                   EVAL      SWOK = '0'
     C                   SELECT
     C                   WHEN      %SUBST(WOWN:1:1) = '#'
     C                   EVAL      KRM = %SUBST(WOWN:2:9)
     C     KRM           CHAIN     ROOMREC
     C                   IF        %FOUND(OVROOMP)
     C                   EVAL      SWOK = '1'
     C                   EVAL      OWNNM = 'Room: ' + RMNAME
     C                   EVAL      CANCHG = '1'
     C                   ELSE
     C                   EVAL      MSG = 'There is no conference room ' +
     C                             %SUBST(WOWN:2:9)
     C                   ENDIF
     C                   OTHER
     C     WOWN          CHAIN     USERREC
     C                   IF        NOT %FOUND(OVUSERP)
     C                   EVAL      MSG = %TRIM(WOWN) + ' is not an office user.'
     C                   ELSE
     C                   EVAL      VW = 'Y'
     C                   EVAL      CG = 'N'
     C                   IF        WOWN = PGMUSR
     C                   EVAL      CG = 'Y'
     C                   ELSE
     C                   EVAL      KAOWN = WOWN
     C                   EVAL      KAUSR = PGMUSR
     C     KEYA          CHAIN     AUTHREC
     C                   IF        NOT %FOUND(OVCAUTP)
     C                   EVAL      KAUSR = '*STD'
     C     KEYA          CHAIN     AUTHREC
     C                   ENDIF
     C                   IF        %FOUND(OVCAUTP)
     C                   EVAL      VW = CAVIEW
     C                   EVAL      CG = CACHG
     C                   ENDIF
     C                   ENDIF
     C                   IF        VW <> 'Y'
     C                   EVAL      MSG = %TRIM(WOWN) +
     C                             ' has not let you see their cal' + 'endar.'
     C                   ELSE
     C                   EVAL      SWOK = '1'
     C                   EVAL      OWNNM = USNAME
     C                   EVAL      CANCHG = '0'
     C                   IF        CG = 'Y'
     C                   EVAL      CANCHG = '1'
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDSL
     C                   IF        SWOK = '1'
     C                   EVAL      OWN = WOWN
     C                   EVAL      KUSER = OWN
     C                   EVAL      PGNO = 0
     C                   ENDIF
     C                   ENDSR
      * ---- fill the Process Calendars menu ----
     C     BUILDM        BEGSR
     C                   EVAL      HDRID = 'CALMAIN'
     C                   EXSR      HDR
     C                   EVAL      PHDR = HDRLN
     C                   EVAL      POWN = OWN
     C                   EVAL      PONM = OWNNM
     C                   MOVE      CURN          W8
     C                   EVAL      DTXT = %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2)
     C                             + '/' + %SUBST(W8:1:4)
     C                   EVAL      PDATE = DTXT
     C                   EVAL      PDSHOW = DTXT
     C                   EXSR      GETWKD
     C                   EVAL      PDNM = %TRIMR(%SUBST(DNAMES:WKD*9+1:9))
     C                   MOVE      CURN          W8
     C                   EVAL      W8 = %SUBST(W8:1:6) + '01'
     C                   MOVE      W8            FIRSTN
     C                   EXSR      MKMON
     C     1             DO        6             I
     C                   EVAL      PMC(I) = ML(I)
     C                   ENDDO
     C                   EVAL      PMCT = MTT
     C                   EXSR      GETDOY
     C                   EVAL      PDOY = '   Day of year: ' + %CHAR(DOYN)
     C                   EVAL      PSEL = *BLANKS
     C                   EVAL      PMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   EVAL      PFK1 = 'F1=Help  F3=Exit  F5=Character' +
     C                             '  F6=Add an appointment'
     C                   EVAL      PFK2 = 'F10=Next month   F11=Previous ' +
     C                             'month   Cursor on a day + Ente' +
     C                             'r picks it'
     C                   ENDSR
     C     CLOCK         BEGSR
     C                   TIME                    TS
     C                   MOVE      TS            WSTMP
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = %SUBST(WSTMP:12:2)
     C                   EXSR      TONUM
     C                   EVAL      H12 = NVAL
     C                   EVAL      AMPM = 'AM'
     C                   IF        H12 >= 12
     C                   EVAL      AMPM = 'PM'
     C                   ENDIF
     C                   IF        H12 > 12
     C                   EVAL      H12 = H12 - 12
     C                   ENDIF
     C                   IF        H12 = 0
     C                   EVAL      H12 = 12
     C                   ENDIF
     C                   EVAL      PTIM = 'Time:  ' + %CHAR(H12) + ':' +
     C                             %SUBST(WSTMP:15:2) + ' ' + AMPM
     C                   ENDSR
      * ---- day of the week of CURD (0 is Sunday), day of the year
     C     GETWKD        BEGSR
     C     CURD          SUBDUR    BASEDT        NDAYS:*D
     C                   EVAL      WKD = %REM(%REM(NDAYS:7) + 7:7)
     C                   ENDSR
     C     GETDOY        BEGSR
     C                   MOVE      CURN          W8
     C                   EVAL      W8 = %SUBST(W8:1:4) + '0101'
     C                   MOVE      W8            N8
     C     *ISO          MOVE      N8            JAN1
     C     CURD          SUBDUR    JAN1          DOYN:*D
     C                   EVAL      DOYN = DOYN + 1
     C                   ENDSR
      * ---- one month as six lines (FIRSTN is the first of the month)
     C     MKMON         BEGSR
     C     *ISO          MOVE      FIRSTN        F1
     C     F1            ADDDUR    1:*M          NXT
     C     NXT           SUBDUR    F1            MDAYS:*D
     C     F1            SUBDUR    BASEDT        NDAYS:*D
     C                   EVAL      FDOW = %REM(%REM(NDAYS:7) + 7:7)
     C                   EVAL      HAS = *BLANK
     C                   EVAL      HOL = *BLANK
     C                   EVAL      KDATE = FIRSTN
     C     KEYD          SETLL     CALREC
     C     KUSER         READE(N)  CALREC
     C                   DOW       NOT %EOF(OVCALP) AND CLDATE < FIRSTN + MDAYS
     C                   EVAL      HAS(CLDATE - FIRSTN + 1) = '*'
     C     KUSER         READE(N)  CALREC
     C                   ENDDO
     C     FIRSTN        SETLL     HOLREC
     C                   READ(N)   HOLREC
     C                   DOW       NOT %EOF(OVHOLP) AND HLDATE < FIRSTN + MDAYS
     C                   EVAL      HOL(HLDATE - FIRSTN + 1) = 'H'
     C                   READ(N)   HOLREC
     C                   ENDDO
     C                   EVAL      ML = *BLANKS
     C     1             DO        MDAYS         DY
     C                   EVAL      CELL = FDOW + DY
     C                   EVAL      RW = %DIV(CELL - 1:7) + 1
     C                   EVAL      CC = %REM(CELL - 1:7)
     C                   EVAL      DAY2 = DY
     C                   EVAL      MARK = HAS(DY)
     C                   IF        HOL(DY) = 'H'
     C                   EVAL      MARK = 'H'
     C                   ENDIF
     C                   IF        FIRSTN + DY - 1 = CURN
     C                   EVAL      MARK = '>'
     C                   ENDIF
     C                   EVAL      %SUBST(ML(RW):CC*3+1:3) = MARK +
     C                             %EDITC(DAY2:'Z')
     C                   ENDDO
     C                   MOVE      FIRSTN        W8
     C                   EVAL      MM = %DIV(%REM(FIRSTN:10000):100)
     C                   EVAL      MTT = %SUBST(W8:1:4) + '   ' +
     C                             %TRIMR(%SUBST(MNAMES:(MM-1)*9+1:9)) + '   ' +
     C                             %SUBST(W8:1:4)
     C                   ENDSR
      * ---- the character beside the calendar ----
     C     SETART        BEGSR
     C                   EVAL      ART = *BLANKS
     C                   SELECT
     C                   WHEN      MIDX = 1 AND FRAME = 0
     C                   EVAL      ART = ACOFA
     C                   WHEN      MIDX = 1
     C                   EVAL      ART = ACOFB
     C                   WHEN      MIDX = 2 AND FRAME = 0
     C                   EVAL      ART = ACATA
     C                   WHEN      MIDX = 2
     C                   EVAL      ART = ACATB
     C                   WHEN      MIDX = 3 AND FRAME = 0
     C                   EVAL      ART = ADOGA
     C                   WHEN      MIDX = 3
     C                   EVAL      ART = ADOGB
     C                   WHEN      MIDX = 4 AND FRAME = 0
     C                   EVAL      ART = AROBA
     C                   WHEN      MIDX = 4
     C                   EVAL      ART = AROBB
     C                   WHEN      MIDX = 5 AND FRAME = 0
     C                   EVAL      ART = AFISA
     C                   WHEN      MIDX = 5
     C                   EVAL      ART = AFISB
     C                   ENDSL
     C     1             DO        6             I
     C                   EVAL      CS(I) = %SUBST(ART:I*12-11:12)
     C                   ENDDO
     C                   ENDSR
     C     NEXTCH        BEGSR
     C                   EVAL      MIDX = MIDX + 1
     C                   IF        MIDX > 6
     C                   EVAL      MIDX = 1
     C                   ENDIF
     C                   EVAL      ANIM = '1'
     C                   IF        MIDX = 6
     C                   EVAL      ANIM = '0'
     C                   ENDIF
     C     PGMUSR        CHAIN     PREFREC
     C                   EVAL      PRUSER = PGMUSR
     C                   EVAL      PRMASC = %SUBST(MNAMEL:MIDX*7-6:7)
     C                   IF        %FOUND(OVPREFP)
     C                   UPDATE    PREFREC
     C                   ELSE
     C                   WRITE     PREFREC
     C                   ENDIF
     C                   EVAL      MSG = 'Character: ' + %TRIM(PRMASC) +
     C                             '.  F5 for the next one.'
     C                   ENDSR
      * ---- work with the schedule for one day ----
     C     DAYVW         BEGSR
     C                   EVAL      PGNO = 0
     C                   DOW       1 = 1
     C                   EXSR      LOADD
     C                   EVAL      HDRID = 'CALDAY'
     C                   EXSR      HDR
     C                   EVAL      DHDR = HDRLN
     C                   EVAL      DTTL = 'Schedule for ' + OWNNM
     C                   MOVE      CURN          W8
     C                   EVAL      DTXT = %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2)
     C                             + '/' + %SUBST(W8:1:4)
     C                   EXSR      GETWKD
     C                   EXSR      GETDOY
     C                   EVAL      DDTE = %TRIMR(%SUBST(DNAMES:WKD*9+1:9)) +
     C                             ', ' + DTXT + '   day ' + %CHAR(DOYN)
     C                   EVAL      DHOL = *BLANKS
     C     CURN          CHAIN(N)  HOLREC
     C                   IF        %FOUND(OVHOLP)
     C                   EVAL      DHOL = 'Holiday: ' + HLNAME
     C                   ENDIF
     C                   EVAL      DMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   EVAL      DFK1 = DK1
     C                   EVAL      DFK2 = DK2
     C                   EXFMT     DAYV
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   SELECT
     C                   WHEN      *IN06 = *ON
     C                   EVAL      EDMODE = 'A'
     C                   EXSR      ADDC
     C                   WHEN      *IN07 = *ON
     C                   SUBDUR    1:*D          CURD
     C     *ISO          MOVE      CURD          CURN
     C                   EVAL      PGNO = 0
     C                   WHEN      *IN08 = *ON
     C                   ADDDUR    1:*D          CURD
     C     *ISO          MOVE      CURD          CURN
     C                   EVAL      PGNO = 0
     C                   WHEN      *IN09 = *ON
     C                   EVAL      NDV = 1
     C                   EXSR      PRINTN
     C                   WHEN      *IN11 = *ON
     C                   EVAL      PGNO = PGNO + 1
     C                   IF        PGNO * 12 >= NMATCH
     C                   EVAL      PGNO = 0
     C                   ENDIF
     C                   OTHER
     C                   EXSR      DAYOPT
     C                   ENDSL
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
     C     LOADD         BEGSR
     C                   EVAL      DLNA = *BLANKS
     C                   EVAL      DOPA = *BLANKS
     C                   EVAL      NMATCH = 0
     C                   EVAL      BASE = PGNO * 12
     C                   EVAL      KDATE = CURN
     C     KEYD          SETLL     CALREC
     C     KEYD          READE(N)  CALREC
     C                   DOW       NOT %EOF(OVCALP)
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 12
     C                   EVAL      ROW = NMATCH - BASE
     C                   EXSR      FMTTM
     C                   EVAL      DLN(ROW) = TTXT + '  ' + CLTEXT
     C                   EVAL      KTM(ROW) = CLTIME
     C                   EVAL      KSD(ROW) = CLSTMP
     C                   ENDIF
     C     KEYD          READE(N)  CALREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 12
     C                   EVAL      NSHOW = 12
     C                   ENDIF
     C                   IF        NMATCH = 0
     C                   EVAL      DLN(1) = '(nothing scheduled)'
     C                   ENDIF
     C                   ENDSR
     C     DAYOPT        BEGSR
     C                   EVAL      DCNT = 0
     C                   EVAL      CHGR = 0
     C     1             DO        NSHOW         ROW
     C                   EVAL      OP = %TRIM(DOP(ROW))
     C                   IF        OP = '2' OR OP = '4'
     C                   IF        CANCHG = '0'
     C                   EVAL      MSG = 'You may look at this calendar ' +
     C                             'but not change it.'
     C                   ELSE
     C                   IF        OP = '2' AND CHGR = 0
     C                   EVAL      CHGR = ROW
     C                   ENDIF
     C                   IF        OP = '4'
     C                   EVAL      KDATE = CURN
     C                   EVAL      KTIME = KTM(ROW)
     C                   EVAL      KSTMP = KSD(ROW)
     C     KEYF          CHAIN     CALREC
     C                   IF        %FOUND(OVCALP)
     C                   DELETE    CALREC
     C                   EVAL      DCNT = DCNT + 1
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   IF        CHGR > 0 AND DCNT = 0
     C                   EVAL      KDATE = CURN
     C                   EVAL      KTIME = KTM(CHGR)
     C                   EVAL      KSTMP = KSD(CHGR)
     C                   EVAL      EDMODE = 'C'
     C                   EXSR      ADDC
     C                   ENDIF
     C                   IF        DCNT > 0
     C                   EVAL      MSG = %CHAR(DCNT) +
     C                             ' appointment(s) deleted.'
     C                   ENDIF
     C                   ENDSR
     C     FMTTM         BEGSR
     C                   EVAL      TTXT = 'all day'
     C                   IF        CLTIME >= 0
     C                   MOVE      CLTIME        W4
     C                   EVAL      TTXT = %SUBST(W4:1:2) + ':' + %SUBST(W4:3:2)
     C                   ENDIF
     C                   ENDSR
      * ---- N days, as lines in NLX ----
     C     BLDND         BEGSR
     C                   EVAL      NLN = 0
     C                   EVAL      D1 = CURD
     C     1             DO        NDV           KK
     C     *ISO          MOVE      D1            KDATE
     C                   MOVE      KDATE         W8
     C                   EVAL      WSAVE = CURD
     C                   EVAL      CURD = D1
     C                   EXSR      GETWKD
     C                   EVAL      CURD = WSAVE
     C                   EVAL      HOLNM = *BLANKS
     C     KDATE         CHAIN(N)  HOLREC
     C                   IF        %FOUND(OVHOLP)
     C                   EVAL      HOLNM = '   Holiday: ' + HLNAME
     C                   ENDIF
     C                   IF        NLN < 300
     C                   EVAL      NLN = NLN + 1
     C                   EVAL      NLX(NLN) = %TRIMR(%SUBST(DNAMES:WKD*9+1:9)) +
     C                             ', ' + %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2)
     C                             + '/' + %SUBST(W8:1:4) + HOLNM
     C                   EVAL      NLH(NLN) = '1'
     C                   ENDIF
     C                   EVAL      CNTN = 0
     C     KEYD          SETLL     CALREC
     C     KEYD          READE(N)  CALREC
     C                   DOW       NOT %EOF(OVCALP)
     C                   EVAL      CNTN = CNTN + 1
     C                   EXSR      FMTTM
     C                   IF        NLN < 300
     C                   EVAL      NLN = NLN + 1
     C                   EVAL      NLX(NLN) = '     ' + TTXT + '  ' + CLTEXT
     C                   EVAL      NLH(NLN) = '0'
     C                   ENDIF
     C     KEYD          READE(N)  CALREC
     C                   ENDDO
     C                   IF        CNTN = 0 AND NLN < 300
     C                   EVAL      NLN = NLN + 1
     C                   EVAL      NLX(NLN) = '     (nothing scheduled)'
     C                   EVAL      NLH(NLN) = '0'
     C                   ENDIF
     C                   ADDDUR    1:*D          D1
     C                   ENDDO
     C                   ENDSR
     C     NDAYVW        BEGSR
     C                   EXSR      BLDND
     C                   EVAL      PGNO = 0
     C                   DOW       1 = 1
     C                   EVAL      NLA = *BLANKS
     C     1             DO        16            I
     C                   EVAL      J = PGNO * 16 + I
     C                   EVAL      *IN(60 + I) = *OFF
     C                   IF        J <= NLN
     C                   EVAL      NL(I) = NLX(J)
     C                   EVAL      *IN(60 + I) = (NLH(J) = '1')
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      HDRID = 'CALDAYS'
     C                   EXSR      HDR
     C                   EVAL      NHDR = HDRLN
     C                   EVAL      NTTL = %CHAR(NDV) +
     C                             ' days of the calendar for ' + OWNNM
     C                   EVAL      NMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   EVAL      NFK = 'F1=Help  F3=Exit  F7=Page up  ' +
     C                             'F8=Page down  F9=Print these d' +
     C                             'ays  F12=Return'
     C                   EXFMT     NDVR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   SELECT
     C                   WHEN      *IN07 = *ON AND PGNO > 0
     C                   EVAL      PGNO = PGNO - 1
     C                   WHEN      *IN08 = *ON AND (PGNO + 1) * 16 < NLN
     C                   EVAL      PGNO = PGNO + 1
     C                   WHEN      *IN09 = *ON
     C                   EXSR      PRINTN
     C                   ENDSL
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
     C     PRINTN        BEGSR
     C                   EXSR      BLDND
     C                   EVAL      PACT = 'O'
     C                   EVAL      PTXT = %CHAR(NDV) +
     C                             ' days of the calendar for ' + OWNNM
     C                   EXSR      PRT
     C     1             DO        NLN           J
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = NLX(J)
     C                   EXSR      PRT
     C                   ENDDO
     C                   EVAL      PACT = 'C'
     C                   EXSR      PRT
     C                   EVAL      MSG = 'Printed.  See Printed output o' +
     C                             'n the main menu.'
     C                   ENDSR
      * ---- the month, boxed ----
     C     MONTHV        BEGSR
     C                   DOW       1 = 1
     C                   MOVE      CURN          W8
     C                   EVAL      W8 = %SUBST(W8:1:6) + '01'
     C                   MOVE      W8            FIRSTN
     C                   EXSR      MKMON
     C                   EVAL      DOTS = ' ........ '
     C                   EVAL      KDATE = FIRSTN
     C     KEYD          SETLL     CALREC
     C     KUSER         READE(N)  CALREC
     C                   DOW       NOT %EOF(OVCALP) AND CLDATE < FIRSTN + MDAYS
     C                   EVAL      DY = CLDATE - FIRSTN + 1
     C                   SELECT
     C                   WHEN      CLTIME < 0
     C                   IF        %SUBST(DOTS(DY):1:1) = ' '
     C                   EVAL      %SUBST(DOTS(DY):1:1) = '*'
     C                   ENDIF
     C                   WHEN      CLTIME < 800
     C                   EVAL      %SUBST(DOTS(DY):1:1) = '<'
     C                   WHEN      CLTIME >= 1600
     C                   EVAL      %SUBST(DOTS(DY):10:1) = '>'
     C                   OTHER
     C                   EVAL      SLOT = %DIV(CLTIME:100) - 6
     C                   EVAL      %SUBST(DOTS(DY):SLOT:1) = %SUBST(CLTEXT:1:1)
     C                   ENDSL
     C     KUSER         READE(N)  CALREC
     C                   ENDDO
     C     1             DO        6             I
     C                   EVAL      MDL(I) = ROWL
     C                   EVAL      MVL(I) = ROWL
     C                   ENDDO
     C     1             DO        MDAYS         DY
     C                   EVAL      CELL = FDOW + DY
     C                   EVAL      RW = %DIV(CELL - 1:7) + 1
     C                   EVAL      CC = %REM(CELL - 1:7)
     C                   EVAL      WCELL = *BLANKS
     C                   IF        HOL(DY) = 'H'
     C                   EVAL      WCELL = 'Hol'
     C                   ENDIF
     C                   EVAL      DAY2 = DY
     C                   EVAL      MARK = ' '
     C                   IF        FIRSTN + DY - 1 = CURN
     C                   EVAL      MARK = '>'
     C                   ENDIF
     C                   EVAL      %SUBST(WCELL:7:3) = MARK + %EDITC(DAY2:'Z')
     C                   EVAL      %SUBST(MDL(RW):CC*11+2:10) = WCELL
     C                   EVAL      %SUBST(MVL(RW):CC*11+2:10) = DOTS(DY)
     C                   ENDDO
     C                   EVAL      HDRID = 'CALMONTH'
     C                   EXSR      HDR
     C                   EVAL      MHDR = HDRLN
     C                   EVAL      MTTL = 'Calendar for ' + %TRIMR(OWNNM) +
     C                             '     ' + %TRIM(%SUBST(MTT:5:16))
     C                   EVAL      MFK = 'F1=Help  F3=Exit  F10=Next mon' +
     C                             'th  F11=Previous month  Cursor' +
     C                             '+Enter opens a day'
     C                   EXFMT     MONV
     C                   EXSR      CSR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   SELECT
     C                   WHEN      *IN10 = *ON
     C                   EVAL      CURD = F1
     C                   ADDDUR    1:*M          CURD
     C     *ISO          MOVE      CURD          CURN
     C                   WHEN      *IN11 = *ON
     C                   EVAL      CURD = F1
     C                   SUBDUR    1:*M          CURD
     C     *ISO          MOVE      CURD          CURN
     C                   WHEN      CSRROW >= 5 AND CSRROW <= 21 AND CSRCOL >= 2
     C                             AND CSRCOL <= 78
     C                   EVAL      RW = %DIV(CSRROW - 5:3) + 1
     C                   EVAL      CC = %DIV(CSRCOL - 2:11)
     C                   EVAL      DY = (RW - 1) * 7 + CC + 1 - FDOW
     C                   IF        DY >= 1 AND DY <= MDAYS
     C                   EVAL      CURN = FIRSTN + DY - 1
     C     *ISO          MOVE      CURN          CURD
     C                   EXSR      DAYVW
     C                   ENDIF
     C                   ENDSL
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- the business week, Monday to Friday, by the hour ----
     C     WEEKV         BEGSR
     C                   DOW       1 = 1
     C                   EXSR      GETWKD
     C                   EVAL      MOND = CURD
     C                   EVAL      WOFF = %REM(WKD + 6:7)
     C                   SUBDUR    WOFF:*D       MOND
     C                   EVAL      WLA = *BLANKS
     C     1             DO        13            WROW
     C                   SELECT
     C                   WHEN      WROW = 1
     C                   EVAL      WL(WROW) = 'All day'
     C                   WHEN      WROW = 2
     C                   EVAL      WL(WROW) = 'Early'
     C                   WHEN      WROW = 13
     C                   EVAL      WL(WROW) = 'Later'
     C                   OTHER
     C                   EVAL      HOUR = WROW + 5
     C                   EVAL      DAY2 = HOUR
     C                   EVAL      WL(WROW) = %EDITC(DAY2:'Z') + ':00'
     C                   ENDSL
     C     1             DO        6             WDAY
     C                   EVAL      %SUBST(WL(WROW):(WDAY-1)*14+8:1) = '|'
     C                   ENDDO
     C                   ENDDO
     C                   EVAL      WL(14) = '       +-------------+--------' +
     C                             '-----+-------------+----------' +
     C                             '---+-------------+'
     C                   EVAL      WCOL = *BLANKS
     C                   EVAL      D1 = MOND
     C     1             DO        5             WDAY
     C     *ISO          MOVE      D1            KDATE
     C                   MOVE      KDATE         W8
     C                   EVAL      %SUBST(WCOL:(WDAY-1)*14+8:14) = '| ' +
     C                             %SUBST(DNAMES:WDAY*9+1:3) + ' ' +
     C                             %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2)
     C     KDATE         CHAIN(N)  HOLREC
     C                   IF        %FOUND(OVHOLP)
     C                   EVAL      %SUBST(WL(1):(WDAY-1)*14+9:13) = HLNAME
     C                   ENDIF
     C     KEYD          SETLL     CALREC
     C     KEYD          READE(N)  CALREC
     C                   DOW       NOT %EOF(OVCALP)
     C                   SELECT
     C                   WHEN      CLTIME < 0
     C                   EVAL      WROW = 1
     C                   WHEN      CLTIME < 800
     C                   EVAL      WROW = 2
     C                   WHEN      CLTIME >= 1800
     C                   EVAL      WROW = 13
     C                   OTHER
     C                   EVAL      WROW = %DIV(CLTIME:100) - 5
     C                   ENDSL
     C                   EVAL      WPOS = (WDAY-1)*14+9
     C                   IF        %SUBST(WL(WROW):WPOS:13) = *BLANKS
     C                   EVAL      %SUBST(WL(WROW):WPOS:13) = CLTEXT
     C                   ELSE
     C                   EVAL      %SUBST(WL(WROW):WPOS+12:1) = '+'
     C                   ENDIF
     C     KEYD          READE(N)  CALREC
     C                   ENDDO
     C                   ADDDUR    1:*D          D1
     C                   ENDDO
     C                   EVAL      %SUBST(WCOL:78:1) = '|'
     C                   EVAL      HDRID = 'CALWEEK'
     C                   EXSR      HDR
     C                   EVAL      WHDR = HDRLN
     C                   EVAL      WTTL = 'Business week for ' + OWNNM
     C                   EVAL      WMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   EVAL      WFK = 'F1=Help  F3=Exit  F7=Previous ' +
     C                             'week  F8=Next week  Cursor on ' +
     C                             'a day + Enter opens it'
     C                   EXFMT     WEEKVR
     C                   EXSR      CSR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   SELECT
     C                   WHEN      *IN07 = *ON
     C                   SUBDUR    7:*D          CURD
     C     *ISO          MOVE      CURD          CURN
     C                   WHEN      *IN08 = *ON
     C                   ADDDUR    7:*D          CURD
     C     *ISO          MOVE      CURD          CURN
     C                   WHEN      CSRCOL >= 9 AND CSRCOL <= 77 AND CSRROW >= 4
     C                             AND CSRROW <= 18
     C                   EVAL      WDAY = %DIV(CSRCOL - 9:14)
     C                   EVAL      CURD = MOND
     C                   ADDDUR    WDAY:*D       CURD
     C     *ISO          MOVE      CURD          CURN
     C                   EXSR      DAYVW
     C                   ENDSL
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- six months at a glance ----
     C     SIXVW         BEGSR
     C                   MOVE      CURN          W8
     C                   EVAL      W8 = %SUBST(W8:1:6) + '01'
     C                   MOVE      W8            N8
     C     *ISO          MOVE      N8            SXD
     C                   DOW       1 = 1
     C                   EVAL      SXA = *BLANKS
     C                   EVAL      D2 = SXD
     C     1             DO        6             KM
     C                   EVAL      BAND = %DIV(KM - 1:3)
     C                   EVAL      MCOL = %REM(KM - 1:3) * 25 + 1
     C     *ISO          MOVE      D2            FIRSTN
     C                   EXSR      MKMON
     C                   EVAL      %SUBST(SX(BAND*8+1):MCOL:21) =
     C                             %SUBST(MTT:5:18)
     C                   EVAL      %SUBST(SX(BAND*8+2):MCOL:21) =
     C                             ' Su Mo Tu We Th Fr Sa'
     C     1             DO        6             I
     C                   EVAL      %SUBST(SX(BAND*8+2+I):MCOL:21) = ML(I)
     C                   ENDDO
     C                   ADDDUR    1:*M          D2
     C                   ENDDO
     C                   EVAL      HDRID = 'CALSIX'
     C                   EXSR      HDR
     C                   EVAL      SHDR = HDRLN
     C                   EVAL      STTL = 'Six months of the calendar for ' +
     C                             OWNNM
     C                   EVAL      SFK = 'F1=Help  F3=Exit  F7=Back six ' +
     C                             'months  F8=Forward six months ' +
     C                             ' F12=Return'
     C                   EXFMT     SIXVR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN07 = *ON
     C                   SUBDUR    6:*M          SXD
     C                   ENDIF
     C                   IF        *IN08 = *ON
     C                   ADDDUR    6:*M          SXD
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- add (EDMODE A) or change (EDMODE C) an appointment ----
     C     ADDC          BEGSR
     C                   IF        CANCHG = '0'
     C                   EVAL      MSG = 'You may look at this calendar ' +
     C                             'but not change it.'
     C                   ELSE
     C                   MOVE      CURN          W8
     C                   EVAL      DTXT = %SUBST(W8:5:2) + '/' + %SUBST(W8:7:2)
     C                             + '/' + %SUBST(W8:1:4)
     C                   EVAL      ADATE = DTXT
     C                   EVAL      AEND = *BLANKS
     C                   EVAL      ATIME = *BLANKS
     C                   EVAL      ATEXT = *BLANKS
     C                   EVAL      AMSG = *BLANKS
     C                   EVAL      *IN42 = *OFF
     C                   EVAL      HDRID = 'CALADD'
     C                   IF        EDMODE = 'C'
     C     KEYF          CHAIN(N)  CALREC
     C                   IF        %FOUND(OVCALP)
     C                   EVAL      *IN42 = *ON
     C                   EVAL      HDRID = 'CALCHANGE'
     C                   EXSR      FMTTM
     C                   IF        CLTIME >= 0
     C                   EVAL      ATIME = TTXT
     C                   ENDIF
     C                   EVAL      ATEXT = CLTEXT
     C                   ELSE
     C                   EVAL      EDMODE = 'A'
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      ALB1 = 'Last day (optional)'
     C                   EVAL      ALB2 = 'For an event that lasts severa' +
     C                             'l days'
     C                   IF        *IN42 = *ON
     C                   EVAL      ALB1 = *BLANKS
     C                   EVAL      ALB2 = *BLANKS
     C                   ENDIF
     C                   DOW       1 = 1
     C                   EXSR      HDR
     C                   EVAL      AHDR = HDRLN
     C                   EVAL      AFK = 'F1=Help   Enter=Save   F12=Cancel'
     C                   EXFMT     CADD
     C                   EVAL      AMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON OR ATEXT = *BLANKS
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      DUE = ADATE
     C                   EXSR      CHKDT
     C                   IF        NERR = '1'
     C                   EVAL      AMSG = 'That date is not valid.  Use M' +
     C                             '/D or M/D/YYYY.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      STARTV = DUEVAL
     C                   EVAL      NDAY = 1
     C                   IF        EDMODE = 'A' AND AEND <> *BLANKS
     C                   EVAL      DUE = AEND
     C                   EXSR      CHKDT
     C                   IF        NERR = '1'
     C                   EVAL      AMSG = 'The last day is not a valid date.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      ENDV = DUEVAL
     C                   IF        ENDV < STARTV
     C                   EVAL      AMSG = 'The last day is before the fir' +
     C                             'st day.'
     C                   ITER
     C                   ENDIF
     C     *ISO          MOVE      STARTV        D1
     C     *ISO          MOVE      ENDV          D2
     C     D2            SUBDUR    D1            NDAY:*D
     C                   EVAL      NDAY = NDAY + 1
     C                   IF        NDAY > 31
     C                   EVAL      AMSG = 'An event can last at most 31 days.'
     C                   ITER
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      TM = ATIME
     C                   EXSR      PARSTM
     C                   IF        NERR = '1'
     C                   EVAL      AMSG = 'That time is not valid.  Use H' +
     C                             'H:MM, such as 14:30.'
     C                   ITER
     C                   ENDIF
     C                   IF        EDMODE = 'C'
     C     KEYF          CHAIN     CALREC
     C                   IF        %FOUND(OVCALP)
     C                   DELETE    CALREC
     C                   ENDIF
     C                   EVAL      CLUSER = OWN
     C                   EVAL      CLDATE = STARTV
     C                   EVAL      CLTIME = CLT
     C                   EVAL      CLSTMP = KSTMP
     C                   EVAL      CLTEXT = %TRIML(ATEXT)
     C                   WRITE     CALREC
     C                   EVAL      MSG = 'Appointment changed.'
     C                   ELSE
     C     *ISO          MOVE      STARTV        D1
     C     1             DO        NDAY          KK
     C                   EVAL      CLUSER = OWN
     C     *ISO          MOVE      D1            CLDATE
     C                   EVAL      CLTIME = CLT
     C                   EXSR      NEWTS
     C                   EVAL      CLSTMP = TS
     C                   EVAL      CLTEXT = %TRIML(ATEXT)
     C                   IF        NDAY > 1
     C                   EVAL      CLTEXT = %TRIMR(%SUBST(CLTEXT:1:50)) + ' (' +
     C                             %CHAR(KK) + '/' + %CHAR(NDAY) + ')'
     C                   ENDIF
     C                   WRITE     CALREC
     C                   ADDDUR    1:*D          D1
     C                   ENDDO
     C                   EVAL      MSG = 'Appointment added.'
     C                   IF        NDAY > 1
     C                   EVAL      MSG = 'Appointment added to ' + %CHAR(NDAY) +
     C                             ' days.'
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      CURN = STARTV
     C     *ISO          MOVE      CURN          CURD
     C                   EVAL      PGNO = 0
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      *IN42 = *OFF
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDIF
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

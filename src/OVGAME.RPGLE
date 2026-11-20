     H DFTACTGRP(*YES)
      * OVGAME - OfficeVibes/400
     FOVSCORP   UF A E           K DISK
     FOVGAME    CF   E             WORKSTN INFDS(DSPINF) MAXDEV(*FILE)
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
     DTCA                             9A
     D TC                             1A   DIM(9) OVERLAY(TCA)
     D TC1                            1A   OVERLAY(TCA:1)
     D TC2                            1A   OVERLAY(TCA:2)
     D TC3                            1A   OVERLAY(TCA:3)
     D TC4                            1A   OVERLAY(TCA:4)
     D TC5                            1A   OVERLAY(TCA:5)
     D TC6                            1A   OVERLAY(TCA:6)
     D TC7                            1A   OVERLAY(TCA:7)
     D TC8                            1A   OVERLAY(TCA:8)
     D TC9                            1A   OVERLAY(TCA:9)
     D                 DS
     DXBA                           400A
     D XB                            20A   DIM(20) OVERLAY(XBA)
     D XB01                          20A   OVERLAY(XBA:1)
     D XB02                          20A   OVERLAY(XBA:21)
     D XB03                          20A   OVERLAY(XBA:41)
     D XB04                          20A   OVERLAY(XBA:61)
     D XB05                          20A   OVERLAY(XBA:81)
     D XB06                          20A   OVERLAY(XBA:101)
     D XB07                          20A   OVERLAY(XBA:121)
     D XB08                          20A   OVERLAY(XBA:141)
     D XB09                          20A   OVERLAY(XBA:161)
     D XB10                          20A   OVERLAY(XBA:181)
     D XB11                          20A   OVERLAY(XBA:201)
     D XB12                          20A   OVERLAY(XBA:221)
     D XB13                          20A   OVERLAY(XBA:241)
     D XB14                          20A   OVERLAY(XBA:261)
     D XB15                          20A   OVERLAY(XBA:281)
     D XB16                          20A   OVERLAY(XBA:301)
     D XB17                          20A   OVERLAY(XBA:321)
     D XB18                          20A   OVERLAY(XBA:341)
     D XB19                          20A   OVERLAY(XBA:361)
     D XB20                          20A   OVERLAY(XBA:381)
     D                 DS
     DXNA                            32A
     D XN                             8A   DIM(4) OVERLAY(XNA)
     D XN1                            8A   OVERLAY(XNA:1)
     D XN2                            8A   OVERLAY(XNA:9)
     D XN3                            8A   OVERLAY(XNA:17)
     D XN4                            8A   OVERLAY(XNA:25)
     DBRD              S              1A   DIM(200)
     DCR               S              5  0 DIM(4)
     DCCL              S              5  0 DIM(4)
     DTR               S              5  0 DIM(4)
     DTT               S              5  0 DIM(4)
     DPCUR             S              5  0
     DPNXT             S              5  0
     DROWP             S              5  0
     DCOLP             S              5  0
     DNR               S              5  0
     DNC               S              5  0
     DMDR              S              5  0
     DMDC              S              5  0
     DFITOK            S              1A
     DMOVED            S              1A
     DGOVER            S              1A
     DTPTS             S              7  0
     DLINES            S              5  0
     DNCL              S              5  0
     DLASTG            S               Z
     DNOWT             S               Z
     DSECS             S              9  0
     DROWX             S              5  0
     DCOLX             S              5  0
     DRR2              S              5  0
     DXLINE            S             20A
     DXCELL            S              2A
     DROWFUL           S              1A
     DFULLW            S              1A
     DTANIM            S              1A
     DKQ               S              5  0
     DPOSN             S              5  0
     DKBEST            S              7  0
     DCORN1            C                   '1397'
     DCORN2            C                   '9731'
     DSQORD            C                   '13792468'
     DPCS              C                   '101112131112212210111221111220-
     D                                     21101121221011122210111220'
     DNTHR             S              5  0
     DTSQ              S              5  0
     DBSQ              S              5  0
     DMKC              S              5  0
     DBLC              S              5  0
     DFKN              S              5  0
     DFKSQ             S              5  0
     DS1               S              5  0
     DS2               S              5  0
     DW                S              5  0
     DSEL              S              3A
     DSELN             S              5  0
     DKGAME            S             10A
     DSEED             S              9  0
     DW6               S              6A
     DSECRET           S              5  0
     DTRIES            S              5  0
     DRES              S              1A
     DMK               S              1A
     DWON              S              1A
     DBEST             S              5  0
     DK                S              5  0
     DL                S              5  0
     DC1               S              5  0
     DC2               S              5  0
     DC3               S              5  0
     DFULL             S              1A
     DOVER             S              1A
     DWINL             C                   '123456789147258369159357'
     C     KEYS          KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KGAME
     C                   TIME                    TS
     C                   MOVE      TS            WSTMP
     C                   EVAL      W6 = %SUBST(WSTMP:12:2) + %SUBST(WSTMP:15:2)
     C                             + %SUBST(WSTMP:18:2)
     C                   MOVE      W6            SEED
     C                   DOW       *IN03 = *OFF
     C                   EVAL      KGAME = 'GUESS'
     C                   EVAL      GSC1 = 'Guess the number: not played yet'
     C     KEYS          CHAIN(N)  SCORREC
     C                   IF        %FOUND(OVSCORP)
     C                   EVAL      GSC1 = 'Guess the number: ' + %CHAR(SCWIN) +
     C                             ' solved, best ' + %CHAR(SCBEST) + ' tries'
     C                   ENDIF
     C                   EVAL      KGAME = 'TICTACTOE'
     C                   EVAL      GSC2 = 'Tic-tac-toe: not played yet'
     C     KEYS          CHAIN(N)  SCORREC
     C                   IF        %FOUND(OVSCORP)
     C                   EVAL      GSC2 = 'Tic-tac-toe: ' + %CHAR(SCWIN) +
     C                             ' won, ' + %CHAR(SCLOSS) + ' lost, ' +
     C                             %CHAR(SCDRAW) + ' drawn'
     C                   ENDIF
     C                   EVAL      KGAME = 'TETRIS'
     C                   EVAL      GSC3 = 'Tetris: not played yet'
     C     KEYS          CHAIN(N)  SCORREC
     C                   IF        %FOUND(OVSCORP)
     C                   EVAL      GSC3 = 'Tetris: best ' + %CHAR(SCBEST) +
     C                             ' points in ' + %CHAR(SCWIN) + ' games'
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCGAMES'
     C                   EXSR      HDR
     C                   EVAL      GHDR = HDRLN
     C                   EVAL      GFK = 'F1=Help   F3=Exit   Type a num' +
     C                             'ber, or put the cursor on a ga' +
     C                             'me, and press Enter'
     C                   EVAL      GSEL = *BLANKS
     C                   EVAL      GMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     GMENU
     C                   EXSR      CSR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      SEL = %TRIML(GSEL)
     C                   EVAL      SELN = 0
     C                   IF        SEL = *BLANKS
     C                   IF        CSRROW >= 6 AND CSRROW <= 8
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
     C                   SELECT
     C                   WHEN      SELN = 1
     C                   EXSR      GUESS
     C                   WHEN      SELN = 2
     C                   EXSR      TTT
     C                   WHEN      SELN = 3
     C                   EXSR      TETRS
     C                   WHEN      SELN <> 0
     C                   EVAL      MSG = 'That is not one of the choices.'
     C                   ENDSL
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     RAND          BEGSR
     C                   EVAL      SEED = %REM(SEED * 31 + 17:99991)
     C                   ENDSR
      * ---- record a result: RES is W, L or D ----
     C     SCORE         BEGSR
     C     KEYS          CHAIN     SCORREC
     C                   IF        NOT %FOUND(OVSCORP)
     C                   EVAL      SCUSER = PGMUSR
     C                   EVAL      SCGAME = KGAME
     C                   EVAL      SCWIN = 0
     C                   EVAL      SCLOSS = 0
     C                   EVAL      SCDRAW = 0
     C                   EVAL      SCBEST = 0
     C                   ENDIF
     C                   SELECT
     C                   WHEN      RES = 'W'
     C                   EVAL      SCWIN = SCWIN + 1
     C                   IF        KGAME = 'GUESS' AND (SCBEST = 0 OR TRIES <
     C                             SCBEST)
     C                   EVAL      SCBEST = TRIES
     C                   ENDIF
     C                   WHEN      RES = 'L'
     C                   EVAL      SCLOSS = SCLOSS + 1
     C                   OTHER
     C                   EVAL      SCDRAW = SCDRAW + 1
     C                   ENDSL
     C                   IF        %FOUND(OVSCORP)
     C                   UPDATE    SCORREC
     C                   ELSE
     C                   WRITE     SCORREC
     C                   ENDIF
     C                   ENDSR
      * ---- guess the number ----
     C     GUESS         BEGSR
     C                   EXSR      RAND
     C                   EVAL      SECRET = %REM(SEED:100) + 1
     C                   EVAL      TRIES = 0
     C                   EVAL      UINF = 'Type a number and press Enter.'
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCGUESS'
     C                   EXSR      HDR
     C                   EVAL      UHDR = HDRLN
     C                   EVAL      UFK = 'F1=Help   Enter=Guess   F12=Gi' +
     C                             've up'
     C                   EVAL      UGUESS = *BLANKS
     C                   EVAL      UMSG = *BLANKS
     C                   EXFMT     GGUESS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   EVAL      MSG = 'The number was ' + %CHAR(SECRET) + '.'
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      NERR = '0'
     C                   EVAL      NSTR = %TRIML(UGUESS)
     C                   EXSR      TONUM
     C                   IF        NERR = '1' OR NVAL < 1 OR NVAL > 100
     C                   EVAL      UINF = 'Please type a number from 1 to' +
     C                             ' 100.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      TRIES = TRIES + 1
     C                   IF        NVAL < SECRET
     C                   EVAL      UINF = %CHAR(NVAL) +
     C                             ' is too low.  Tries so far: ' + %CHAR(TRIES)
     C                   ITER
     C                   ENDIF
     C                   IF        NVAL > SECRET
     C                   EVAL      UINF = %CHAR(NVAL) +
     C                             ' is too high.  Tries so far: ' +
     C                             %CHAR(TRIES)
     C                   ITER
     C                   ENDIF
     C                   EVAL      KGAME = 'GUESS'
     C                   EVAL      RES = 'W'
     C                   EXSR      SCORE
     C                   EVAL      MSG = 'Yes, it was ' + %CHAR(SECRET) +
     C                             '.  You took ' + %CHAR(TRIES) + ' tries.'
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- the computer's move: win, block, fork, block a fork, centre,
      * ---- opposite corner, corner, side.  It cannot be beaten.
     C     OMOVE         BEGSR
     C                   EVAL      MK = 'O'
     C                   EXSR      TRYMV
     C                   IF        BEST = 0
     C                   EVAL      MK = 'X'
     C                   EXSR      TRYMV
     C                   ENDIF
     C                   IF        BEST = 0
     C                   EVAL      MK = 'O'
     C                   EXSR      FORKS
     C                   EVAL      BEST = FKSQ
     C                   ENDIF
     C                   IF        BEST = 0
     C                   EVAL      MK = 'X'
     C                   EXSR      FORKS
     C                   IF        FKN = 1
     C                   EVAL      BEST = FKSQ
     C                   ENDIF
     C                   IF        FKN >= 2
     C     1             DO        9             S2
     C                   IF        BEST = 0 AND TC(S2) = ' '
     C                   EVAL      TC(S2) = 'O'
     C                   EVAL      MK = 'O'
     C                   EXSR      CNTTHR
     C                   IF        NTHR = 1
     C                   EVAL      W = TSQ
     C                   EVAL      TC(W) = 'X'
     C                   EVAL      MK = 'X'
     C                   EXSR      CNTTHR
     C                   EVAL      TC(W) = ' '
     C                   IF        NTHR < 2
     C                   EVAL      BEST = S2
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      TC(S2) = ' '
     C                   ENDIF
     C                   ENDDO
     C                   ENDIF
     C                   ENDIF
     C                   IF        BEST = 0 AND TC(5) = ' '
     C                   EVAL      BEST = 5
     C                   ENDIF
     C                   IF        BEST = 0
     C     1             DO        4             S2
     C                   EVAL      C1 = %SCAN(%SUBST(CORN1:S2:1):'123456789')
     C                   EVAL      C2 = %SCAN(%SUBST(CORN2:S2:1):'123456789')
     C                   IF        BEST = 0 AND TC(C1) = 'X' AND TC(C2) = ' '
     C                   EVAL      BEST = C2
     C                   ENDIF
     C                   ENDDO
     C                   ENDIF
     C                   IF        BEST = 0
     C     1             DO        8             S2
     C                   EVAL      C1 = %SCAN(%SUBST(SQORD:S2:1):'123456789')
     C                   IF        BEST = 0 AND TC(C1) = ' '
     C                   EVAL      BEST = C1
     C                   ENDIF
     C                   ENDDO
     C                   ENDIF
     C                   ENDSR
      * ---- lines where MK has two and one is empty: NTHR, TSQ
     C     CNTTHR        BEGSR
     C                   EVAL      NTHR = 0
     C     1             DO        8             L
     C                   EVAL      C1 = %SCAN(%SUBST(WINL:L*3-2:1):'123456789')
     C                   EVAL      C2 = %SCAN(%SUBST(WINL:L*3-1:1):'123456789')
     C                   EVAL      C3 = %SCAN(%SUBST(WINL:L*3:1):'123456789')
     C                   EVAL      MKC = 0
     C                   EVAL      BLC = 0
     C                   IF        TC(C1) = MK
     C                   EVAL      MKC = MKC + 1
     C                   ENDIF
     C                   IF        TC(C1) = ' '
     C                   EVAL      BLC = BLC + 1
     C                   EVAL      BSQ = C1
     C                   ENDIF
     C                   IF        TC(C2) = MK
     C                   EVAL      MKC = MKC + 1
     C                   ENDIF
     C                   IF        TC(C2) = ' '
     C                   EVAL      BLC = BLC + 1
     C                   EVAL      BSQ = C2
     C                   ENDIF
     C                   IF        TC(C3) = MK
     C                   EVAL      MKC = MKC + 1
     C                   ENDIF
     C                   IF        TC(C3) = ' '
     C                   EVAL      BLC = BLC + 1
     C                   EVAL      BSQ = C3
     C                   ENDIF
     C                   IF        MKC = 2 AND BLC = 1
     C                   EVAL      NTHR = NTHR + 1
     C                   EVAL      TSQ = BSQ
     C                   ENDIF
     C                   ENDDO
     C                   ENDSR
      * ---- squares where MK makes two threats at once: FKN, FKSQ
     C     FORKS         BEGSR
     C                   EVAL      FKN = 0
     C                   EVAL      FKSQ = 0
     C     1             DO        9             S1
     C                   IF        TC(S1) = ' '
     C                   EVAL      TC(S1) = MK
     C                   EXSR      CNTTHR
     C                   EVAL      TC(S1) = ' '
     C                   IF        NTHR >= 2
     C                   EVAL      FKN = FKN + 1
     C                   IF        FKSQ = 0
     C                   EVAL      FKSQ = S1
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   ENDSR
      * ---- Tetris ----
     C     TETRS         BEGSR
     C                   EVAL      KGAME = 'TETRIS'
     C                   EXSR      NEWG
     C                   EVAL      FULLW = '1'
     C                   EVAL      TANIM = '1'
     C                   DOW       1 = 1
     C                   TIME                    NOWT
     C                   IF        GOVER = '0'
     C     NOWT          SUBDUR    LASTG         SECS:*S
     C                   IF        SECS >= 1
     C                   EVAL      LASTG = NOWT
     C                   EXSR      GRAV
     C                   ENDIF
     C                   ENDIF
     C                   EXSR      DRAWT
     C                   IF        TANIM = '1'
     C                   EVAL      *IN45 = *ON
     C                   IF        FULLW = '1'
     C                   EVAL      *IN46 = *OFF
     C                   WRITE     BLANK
     C                   ELSE
     C                   EVAL      *IN46 = *ON
     C                   ENDIF
     C                   WRITE     TETRIS
     C                   EVAL      FULLW = '0'
     C                   READ      OVGAME                               5152
     C                   IF        *IN51 = *ON
     C                   EVAL      *IN51 = *OFF
     C                   IF        DSPSTS <> 1331
     C                   EVAL      TANIM = '0'
     C                   EVAL      FULLW = '1'
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   ELSE
     C                   EVAL      *IN45 = *OFF
     C                   EVAL      *IN46 = *OFF
     C                   EXFMT     TETRIS
     C                   ENDIF
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN09 = *ON
     C                   EXSR      NEWG
     C                   ITER
     C                   ENDIF
     C                   IF        GOVER = '1'
     C                   ITER
     C                   ENDIF
     C                   SELECT
     C                   WHEN      *IN04 = *ON
     C                   EVAL      MDR = 0
     C                   EVAL      MDC = -1
     C                   EXSR      TRYMOV
     C                   WHEN      *IN05 = *ON
     C                   EVAL      MDR = 0
     C                   EVAL      MDC = 1
     C                   EXSR      TRYMOV
     C                   WHEN      *IN07 = *ON
     C                   EXSR      GRAV
     C                   EVAL      LASTG = NOWT
     C                   WHEN      *IN08 = *ON
     C                   EVAL      MDR = 1
     C                   EVAL      MDC = 0
     C                   EVAL      MOVED = '1'
     C                   DOW       MOVED = '1'
     C                   EXSR      TRYMOV
     C                   ENDDO
     C                   EXSR      LOCK
     C                   EVAL      LASTG = NOWT
     C                   OTHER
     C                   EXSR      ROTATE
     C                   ENDSL
     C                   ENDDO
     C                   EVAL      *IN45 = *OFF
     C                   EVAL      *IN46 = *OFF
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
     C     NEWG          BEGSR
     C                   EVAL      BRD = *BLANK
     C                   EVAL      TPTS = 0
     C                   EVAL      LINES = 0
     C                   EVAL      GOVER = '0'
     C                   EVAL      XSTA = *BLANKS
     C                   EVAL      XST2 = *BLANKS
     C                   EVAL      KBEST = 0
     C     KEYS          CHAIN(N)  SCORREC
     C                   IF        %FOUND(OVSCORP)
     C                   EVAL      KBEST = SCBEST
     C                   ENDIF
     C                   EVAL      XBST = %CHAR(KBEST)
     C                   EXSR      RAND
     C                   EVAL      PNXT = %REM(SEED:7) + 1
     C                   EXSR      SPAWN
     C                   TIME                    LASTG
     C                   EVAL      HDRID = 'OFCTETRIS'
     C                   EXSR      HDR
     C                   EVAL      XHDR = HDRLN
     C                   EVAL      FULLW = '1'
     C                   ENDSR
      * ---- piece PCUR into CR and CCL (rows and columns 0 to 3)
     C     LOADP         BEGSR
     C     1             DO        4             KQ
     C                   EVAL      POSN = (PCUR - 1) * 8 + KQ * 2 - 1
     C                   EVAL      CR(KQ) =
     C                             %SCAN(%SUBST(PCS:POSN:1):'0123456789') - 1
     C                   EVAL      CCL(KQ) =
     C                             %SCAN(%SUBST(PCS:POSN+1:1):'0123456789') - 1
     C                   ENDDO
     C                   ENDSR
     C     SPAWN         BEGSR
     C                   EVAL      PCUR = PNXT
     C                   EXSR      RAND
     C                   EVAL      PNXT = %REM(SEED:7) + 1
     C                   EXSR      LOADP
     C                   EVAL      ROWP = 0
     C                   EVAL      COLP = 4
     C     1             DO        4             KQ
     C                   EVAL      TR(KQ) = CR(KQ)
     C                   EVAL      TT(KQ) = CCL(KQ)
     C                   ENDDO
     C                   EVAL      NR = ROWP
     C                   EVAL      NC = COLP
     C                   EXSR      FITS
     C                   IF        FITOK = '0'
     C                   EVAL      GOVER = '1'
     C                   EVAL      XSTA = '   G A M E   O V E R'
     C                   EVAL      XST2 = '   F9 plays again'
     C                   EXSR      TSCORE
     C                   ENDIF
     C                   ENDSR
      * ---- do TR and TT fit at row NR, column NC: FITOK ----
     C     FITS          BEGSR
     C                   EVAL      FITOK = '1'
     C     1             DO        4             KQ
     C                   EVAL      ROWX = NR + TR(KQ)
     C                   EVAL      COLX = NC + TT(KQ)
     C                   IF        COLX < 1 OR COLX > 10 OR ROWX > 20
     C                   EVAL      FITOK = '0'
     C                   ELSE
     C                   IF        ROWX >= 1
     C                   IF        BRD((ROWX - 1) * 10 + COLX) <> ' '
     C                   EVAL      FITOK = '0'
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   ENDSR
      * ---- move by MDR rows and MDC columns if it fits: MOVED ----
     C     TRYMOV        BEGSR
     C     1             DO        4             KQ
     C                   EVAL      TR(KQ) = CR(KQ)
     C                   EVAL      TT(KQ) = CCL(KQ)
     C                   ENDDO
     C                   EVAL      NR = ROWP + MDR
     C                   EVAL      NC = COLP + MDC
     C                   EXSR      FITS
     C                   EVAL      MOVED = FITOK
     C                   IF        FITOK = '1'
     C                   EVAL      ROWP = NR
     C                   EVAL      COLP = NC
     C                   ENDIF
     C                   ENDSR
     C     ROTATE        BEGSR
     C     1             DO        4             KQ
     C                   EVAL      TR(KQ) = CCL(KQ)
     C                   EVAL      TT(KQ) = 3 - CR(KQ)
     C                   ENDDO
     C                   EVAL      NR = ROWP
     C                   EVAL      NC = COLP
     C                   EXSR      FITS
     C                   IF        FITOK = '0'
     C                   EVAL      NC = COLP - 1
     C                   EXSR      FITS
     C                   ENDIF
     C                   IF        FITOK = '0'
     C                   EVAL      NC = COLP + 1
     C                   EXSR      FITS
     C                   ENDIF
     C                   IF        FITOK = '1'
     C                   EVAL      COLP = NC
     C     1             DO        4             KQ
     C                   EVAL      CR(KQ) = TR(KQ)
     C                   EVAL      CCL(KQ) = TT(KQ)
     C                   ENDDO
     C                   ENDIF
     C                   ENDSR
     C     GRAV          BEGSR
     C                   EVAL      MDR = 1
     C                   EVAL      MDC = 0
     C                   EXSR      TRYMOV
     C                   IF        MOVED = '0'
     C                   EXSR      LOCK
     C                   ENDIF
     C                   ENDSR
      * ---- fix the piece, clear full rows, bring the next piece
     C     LOCK          BEGSR
     C     1             DO        4             KQ
     C                   EVAL      ROWX = ROWP + CR(KQ)
     C                   EVAL      COLX = COLP + CCL(KQ)
     C                   IF        ROWX >= 1
     C                   EVAL      BRD((ROWX - 1) * 10 + COLX) = 'X'
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      NCL = 0
     C                   EVAL      ROWX = 20
     C                   DOW       ROWX >= 1
     C                   EVAL      ROWFUL = '1'
     C     1             DO        10            COLX
     C                   IF        BRD((ROWX - 1) * 10 + COLX) = ' '
     C                   EVAL      ROWFUL = '0'
     C                   ENDIF
     C                   ENDDO
     C                   IF        ROWFUL = '1'
     C                   EVAL      NCL = NCL + 1
     C                   EVAL      RR2 = ROWX
     C                   DOW       RR2 >= 2
     C     1             DO        10            COLX
     C                   EVAL      BRD((RR2 - 1) * 10 + COLX) = BRD((RR2 - 2) *
     C                             10 + COLX)
     C                   ENDDO
     C                   EVAL      RR2 = RR2 - 1
     C                   ENDDO
     C     1             DO        10            COLX
     C                   EVAL      BRD(COLX) = ' '
     C                   ENDDO
     C                   ELSE
     C                   EVAL      ROWX = ROWX - 1
     C                   ENDIF
     C                   ENDDO
     C                   SELECT
     C                   WHEN      NCL = 1
     C                   EVAL      TPTS = TPTS + 100
     C                   WHEN      NCL = 2
     C                   EVAL      TPTS = TPTS + 300
     C                   WHEN      NCL = 3
     C                   EVAL      TPTS = TPTS + 500
     C                   WHEN      NCL = 4
     C                   EVAL      TPTS = TPTS + 800
     C                   ENDSL
     C                   IF        TPTS > 99999
     C                   EVAL      TPTS = 99999
     C                   ENDIF
     C                   EVAL      LINES = LINES + NCL
     C                   EXSR      SPAWN
     C                   ENDSR
     C     DRAWT         BEGSR
     C     1             DO        20            ROWX
     C                   EVAL      XLINE = *BLANKS
     C     1             DO        10            COLX
     C                   EVAL      XCELL = ' .'
     C                   IF        BRD((ROWX - 1) * 10 + COLX) <> ' '
     C                   EVAL      XCELL = '[]'
     C                   ENDIF
     C                   IF        GOVER = '0'
     C     1             DO        4             KQ
     C                   IF        ROWP + CR(KQ) = ROWX AND COLP + CCL(KQ) =
     C                             COLX
     C                   EVAL      XCELL = '[]'
     C                   ENDIF
     C                   ENDDO
     C                   ENDIF
     C                   EVAL      %SUBST(XLINE:COLX * 2 - 1:2) = XCELL
     C                   ENDDO
     C                   EVAL      XB(ROWX) = XLINE
     C                   ENDDO
     C                   EVAL      XNA = *BLANKS
     C     1             DO        4             KQ
     C                   EVAL      POSN = (PNXT - 1) * 8 + KQ * 2 - 1
     C                   EVAL      ROWX = %SCAN(%SUBST(PCS:POSN:1):'0123456789')
     C                   EVAL      COLX =
     C                             %SCAN(%SUBST(PCS:POSN+1:1):'0123456789') - 1
     C                   EVAL      %SUBST(XN(ROWX):COLX * 2 + 1:2) = '[]'
     C                   ENDDO
     C                   EVAL      XSCO = %CHAR(TPTS)
     C                   EVAL      XLIN = %CHAR(LINES)
     C                   ENDSR
      * ---- a finished game: SCWIN counts games, SCBEST is the top score
     C     TSCORE        BEGSR
     C     KEYS          CHAIN     SCORREC
     C                   IF        NOT %FOUND(OVSCORP)
     C                   EVAL      SCUSER = PGMUSR
     C                   EVAL      SCGAME = KGAME
     C                   EVAL      SCWIN = 0
     C                   EVAL      SCLOSS = 0
     C                   EVAL      SCDRAW = 0
     C                   EVAL      SCBEST = 0
     C                   ENDIF
     C                   EVAL      SCWIN = SCWIN + 1
     C                   IF        TPTS > SCBEST
     C                   EVAL      SCBEST = TPTS
     C                   EVAL      XST2 = '   A new best score!'
     C                   ENDIF
     C                   IF        %FOUND(OVSCORP)
     C                   UPDATE    SCORREC
     C                   ELSE
     C                   WRITE     SCORREC
     C                   ENDIF
     C                   ENDSR
      * ---- does MK hold a full line: sets WON ----
     C     CHKWIN        BEGSR
     C                   EVAL      WON = '0'
     C     1             DO        8             L
     C                   EVAL      C1 = %SCAN(%SUBST(WINL:L*3-2:1):'123456789')
     C                   EVAL      C2 = %SCAN(%SUBST(WINL:L*3-1:1):'123456789')
     C                   EVAL      C3 = %SCAN(%SUBST(WINL:L*3:1):'123456789')
     C                   IF        TC(C1) = MK AND TC(C2) = MK AND TC(C3) = MK
     C                   EVAL      WON = '1'
     C                   ENDIF
     C                   ENDDO
     C                   ENDSR
      * ---- find a square that completes a line for MK: sets BEST ----
     C     TRYMV         BEGSR
     C                   EVAL      BEST = 0
     C     1             DO        9             K
     C                   IF        TC(K) = ' ' AND BEST = 0
     C                   EVAL      TC(K) = MK
     C                   EXSR      CHKWIN
     C                   IF        WON = '1'
     C                   EVAL      BEST = K
     C                   ENDIF
     C                   EVAL      TC(K) = ' '
     C                   ENDIF
     C                   ENDDO
     C                   ENDSR
     C     ISFULL        BEGSR
     C                   EVAL      FULL = '1'
     C     1             DO        9             K
     C                   IF        TC(K) = ' '
     C                   EVAL      FULL = '0'
     C                   ENDIF
     C                   ENDDO
     C                   ENDSR
      * ---- tic-tac-toe ----
     C     TTT           BEGSR
     C                   EVAL      TCA = *BLANKS
     C                   EVAL      OVER = '0'
     C                   EVAL      TINF = 'Your move.'
     C                   EVAL      KGAME = 'TICTACTOE'
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCTTT'
     C                   EXSR      HDR
     C                   EVAL      THDR = HDRLN
     C                   EVAL      TFK = 'F1=Help   Enter=Move   F5=New ' +
     C                             'game   F12=Back'
     C                   EVAL      TMOVE = *BLANK
     C                   EVAL      TMSG = *BLANKS
     C                   EXFMT     GTTT
     C                   EXSR      CSR
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN05 = *ON OR OVER = '1'
     C                   EVAL      TCA = *BLANKS
     C                   EVAL      OVER = '0'
     C                   EVAL      TINF = 'New game.  Your move.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      K = %SCAN(TMOVE:'123456789')
     C                   IF        TMOVE = ' '
     C                   EVAL      K = 0
     C                   IF        (CSRROW = 8 OR CSRROW = 10 OR CSRROW = 12)
     C                             AND CSRCOL >= 31 AND CSRCOL <= 41
     C                   EVAL      K = %DIV(CSRROW - 8:2) * 3 + %DIV(CSRCOL -
     C                             31:4) + 1
     C                   ENDIF
     C                   ENDIF
     C                   IF        K < 1 OR K > 9
     C                   EVAL      TINF = 'Pick a square with the cursor,' +
     C                             ' or type 1 to 9.'
     C                   ITER
     C                   ENDIF
     C                   IF        TC(K) <> ' '
     C                   EVAL      TINF = 'That square is taken.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      TC(K) = 'X'
     C                   EVAL      MK = 'X'
     C                   EXSR      CHKWIN
     C                   IF        WON = '1'
     C                   EVAL      RES = 'W'
     C                   EXSR      SCORE
     C                   EVAL      OVER = '1'
     C                   EVAL      TINF = 'You win!  Press Enter for a ne' +
     C                             'w game.'
     C                   ITER
     C                   ENDIF
     C                   EXSR      ISFULL
     C                   IF        FULL = '1'
     C                   EVAL      RES = 'D'
     C                   EXSR      SCORE
     C                   EVAL      OVER = '1'
     C                   EVAL      TINF = 'A draw.  Press Enter for a new' +
     C                             ' game.'
     C                   ITER
     C                   ENDIF
     C                   EXSR      OMOVE
     C                   EVAL      TC(BEST) = 'O'
     C                   EVAL      MK = 'O'
     C                   EXSR      CHKWIN
     C                   IF        WON = '1'
     C                   EVAL      RES = 'L'
     C                   EXSR      SCORE
     C                   EVAL      OVER = '1'
     C                   EVAL      TINF = 'The computer wins.  Press Ente' +
     C                             'r for a new game.'
     C                   ITER
     C                   ENDIF
     C                   EXSR      ISFULL
     C                   IF        FULL = '1'
     C                   EVAL      RES = 'D'
     C                   EXSR      SCORE
     C                   EVAL      OVER = '1'
     C                   EVAL      TINF = 'A draw.  Press Enter for a new' +
     C                             ' game.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      TINF = 'The computer took square ' +
     C                             %CHAR(BEST) + '.  Your move.'
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

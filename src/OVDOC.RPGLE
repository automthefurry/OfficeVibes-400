     H DFTACTGRP(*YES)
      * OVDOC - OfficeVibes/400
     FOVDOCP    UF A E           K DISK
     FOVDOCLP   UF A E           K DISK
     FOVDOC     CF   E             WORKSTN INFDS(DSPINF)
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
     DDLNA                         1008A
     D DLN                           72A   DIM(14) OVERLAY(DLNA)
     D DLN01                         72A   OVERLAY(DLNA:1)
     D DLN02                         72A   OVERLAY(DLNA:73)
     D DLN03                         72A   OVERLAY(DLNA:145)
     D DLN04                         72A   OVERLAY(DLNA:217)
     D DLN05                         72A   OVERLAY(DLNA:289)
     D DLN06                         72A   OVERLAY(DLNA:361)
     D DLN07                         72A   OVERLAY(DLNA:433)
     D DLN08                         72A   OVERLAY(DLNA:505)
     D DLN09                         72A   OVERLAY(DLNA:577)
     D DLN10                         72A   OVERLAY(DLNA:649)
     D DLN11                         72A   OVERLAY(DLNA:721)
     D DLN12                         72A   OVERLAY(DLNA:793)
     D DLN13                         72A   OVERLAY(DLNA:865)
     D DLN14                         72A   OVERLAY(DLNA:937)
     D                 DS
     DDOPA                           28A
     D DOP                            2A   DIM(14) OVERLAY(DOPA)
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
     D DOP13                          2A   OVERLAY(DOPA:25)
     D DOP14                          2A   OVERLAY(DOPA:27)
     D                 DS
     DEDA                          1140A
     D ED                            76A   DIM(15) OVERLAY(EDA)
     D ED01                          76A   OVERLAY(EDA:1)
     D ED02                          76A   OVERLAY(EDA:77)
     D ED03                          76A   OVERLAY(EDA:153)
     D ED04                          76A   OVERLAY(EDA:229)
     D ED05                          76A   OVERLAY(EDA:305)
     D ED06                          76A   OVERLAY(EDA:381)
     D ED07                          76A   OVERLAY(EDA:457)
     D ED08                          76A   OVERLAY(EDA:533)
     D ED09                          76A   OVERLAY(EDA:609)
     D ED10                          76A   OVERLAY(EDA:685)
     D ED11                          76A   OVERLAY(EDA:761)
     D ED12                          76A   OVERLAY(EDA:837)
     D ED13                          76A   OVERLAY(EDA:913)
     D ED14                          76A   OVERLAY(EDA:989)
     D ED15                          76A   OVERLAY(EDA:1065)
     DTXT              S             76A   DIM(500)
     DNLINES           S              5  0
     DTOPL             S              5  0
     DIDX              S              5  0
     DCLN              S              5  0
     DDIRTY            S              1A
     DWARN             S              1A
     DKD               S             10A   DIM(14)
     DW12              S             11A
     DKDOC             S             10A
     DWTITL            S             40A
     DCOLH             C                   'Opt      Name       Title     -
     D                                                              Size -
     D                                           Changed'
     DFK1              C                   '2=Edit  4=Delete  6=Print   Cu-
     D                                     rsor on a line + Enter opens i-
     D                                     t'
     DFK2              C                   'F1=Help  F3=Exit  F6=New docum-
     D                                     ent  F7/F8=Page'
     DEK1              C                   'F6=Insert line at cursor   F9=-
     D                                     Delete line at cursor   F7/F8=-
     D                                     Page up/down'
     DEK2              C                   'F1=Help   F10=Save   F11=Print-
     D                                        F3=Exit'
     C     KEY2D         KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KDOC
     C                   EVAL      LAPP = 'DOCUMENTS'
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCDOC'
     C                   EXSR      HDR
     C                   EVAL      DHDR = HDRLN
     C                   EVAL      DTTL = TTLW
     C                   EVAL      DCOL = COLH
     C                   EVAL      DMSG = MSG
     C                   EVAL      DFK1 = FK1
     C                   EVAL      DFK2 = FK2
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     DLIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 5
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 2
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EXSR      NEWDOC
     C                   ITER
     C                   ENDIF
     C                   IF        *IN07 = *ON
     C                   IF        PGNO > 0
     C                   EVAL      PGNO = PGNO - 1
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   IF        *IN08 = *ON
     C                   IF        BASE + 14 < NMATCH
     C                   EVAL      PGNO = PGNO + 1
     C                   ENDIF
     C                   ITER
     C                   ENDIF
     C                   EVAL      ANYOP = 0
     C     1             DO        NSHOW         ROW
     C                   IF        DOP(ROW) <> *BLANKS
     C                   EVAL      ANYOP = 1
     C                   ENDIF
     C                   ENDDO
     C                   IF        ANYOP = 0 AND CSRSEL > 0
     C                   EVAL      DOP(CSRSEL) = '2'
     C                   ENDIF
     C                   EVAL      DCNT = 0
     C     1             DO        NSHOW         ROW
     C                   EVAL      OP = %TRIM(DOP(ROW))
     C                   IF        OP = '2' OR OP = '4' OR OP = '6'
     C                   EVAL      KDOC = KD(ROW)
     C                   SELECT
     C                   WHEN      OP = '2'
     C                   EXSR      EDIT
     C                   WHEN      OP = '6'
     C                   EXSR      LOADD
     C                   EXSR      PRINTD
     C                   OTHER
     C     KEY2D         SETLL     DOCLREC
     C     KEY2D         READE     DOCLREC
     C                   DOW       NOT %EOF(OVDOCLP)
     C                   DELETE    DOCLREC
     C     KEY2D         READE     DOCLREC
     C                   ENDDO
     C     KEY2D         CHAIN     DOCREC
     C                   IF        %FOUND(OVDOCP)
     C                   DELETE    DOCREC
     C                   EVAL      DCNT = DCNT + 1
     C                   ENDIF
     C                   ENDSL
     C                   ENDIF
     C                   ENDDO
     C                   IF        DCNT > 0
     C                   EVAL      MSG = %CHAR(DCNT) + ' document(s) deleted.'
     C                   EVAL      LACT = 'DELETE'
     C                   EVAL      LTXT = %CHAR(DCNT) + ' document(s)'
     C                   EXSR      LOGIT
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     LOAD          BEGSR
     C                   EVAL      DLNA = *BLANKS
     C                   EVAL      NMATCH = 0
     C                   EVAL      BASE = PGNO * 14
     C     KUSER         SETLL     DOCREC
     C     KUSER         READE(N)  DOCREC
     C                   DOW       NOT %EOF(OVDOCP)
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 14
     C                   EVAL      ROW = NMATCH - BASE
     C                   MOVE      DCSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      W12 = %CHAR(DCLINE) + ' lines'
     C                   EVAL      DLN(ROW) = '[=] ' + DCNAME + ' ' +
     C                             %SUBST(DCTITL:1:34) + ' ' + W12 +
     C                             %SUBST(WDT:1:10)
     C                   EVAL      KD(ROW) = DCNAME
     C                   ENDIF
     C     KUSER         READE(N)  DOCREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 14
     C                   EVAL      NSHOW = 14
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C                   EVAL      TTLW = %CHAR(NMATCH) + ' document(s)'
     C                   IF        NMATCH = 0
     C                   EVAL      TTLW = 'No documents yet.  Press F6 to' +
     C                             ' write one.'
     C                   ENDIF
     C                   ENDSR
      * ---- create a document, then edit it ----
     C     NEWDOC        BEGSR
     C                   EVAL      NNAME = *BLANKS
     C                   EVAL      NTITL = *BLANKS
     C                   EVAL      NMSG = *BLANKS
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCNEWDOC'
     C                   EXSR      HDR
     C                   EVAL      NHDR = HDRLN
     C                   EVAL      NFK = 'F1=Help   Enter=Create   F12=C' +
     C                             'ancel'
     C                   EXFMT     DNEW
     C                   EVAL      NMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON OR NNAME = *BLANKS
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      KDOC = %TRIML(NNAME)
     C     KEY2D         CHAIN(N)  DOCREC
     C                   IF        %FOUND(OVDOCP)
     C                   EVAL      NMSG = 'You already have a document wi' +
     C                             'th that name.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      DCUSER = PGMUSR
     C                   EVAL      DCNAME = KDOC
     C                   EVAL      DCTITL = %TRIML(NTITL)
     C                   TIME                    DCSTMP
     C                   EVAL      DCLINE = 0
     C                   WRITE     DOCREC
     C                   EVAL      LACT = 'NEWDOC'
     C                   EVAL      LTXT = KDOC
     C                   EXSR      LOGIT
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   EXSR      EDIT
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- read the document into memory ----
     C     LOADD         BEGSR
     C                   EVAL      TXT = *BLANKS
     C                   EVAL      NLINES = 0
     C                   EVAL      WTITL = *BLANKS
     C     KEY2D         CHAIN(N)  DOCREC
     C                   IF        %FOUND(OVDOCP)
     C                   EVAL      WTITL = DCTITL
     C                   ENDIF
     C     KEY2D         SETLL     DOCLREC
     C     KEY2D         READE(N)  DOCLREC
     C                   DOW       NOT %EOF(OVDOCLP) AND NLINES < 500
     C                   EVAL      NLINES = NLINES + 1
     C                   EVAL      TXT(NLINES) = DLTEXT
     C     KEY2D         READE(N)  DOCLREC
     C                   ENDDO
     C                   ENDSR
      * ---- the editor ----
     C     EDIT          BEGSR
     C                   EXSR      LOADD
     C                   EVAL      TOPL = 1
     C                   EVAL      DIRTY = '0'
     C                   EVAL      WARN = '0'
     C                   EVAL      EMSG = *BLANKS
     C                   DOW       1 = 1
     C     1             DO        15            I
     C                   EVAL      ED(I) = TXT(TOPL + I - 1)
     C                   ENDDO
     C                   EVAL      HDRID = 'OFCEDIT'
     C                   EXSR      HDR
     C                   EVAL      EHDR = HDRLN
     C                   EVAL      EINF = %TRIMR(KDOC) + ': ' + %TRIMR(WTITL) +
     C                             '   lines ' + %CHAR(TOPL) + ' to ' +
     C                             %CHAR(TOPL + 14) + ' of ' + %CHAR(NLINES)
     C                   EVAL      EFK1 = EK1
     C                   EVAL      EFK2 = EK2
     C                   EXFMT     DEDIT
     C                   EXSR      CSR
     C                   EVAL      EMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   IF        DIRTY = '1' AND WARN = '0'
     C                   EVAL      WARN = '1'
     C                   EVAL      EMSG = 'Not saved.  F10 saves.  F3 aga' +
     C                             'in leaves without saving.'
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ITER
     C                   ENDIF
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      WARN = '0'
     C     1             DO        15            I
     C                   EVAL      IDX = TOPL + I - 1
     C                   IF        ED(I) <> TXT(IDX)
     C                   EVAL      TXT(IDX) = ED(I)
     C                   EVAL      DIRTY = '1'
     C                   ENDIF
     C                   IF        ED(I) <> *BLANKS AND IDX > NLINES
     C                   EVAL      NLINES = IDX
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      CLN = 0
     C                   IF        CSRROW >= 6 AND CSRROW <= 20
     C                   EVAL      CLN = TOPL + CSRROW - 6
     C                   ENDIF
     C                   SELECT
     C                   WHEN      *IN07 = *ON
     C                   EVAL      TOPL = TOPL - 15
     C                   IF        TOPL < 1
     C                   EVAL      TOPL = 1
     C                   ENDIF
     C                   WHEN      *IN08 = *ON
     C                   IF        TOPL + 15 <= 486
     C                   EVAL      TOPL = TOPL + 15
     C                   ENDIF
     C                   WHEN      *IN06 = *ON AND CLN > 0
     C                   IF        NLINES >= 500
     C                   EVAL      EMSG = 'The document is full at 500 lines.'
     C                   ELSE
     C                   EVAL      J = 499
     C                   DOW       J >= CLN
     C                   EVAL      TXT(J + 1) = TXT(J)
     C                   EVAL      J = J - 1
     C                   ENDDO
     C                   EVAL      TXT(CLN) = *BLANKS
     C                   IF        CLN <= NLINES
     C                   EVAL      NLINES = NLINES + 1
     C                   ENDIF
     C                   EVAL      DIRTY = '1'
     C                   ENDIF
     C                   WHEN      *IN09 = *ON AND CLN > 0
     C                   EVAL      J = CLN
     C                   DOW       J < 500
     C                   EVAL      TXT(J) = TXT(J + 1)
     C                   EVAL      J = J + 1
     C                   ENDDO
     C                   EVAL      TXT(500) = *BLANKS
     C                   IF        CLN <= NLINES
     C                   EVAL      NLINES = NLINES - 1
     C                   ENDIF
     C                   EVAL      DIRTY = '1'
     C                   WHEN      *IN10 = *ON
     C                   EXSR      SAVED
     C                   EVAL      EMSG = 'Document saved.'
     C                   WHEN      *IN11 = *ON
     C                   EXSR      PRINTD
     C                   EVAL      EMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   ENDSL
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
     C     SAVED         BEGSR
     C                   DOW       NLINES > 0 AND TXT(NLINES) = *BLANKS
     C                   EVAL      NLINES = NLINES - 1
     C                   ENDDO
     C     KEY2D         SETLL     DOCLREC
     C     KEY2D         READE     DOCLREC
     C                   DOW       NOT %EOF(OVDOCLP)
     C                   DELETE    DOCLREC
     C     KEY2D         READE     DOCLREC
     C                   ENDDO
     C     1             DO        NLINES        I
     C                   EVAL      DLUSER = PGMUSR
     C                   EVAL      DLNAME = KDOC
     C                   EVAL      DLSEQ = I
     C                   EVAL      DLTEXT = TXT(I)
     C                   WRITE     DOCLREC
     C                   ENDDO
     C     KEY2D         CHAIN     DOCREC
     C                   IF        %FOUND(OVDOCP)
     C                   EVAL      DCLINE = NLINES
     C                   TIME                    DCSTMP
     C                   UPDATE    DOCREC
     C                   ENDIF
     C                   EVAL      DIRTY = '0'
     C                   EVAL      LACT = 'SAVEDOC'
     C                   EVAL      LTXT = %TRIMR(KDOC) + ', ' + %CHAR(NLINES) +
     C                             ' lines'
     C                   EXSR      LOGIT
     C                   ENDSR
     C     PRINTD        BEGSR
     C                   EVAL      PACT = 'O'
     C                   EVAL      PTXT = %TRIMR(KDOC) + ': ' + WTITL
     C                   EXSR      PRT
     C     1             DO        NLINES        J
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = TXT(J)
     C                   EXSR      PRT
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

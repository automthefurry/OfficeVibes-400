     H DFTACTGRP(*YES)
      * OVSHEET - OfficeVibes/400
     FOVSHTP    UF A E           K DISK
     FOVSHCP    UF A E           K DISK
     FOVSHEET   CF   E             WORKSTN INFDS(DSPINF)
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
     DSLNA                          720A
     D SLN                           72A   DIM(10) OVERLAY(SLNA)
     D SLN01                         72A   OVERLAY(SLNA:1)
     D SLN02                         72A   OVERLAY(SLNA:73)
     D SLN03                         72A   OVERLAY(SLNA:145)
     D SLN04                         72A   OVERLAY(SLNA:217)
     D SLN05                         72A   OVERLAY(SLNA:289)
     D SLN06                         72A   OVERLAY(SLNA:361)
     D SLN07                         72A   OVERLAY(SLNA:433)
     D SLN08                         72A   OVERLAY(SLNA:505)
     D SLN09                         72A   OVERLAY(SLNA:577)
     D SLN10                         72A   OVERLAY(SLNA:649)
     D                 DS
     DSOPA                           20A
     D SOP                            2A   DIM(10) OVERLAY(SOPA)
     D SOP01                          2A   OVERLAY(SOPA:1)
     D SOP02                          2A   OVERLAY(SOPA:3)
     D SOP03                          2A   OVERLAY(SOPA:5)
     D SOP04                          2A   OVERLAY(SOPA:7)
     D SOP05                          2A   OVERLAY(SOPA:9)
     D SOP06                          2A   OVERLAY(SOPA:11)
     D SOP07                          2A   OVERLAY(SOPA:13)
     D SOP08                          2A   OVERLAY(SOPA:15)
     D SOP09                          2A   OVERLAY(SOPA:17)
     D SOP10                          2A   OVERLAY(SOPA:19)
     D                 DS
     DGCA                           896A
     D GC                             8A   DIM(112) OVERLAY(GCA)
     D CA01                           8A   OVERLAY(GCA:1)
     D CB01                           8A   OVERLAY(GCA:9)
     D CC01                           8A   OVERLAY(GCA:17)
     D CD01                           8A   OVERLAY(GCA:25)
     D CE01                           8A   OVERLAY(GCA:33)
     D CF01                           8A   OVERLAY(GCA:41)
     D CG01                           8A   OVERLAY(GCA:49)
     D CH01                           8A   OVERLAY(GCA:57)
     D CA02                           8A   OVERLAY(GCA:65)
     D CB02                           8A   OVERLAY(GCA:73)
     D CC02                           8A   OVERLAY(GCA:81)
     D CD02                           8A   OVERLAY(GCA:89)
     D CE02                           8A   OVERLAY(GCA:97)
     D CF02                           8A   OVERLAY(GCA:105)
     D CG02                           8A   OVERLAY(GCA:113)
     D CH02                           8A   OVERLAY(GCA:121)
     D CA03                           8A   OVERLAY(GCA:129)
     D CB03                           8A   OVERLAY(GCA:137)
     D CC03                           8A   OVERLAY(GCA:145)
     D CD03                           8A   OVERLAY(GCA:153)
     D CE03                           8A   OVERLAY(GCA:161)
     D CF03                           8A   OVERLAY(GCA:169)
     D CG03                           8A   OVERLAY(GCA:177)
     D CH03                           8A   OVERLAY(GCA:185)
     D CA04                           8A   OVERLAY(GCA:193)
     D CB04                           8A   OVERLAY(GCA:201)
     D CC04                           8A   OVERLAY(GCA:209)
     D CD04                           8A   OVERLAY(GCA:217)
     D CE04                           8A   OVERLAY(GCA:225)
     D CF04                           8A   OVERLAY(GCA:233)
     D CG04                           8A   OVERLAY(GCA:241)
     D CH04                           8A   OVERLAY(GCA:249)
     D CA05                           8A   OVERLAY(GCA:257)
     D CB05                           8A   OVERLAY(GCA:265)
     D CC05                           8A   OVERLAY(GCA:273)
     D CD05                           8A   OVERLAY(GCA:281)
     D CE05                           8A   OVERLAY(GCA:289)
     D CF05                           8A   OVERLAY(GCA:297)
     D CG05                           8A   OVERLAY(GCA:305)
     D CH05                           8A   OVERLAY(GCA:313)
     D CA06                           8A   OVERLAY(GCA:321)
     D CB06                           8A   OVERLAY(GCA:329)
     D CC06                           8A   OVERLAY(GCA:337)
     D CD06                           8A   OVERLAY(GCA:345)
     D CE06                           8A   OVERLAY(GCA:353)
     D CF06                           8A   OVERLAY(GCA:361)
     D CG06                           8A   OVERLAY(GCA:369)
     D CH06                           8A   OVERLAY(GCA:377)
     D CA07                           8A   OVERLAY(GCA:385)
     D CB07                           8A   OVERLAY(GCA:393)
     D CC07                           8A   OVERLAY(GCA:401)
     D CD07                           8A   OVERLAY(GCA:409)
     D CE07                           8A   OVERLAY(GCA:417)
     D CF07                           8A   OVERLAY(GCA:425)
     D CG07                           8A   OVERLAY(GCA:433)
     D CH07                           8A   OVERLAY(GCA:441)
     D CA08                           8A   OVERLAY(GCA:449)
     D CB08                           8A   OVERLAY(GCA:457)
     D CC08                           8A   OVERLAY(GCA:465)
     D CD08                           8A   OVERLAY(GCA:473)
     D CE08                           8A   OVERLAY(GCA:481)
     D CF08                           8A   OVERLAY(GCA:489)
     D CG08                           8A   OVERLAY(GCA:497)
     D CH08                           8A   OVERLAY(GCA:505)
     D CA09                           8A   OVERLAY(GCA:513)
     D CB09                           8A   OVERLAY(GCA:521)
     D CC09                           8A   OVERLAY(GCA:529)
     D CD09                           8A   OVERLAY(GCA:537)
     D CE09                           8A   OVERLAY(GCA:545)
     D CF09                           8A   OVERLAY(GCA:553)
     D CG09                           8A   OVERLAY(GCA:561)
     D CH09                           8A   OVERLAY(GCA:569)
     D CA10                           8A   OVERLAY(GCA:577)
     D CB10                           8A   OVERLAY(GCA:585)
     D CC10                           8A   OVERLAY(GCA:593)
     D CD10                           8A   OVERLAY(GCA:601)
     D CE10                           8A   OVERLAY(GCA:609)
     D CF10                           8A   OVERLAY(GCA:617)
     D CG10                           8A   OVERLAY(GCA:625)
     D CH10                           8A   OVERLAY(GCA:633)
     D CA11                           8A   OVERLAY(GCA:641)
     D CB11                           8A   OVERLAY(GCA:649)
     D CC11                           8A   OVERLAY(GCA:657)
     D CD11                           8A   OVERLAY(GCA:665)
     D CE11                           8A   OVERLAY(GCA:673)
     D CF11                           8A   OVERLAY(GCA:681)
     D CG11                           8A   OVERLAY(GCA:689)
     D CH11                           8A   OVERLAY(GCA:697)
     D CA12                           8A   OVERLAY(GCA:705)
     D CB12                           8A   OVERLAY(GCA:713)
     D CC12                           8A   OVERLAY(GCA:721)
     D CD12                           8A   OVERLAY(GCA:729)
     D CE12                           8A   OVERLAY(GCA:737)
     D CF12                           8A   OVERLAY(GCA:745)
     D CG12                           8A   OVERLAY(GCA:753)
     D CH12                           8A   OVERLAY(GCA:761)
     D CA13                           8A   OVERLAY(GCA:769)
     D CB13                           8A   OVERLAY(GCA:777)
     D CC13                           8A   OVERLAY(GCA:785)
     D CD13                           8A   OVERLAY(GCA:793)
     D CE13                           8A   OVERLAY(GCA:801)
     D CF13                           8A   OVERLAY(GCA:809)
     D CG13                           8A   OVERLAY(GCA:817)
     D CH13                           8A   OVERLAY(GCA:825)
     D CA14                           8A   OVERLAY(GCA:833)
     D CB14                           8A   OVERLAY(GCA:841)
     D CC14                           8A   OVERLAY(GCA:849)
     D CD14                           8A   OVERLAY(GCA:857)
     D CE14                           8A   OVERLAY(GCA:865)
     D CF14                           8A   OVERLAY(GCA:873)
     D CG14                           8A   OVERLAY(GCA:881)
     D CH14                           8A   OVERLAY(GCA:889)
     D                 DS
     DGNA                            42A
     D GN                             3A   DIM(14) OVERLAY(GNA)
     D GN01                           3A   OVERLAY(GNA:1)
     D GN02                           3A   OVERLAY(GNA:4)
     D GN03                           3A   OVERLAY(GNA:7)
     D GN04                           3A   OVERLAY(GNA:10)
     D GN05                           3A   OVERLAY(GNA:13)
     D GN06                           3A   OVERLAY(GNA:16)
     D GN07                           3A   OVERLAY(GNA:19)
     D GN08                           3A   OVERLAY(GNA:22)
     D GN09                           3A   OVERLAY(GNA:25)
     D GN10                           3A   OVERLAY(GNA:28)
     D GN11                           3A   OVERLAY(GNA:31)
     D GN12                           3A   OVERLAY(GNA:34)
     D GN13                           3A   OVERLAY(GNA:37)
     D GN14                           3A   OVERLAY(GNA:40)
     D                 DS
     DHDS                            64A
     D HD                             8A   DIM(8) OVERLAY(HDS)
     D HDA                            8A   OVERLAY(HDS:1)
     D HDB                            8A   OVERLAY(HDS:9)
     D HDC                            8A   OVERLAY(HDS:17)
     D HDD                            8A   OVERLAY(HDS:25)
     D HDE                            8A   OVERLAY(HDS:33)
     D HDF                            8A   OVERLAY(HDS:41)
     D HDG                            8A   OVERLAY(HDS:49)
     D HDH                            8A   OVERLAY(HDS:57)
     D                 DS
     DKLA                           150A
     D KL                            10A   DIM(15) OVERLAY(KLA)
     D KL01                          10A   OVERLAY(KLA:1)
     D KL02                          10A   OVERLAY(KLA:11)
     D KL03                          10A   OVERLAY(KLA:21)
     D KL04                          10A   OVERLAY(KLA:31)
     D KL05                          10A   OVERLAY(KLA:41)
     D KL06                          10A   OVERLAY(KLA:51)
     D KL07                          10A   OVERLAY(KLA:61)
     D KL08                          10A   OVERLAY(KLA:71)
     D KL09                          10A   OVERLAY(KLA:81)
     D KL10                          10A   OVERLAY(KLA:91)
     D KL11                          10A   OVERLAY(KLA:101)
     D KL12                          10A   OVERLAY(KLA:111)
     D KL13                          10A   OVERLAY(KLA:121)
     D KL14                          10A   OVERLAY(KLA:131)
     D KL15                          10A   OVERLAY(KLA:141)
     D                 DS
     DKVA                           150A
     D KV                            10A   DIM(15) OVERLAY(KVA)
     D KV01                          10A   OVERLAY(KVA:1)
     D KV02                          10A   OVERLAY(KVA:11)
     D KV03                          10A   OVERLAY(KVA:21)
     D KV04                          10A   OVERLAY(KVA:31)
     D KV05                          10A   OVERLAY(KVA:41)
     D KV06                          10A   OVERLAY(KVA:51)
     D KV07                          10A   OVERLAY(KVA:61)
     D KV08                          10A   OVERLAY(KVA:71)
     D KV09                          10A   OVERLAY(KVA:81)
     D KV10                          10A   OVERLAY(KVA:91)
     D KV11                          10A   OVERLAY(KVA:101)
     D KV12                          10A   OVERLAY(KVA:111)
     D KV13                          10A   OVERLAY(KVA:121)
     D KV14                          10A   OVERLAY(KVA:131)
     D KV15                          10A   OVERLAY(KVA:141)
     D                 DS
     DKBA                           750A
     D KB                            50A   DIM(15) OVERLAY(KBA)
     D KB01                          50A   OVERLAY(KBA:1)
     D KB02                          50A   OVERLAY(KBA:51)
     D KB03                          50A   OVERLAY(KBA:101)
     D KB04                          50A   OVERLAY(KBA:151)
     D KB05                          50A   OVERLAY(KBA:201)
     D KB06                          50A   OVERLAY(KBA:251)
     D KB07                          50A   OVERLAY(KBA:301)
     D KB08                          50A   OVERLAY(KBA:351)
     D KB09                          50A   OVERLAY(KBA:401)
     D KB10                          50A   OVERLAY(KBA:451)
     D KB11                          50A   OVERLAY(KBA:501)
     D KB12                          50A   OVERLAY(KBA:551)
     D KB13                          50A   OVERLAY(KBA:601)
     D KB14                          50A   OVERLAY(KBA:651)
     D KB15                          50A   OVERLAY(KBA:701)
     DDSPV             S              8A   DIM(112)
     DCHG              S              1A
     DOSR              S              5  0
     DOSC              S              5  0
     DLSTR             S              5  0
     DLSTC             S              5  0
     DDIR              S              1A   INZ('D')
     DKROWS            S              5  0 DIM(15)
     DBLN              S              5  0
     DHASH50           C                   '##############################-
     D                                     ####################'
     DDASH50           C                   '-------------------------------
     D                                     --------------------'
     DTX               S             30A   DIM(792)
     DVAL              S              8F   DIM(792)
     DISN              S              1A   DIM(792)
     DKSN              S             10A   DIM(10)
     DKSHT             S             10A
     DKROW             S              3  0
     DKCOL             S              2  0
     DTOPR             S              5  0
     DSELR             S              5  0
     DSELC             S              5  0
     DSIDX             S              5  0
     DIDX              S              5  0
     DIDX2             S              5  0
     DPASS             S              5  0
     DRX               S              5  0
     DCX               S              5  0
     DP                S              5  0
     DFLEN             S              5  0
     DFTXT             S             30A
     DFERR             S              1A
     DFVAL             S              8F
     DRES              S              8F
     DTERM             S              8F
     DOPV              S              8F
     DNUMV             S              8F
     DSCALE            S              8F
     DSUMV             S              8F
     DMINV             S              8F
     DMAXV             S              8F
     DPEND             S              1A
     DOPR              S              1A
     DNEG              S              1A
     DNOK              S              1A
     DRERR             S              1A
     DDG               S              5  0
     DRR               S              5  0
     DRC               S              5  0
     DNDG              S              5  0
     DK                S              5  0
     DFN               S              5A
     DR1               S              5  0
     DC1               S              5  0
     DR2               S              5  0
     DC2               S              5  0
     DRA               S              5  0
     DCA               S              5  0
     DCNTN             S              5  0
     DV2               S             13  2
     DVI               S             11  0
     DWS               S             20A
     DCELL8            S              8A
     DMARK             S              1A
     DR2D              S              2  0
     DCNAME            S              3A
     DOLDC             S             30A
     DOLDN             S              3A
     DRLINE            S             75A
     DANY              S              1A
     DSHOWM            S              1A
     DWTITL            S             40A
     DNEWN             S              3A
     DCOLS             C                   'ABCDEFGH'
     DCOLH             C                   'Opt  Name       Title         -
     D                                                                Cha-
     D                                     nged'
     DFK1              C                   '2=Open  4=Delete  6=Print   or-
     D                                      put the cursor on a sheet and-
     D                                      press Enter'
     DFK2              C                   'F1=Help  F3=Exit  F6=New sheet-
     D                                       F7/F8=Page'
     DGK1              C                   'Type in the cells.  Tab/Backta-
     D                                     b move across.  Enter stores a-
     D                                     nd moves on.'
     DGK2              C                   'F1=Help F3=Exit F6=Empty cell -
     D                                     F7/F8=Rows F9=Print F10=Down/R-
     D                                     ight F11=Chart'
     DPCOLH            C                   '       A        B        C    -
     D                                         D        E        F       -
     D                                      G        H    '
     C     KEY2S         KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KSHT
     C     KEY4          KLIST
     C                   KFLD                    KUSER
     C                   KFLD                    KSHT
     C                   KFLD                    KROW
     C                   KFLD                    KCOL
     C                   EVAL      LAPP = 'SHEETS'
     C                   DOW       *IN03 = *OFF AND *IN12 = *OFF
     C                   EXSR      LOAD
     C                   IF        PGNO > 0 AND BASE >= NMATCH
     C                   EVAL      PGNO = 0
     C                   EXSR      LOAD
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCSHEETS'
     C                   EXSR      HDR
     C                   EVAL      SHDR = HDRLN
     C                   EVAL      STTL = TTLW
     C                   EVAL      SCOL = COLH
     C                   EVAL      SMSG = MSG
     C                   EVAL      SFK1 = FK1
     C                   EVAL      SFK2 = FK2
     C                   EVAL      MSG = *BLANKS
     C                   EXFMT     SLIST
     C                   EXSR      CSR
     C                   EVAL      CSRSEL = CSRROW - 8
     C                   IF        CSRSEL < 1 OR CSRSEL > NSHOW OR CSRCOL < 7
     C                   EVAL      CSRSEL = 0
     C                   ENDIF
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   IF        *IN06 = *ON
     C                   EXSR      NEWSHT
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
     C                   IF        SOP(ROW) <> *BLANKS
     C                   EVAL      ANYOP = 1
     C                   ENDIF
     C                   ENDDO
     C                   IF        ANYOP = 0 AND CSRSEL > 0
     C                   EVAL      SOP(CSRSEL) = '2'
     C                   ENDIF
     C                   EVAL      DCNT = 0
     C     1             DO        NSHOW         ROW
     C                   EVAL      OP = %TRIM(SOP(ROW))
     C                   IF        OP = '2' OR OP = '4' OR OP = '6'
     C                   EVAL      KSHT = KSN(ROW)
     C                   SELECT
     C                   WHEN      OP = '2'
     C                   EXSR      GRID
     C                   WHEN      OP = '6'
     C                   EXSR      LOADS
     C                   EXSR      RECALC
     C                   EXSR      PRINTS
     C                   OTHER
     C     KEY2S         SETLL     SHCREC
     C     KEY2S         READE     SHCREC
     C                   DOW       NOT %EOF(OVSHCP)
     C                   DELETE    SHCREC
     C     KEY2S         READE     SHCREC
     C                   ENDDO
     C     KEY2S         CHAIN     SHTREC
     C                   IF        %FOUND(OVSHTP)
     C                   DELETE    SHTREC
     C                   EVAL      DCNT = DCNT + 1
     C                   ENDIF
     C                   ENDSL
     C                   ENDIF
     C                   ENDDO
     C                   IF        DCNT > 0
     C                   EVAL      MSG = %CHAR(DCNT) + ' sheet(s) deleted.'
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      *INLR = *ON
     C     LOAD          BEGSR
     C                   EVAL      SLNA = *BLANKS
     C                   EVAL      NMATCH = 0
     C                   EVAL      BASE = PGNO * 10
     C     KUSER         SETLL     SHTREC
     C     KUSER         READE(N)  SHTREC
     C                   DOW       NOT %EOF(OVSHTP)
     C                   EVAL      NMATCH = NMATCH + 1
     C                   IF        NMATCH > BASE AND NMATCH <= BASE + 10
     C                   EVAL      ROW = NMATCH - BASE
     C                   MOVE      SHSTMP        WSTMP
     C                   EXSR      FMTDT
     C                   EVAL      SLN(ROW) = SHNAME + ' ' + SHTITL + ' ' + WDT
     C                   EVAL      KSN(ROW) = SHNAME
     C                   ENDIF
     C     KUSER         READE(N)  SHTREC
     C                   ENDDO
     C                   EVAL      NSHOW = NMATCH - BASE
     C                   IF        NSHOW > 10
     C                   EVAL      NSHOW = 10
     C                   ENDIF
     C                   IF        NSHOW < 0
     C                   EVAL      NSHOW = 0
     C                   ENDIF
     C                   EVAL      TTLW = 'Spreadsheets - ' + %CHAR(NMATCH)
     C                   ENDSR
     C     NEWSHT        BEGSR
     C                   EVAL      NNAME = *BLANKS
     C                   EVAL      NTITL = *BLANKS
     C                   EVAL      NMSG = *BLANKS
     C                   DOW       1 = 1
     C                   EVAL      HDRID = 'OFCNEWSHT'
     C                   EXSR      HDR
     C                   EVAL      NHDR = HDRLN
     C                   EVAL      NFK = 'F1=Help   Enter=Create   F12=C' +
     C                             'ancel'
     C                   EXFMT     SNEW
     C                   EVAL      NMSG = *BLANKS
     C                   IF        *IN03 = *ON OR *IN12 = *ON OR NNAME = *BLANKS
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      KSHT = %TRIML(NNAME)
     C     KEY2S         CHAIN(N)  SHTREC
     C                   IF        %FOUND(OVSHTP)
     C                   EVAL      NMSG = 'You already have a sheet with ' +
     C                             'that name.'
     C                   ITER
     C                   ENDIF
     C                   EVAL      SHUSER = PGMUSR
     C                   EVAL      SHNAME = KSHT
     C                   EVAL      SHTITL = %TRIML(NTITL)
     C                   TIME                    SHSTMP
     C                   WRITE     SHTREC
     C                   EVAL      LACT = 'NEWSHEET'
     C                   EVAL      LTXT = KSHT
     C                   EXSR      LOGIT
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   EXSR      GRID
     C                   LEAVE
     C                   ENDDO
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- read the sheet into memory ----
     C     LOADS         BEGSR
     C                   EVAL      TX = *BLANKS
     C                   EVAL      WTITL = *BLANKS
     C     KEY2S         CHAIN(N)  SHTREC
     C                   IF        %FOUND(OVSHTP)
     C                   EVAL      WTITL = SHTITL
     C                   ENDIF
     C     KEY2S         SETLL     SHCREC
     C     KEY2S         READE(N)  SHCREC
     C                   DOW       NOT %EOF(OVSHCP)
     C                   IF        SXROW >= 1 AND SXROW <= 99 AND SXCOL >= 1 AND
     C                             SXCOL <= 8
     C                   EVAL      TX((SXROW - 1) * 8 + SXCOL) = SXTEXT
     C                   ENDIF
     C     KEY2S         READE(N)  SHCREC
     C                   ENDDO
     C                   ENDSR
      * ---- write the current cell to the file ----
     C     STORE         BEGSR
     C                   EVAL      KROW = SELR
     C                   EVAL      KCOL = SELC
     C     KEY4          CHAIN     SHCREC
     C                   IF        TX(SIDX) = *BLANKS
     C                   IF        %FOUND(OVSHCP)
     C                   DELETE    SHCREC
     C                   ENDIF
     C                   ELSE
     C                   EVAL      SXUSER = PGMUSR
     C                   EVAL      SXNAME = KSHT
     C                   EVAL      SXROW = SELR
     C                   EVAL      SXCOL = SELC
     C                   EVAL      SXTEXT = TX(SIDX)
     C                   IF        %FOUND(OVSHCP)
     C                   UPDATE    SHCREC
     C                   ELSE
     C                   WRITE     SHCREC
     C                   ENDIF
     C                   ENDIF
     C     KEY2S         CHAIN     SHTREC
     C                   IF        %FOUND(OVSHTP)
     C                   TIME                    SHSTMP
     C                   UPDATE    SHTREC
     C                   ENDIF
     C                   ENDSR
      * ---- work out every cell.  Six passes let formulas feed formulas ----
     C     RECALC        BEGSR
     C     1             DO        6             PASS
     C     1             DO        792           IDX
     C                   IF        TX(IDX) = *BLANKS
     C                   EVAL      ISN(IDX) = '0'
     C                   EVAL      VAL(IDX) = 0
     C                   ELSE
     C                   IF        %SUBST(TX(IDX):1:1) = '='
     C                   EVAL      FTXT = %SUBST(TX(IDX):2)
     C     LCASE:UCASE   XLATE     FTXT          FTXT
     C                   EXSR      EVALF
     C                   EVAL      VAL(IDX) = FVAL
     C                   EVAL      ISN(IDX) = '1'
     C                   IF        FERR = '1'
     C                   EVAL      ISN(IDX) = 'E'
     C                   EVAL      VAL(IDX) = 0
     C                   ENDIF
     C                   ELSE
     C                   IF        PASS = 1
     C                   EVAL      ISN(IDX) = '0'
     C                   EVAL      VAL(IDX) = 0
     C                   EVAL      FTXT = TX(IDX)
     C                   EVAL      FLEN = %LEN(%TRIMR(FTXT))
     C                   EVAL      P = 1
     C                   IF        %SCAN(%SUBST(FTXT:1:1):'0123456789.-') > 0
     C                   EXSR      GETNUM
     C                   IF        NOK = '1' AND P > FLEN
     C                   EVAL      ISN(IDX) = '1'
     C                   EVAL      VAL(IDX) = NUMV
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   ENDDO
     C                   ENDSR
      * ---- formula in FTXT: sets FVAL and FERR ----
     C     EVALF         BEGSR
     C                   EVAL      FERR = '0'
     C                   EVAL      FVAL = 0
     C                   EVAL      P = 1
     C                   EVAL      FLEN = %LEN(%TRIMR(FTXT))
     C                   EXSR      GETOPD
     C                   EVAL      RES = 0
     C                   EVAL      TERM = OPV
     C                   EVAL      PEND = '+'
     C                   DOW       FERR = '0' AND P <= FLEN
     C                   EVAL      CH = %SUBST(FTXT:P:1)
     C                   EVAL      P = P + 1
     C                   IF        CH = ' '
     C                   ITER
     C                   ENDIF
     C                   IF        CH <> '+' AND CH <> '-' AND CH <> '*' AND CH
     C                             <> '/'
     C                   EVAL      FERR = '1'
     C                   LEAVE
     C                   ENDIF
     C                   EVAL      OPR = CH
     C                   EXSR      GETOPD
     C                   IF        FERR = '1'
     C                   LEAVE
     C                   ENDIF
     C                   SELECT
     C                   WHEN      OPR = '*'
     C                   EVAL      TERM = TERM * OPV
     C                   WHEN      OPR = '/'
     C                   IF        OPV = 0
     C                   EVAL      FERR = '1'
     C                   ELSE
     C                   EVAL      TERM = TERM / OPV
     C                   ENDIF
     C                   OTHER
     C                   IF        PEND = '+'
     C                   EVAL      RES = RES + TERM
     C                   ELSE
     C                   EVAL      RES = RES - TERM
     C                   ENDIF
     C                   EVAL      PEND = OPR
     C                   EVAL      TERM = OPV
     C                   ENDSL
     C                   ENDDO
     C                   IF        PEND = '+'
     C                   EVAL      RES = RES + TERM
     C                   ELSE
     C                   EVAL      RES = RES - TERM
     C                   ENDIF
     C                   EVAL      FVAL = RES
     C                   ENDSR
      * ---- next operand at P: a number, a cell or a function: sets OPV ----
     C     GETOPD        BEGSR
     C                   EVAL      OPV = 0
     C                   DOW       P <= FLEN AND %SUBST(FTXT:P:1) = ' '
     C                   EVAL      P = P + 1
     C                   ENDDO
     C                   IF        P > FLEN
     C                   EVAL      FERR = '1'
     C                   ELSE
     C                   EVAL      CH = %SUBST(FTXT:P:1)
     C                   SELECT
     C                   WHEN      %SCAN(CH:'0123456789.-') > 0
     C                   EXSR      GETNUM
     C                   EVAL      OPV = NUMV
     C                   IF        NOK = '0'
     C                   EVAL      FERR = '1'
     C                   ENDIF
     C                   WHEN      %SCAN(CH:COLS) > 0 AND P < FLEN AND
     C                             %SCAN(%SUBST(FTXT:P+1:1):'0123456789') > 0
     C                   EXSR      GETREF
     C                   IF        RERR = '1'
     C                   EVAL      FERR = '1'
     C                   ELSE
     C                   EVAL      IDX2 = (RR - 1) * 8 + RC
     C                   IF        ISN(IDX2) = '1'
     C                   EVAL      OPV = VAL(IDX2)
     C                   ENDIF
     C                   IF        ISN(IDX2) = 'E'
     C                   EVAL      FERR = '1'
     C                   ENDIF
     C                   ENDIF
     C                   OTHER
     C                   EXSR      GETFN
     C                   ENDSL
     C                   ENDIF
     C                   ENDSR
      * ---- number at P: sets NUMV, NOK ----
     C     GETNUM        BEGSR
     C                   EVAL      NOK = '0'
     C                   EVAL      NUMV = 0
     C                   EVAL      NEG = '0'
     C                   EVAL      SCALE = 0
     C                   IF        %SUBST(FTXT:P:1) = '-'
     C                   EVAL      NEG = '1'
     C                   EVAL      P = P + 1
     C                   ENDIF
     C                   DOW       P <= FLEN
     C                   EVAL      CH = %SUBST(FTXT:P:1)
     C                   EVAL      DG = %SCAN(CH:'0123456789')
     C                   IF        DG > 0
     C                   IF        SCALE = 0
     C                   EVAL      NUMV = NUMV * 10 + DG - 1
     C                   ELSE
     C                   EVAL      NUMV = NUMV + (DG - 1) * SCALE
     C                   EVAL      SCALE = SCALE / 10
     C                   ENDIF
     C                   EVAL      NOK = '1'
     C                   ELSE
     C                   IF        CH = '.' AND SCALE = 0
     C                   EVAL      SCALE = 0.1
     C                   ELSE
     C                   LEAVE
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      P = P + 1
     C                   ENDDO
     C                   IF        NEG = '1'
     C                   EVAL      NUMV = 0 - NUMV
     C                   ENDIF
     C                   ENDSR
      * ---- cell name at P, such as B12: sets RR, RC, RERR ----
     C     GETREF        BEGSR
     C                   EVAL      RERR = '0'
     C                   EVAL      RR = 0
     C                   EVAL      RC = 0
     C                   IF        P <= FLEN
     C                   EVAL      RC = %SCAN(%SUBST(FTXT:P:1):COLS)
     C                   ENDIF
     C                   IF        RC = 0
     C                   EVAL      RERR = '1'
     C                   ELSE
     C                   EVAL      P = P + 1
     C                   EVAL      NDG = 0
     C                   DOW       P <= FLEN AND NDG < 2 AND
     C                             %SCAN(%SUBST(FTXT:P:1):'0123456789') > 0
     C                   EVAL      RR = RR * 10 +
     C                             %SCAN(%SUBST(FTXT:P:1):'0123456789') - 1
     C                   EVAL      NDG = NDG + 1
     C                   EVAL      P = P + 1
     C                   ENDDO
     C                   IF        RR < 1 OR RR > 99
     C                   EVAL      RERR = '1'
     C                   ENDIF
     C                   ENDIF
     C                   ENDSR
      * ---- function at P, such as SUM(B2:B9): sets OPV ----
     C     GETFN         BEGSR
     C                   EVAL      FN = *BLANKS
     C                   EVAL      K = 0
     C                   DOW       P <= FLEN AND K < 5 AND
     C                             %SCAN(%SUBST(FTXT:P:1):UCASE) > 0
     C                   EVAL      K = K + 1
     C                   EVAL      %SUBST(FN:K:1) = %SUBST(FTXT:P:1)
     C                   EVAL      P = P + 1
     C                   ENDDO
     C                   IF        P > FLEN OR K = 0
     C                   EVAL      FERR = '1'
     C                   ELSE
     C                   IF        %SUBST(FTXT:P:1) <> '('
     C                   EVAL      FERR = '1'
     C                   ENDIF
     C                   ENDIF
     C                   IF        FERR = '0'
     C                   EVAL      P = P + 1
     C                   EXSR      GETREF
     C                   EVAL      R1 = RR
     C                   EVAL      C1 = RC
     C                   IF        RERR = '1' OR P > FLEN
     C                   EVAL      FERR = '1'
     C                   ELSE
     C                   IF        %SUBST(FTXT:P:1) <> ':'
     C                   EVAL      FERR = '1'
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   IF        FERR = '0'
     C                   EVAL      P = P + 1
     C                   EXSR      GETREF
     C                   EVAL      R2 = RR
     C                   EVAL      C2 = RC
     C                   IF        RERR = '1' OR P > FLEN
     C                   EVAL      FERR = '1'
     C                   ELSE
     C                   IF        %SUBST(FTXT:P:1) <> ')'
     C                   EVAL      FERR = '1'
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   IF        FERR = '0'
     C                   EVAL      P = P + 1
     C                   EVAL      CNTN = 0
     C                   EVAL      SUMV = 0
     C                   EVAL      MINV = 0
     C                   EVAL      MAXV = 0
     C     R1            DO        R2            RA
     C     C1            DO        C2            CA
     C                   EVAL      IDX2 = (RA - 1) * 8 + CA
     C                   IF        ISN(IDX2) = '1'
     C                   EVAL      CNTN = CNTN + 1
     C                   EVAL      SUMV = SUMV + VAL(IDX2)
     C                   IF        CNTN = 1 OR VAL(IDX2) < MINV
     C                   EVAL      MINV = VAL(IDX2)
     C                   ENDIF
     C                   IF        CNTN = 1 OR VAL(IDX2) > MAXV
     C                   EVAL      MAXV = VAL(IDX2)
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   ENDDO
     C                   SELECT
     C                   WHEN      FN = 'SUM'
     C                   EVAL      OPV = SUMV
     C                   WHEN      FN = 'AVG' AND CNTN > 0
     C                   EVAL      OPV = SUMV / CNTN
     C                   WHEN      FN = 'MIN'
     C                   EVAL      OPV = MINV
     C                   WHEN      FN = 'MAX'
     C                   EVAL      OPV = MAXV
     C                   WHEN      FN = 'COUNT'
     C                   EVAL      OPV = CNTN
     C                   OTHER
     C                   EVAL      FERR = '1'
     C                   ENDSL
     C                   ENDIF
     C                   ENDSR
      * ---- cell IDX as eight characters: sets CELL8 ----
     C     FMTC          BEGSR
     C                   EVAL      CELL8 = *BLANKS
     C                   SELECT
     C                   WHEN      TX(IDX) = *BLANKS
     C                   EVAL      CELL8 = *BLANKS
     C                   WHEN      ISN(IDX) = 'E'
     C                   EVAL      CELL8 = '   ERROR'
     C                   WHEN      ISN(IDX) = '1'
     C                   IF        VAL(IDX) > 9999999 OR VAL(IDX) < -999999
     C                   EVAL      CELL8 = '########'
     C                   ELSE
     C                   EVAL(H)   V2 = VAL(IDX)
     C                   EVAL      VI = V2
     C                   IF        VI = V2
     C                   EVAL      WS = %TRIM(%EDITC(VI:'P'))
     C                   ELSE
     C                   EVAL      WS = %TRIM(%EDITC(V2:'P'))
     C                   ENDIF
     C                   IF        %LEN(%TRIM(WS)) > 8
     C                   EVAL      CELL8 = '########'
     C                   ELSE
     C                   EVALR     CELL8 = %TRIM(WS)
     C                   ENDIF
     C                   ENDIF
     C                   OTHER
     C                   EVAL      CELL8 = TX(IDX)
     C                   ENDSL
     C                   ENDSR
      * ---- one row RX as a line: sets RLINE and ANY ----
     C     ROWLN         BEGSR
     C                   EVAL      R2D = RX
     C                   EVAL      RLINE = %EDITC(R2D:'Z')
     C                   EVAL      ANY = '0'
     C     1             DO        8             CX
     C                   EVAL      IDX = (RX - 1) * 8 + CX
     C                   EXSR      FMTC
     C                   IF        TX(IDX) <> *BLANKS
     C                   EVAL      ANY = '1'
     C                   ENDIF
     C                   EVAL      MARK = ' '
     C                   IF        SHOWM = '1' AND RX = SELR AND CX = SELC
     C                   EVAL      MARK = '>'
     C                   ENDIF
     C                   EVAL      %SUBST(RLINE:CX*9-5:9) = MARK + CELL8
     C                   ENDDO
     C                   ENDSR
      * ---- the grid ----
     C     GRID          BEGSR
     C                   EXSR      LOADS
     C                   EXSR      RECALC
     C                   EVAL      TOPR = 1
     C                   EVAL      SELR = 1
     C                   EVAL      SELC = 1
     C                   EVAL      GMSG = *BLANKS
     C                   DOW       1 = 1
     C                   EXSR      SHOWG
     C                   EXFMT     SGRID
     C                   EXSR      CSR
     C                   EVAL      GMSG = *BLANKS
     C                   EXSR      TAKEIN
     C                   IF        *IN03 = *ON OR *IN12 = *ON
     C                   LEAVE
     C                   ENDIF
     C                   SELECT
     C                   WHEN      *IN07 = *ON
     C                   EVAL      TOPR = TOPR - 14
     C                   IF        TOPR < 1
     C                   EVAL      TOPR = 1
     C                   ENDIF
     C                   WHEN      *IN08 = *ON
     C                   EVAL      TOPR = TOPR + 14
     C                   IF        TOPR > 86
     C                   EVAL      TOPR = 86
     C                   ENDIF
     C                   WHEN      *IN09 = *ON
     C                   EXSR      PRINTS
     C                   EVAL      GMSG = MSG
     C                   EVAL      MSG = *BLANKS
     C                   WHEN      *IN06 = *ON
     C                   EVAL      SIDX = (SELR - 1) * 8 + SELC
     C                   EVAL      TX(SIDX) = *BLANKS
     C                   EXSR      STORE
     C                   EXSR      RECALC
     C                   WHEN      *IN10 = *ON
     C                   IF        DIR = 'D'
     C                   EVAL      DIR = 'R'
     C                   ELSE
     C                   EVAL      DIR = 'D'
     C                   ENDIF
     C                   WHEN      *IN11 = *ON
     C                   EXSR      CHART
     C                   WHEN      CHG = '1'
     C                   EVAL      SELR = LSTR
     C                   EVAL      SELC = LSTC
     C                   IF        DIR = 'D'
     C                   IF        SELR < 99
     C                   EVAL      SELR = SELR + 1
     C                   ENDIF
     C                   ELSE
     C                   IF        SELC < 8
     C                   EVAL      SELC = SELC + 1
     C                   ELSE
     C                   IF        SELR < 99
     C                   EVAL      SELC = 1
     C                   EVAL      SELR = SELR + 1
     C                   ENDIF
     C                   ENDIF
     C                   ENDIF
     C                   EXSR      INVIEW
     C                   WHEN      CSRROW >= 4 AND CSRROW <= 17 AND CSRCOL >= 5
     C                             AND CSRCOL <= 76
     C                   EVAL      SELR = TOPR + CSRROW - 4
     C                   EVAL      SELC = %DIV(CSRCOL - 5:9) + 1
     C                   OTHER
     C                   EVAL      FTXT = %TRIML(SCELL)
     C     LCASE:UCASE   XLATE     FTXT          FTXT
     C                   IF        FTXT <> OLDN
     C                   EVAL      FLEN = %LEN(%TRIMR(FTXT))
     C                   EVAL      P = 1
     C                   EVAL      RERR = '1'
     C                   IF        FLEN > 0
     C                   EXSR      GETREF
     C                   ENDIF
     C                   IF        RERR = '1' OR P <= FLEN
     C                   EVAL      GMSG = 'Cell must be a letter A to H a' +
     C                             'nd a row 1 to 99, such as C12.'
     C                   ELSE
     C                   EVAL      SELR = RR
     C                   EVAL      SELC = RC
     C                   EXSR      INVIEW
     C                   ENDIF
     C                   ENDIF
     C                   ENDSL
     C                   ENDDO
     C                   EVAL      DIR = 'D'
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
      * ---- put the sheet on the screen ----
     C     SHOWG         BEGSR
     C     1             DO        14            I
     C                   EVAL      RX = TOPR + I - 1
     C                   EVAL      R2D = RX
     C                   EVAL      GN(I) = %EDITC(R2D:'Z')
     C                   EVAL      *IN(60 + I) = (RX = SELR)
     C     1             DO        8             CX
     C                   EVAL      IDX = (RX - 1) * 8 + CX
     C                   EXSR      FMTC
     C                   EVAL      J = (I - 1) * 8 + CX
     C                   EVAL      GC(J) = CELL8
     C                   EVAL      DSPV(J) = CELL8
     C                   ENDDO
     C                   ENDDO
     C     1             DO        8             CX
     C                   EVAL      HD(CX) = '   ' + %SUBST(COLS:CX:1)
     C                   EVAL      *IN(80 + CX) = (CX = SELC)
     C                   ENDDO
     C                   EVAL      SIDX = (SELR - 1) * 8 + SELC
     C                   EVAL      CNAME = %SUBST(COLS:SELC:1) + %CHAR(SELR)
     C                   EVAL      SCELL = CNAME
     C                   EVAL      SCONT = TX(SIDX)
     C                   EVAL      OLDC = SCONT
     C                   EVAL      OLDN = CNAME
     C                   EVAL      IDX = SIDX
     C                   EXSR      FMTC
     C                   SELECT
     C                   WHEN      TX(SIDX) = *BLANKS
     C                   EVAL      SINF = %TRIM(CNAME) + ' is empty.'
     C                   WHEN      ISN(SIDX) = 'E'
     C                   EVAL      SINF = %TRIM(CNAME) +
     C                             ' cannot be worked out: ' + TX(SIDX)
     C                   WHEN      %SUBST(TX(SIDX):1:1) = '='
     C                   EVAL      SINF = %TRIM(CNAME) + ' = ' + %TRIM(CELL8) +
     C                             '      from the formula  ' + TX(SIDX)
     C                   OTHER
     C                   EVAL      SINF = %TRIM(CNAME) + ' holds  ' + TX(SIDX)
     C                   ENDSL
     C                   EVAL      CSLIN = 19
     C                   EVAL      CSCOL = 25
     C                   IF        SELR >= TOPR AND SELR <= TOPR + 13
     C                   EVAL      CSLIN = 4 + SELR - TOPR
     C                   EVAL      CSCOL = 6 + (SELC - 1) * 9
     C                   ENDIF
     C                   EVAL      GDIR = 'Enter moves: DOWN'
     C                   IF        DIR = 'R'
     C                   EVAL      GDIR = 'Enter moves: RIGHT'
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCSHEET'
     C                   EXSR      HDR
     C                   EVAL      GHDR = HDRLN
     C                   EVAL      GTTL = %TRIMR(KSHT) + ': ' + WTITL
     C                   EVAL      GFK1 = GK1
     C                   EVAL      GFK2 = GK2
     C                   ENDSR
      * ---- store what was typed in the grid, then the Contents line ----
     C     TAKEIN        BEGSR
     C                   EVAL      CHG = '0'
     C                   EVAL      OSR = SELR
     C                   EVAL      OSC = SELC
     C     1             DO        112           J
     C                   IF        GC(J) <> DSPV(J)
     C                   EVAL      SELR = TOPR + %DIV(J - 1:8)
     C                   EVAL      SELC = %REM(J - 1:8) + 1
     C                   EVAL      SIDX = (SELR - 1) * 8 + SELC
     C                   EVAL      TX(SIDX) = %TRIM(GC(J))
     C                   EXSR      STORE
     C                   EVAL      CHG = '1'
     C                   EVAL      LSTR = SELR
     C                   EVAL      LSTC = SELC
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      SELR = OSR
     C                   EVAL      SELC = OSC
     C                   EVAL      SIDX = (SELR - 1) * 8 + SELC
     C                   IF        SCONT <> OLDC
     C                   EVAL      TX(SIDX) = %TRIML(SCONT)
     C                   EXSR      STORE
     C                   EVAL      CHG = '1'
     C                   EVAL      LSTR = SELR
     C                   EVAL      LSTC = SELC
     C                   ENDIF
     C                   IF        CHG = '1'
     C                   EXSR      RECALC
     C                   ENDIF
     C                   ENDSR
     C     INVIEW        BEGSR
     C                   IF        SELR < TOPR
     C                   EVAL      TOPR = SELR
     C                   ENDIF
     C                   IF        SELR > TOPR + 13
     C                   EVAL      TOPR = SELR - 13
     C                   ENDIF
     C                   IF        TOPR > 86
     C                   EVAL      TOPR = 86
     C                   ENDIF
     C                   IF        TOPR < 1
     C                   EVAL      TOPR = 1
     C                   ENDIF
     C                   ENDSR
      * ---- bar chart of the numbers in the current column ----
     C     CHART         BEGSR
     C                   EVAL      KLA = *BLANKS
     C                   EVAL      KVA = *BLANKS
     C                   EVAL      KBA = *BLANKS
     C                   EVAL      CNTN = 0
     C                   EVAL      MAXV = 0
     C     1             DO        99            RA
     C                   EVAL      IDX2 = (RA - 1) * 8 + SELC
     C                   IF        ISN(IDX2) = '1' AND CNTN < 15
     C                   EVAL      CNTN = CNTN + 1
     C                   EVAL      KROWS(CNTN) = RA
     C                   IF        %ABS(VAL(IDX2)) > MAXV
     C                   EVAL      MAXV = %ABS(VAL(IDX2))
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C     1             DO        CNTN          K
     C                   EVAL      RA = KROWS(K)
     C                   EVAL      IDX2 = (RA - 1) * 8 + SELC
     C                   EVAL      KL(K) = 'Row ' + %CHAR(RA)
     C                   IF        SELC > 1
     C                   IF        TX((RA - 1) * 8 + 1) <> *BLANKS AND ISN((RA -
     C                             1) * 8 + 1) = '0'
     C                   EVAL      KL(K) = TX((RA - 1) * 8 + 1)
     C                   ENDIF
     C                   ENDIF
     C                   EVAL      IDX = IDX2
     C                   EXSR      FMTC
     C                   EVALR     KV(K) = %TRIM(CELL8)
     C                   EVAL      BLN = 0
     C                   IF        MAXV > 0
     C                   EVAL      BLN = %INT(%ABS(VAL(IDX2)) * 50 / MAXV)
     C                   ENDIF
     C                   IF        BLN = 0 AND VAL(IDX2) <> 0
     C                   EVAL      BLN = 1
     C                   ENDIF
     C                   IF        BLN > 0
     C                   IF        VAL(IDX2) >= 0
     C                   EVAL      KB(K) = %SUBST(HASH50:1:BLN)
     C                   ELSE
     C                   EVAL      KB(K) = %SUBST(DASH50:1:BLN)
     C                   ENDIF
     C                   ENDIF
     C                   ENDDO
     C                   EVAL      KTTL = 'Column ' + %SUBST(COLS:SELC:1) +
     C                             ' of ' + %TRIMR(KSHT) + ': ' + WTITL
     C                   IF        CNTN = 0
     C                   EVAL      KSCL = 'Column ' + %SUBST(COLS:SELC:1) +
     C                             ' has no numbers to chart.'
     C                   ELSE
     C                   EVAL(H)   V2 = MAXV
     C                   EVAL      KSCL = 'The longest bar is ' + %CHAR(V2) +
     C                             '.  Negative numbers are drawn ' + 'with -'
     C                   ENDIF
     C                   EVAL      HDRID = 'OFCCHART'
     C                   EXSR      HDR
     C                   EVAL      KHDR = HDRLN
     C                   EVAL      KFK = 'F1=Help   Press Enter to go ba' +
     C                             'ck to the sheet'
     C                   EXFMT     SCHART
     C                   EVAL      *IN03 = *OFF
     C                   EVAL      *IN12 = *OFF
     C                   ENDSR
     C     PRINTS        BEGSR
     C                   EVAL      PACT = 'O'
     C                   EVAL      PTXT = %TRIMR(KSHT) + ': ' + WTITL
     C                   EXSR      PRT
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = PCOLH
     C                   EXSR      PRT
     C                   EVAL      SHOWM = '0'
     C     1             DO        99            J
     C                   EVAL      RX = J
     C                   EXSR      ROWLN
     C                   IF        ANY = '1'
     C                   EVAL      PACT = 'L'
     C                   EVAL      PTXT = RLINE
     C                   EXSR      PRT
     C                   ENDIF
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

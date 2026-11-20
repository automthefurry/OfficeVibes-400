     H DFTACTGRP(*YES)
      * OVGSET - OfficeVibes/400
     FOVSETUP   IF   E           K DISK
     DPSDS            SDS
     D PGMUSR                254    263
     DPSET             S             40A
     DWOFF             S              5A
     C     *ENTRY        PLIST
     C                   PARM                    PSET
     C                   EVAL      PSET = 'IS08001700      +0000'
     C     PGMUSR        CHAIN     SETREC
     C                   IF        %FOUND(OVSETUP)
     C                   IF        STUNIT = 'M'
     C                   EVAL      %SUBST(PSET:1:1) = 'M'
     C                   ENDIF
     C                   IF        STWEEK = 'M'
     C                   EVAL      %SUBST(PSET:2:1) = 'M'
     C                   ENDIF
     C                   IF        STDBEG > 0 OR STDEND > 0
     C                   EVAL      %SUBST(PSET:3:4) = %EDITC(STDBEG:'X')
     C                   EVAL      %SUBST(PSET:7:4) = %EDITC(STDEND:'X')
     C                   ENDIF
     C                   EVAL      %SUBST(PSET:11:6) = STZONE
     C                   ENDIF
     C                   EVAL      WOFF = *BLANKS
     C                   CALL      'OVTZC'                              50
     C                   PARM                    WOFF
     C                   IF        *IN50 = *OFF AND WOFF <> *BLANKS
     C                   EVAL      %SUBST(PSET:17:5) = WOFF
     C                   ENDIF
     C                   EVAL      *IN50 = *OFF
     C                   RETURN

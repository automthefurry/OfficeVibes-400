     H DFTACTGRP(*YES)
      * OVLOG - OfficeVibes/400
     FOVLOGP    UF A E           K DISK
     DPSDS            SDS
     D PGMUSR                254    263
     DPA1              S             10A
     DPA2              S             10A
     DPA3              S             60A
     C     *ENTRY        PLIST
     C                   PARM                    PA1
     C                   PARM                    PA2
     C                   PARM                    PA3
     C                   TIME                    LGSTMP
     C                   EVAL      LGUSER = PGMUSR
     C                   EVAL      LGAPP = PA1
     C                   EVAL      LGACT = PA2
     C                   EVAL      LGTEXT = PA3
     C                   WRITE     LOGREC
     C                   RETURN

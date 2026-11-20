     H DFTACTGRP(*YES)
      * OVPRT - OfficeVibes/400
     FOVPRTF    O    E             PRINTER OFLIND(*IN90) USROPN
     DPA1              S              1A
     DPA2              S            100A
     C     *ENTRY        PLIST
     C                   PARM                    PA1
     C                   PARM                    PA2
     C                   SELECT
     C                   WHEN      PA1 = 'O'
     C                   IF        NOT %OPEN(OVPRTF)
     C                   OPEN      OVPRTF
     C                   ENDIF
     C                   EVAL      PTITLE = PA2
     C                   WRITE     PHEAD
     C                   WHEN      PA1 = 'L'
     C                   IF        *IN90 = *ON
     C                   WRITE     PHEAD
     C                   EVAL      *IN90 = *OFF
     C                   ENDIF
     C                   EVAL      PTEXT = PA2
     C                   WRITE     PLINE
     C                   WHEN      PA1 = 'C'
     C                   IF        %OPEN(OVPRTF)
     C                   CLOSE     OVPRTF
     C                   ENDIF
     C                   ENDSL
     C                   RETURN

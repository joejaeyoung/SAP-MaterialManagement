
*&---------------------------------------------------------------------*

*& Report ZMM24_001

*&---------------------------------------------------------------------*

*&

*&---------------------------------------------------------------------*




REPORT ZMM24_001.



include
ZMM24_001_CLS
.

include
ZMM24_001_TOP
.

include
ZMM24_001_SCR
.

include
ZMM24_001_F01
. "### ##

include
ZMM24_001_F02
. "### ##

include
ZMM24_001_PBO
.

include
ZMM24_001_PAI
.



INITIALIZATION.



AT SELECTION-SCREEN.



AT SELECTION-SCREEN OUTPUT.

  PERFORM SCREEN_MODIFY. "## ## # ## ##



START-OF-SELECTION.

  PERFORM VALID_SCREEN_INPUT.

  IF RB_CR = 'X'. "## ##

    GV_KTOKK = P_KTOKK.

    GV_BUKRS = P_BUKRS.

    CALL SCREEN 100.

  ELSE. "####

    PERFORM GET_VENDOR_DATA. "### ##

    CALL SCREEN 200.

    "PERFORM DISPLAY_ALV_VENDOR. "ALV ##

  ENDIF.








*Messages

*----------------------------------------------------------

*

* Message class: Hard coded

*   ## ### ######
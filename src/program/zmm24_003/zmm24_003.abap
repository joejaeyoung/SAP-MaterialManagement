
*&---------------------------------------------------------------------*

*& Report ZMM24_003

*&---------------------------------------------------------------------*

*&

*&---------------------------------------------------------------------*




REPORT ZMM24_003.



DATA : GV_SELECTED_MBLNR LIKE ZMKPF24-MBLNR.

DATA : OK_CODE TYPE SY-UCOMM.



include
ZMM24_003_CLS
.

include
ZMM24_003_TOP
.

include
ZMM24_003_SCR
.

include
ZMM24_003_F01
.  "## + ##

include
ZMM24_003_F02
.  "##

include
ZMM24_003_PBO
.

include
ZMM24_003_PAI
.



INITIALIZATION.

  PERFORM SCREEN_INIT.



AT SELECTION-SCREEN.



AT SELECTION-SCREEN OUTPUT.

  PERFORM SCREEN_MODIFY.



START-OF-SELECTION.



  IF RB_CR = 'X'. "## ##

    PERFORM VALID_PO_INPUT. "### VALID ##

    PERFORM GET_PO_ITEMS.

    PERFORM MODIFY_PO_ITEMS.

    PERFORM FILL_HEAER. "## ## ## ## ###

    CALL SCREEN 100.

  ELSE. "## ##

    GY_DYNNR = '0201'.

    PERFORM VALID_GR_INPUT.

    PERFORM GET_GR_DATA.

    PERFORM MODIFY_GR_DATA.

    CALL SCREEN 200.

  ENDIF.








*Messages

*----------------------------------------------------------

*

* Message class: Hard coded

*   ## ## ######
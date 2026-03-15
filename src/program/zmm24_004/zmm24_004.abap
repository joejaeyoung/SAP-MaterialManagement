
*&---------------------------------------------------------------------*

*& Report ZMM24_004

*&---------------------------------------------------------------------*

*&

*&---------------------------------------------------------------------*




REPORT ZMM24_004.



DATA : GV_SELECTED_BELNR LIKE ZRBKP24-BELNR.

DATA : OK_CODE TYPE SY-UCOMM.

include
ZMM24_004_CLS
.

include
ZMM24_004_TOP
.

include
ZMM24_004_SCR
.

include
ZMM24_004_F01
.  "## + ##

include
ZMM24_004_F02
.  "##

include
ZMM24_004_PBO
.

include
ZMM24_004_PAI
.



INITIALIZATION.

  PERFORM SCREEN_INIT.



AT SELECTION-SCREEN OUTPUT.

  PERFORM SCREEN_MODIFY.



START-OF-SELECTION.

  IF RB_CR = 'X'. "## ##

    PERFORM VALID_IR_INPUT_CR. "### VALID ##

    PERFORM GET_DATAS.

    PERFORM MODIFY_DATAS.

    CALL SCREEN 100.

  ELSE. "## ##

    GY_DYNNR = '0210'.

    PERFORM VALID_IR_INPUT_DSP.

    PERFORM GET_IR_DATA.

    CALL SCREEN 200.

  ENDIF.








*Messages

*----------------------------------------------------------

*

* Message class: Hard coded

*   ## ## ######
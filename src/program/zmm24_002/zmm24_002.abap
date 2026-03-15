
*&---------------------------------------------------------------------*

*& Report ZMM24_002

*&---------------------------------------------------------------------*

*&

*&---------------------------------------------------------------------*




REPORT ZMM24_002.



include
ZMM24_002_CLS
.

include
ZMM24_002_TOP
.

include
ZMM24_002_SCR
.

include
ZMM24_002_F01
.

include
ZMM24_002_F02
.

include
ZMM24_002_PBO
.

include
ZMM24_002_PAI
.



INITIALIZATION.



AT SELECTION-SCREEN.



AT SELECTION-SCREEN OUTPUT.

  PERFORM SCREEN_MODIFY.



START-OF-SELECTION.

  PERFORM VALID_SCREEN_INPUT. "### VALID ##



  IF RB_CR = 'X'. "##

    PERFORM VALID_INPUT_DATA.

    PERFORM FILL_VENDOR.        "### ##(##) ###

    CALL SCREEN 100.

  ELSE. "##

    PERFORM GET_PO_DATA.

    PERFORM MODIFY_PO_DATA.

    IF GS_HTABLE IS INITIAL.

      MESSAGE '## ### #### #### ####' TYPE 'E'.

    ENDIF.

    CALL SCREEN 200.

  ENDIF.








*Messages

*----------------------------------------------------------

*

* Message class: Hard coded

*   ## ## # ######
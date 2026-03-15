
*&---------------------------------------------------------------------*

*& Report ZMM24_000

*&---------------------------------------------------------------------*

*&

*&---------------------------------------------------------------------*




REPORT ZMM24_000.



include
ZMM24_000_TOP
.

include
ZMM24_000_SCR
.

include
ZMM24_000_F01
.

include
ZMM24_000_PBO
.

include
ZMM24_000_PAI
.



START-OF-SELECTION.

  PERFORM GET_DATA.

  PERFORM MODIFY_DATA.



  CALL SCREEN 100.

*&---------------------------------------------------------------------*

*&  Include           ZMM24_002_SCR

*&---------------------------------------------------------------------*






SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE TEXT-001.

  "1. ### ## ##

  PARAMETERS : P_BUKRS TYPE BUKRS MODIF ID CR1, "#### (##-##)

               P_LIFNR TYPE LIFNR MODIF ID CR1, "###   (##-##)

               P_BEDAT LIKE ZEKKO24-BEDAT MODIF ID CR1. "###   (##-##)



  "2. ### ## ##

  PARAMETERS : P_LIFNR2 TYPE LIFNR MODIF ID DSP, "#####

               P_BUKRS2 TYPE BUKRS MODIF ID DSP, "####

               P_EBELN TYPE EBELN MODIF ID DSP.  "PO##



  SELECTION-SCREEN SKIP 1. "# # ###



  "2. ## OR ## ##

  PARAMETERS : RB_CR RADIOBUTTON GROUP GRP1 DEFAULT 'X' USER-COMMAND UCOM. "##

  PARAMETERS : RB_DSP RADIOBUTTON GROUP GRP1. "##

SELECTION-SCREEN END OF BLOCK B1.
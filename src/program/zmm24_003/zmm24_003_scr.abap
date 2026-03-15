
*&---------------------------------------------------------------------*

*&  Include           ZMM24_003_SCR

*&---------------------------------------------------------------------*






SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE TEXT-001.

  "1. ### ## ##

  PARAMETERS : P_EBELN LIKE ZMSEG24-EBELN MODIF ID CR1, "####

               P_WERKS LIKE ZMSEG24-WERKS MODIF ID CR1, "###

               P_DATE LIKE SY-DATUM MODIF ID CR1. "#####



  "2. ### ## ##

  PARAMETERS : P_EBELN2 LIKE ZMSEG24-EBELN MODIF ID DSP, "####

               P_WERKS2 TYPE ZMSEG24-WERKS MODIF ID DSP. "###



  SELECTION-SCREEN SKIP 1. "# # ###



  "2. ## OR ## ##

  PARAMETERS : RB_CR RADIOBUTTON GROUP GRP1 DEFAULT 'X' USER-COMMAND UCOM. "##

  PARAMETERS : RB_DSP RADIOBUTTON GROUP GRP1. "##

SELECTION-SCREEN END OF BLOCK B1.

*&---------------------------------------------------------------------*

*&  Include           ZMM24_001_SCR

*&---------------------------------------------------------------------*








SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE TEXT-001.

  PARAMETERS : P_LIFNR TYPE LIFNR MODIF ID DSP, "##### (##-##)

               P_BUKRS TYPE BUKRS,

               P_KTOKK LIKE ZLFA1_24-KTOKK MODIF ID CR1 VALUE CHECK. "##### (##-##)              "####   (##, ##-##)



  SELECTION-SCREEN SKIP 1. "# # ###



  "##

  PARAMETERS : RB_CR RADIOBUTTON GROUP GRP1 DEFAULT 'X' USER-COMMAND UCOM.

  "##

  PARAMETERS : RB_DSP RADIOBUTTON GROUP GRP1.

SELECTION-SCREEN END OF BLOCK B1.
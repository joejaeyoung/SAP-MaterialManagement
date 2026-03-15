
*&---------------------------------------------------------------------*

*&  Include           ZMM24_001_TOP

*&---------------------------------------------------------------------*








TABLES : ZLFA1_24. "#####

TABLES : ZLFB1_24. "#### ###

TABLES : ZLFM1_24. "#### ###



"## ###




*DATA : BEGIN OF GS_LFA1,

*  MANDT LIKE ZLFA1_24-MANDT,  "CLIENT

*  LIFNR LIKE ZLFA1_24-LIFNR,  "#####

*  NAME1 LIKE ZLFA1_24-NAME1,  "####

*  LAND1 LIKE ZLFA1_24-LAND1,  "###

*  STRAS LIKE ZLFA1_24-STRAS,  "##

*  KTOKK LIKE ZLFA1_24-KTOKK,  "## ##

*  STCD1 LIKE ZLFA1_24-STCD1,  "## ##

*  STCD2 LIKE ZLFA1_24-STCD2,  "### ##

*END OF GS_LFA1.




DATA : GS_LFA1 TYPE ZLFA1_24.

DATA : GT_LFA1 LIKE TABLE OF GS_LFA1.






*"#### ###

*DATA : BEGIN OF GS_LFB1,

*  MANDT LIKE ZLFB1_24-MANDT,  "CLIENT

*  LIFNR LIKE ZLFB1_24-LIFNR,  "#####

*  BUKRS LIKE ZLFB1_24-BUKRS,  "####

*  LOEVM LIKE ZLFB1_24-LOEVM,  "#####

*  AKONT LIKE ZLFB1_24-AKONT,  "####

*  ZTERM LIKE ZLFB1_24-ZTERM,  "####

*END OF GS_LFB1.




DATA : GS_LFB1 TYPE ZLFB1_24.

DATA : GT_LFB1 LIKE TABLE OF GS_LFB1.



"#######




*DATA : BEGIN OF GS_LFM1,

*  MANDT LIKE ZLFM1_24-MANDT,  "CLIENT

*  LIFNR LIKE ZLFM1_24-LIFNR,  "#####

*  EKORG LIKE ZLFM1_24-EKORG,  "####

*  EKGRP LIKE ZLFM1_24-EKGRP,  "####

*  LOEVM LIKE ZLFM1_24-LOEVM,  "#####

*  WAERS LIKE ZLFM1_24-WAERS,  "######

*  MWSKZ LIKE ZLFM1_24-MWSKZ,  "####

*END OF GS_LFM1.




DATA : GS_LFM1 TYPE ZLFM1_24.

DATA : GT_LFM1 LIKE TABLE OF GS_LFM1.



"### 100# ##### #### ###

DATA :   GV_LIFNR LIKE ZLFA1_24-LIFNR,  "#####

         GV_NAME1 LIKE ZLFA1_24-NAME1,  "####

         GV_LAND1 LIKE ZLFA1_24-LAND1,  "###

         GV_STRAS LIKE ZLFA1_24-STRAS,  "##

         GV_KTOKK LIKE ZLFA1_24-KTOKK,  "## ##

         GV_STCD1 LIKE ZLFA1_24-STCD1,  "## ##

         GV_STCD2 LIKE ZLFA1_24-STCD2,  "### ##

         GV_BUKRS LIKE ZLFB1_24-BUKRS,  "####

         GV_AKONT LIKE ZLFB1_24-AKONT,  "####

         GV_ZTERM LIKE ZLFB1_24-ZTERM,  "####

         GV_EKORG LIKE ZLFM1_24-EKORG,  "####

         GV_EKGRP LIKE ZLFM1_24-EKGRP,  "####

         GV_LOEVM LIKE ZLFM1_24-LOEVM,  "#####

         GV_WAERS LIKE ZLFM1_24-WAERS,  "######

         GV_MWSKZ LIKE ZLFM1_24-MWSKZ.  "####





" ALV ## ##

DATA: BEGIN OF GS_ALV_OUTPUT,

         LIFNR TYPE ZLFA1_24-LIFNR,    " #####

         NAME1 TYPE ZLFA1_24-NAME1,    " ####

         LAND1 TYPE ZLFA1_24-LAND1,    " ###

         KTOKK TYPE ZLFA1_24-KTOKK,    " #####

         STCD1 TYPE ZLFA1_24-STCD1,    " ####

         STCD2 TYPE ZLFA1_24-STCD2,    " #####

         STRAS TYPE ZLFA1_24-STRAS,    " ##

         BUKRS TYPE ZLFB1_24-BUKRS,    " ####

         AKONT TYPE ZLFB1_24-AKONT,    " ####

         ZTERM TYPE ZLFB1_24-ZTERM,    " ####

         EKORG TYPE ZLFM1_24-EKORG,    " ####

         EKGRP TYPE ZLFM1_24-EKGRP,    " ####

         WAERS TYPE ZLFM1_24-WAERS,    " ##

         MWSKZ TYPE ZLFM1_24-MWSKZ,    " ####

         COLOR TYPE LVC_T_SCOL,    " # ## (##### ## ###)

       END OF GS_ALV_OUTPUT.

DATA: GT_ALV_OUTPUT LIKE TABLE OF GS_ALV_OUTPUT.



" ALV ## (## ###)

DATA : GS_FC TYPE LVC_S_FCAT,

       GT_FC TYPE LVC_T_FCAT.

DATA : GS_LAYOUT TYPE LVC_S_LAYO.

DATA : GC_DOCKING TYPE REF TO CL_GUI_DOCKING_CONTAINER.

DATA : GC_GRID TYPE REF TO CL_GUI_ALV_GRID.





"## ## ###

DATA : GV_INPUT_MODE TYPE C. "## ## ##



" ## ##

DATA: gt_exclude   TYPE ui_functions.



" ## ## ##

DATA: gv_modified  TYPE abap_bool.



" ## ### ##

DATA : OK_CODE TYPE SY-UCOMM.



" ## ### ##

DATA : GO_EVENT TYPE REF TO EVENT.
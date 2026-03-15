
*&---------------------------------------------------------------------*

*&  Include           ZMM24_000_TOP

*&---------------------------------------------------------------------*






TABLES : ZMARA24.



"##### ### ##

DATA : BEGIN OF GS_MARA.

  include structure
ZMARA24
.

DATA : END OF GS_MARA.

DATA : GT_MARA LIKE TABLE OF GS_MARA.



"## # ### ##

DATA : BEGIN OF GS_OUTPUT,

  WERKS LIKE ZMARA24-WERKS,       "###

  WERKSNAME TYPE C LENGTH 4,   "### #

  ZMATNR LIKE ZMARA24-ZMATNR,     "####

  ZMATNAME LIKE ZMARA24-ZMATNAME, "###

  LGORT LIKE ZMARA24-LGORT,       "####

  LGORTNAME TYPE C LENGTH 5,   "###

  MTART LIKE ZMARA24-MTART,       "####

  MTARTNAME TYPE C LENGTH 5,   "#####

  STPRS LIKE ZMARA24-STPRS,       "##

  WAERS LIKE ZMARA24-WAERS,       "##

  MENGE LIKE ZMARA24-MENGE,       "##

  MEINS LIKE ZMARA24-MEINS,       "##

  END OF GS_OUTPUT.

DATA : GT_OUTPUT LIKE TABLE OF GS_OUTPUT.



"## ## ##

DATA : GS_FC TYPE LVC_S_FCAT, "## ####

       GT_FC TYPE LVC_T_FCAT,

       GS_LAYOUT TYPE LVC_S_LAYO, "####

       GS_SORT TYPE LVC_S_SORT, "##

       GT_SORT TYPE LVC_T_SORT,

       GC_DOCKING TYPE REF TO CL_GUI_DOCKING_CONTAINER, "DOCKING

       GC_GRID TYPE REF TO CL_GUI_ALV_GRID. "GRID



"OK_CODE

DATA : OK_CODE TYPE SY-UCOMM.
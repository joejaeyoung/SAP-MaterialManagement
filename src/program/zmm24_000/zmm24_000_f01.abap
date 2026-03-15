
*&---------------------------------------------------------------------*

*&  Include           ZMM24_000_F01

*&---------------------------------------------------------------------*



*&---------------------------------------------------------------------*

*&      Form  GET_DATA

*&---------------------------------------------------------------------*

*       ZMARA24## ### ####

*----------------------------------------------------------------------*




FORM GET_DATA .

  SELECT * FROM ZMARA24

    INTO CORRESPONDING FIELDS OF TABLE GT_MARA

    WHERE WERKS IN S_WERKS  "###

      AND ZMATNR IN S_MATNR  "####

      AND LGORT IN S_LGORT  "####

      AND MTART IN S_MTART. "####

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  MODIFY_DATA

*&---------------------------------------------------------------------*

*       GT_MARA ### #### (## -> ## ##)

*----------------------------------------------------------------------*




FORM MODIFY_DATA .

  CLEAR : GS_OUTPUT, GT_OUTPUT, GS_MARA.



  DATA : LV_WERKSNAME LIKE GS_OUTPUT-WERKSNAME, "1. ####

         LV_LGORTNAME LIKE GS_OUTPUT-LGORTNAME, "2. ###

         LV_MTARTNAME LIKE GS_OUTPUT-MTARTNAME. "3. #####





  LOOP AT GT_MARA INTO GS_MARA.

    MOVE-CORRESPONDING GS_MARA TO GS_OUTPUT.



    "1. ### -> ### #

    PERFORM CV_WERKS USING GS_MARA-WERKS CHANGING LV_WERKSNAME.

    GS_OUTPUT-WERKSNAME = LV_WERKSNAME.



    "2. #### -> ###

    PERFORM CV_LGORT USING GS_MARA-LGORT CHANGING LV_LGORTNAME.

    GS_OUTPUT-LGORTNAME = LV_WERKSNAME.



    "3. #### -> #####

    PERFORM CV_MTART USING GS_MARA-MTART CHANGING LV_MTARTNAME.

    GS_OUTPUT-MTARTNAME = LV_MTARTNAME.



    APPEND GS_OUTPUT TO GT_OUTPUT.

  ENDLOOP.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CV_WERKS

*&---------------------------------------------------------------------*

*       1. ### -> ### #

*----------------------------------------------------------------------*




FORM CV_WERKS  USING    P_WERKS

               CHANGING P_WERKSNAME.



  CASE P_WERKS.

    WHEN '1000'.

      P_WERKSNAME = '####'.

    WHEN '1100'.

      P_WERKSNAME = '####'.

    WHEN '1200'.

      P_WERKSNAME = '####'.

    WHEN '1300'.

      P_WERKSNAME = '####'.

  ENDCASE.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CV_LGORT

*&---------------------------------------------------------------------*

*       2. #### -> ###

*----------------------------------------------------------------------*




FORM CV_LGORT  USING    P_LGORT

               CHANGING P_LGORTNAME.

  CASE P_LGORT.

    WHEN '1000'.

      P_LGORTNAME = '####'.

    WHEN '2000'.

      P_LGORTNAME = '####'.

    WHEN '3000'.

      P_LGORTNAME = '####'.

  ENDCASE.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CV_MTART

*&---------------------------------------------------------------------*

*       3. #### -> #####

*----------------------------------------------------------------------*




FORM CV_MTART  USING    P_MTART

               CHANGING P_MTARTNAME.

  CASE P_MTART.

    WHEN 'Z001'.

      P_MTARTNAME = '##'.

    WHEN 'Z002'.

      P_MTARTNAME = '###'.

    WHEN 'Z003'.

      P_MTARTNAME = '##'.

    WHEN 'Z004'.

      P_MTARTNAME = '###'.

    WHEN 'Z005'.

      P_MTARTNAME = '###'.

    WHEN 'Z006'.

      P_MTARTNAME = '###'.

  ENDCASE.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CREATE_OBJECT

*&---------------------------------------------------------------------*

*       GC_DOCKING, GC_GRID ##

*----------------------------------------------------------------------*




FORM CREATE_OBJECT .

  CREATE OBJECT GC_DOCKING

    EXPORTING

      REPID = SY-REPID

      DYNNR = SY-DYNNR

      EXTENSION = 2000

      NAME = '##### ###'.



  CREATE OBJECT GC_GRID

    EXPORTING

      I_PARENT = GC_DOCKING.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  FIELD_CATALOG

*&---------------------------------------------------------------------*

*       ###### ##

*----------------------------------------------------------------------*




FORM FIELD_CATALOG .

  CLEAR : GS_FC, GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 1.

  GS_FC-FIELDNAME = 'WERKS'.

  GS_FC-COLTEXT = '###'.

  GS_FC-KEY = 'X'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 2.

  GS_FC-FIELDNAME = 'WERKSNAME'.

  GS_FC-COLTEXT = '####'.

  GS_FC-KEY = 'X'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 3.

  GS_FC-FIELDNAME = 'ZMATNR'.

  GS_FC-COLTEXT = '####'.

  GS_FC-KEY = 'X'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 4.

  GS_FC-FIELDNAME = 'ZMATNAME'.

  GS_FC-COLTEXT = '###'.

  GS_FC-KEY = 'X'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 5.

  GS_FC-FIELDNAME = 'LGORT'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 6.

  GS_FC-FIELDNAME = 'LGORTNAME'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 7.

  GS_FC-FIELDNAME = 'MTART'.

  GS_FC-COLTEXT = '#####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 8.

  GS_FC-FIELDNAME = 'MTARTNAME'.

  GS_FC-COLTEXT = '#####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 9.

  GS_FC-FIELDNAME = 'STPRS'.

  GS_FC-COLTEXT = '##'.

  GS_FC-DO_SUM = 'X'.

  GS_FC-CFIELDNAME = 'WAERS'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 10.

  GS_FC-FIELDNAME = 'WAERS'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 11.

  GS_FC-FIELDNAME = 'MENGE'.

  GS_FC-COLTEXT = '##'.

  GS_FC-QFIELDNAME = 'MEINS'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 12.

  GS_FC-FIELDNAME = 'MEINS'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  ALV_LAYOUT

*&---------------------------------------------------------------------*

*       ALV #### ##

*----------------------------------------------------------------------*




FORM ALV_LAYOUT .

  GS_LAYOUT-ZEBRA = 'X'.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  ALV_SORT

*&---------------------------------------------------------------------*

*       ALV ##

*----------------------------------------------------------------------*




FORM ALV_SORT .

    CLEAR GS_SORT.

    GS_SORT-SPOS = 1.

    GS_SORT-FIELDNAME = 'WERKS'.

    GS_SORT-UP = 'X'.

    GS_SORT-SUBTOT = 'X'.

    APPEND GS_SORT TO GT_SORT.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CALL_ALV

*&---------------------------------------------------------------------*

*       ALV ## ##

*----------------------------------------------------------------------*




FORM CALL_ALV .

  CALL METHOD GC_GRID->SET_TABLE_FOR_FIRST_DISPLAY

    EXPORTING

      IS_LAYOUT = GS_LAYOUT

    CHANGING

      IT_OUTTAB = GT_OUTPUT

      IT_FIELDCATALOG = GT_FC

      IT_SORT = GT_SORT.

ENDFORM.
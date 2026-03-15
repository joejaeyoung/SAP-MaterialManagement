
*&---------------------------------------------------------------------*

*&  Include           ZMM24_002_F02

*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*

*&      Form  GET_VENDOR_DATA

*&---------------------------------------------------------------------*

*       ## ### ## #### ####.

*----------------------------------------------------------------------*




FORM GET_PO_DATA .

  "1.ZEKKO24# ## ## ## ###

  SELECT SINGLE * FROM ZEKKO24

    INTO CORRESPONDING FIELDS OF GS_HTABLE

    WHERE LIFNR = P_LIFNR2  "#####

      AND BUKRS = P_BUKRS2  "####

      AND EBELN = P_EBELN.  "PO##



  IF GS_HTABLE IS INITIAL.

    MESSAGE '### ## ## ### #### ####.' TYPE 'I'.

    STOP.

  ENDIF.



  "2.ZEKPO24# ## ### ## ###

  SELECT * FROM ZEKPO24

    INTO CORRESPONDING FIELDS OF TABLE GT_ITABLE

    WHERE EBELN = P_EBELN.  "PO##



  IF GT_ITABLE IS INITIAL.

    MESSAGE '### ## ## #### #### ####.' TYPE 'I'.

    STOP.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  MODIFY_PO_DATA

*&---------------------------------------------------------------------*

*       ## ### ## #### ####.

*----------------------------------------------------------------------*




FORM MODIFY_PO_DATA .

  "1. HEADER #### ##

  MOVE-CORRESPONDING GS_HTABLE TO GS_HTABLE.



  "2. ITEM #### ##

  LOOP AT GT_ITABLE INTO GS_ITABLE.

    MOVE-CORRESPONDING GS_ITABLE TO GS_ITEM.

    GS_ITEM-WAERS = GS_HTABLE-WAERS.

    APPEND GS_ITEM TO GT_ITEM.

  ENDLOOP.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CREATE_OBJECT_200

*&---------------------------------------------------------------------*

*       GC_DOCKING_200, GC_GRID_200 ##

*----------------------------------------------------------------------*




FORM CREATE_OBJECT_200 .

  CREATE OBJECT GC_DOCKING

    EXPORTING

      REPID = SY-REPID

      DYNNR = SY-DYNNR

      EXTENSION = 2000

      NAME = '#### ###'.



  CREATE OBJECT GC_GRID

    EXPORTING

      I_PARENT = GC_DOCKING.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  FIELD_CATALOG_200

*&---------------------------------------------------------------------*

*       ## ###### ##

*----------------------------------------------------------------------*




FORM FIELD_CATALOG_200 .

  CLEAR : GS_FC, GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 1.

  GS_FC-FIELDNAME = 'EBELP'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 2.

  GS_FC-FIELDNAME = 'MATNR'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 3.

  GS_FC-FIELDNAME = 'MAKTX'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 4.

  GS_FC-FIELDNAME = 'MENGE'.

  GS_FC-COLTEXT = 'PO##'.

  GS_FC-QFIELDNAME = 'MEINS'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 5.

  GS_FC-FIELDNAME = 'STPRS'.

  GS_FC-COLTEXT = '##'.

  GS_FC-CFIELDNAME = 'WAERS'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 6.

  GS_FC-FIELDNAME = 'MEINS'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 7.

  GS_FC-FIELDNAME = 'WAERS'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 8.

  GS_FC-FIELDNAME = 'MWSKZ'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 9.

  GS_FC-FIELDNAME = 'PRDAT'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 10.

  GS_FC-FIELDNAME = 'WERKS'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 11.

  GS_FC-FIELDNAME = 'LGORT'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  ALV_LAYOUT_200

*&---------------------------------------------------------------------*

*       #### ##

*----------------------------------------------------------------------*




FORM ALV_LAYOUT_200 .



ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CALL_ALV_200

*&---------------------------------------------------------------------*

*       ## ##

*----------------------------------------------------------------------*




FORM CALL_ALV_200 .

  CALL METHOD GC_GRID->SET_TABLE_FOR_FIRST_DISPLAY

    CHANGING

      IT_OUTTAB = GT_ITEM

      IT_FIELDCATALOG = GT_FC.

ENDFORM.
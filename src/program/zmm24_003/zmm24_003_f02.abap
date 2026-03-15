
*&---------------------------------------------------------------------*

*&  Include           ZMM24_003_F02

*&---------------------------------------------------------------------*



*&---------------------------------------------------------------------*

*&      Form  VALID_GR_INPUT

*&---------------------------------------------------------------------*

*       ## ### VALID ##

*----------------------------------------------------------------------*




FORM VALID_GR_INPUT .

  IF P_EBELN2 IS INITIAL OR P_WERKS2 IS INITIAL.

    MESSAGE '#### ## ######' TYPE 'I'.

    STOP.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  GET_GR_DATA

*&---------------------------------------------------------------------*

*       ## ## ### ####

*----------------------------------------------------------------------*




FORM GET_GR_DATA .

  CLEAR : GS_MKPF, GS_MSEG, GT_MSEG.



  "1. GR ## ## ### ####

  SELECT * FROM ZMKPF24

    INTO CORRESPONDING FIELDS OF TABLE GT_MKPF

    WHERE EBELN = P_EBELN2

      AND WERKS = P_WERKS2.



  "2. GR ## ### ### ####

  SELECT * FROM ZMSEG24

    INTO CORRESPONDING FIELDS OF TABLE GT_MSEG

    WHERE EBELN = P_EBELN2  "######

      AND WERKS = P_WERKS2. "#####



  IF SY-SUBRC <> 0.

    MESSAGE '### ## #### #### ####.' TYPE 'I'.

    STOP.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  MODIFY_GR_DATA

*&---------------------------------------------------------------------*

*       ## ## ### ##

*----------------------------------------------------------------------*




FORM MODIFY_GR_DATA .



ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  BTN_DEL

*&---------------------------------------------------------------------*

*       ## ##

*----------------------------------------------------------------------*




FORM BTN_DEL .

  "### # ##

  DATA : LT_ROWS TYPE LVC_T_ROW,

         LS_ROW TYPE LVC_S_ROW.

  DATA : LV_ANSWER TYPE C.





  "1. ### ROW INDEX ####

  CALL METHOD GC_GRID_201->GET_SELECTED_ROWS

    IMPORTING

      ET_INDEX_ROWS = LT_ROWS.



  "2. ### # ### ## ### ##

  IF LT_ROWS IS INITIAL.

    MESSAGE '### ## #####.' TYPE 'S'.

    RETURN.

  ENDIF.



  "2-1. ## ## ##

  PERFORM POPUP_TO_CONFIRM CHANGING LV_ANSWER.

  IF LV_ANSWER <> '1'.

    RETURN.

  ENDIF.





  "3. ### ## # ##

  LOOP AT LT_ROWS INTO LS_ROW.



    "PO## ## ## ##

    "3-1. GT_MSEG## ### ####

    READ TABLE GT_MSEG INTO GS_MSEG INDEX LS_ROW-INDEX.



    IF GS_MSEG-BWART = '102'.

      CONTINUE.

    ENDIF.



    "3-2. PO## ## ## ##

    UPDATE ZEKPO24

       SET WEMNG = WEMNG - GS_MSEG-MENGE

       WHERE EBELN = GS_MSEG-EBELN  "###### ##

         AND EBELP = GS_MSEG-ZEILE. "##



    "3-3. ZMSEG24## #### ##

    UPDATE ZMSEG24

       SET BWART = 102

       WHERE MBLNR = GS_MSEG-MBLNR

         AND MJAHR = GS_MSEG-MJAHR

         AND ZEILE = GS_MSEG-ZEILE.




*

*    "3-4. GT_MSEG## ##

*    DELETE GT_MSEG INDEX LS_ROW-INDEX.




  ENDLOOP.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  MAKE_FIELDCATALOG_201

*&---------------------------------------------------------------------*

*       SUBSCREEN ALV### ######

*----------------------------------------------------------------------*




FORM MAKE_FIELDCATALOG_201 .

  CLEAR : GS_FC, GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 1.

  GS_FC-FIELDNAME = 'BWART'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 2.

  GS_FC-FIELDNAME = 'MATNR'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 3.

  GS_FC-FIELDNAME = 'WERKS'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 4.

  GS_FC-FIELDNAME = 'LGORT'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 5.

  GS_FC-FIELDNAME = 'LIFNR'.

  GS_FC-COLTEXT = '#####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 6.

  GS_FC-FIELDNAME = 'WAERS'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 7.

  GS_FC-FIELDNAME = 'MENGE'.

  GS_FC-COLTEXT = '##'.

  GS_FC-QFIELDNAME = 'MEINS'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 8.

  GS_FC-FIELDNAME = 'MEINS'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 9.

  GS_FC-FIELDNAME = 'EBELN'.

  GS_FC-COLTEXT = '########'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 10.

  GS_FC-FIELDNAME = 'BUKRS'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.

ENDFORM.




*&---------------------------------------------------------------------*

*&      Form  REFRESH2

*&---------------------------------------------------------------------*

*       200# ## ####

*----------------------------------------------------------------------*




FORM REFRESH2 .

  DATA : LS_STABLE TYPE LVC_S_STBL.



  "### ### #

  LS_STABLE-ROW = 'X'.

  LS_STABLE-COL = 'X'.



  "## ##

  CALL METHOD GC_GRID_201->REFRESH_TABLE_DISPLAY

    EXPORTING

      IS_STABLE = LS_STABLE.



  IF SY-SUBRC <> 0.

  ENDIF.



ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  REFRESH_SCREEN

*&---------------------------------------------------------------------*

*       GR## ## ### ## ### ##

*----------------------------------------------------------------------*




FORM REFRESH_SCREEN .

  IF GV_SELECTED_MBLNR IS INITIAL OR GV_SELECTED_MBLNR = 'ROOT'.

    RETURN.

  ENDIF.



  "2. ## ### ##

  SELECT SINGLE * FROM ZMKPF24

    INTO CORRESPONDING FIELDS OF GS_MKPF

    WHERE MBLNR = GV_SELECTED_MBLNR.



  "3. ### ### ##

  SELECT * FROM ZMSEG24

    INTO CORRESPONDING FIELDS OF TABLE GT_MSEG

    WHERE MBLNR = GV_SELECTED_MBLNR.



  CLEAR OK_CODE.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  BUILD_TREE_NODES

*&---------------------------------------------------------------------*

*       #### ## ####

*----------------------------------------------------------------------*




FORM BUILD_TREE_NODES .

  DATA : LT_MKPF TYPE TABLE OF ZMKPF24,

         LS_MKPF TYPE ZMKPF24.



  DATA: GT_NODES TYPE TABLE OF MTREESNODE, "## ## ###

        LS_NODE  TYPE MTREESNODE.          "## ## ## (LS_NODE)



  DATA : LV_DATE_CHAR TYPE C LENGTH 10.



  "1. ## ## ## ##

  SELECT MBLNR BUDAT

    INTO CORRESPONDING FIELDS OF TABLE LT_MKPF

    FROM ZMKPF24

    WHERE EBELN = P_EBELN2

      AND WERKS = P_WERKS2

    ORDER BY MBLNR DESCENDING.



  "2. ## ## ##

  CLEAR LS_NODE.

  LS_NODE-NODE_KEY  = 'ROOT'.

  LS_NODE-ISFOLDER  = 'X'.         "## ##

  LS_NODE-TEXT      = '## ## ##'. "### ## ##

  LS_NODE-RELATKEY  = space.       "##### ## ##

  APPEND ls_node TO gt_nodes.



  "3. ## ## #### ## ### ##

  LOOP AT LT_MKPF INTO LS_MKPF.

    LS_NODE-NODE_KEY = LS_MKPF-MBLNR. "## ## ##### ### ### ## # ## ##

    LS_NODE-RELATKEY = 'ROOT'.

    LS_NODE-RELATSHIP = CL_GUI_SIMPLE_TREE=>RELAT_LAST_CHILD. "### ## ### ## ##

    LS_NODE-ISFOLDER = SPACE.  "### ## #(Leaf) ##

    LS_NODE-N_IMAGE = ICON_DOCUMENT.  "### ## (## ##)



    "### ## ### (#: '50000001 (2025.05.09)')

    WRITE LS_MKPF-BUDAT TO LV_DATE_CHAR.

    CONCATENATE LS_MKPF-MBLNR '(' LV_DATE_CHAR ')'

           INTO LS_NODE-TEXT SEPARATED BY SPACE.



    APPEND LS_NODE TO GT_NODES.

  ENDLOOP.



  "4. ### ### ## (### ##)

  CALL METHOD GO_TREE->ADD_NODES

    EXPORTING

      TABLE_STRUCTURE_NAME = 'MTREESNODE'

      NODE_TABLE           = GT_NODES

    EXCEPTIONS

      ERROR_IN_NODE_TABLE  = 1

      OTHERS               = 2.



  " 5. ## ## #### (#### ## # # ##)

  CALL METHOD GO_TREE->EXPAND_NODE

    EXPORTING

      NODE_KEY = 'ROOT'.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  POOPUP_TO_CONFIRM

*&---------------------------------------------------------------------*

*       #### ## ##

*----------------------------------------------------------------------*




FORM POPUP_TO_CONFIRM  CHANGING P_ANSWER.

  CALL FUNCTION 'POPUP_TO_CONFIRM'

    EXPORTING

      TITLEBAR = '## ##'

      TEXT_QUESTION = '########? ## ### ## ## ### #### ####.'

      TEXT_BUTTON_1 = '#'

      TEXT_BUTTON_2 = '###'

      DISPLAY_CANCEL_BUTTON = ' '

    IMPORTING

      ANSWER = P_ANSWER.

ENDFORM.
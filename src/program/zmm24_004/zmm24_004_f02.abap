
*&---------------------------------------------------------------------*

*&  Include           ZMM24_004_F02

*&---------------------------------------------------------------------*



*&---------------------------------------------------------------------*

*&      Form  VALID_IR_INPUT_DSP

*&---------------------------------------------------------------------*

*       #### ### ##

*----------------------------------------------------------------------*




FORM VALID_IR_INPUT_DSP .

  DATA : LV_EBELN LIKE ZRBKP24-EBELN,

         LV_WERKS LIKE ZRBKP24-WERKS.



  IF P_EBELN2 IS INITIAL

    OR P_WERKS2 IS INITIAL.

    MESSAGE '## ## ######' TYPE 'I'.

    STOP.

  ENDIF.



  "1. ## ### #### ###### ##

  SELECT SINGLE EBELN FROM ZRBKP24

    INTO LV_EBELN

    WHERE EBELN = P_EBELN2

      AND WERKS = P_WERKS2.



  IF SY-SUBRC <> 0.

    MESSAGE '## ### #### ## ### ####' TYPE 'I'.

    STOP.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  GET_IR_DATA

*&---------------------------------------------------------------------*

*       #### #######

*----------------------------------------------------------------------*




FORM GET_IR_DATA .

  CLEAR : GT_RBKP, GT_RSEG.



  "1. ##

  SELECT * FROM ZRBKP24

    INTO CORRESPONDING FIELDS OF TABLE GT_RBKP

    WHERE EBELN = P_EBELN2

      AND WERKS = P_WERKS2.



  "2. ###

  SELECT * FROM ZRSEG24

    INTO CORRESPONDING FIELDS OF TABLE GT_RSEG

    WHERE EBELN = P_EBELN2

      AND WERKS = P_WERKS2.



  LOOP AT GT_RSEG INTO GS_RSEG.

    IF GS_RSEG-LOEKZ = 'X'.

      GS_RSEG-STATUS_ICON = ICON_LED_RED.

    ELSE.

      GS_RSEG-STATUS_ICON = ICON_LED_GREEN.

    ENDIF.



    MODIFY GT_RSEG FROM GS_RSEG.

  ENDLOOP.



  IF SY-SUBRC <> 0.

    MESSAGE '### ## #### #### ####.' TYPE 'I'.

    STOP.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  BUILD_TREE_NODES

*&---------------------------------------------------------------------*

*       #### ## ####

*----------------------------------------------------------------------*




FORM BUILD_TREE_NODES .

  "## ## ## ##

  DATA: GT_NODES TYPE TABLE OF MTREESNODE, "## ## ###

        LS_NODE  TYPE MTREESNODE,          "## ## ## (LS_NODE)

        LS_EXPAND_NODE TYPE MTREESNODE.



  "DB ### ##

  DATA : LT_RBKP TYPE TABLE OF ZRBKP24,

         LS_RBKP TYPE ZRBKP24.



  DATA : LV_DATE_CHAR TYPE C LENGTH 10.



  "1. ## PO# ### ## ## (## + ##) ##

  SELECT * FROM ZRBKP24

    INTO TABLE LT_RBKP

    WHERE EBELN = P_EBELN2

      AND WERKS = P_WERKS2

    ORDER BY BELNR ASCENDING.



  "2. ## ## ##

  CLEAR LS_NODE.

  LS_NODE-NODE_KEY  = 'ROOT'.

  LS_NODE-ISFOLDER  = 'X'.         "## ##

  LS_NODE-TEXT      = '## ## ##'. "### ## ##

  LS_NODE-RELATKEY  = SPACE.       "##### ## ##

  APPEND LS_NODE TO GT_NODES.



  "3. ## ## #### ## ### ##

  LOOP AT LT_RBKP INTO LS_RBKP.

    CLEAR LS_NODE.



    LS_NODE-NODE_KEY = LS_RBKP-BELNR. "## ## ##### ### ### ## # ## ##



    "3-1. ## ## ##

    IF LS_RBKP-XBLNR IS INITIAL.

      "## ##

      LS_NODE-RELATKEY = 'ROOT'.

      LS_NODE-ISFOLDER = 'X'.

      LS_NODE-N_IMAGE = ICON_INCOMING_OBJECT.

      LS_NODE-EXP_IMAGE = ICON_INCOMING_OBJECT.

    ELSE.

      "## ##

      LS_NODE-RELATKEY = LS_RBKP-XBLNR.

      LS_NODE-ISFOLDER = SPACE.

      LS_NODE-N_IMAGE = ICON_CANCEL.

    ENDIF.



    "### ## ### (#: '50000001 (2025.05.09)')

    WRITE LS_RBKP-BUDAT TO LV_DATE_CHAR.

    CONCATENATE LS_RBKP-BELNR '(' LV_DATE_CHAR ')'

           INTO LS_NODE-TEXT SEPARATED BY SPACE.



    APPEND LS_NODE TO GT_NODES.

  ENDLOOP.



  "4. ### ### ## (### ##)

  CALL METHOD GO_TREE->DELETE_ALL_NODES.



  CALL METHOD GO_TREE->ADD_NODES

    EXPORTING

      TABLE_STRUCTURE_NAME = 'MTREESNODE'

      NODE_TABLE           = GT_NODES

    EXCEPTIONS

      ERROR_IN_NODE_TABLE  = 1

      OTHERS               = 2.



  "5. ## ## #### (#### ## # # ##)

  LOOP AT GT_NODES INTO LS_EXPAND_NODE WHERE ISFOLDER = 'X'.

    CALL METHOD GO_TREE->EXPAND_NODE

      EXPORTING

        NODE_KEY = LS_EXPAND_NODE-NODE_KEY.

  ENDLOOP.

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

  CALL METHOD GC_GRID_210->REFRESH_TABLE_DISPLAY

    EXPORTING

      IS_STABLE = LS_STABLE.



  IF SY-SUBRC <> 0.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  MAKE_FIELDCATALOG_210

*&---------------------------------------------------------------------*

*       SUBSCREEN ALV### ######

*----------------------------------------------------------------------*




FORM MAKE_FIELDCATALOG_210 .

  CLEAR : GS_FC, GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 0.

  GS_FC-FIELDNAME = 'STATUS_ICON'.

  GS_FC-COLTEXT = '## ###'.

  GS_FC-ICON = 'X'.

  GS_FC-JUST = 'C'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 1.

  GS_FC-FIELDNAME = 'BUZEI'.

  GS_FC-COLTEXT = '#### ##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 2.

  GS_FC-FIELDNAME = 'MATNR'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 3.

  GS_FC-FIELDNAME = 'TXZ01'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 4.

  GS_FC-FIELDNAME = 'WERKS'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



 CLEAR GS_FC.

  GS_FC-COL_POS = 5.

  GS_FC-FIELDNAME = 'WRBTR'.

  GS_FC-COLTEXT = '####'.

  GS_FC-CFIELDNAME = 'WAERS'. " WAERS# ##### ### WAERS# ##### ### #

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 6.

  GS_FC-FIELDNAME = 'MENGE'.

  GS_FC-COLTEXT = '##'.

  GS_FC-QFIELDNAME = 'BSTME'. " BSTME# ##

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 7.

  GS_FC-FIELDNAME = 'BSTME'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 8.

  GS_FC-FIELDNAME = 'MWSKZ'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 9.

  GS_FC-FIELDNAME = 'WMWST'.

  GS_FC-COLTEXT = '##'.

  GS_FC-CFIELDNAME = 'WAERS'. " WAERS ##

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 10.

  GS_FC-FIELDNAME = 'SGTXT'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 11.

  GS_FC-FIELDNAME = 'WAERS'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  BTN_DEL

*&---------------------------------------------------------------------*

*       ## ##

*----------------------------------------------------------------------*




FORM BTN_DEL .

  "ALV ## ##

  DATA : LT_ROWS TYPE LVC_T_ROW,

         LS_ROW TYPE LVC_S_ROW.

  DATA : LV_ANSWER TYPE C.



  "### ## ##

  DATA : LV_ORIGIN_BELNR TYPE ZRBKP24-BELNR, "## ## ##

         LV_ORIGIN_GJAHR TYPE ZRBKP24-GJAHR. "## ##



  "DB ##

  DATA : LV_NEXT_BELNR TYPE ZRBKP24-BELNR, "### ## ##

         LV_MAX LIKE ZRBKP24-BELNR,

         LS_NEW_HEADER TYPE ZRBKP24, "# ## (###)

         LS_NEW_ITEM TYPE ZRSEG24. "# ### (###)



  "## ##

  DATA : LV_SUM_CANCELED TYPE ZRSEG24-MENGE, "## ### ## ##

         LV_REMAIN_QTY TYPE ZRSEG24-MENGE. "## ##



  "1. ### ROW####

  CALL METHOD GC_GRID_210->GET_SELECTED_ROWS

    IMPORTING

      ET_INDEX_ROWS = LT_ROWS.



  IF LT_ROWS IS INITIAL.

    MESSAGE '### ## ### #####' TYPE 'I'.

    EXIT.

  ENDIF.



  "2. ## ##

  PERFORM POPUP_TO_CONFIRM CHANGING LV_ANSWER.

  IF LV_ANSWER <> '1'.

    RETURN.

  ENDIF.



  "3. ## ### ### ##

  LOOP AT LT_ROWS INTO LS_ROW.

    READ TABLE GT_RSEG INTO GS_RSEG INDEX LS_ROW-INDEX.



    CLEAR : LV_SUM_CANCELED, LV_REMAIN_QTY.



    "## (BELNR)# ##(XBLNR)# ### ## ## ## ### ## ##

    SELECT SUM( MENGE ) INTO LV_SUM_CANCELED

      FROM ZRSEG24 AS ITEM

      JOIN ZRBKP24 AS HEAD ON ITEM~BELNR = HEAD~BELNR

                          AND ITEM~GJAHR = HEAD~GJAHR

      WHERE HEAD~XBLNR = GS_RSEG-BELNR  "## ## ##

        AND ITEM~EBELN = GS_RSEG-EBELN  "## PO##

        AND ITEM~EBELP = GS_RSEG-EBELP. "## PO##



    LV_REMAIN_QTY = GS_RSEG-MENGE + LV_SUM_CANCELED.

    IF LV_REMAIN_QTY <= 0.

      MESSAGE '### ### ## ## ### ### ########' TYPE 'E'.

    ENDIF.

    LV_ORIGIN_BELNR = GS_RSEG-BELNR.

  ENDLOOP.



  "4. ## ## ## ##

  "4-1. ## ## 51...

  SELECT MAX( BELNR ) INTO LV_NEXT_BELNR

    FROM ZRBKP24

    WHERE BELNR >= '5100000000'.



   IF LV_NEXT_BELNR <> 0.

     LV_NEXT_BELNR = LV_NEXT_BELNR + 1.

   ELSE.

     LV_NEXT_BELNR = '5100000000'.

   ENDIF.



  "4-2. ## ### ##

  CLEAR LS_NEW_HEADER.

  SELECT SINGLE * FROM ZRBKP24 INTO LS_NEW_HEADER

    WHERE BELNR = LV_ORIGIN_BELNR.

  LS_NEW_HEADER-BELNR = LV_NEXT_BELNR.

  LS_NEW_HEADER-GJAHR = SY-DATUM(4).

  LS_NEW_HEADER-BLART = 'KG'. "## ## (##)

  LS_NEW_HEADER-BUDAT = SY-DATUM.

  LS_NEW_HEADER-XBLNR = LV_ORIGIN_BELNR. "## ## ##

  LS_NEW_HEADER-WERKS = GS_RSEG-WERKS.



  "4-3. ## DB# ##

  INSERT ZRBKP24 FROM LS_NEW_HEADER.



  "5. ## ### ##

  LOOP AT LT_ROWS INTO LS_ROW.

    READ TABLE GT_RSEG INTO GS_RSEG INDEX LS_ROW-INDEX.



    "5-1. ### ## ###

    CLEAR LS_NEW_ITEM.

    MOVE-CORRESPONDING GS_RSEG TO LS_NEW_ITEM.



    LS_NEW_ITEM-BELNR = LV_NEXT_BELNR.

    LS_NEW_ITEM-GJAHR = SY-DATUM(4).



    LS_NEW_ITEM-MENGE = GS_RSEG-MENGE * -1.

    LS_NEW_ITEM-WRBTR = GS_RSEG-WRBTR * -1.

    LS_NEW_ITEM-WMWST = GS_RSEG-WMWST * -1.



    INSERT ZRSEG24 FROM LS_NEW_ITEM.



    "5-2. ## ### ####

    UPDATE ZRSEG24

       SET LOEKZ = 'X'

     WHERE BELNR = GS_RSEG-BELNR

       AND EBELN = GS_RSEG-EBELN

       AND EBELP = GS_RSEG-EBELP.



    "5-3. PO ### ## ## ##(REMNG) ##

    UPDATE ZEKPO24

       SET REMNG = REMNG - GS_RSEG-MENGE

     WHERE EBELN = GS_RSEG-EBELN

       AND EBELP = GS_RSEG-EBELP.

  ENDLOOP.



  MESSAGE '## ### #######' TYPE 'I'.



  "## ## ##

  PERFORM BUILD_TREE_NODES.

  "PERFORM GET_IR_DATA.

  PERFORM REFRESH2.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  REFRESH_SCREEN

*&---------------------------------------------------------------------*

*       ## ##

*----------------------------------------------------------------------*




FORM REFRESH_SCREEN .

  DATA : LS_FCAT TYPE LVC_S_FCAT,

         LT_FCAT TYPE LVC_T_FCAT.



  IF GV_SELECTED_BELNR IS INITIAL OR GV_SELECTED_BELNR = 'ROOT'.

    RETURN.

  ENDIF.



  "2. ## ### ##

  SELECT SINGLE * FROM ZRBKP24

    INTO CORRESPONDING FIELDS OF GS_RBKP

    WHERE BELNR = GV_SELECTED_BELNR.



  "3. ### ### ##

  SELECT * FROM ZRSEG24

    INTO CORRESPONDING FIELDS OF TABLE GT_RSEG

    WHERE BELNR = GV_SELECTED_BELNR.



  CALL METHOD GC_GRID_210->GET_FRONTEND_FIELDCATALOG

    IMPORTING

      ET_FIELDCATALOG = LT_FCAT.



  LOOP AT LT_FCAT INTO LS_FCAT.

    IF LS_FCAT-FIELDNAME = 'STATUS_ICON'.

      IF GV_SELECTED_BELNR >= '5100000000'.

        LS_FCAT-NO_OUT = 'X'.

      ELSE.

        LS_FCAT-NO_OUT = ' '.

      ENDIF.



      MODIFY LT_FCAT FROM LS_FCAT.

    ENDIF.

  ENDLOOP.



  CALL METHOD GC_GRID_210->SET_FRONTEND_FIELDCATALOG

    EXPORTING

      IT_FIELDCATALOG = LT_FCAT.



  LOOP AT GT_RSEG INTO GS_RSEG.

    IF GS_RSEG-LOEKZ = 'X'.

      GS_RSEG-STATUS_ICON = ICON_LED_RED.

    ELSE.

      GS_RSEG-STATUS_ICON = ICON_LED_GREEN.

    ENDIF.



    MODIFY GT_RSEG FROM GS_RSEG.

  ENDLOOP.



  CLEAR OK_CODE.

ENDFORM.



FORM POPUP_TO_CONFIRM  CHANGING P_ANSWER.

  CALL FUNCTION 'POPUP_TO_CONFIRM'

    EXPORTING

      TITLEBAR = '## ##'

      TEXT_QUESTION = '########?'

      TEXT_BUTTON_1 = '#'

      TEXT_BUTTON_2 = '###'

      DISPLAY_CANCEL_BUTTON = ' '

    IMPORTING

      ANSWER = P_ANSWER.

ENDFORM.
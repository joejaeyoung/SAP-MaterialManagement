
*&---------------------------------------------------------------------*

*&  Include           ZMM24_003_F01

*&---------------------------------------------------------------------*



*&---------------------------------------------------------------------*

*&      Form  SCREEN_INIT

*&---------------------------------------------------------------------*

*       ## ### ### ##

*----------------------------------------------------------------------*




FORM SCREEN_INIT .

  P_DATE = SY-DATUM.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  SCREEN_MODIFY

*&---------------------------------------------------------------------*

*       ## ## ##

*----------------------------------------------------------------------*




FORM SCREEN_MODIFY .

  LOOP AT SCREEN.

    "1. ## ## ## #

    IF RB_CR = 'X'.

      IF SCREEN-GROUP1 = 'DSP'. "#### ## ##

        SCREEN-ACTIVE = 0.      "## ####

        SCREEN-INVISIBLE = 1.   "## ##

        SCREEN-REQUIRED = 0.    "## ### ##

        MODIFY SCREEN.

      ENDIF.



      IF SCREEN-GROUP1 = 'CR1'.

        SCREEN-ACTIVE = 1.      "## ###

        SCREEN-INVISIBLE = 0.   "## ##

        SCREEN-REQUIRED = 2.    "## ## ##

        MODIFY SCREEN.

      ENDIF.

    ENDIF.



    "2. ## ## ## #

    IF RB_DSP = 'X'.

      IF SCREEN-GROUP1 = 'CR1'. "## ## ## ##

        SCREEN-ACTIVE = 0.      "## ####

        SCREEN-INVISIBLE = 1.   "## ##

        SCREEN-REQUIRED = 0.    "## ### ##

        MODIFY SCREEN.

      ENDIF.



      IF SCREEN-GROUP1 = 'DSP'. "#### ## ##

        SCREEN-ACTIVE = 1.      "## ###

        SCREEN-INVISIBLE = 0.   "## ##

        SCREEN-REQUIRED = 2.    "## ## ##

        MODIFY SCREEN.

      ENDIF.

    ENDIF.

  ENDLOOP.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  VALID_SCREEN_INPUT

*&---------------------------------------------------------------------*

*       ## ## # VALID ##

*----------------------------------------------------------------------*




FORM VALID_PO_INPUT .

  DATA : LV_EBELN LIKE ZEKKO24-EBELN,

         LV_WERKS LIKE ZEKPO24-WERKS.



  "0. ## ## # ##

  IF P_EBELN IS INITIAL

    OR P_WERKS IS INITIAL

    OR P_DATE IS INITIAL.

    MESSAGE '## ## ######' TYPE 'I'.

    STOP.

  ENDIF.



  "1. ## #### ###### ##

  SELECT SINGLE EBELN FROM ZEKKO24 "#### #### ##

    INTO LV_EBELN

    WHERE EBELN = P_EBELN.



  IF SY-SUBRC <> 0.

    MESSAGE '#### ## #######' TYPE 'I'.

    STOP.

  ENDIF.



  "2. ###### ## #### #####

  SELECT SINGLE WERKS FROM ZEKPO24 "#### ##### ##

    INTO LV_WERKS

    WHERE EBELN = P_EBELN

      AND WERKS = P_WERKS.



  IF SY-SUBRC <> 0.

    MESSAGE '#### ## ######.' TYPE 'I'.

    STOP.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  GET_PO_ITEMS

*&---------------------------------------------------------------------*

*       ## ####### ### ####.

*----------------------------------------------------------------------*




FORM GET_PO_ITEMS .

  CLEAR GT_PO_ITEM.



  "1. #### ## ## ####

  SELECT SINGLE * FROM ZEKKO24

    INTO CORRESPONDING FIELDS OF GS_PO_HEADER

    WHERE EBELN = P_EBELN.



  "2. #### ### ## ####

   SELECT * FROM ZEKPO24

     INTO CORRESPONDING FIELDS OF TABLE GT_PO_ITEM

     WHERE EBELN = P_EBELN

       AND WERKS = P_WERKS.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  MODIFY_PO_ITEMS

*&---------------------------------------------------------------------*

*       PO ### ##### ## ### ## #### ##

*----------------------------------------------------------------------*




FORM MODIFY_PO_ITEMS .

  CLEAR GS_ITEM.

  CLEAR GT_ITEM.

  LOOP AT GT_PO_ITEM INTO GS_PO_ITEM.

    IF GS_PO_ITEM-WEMNG < GS_PO_ITEM-MENGE. "#### ## ##

      GS_ITEM-EBELN = GS_PO_ITEM-EBELN.       "#### ##

      GS_ITEM-EBELP = GS_PO_ITEM-EBELP.       "##

      GS_ITEM-LIFNR = GS_PO_HEADER-LIFNR.     "###

      GS_ITEM-BEDAT = GS_PO_HEADER-BEDAT.     "###

      GS_ITEM-MATNR = GS_PO_ITEM-MATNR.       "####

      GS_ITEM-MAKTX = GS_PO_ITEM-MAKTX.       "###

      GS_ITEM-MENGE = GS_PO_ITEM-MENGE.       "## ## ##

      GS_ITEM-WEMNG = GS_PO_ITEM-WEMNG.       "## ## ##

      GS_ITEM-OPEN_QTY = GS_PO_ITEM-MENGE - GS_PO_ITEM-WEMNG. "### ##

      GS_ITEM-GR_QTY = 0.                     "## ## ##

      GS_ITEM-MEINS = GS_PO_ITEM-MEINS.       "##

      GS_ITEM-STPRS = GS_PO_ITEM-STPRS.       "##

      GS_ITEM-WAERS = GS_PO_HEADER-WAERS.     "##

      GS_ITEM-PRDAT = GS_PO_ITEM-PRDAT.       "###

      GS_ITEM-WERKS = GS_PO_ITEM-WERKS.       "###

      GS_ITEM-LGORT = GS_PO_ITEM-LGORT.       "####

      GS_ITEM-WAERS = GS_PO_HEADER-WAERS.     "##

      APPEND GS_ITEM TO GT_ITEM.

      CLEAR GS_ITEM.

    ENDIF.

  ENDLOOP.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  MAKE_FIELDCATALOG_101

*&---------------------------------------------------------------------*

*       SUBSCREEN ALV### ######

*----------------------------------------------------------------------*




FORM MAKE_FIELDCATALOG_101 .

  CLEAR : GS_FC, GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 1.

  GS_FC-FIELDNAME = 'CHECK'.

  GS_FC-COLTEXT = '##'.

  GS_FC-CHECKBOX = 'X'.

  GS_FC-EDIT = 'X'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 2.

  GS_FC-FIELDNAME = 'EBELN'.

  GS_FC-COLTEXT = '######'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 3.

  GS_FC-FIELDNAME = 'EBELP'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 4.

  GS_FC-FIELDNAME = 'LIFNR'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 5.

  GS_FC-FIELDNAME = 'BEDAT'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 6.

  GS_FC-FIELDNAME = 'MATNR'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 7.

  GS_FC-FIELDNAME = 'MAKTX'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 8.

  GS_FC-FIELDNAME = 'MENGE'.

  GS_FC-COLTEXT = '####'.

  GS_FC-QFIELDNAME = 'MEINS'.

  GS_FC-REF_TABLE = 'ZEKPO24'.

  GS_FC-REF_FIELD = 'MENGE'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 9.

  GS_FC-FIELDNAME = 'WEMNG'.

  GS_FC-COLTEXT = '####'.

  GS_FC-QFIELDNAME = 'MEINS'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 10.

  GS_FC-FIELDNAME = 'OPEN_QTY'.

  GS_FC-COLTEXT = '###'.

  GS_FC-QFIELDNAME = 'MEINS'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 11.

  GS_FC-FIELDNAME = 'GR_QTY'.

  GS_FC-COLTEXT = '## ##'.

  GS_FC-QFIELDNAME = 'MEINS'.

  GS_FC-REF_TABLE = 'ZEKPO24'.

  GS_FC-REF_FIELD = 'MENGE'.

  GS_FC-EDIT = 'X'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 12.

  GS_FC-FIELDNAME = 'MEINS'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 13.

  GS_FC-FIELDNAME = 'STPRS'.

  GS_FC-COLTEXT = '##'.

  GS_FC-CFIELDNAME = 'WAERS'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 14.

  GS_FC-FIELDNAME = 'WAERS'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 15.

  GS_FC-FIELDNAME = 'PRDAT'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 16.

  GS_FC-FIELDNAME = 'WERKS'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 17.

  GS_FC-FIELDNAME = 'LGORT'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CLASS_EVENT

*&---------------------------------------------------------------------*

*       ### ### ##

*----------------------------------------------------------------------*




FORM CLASS_EVENT .

  "### ### ##

  IF GO_EVENT IS INITIAL.

     CREATE OBJECT GO_EVENT.

  ENDIF.



  IF GC_GRID IS BOUND.

    CALL METHOD GC_GRID->REGISTER_EDIT_EVENT

      EXPORTING

        I_EVENT_ID = CL_GUI_ALV_GRID=>MC_EVT_MODIFIED.



    SET HANDLER GO_EVENT->HANDLER_DATA_CHANGED FOR GC_GRID.

    SET HANDLER GO_EVENT->HANDLER_DATA_CHANGED_FINISHED FOR GC_GRID.

  ENDIF.



  IF GC_GRID_201 IS BOUND.

    CALL METHOD GC_GRID_201->REGISTER_EDIT_EVENT

      EXPORTING

        I_EVENT_ID = CL_GUI_ALV_GRID=>MC_EVT_MODIFIED.



    SET HANDLER GO_EVENT->HANDLER_DATA_CHANGED FOR GC_GRID_201.

    SET HANDLER GO_EVENT->HANDLER_DATA_CHANGED_FINISHED FOR GC_GRID_201.

  ENDIF.



  IF GO_TREE IS BOUND.

    SET HANDLER GO_EVENT->HANDLE_NODE_DOUBLE_CLICK FOR GO_TREE.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  REFRESH

*&---------------------------------------------------------------------*

*       ## ####

*----------------------------------------------------------------------*




FORM REFRESH .

  DATA : LS_STABLE TYPE LVC_S_STBL.



  "### ### #

  LS_STABLE-ROW = 'X'.

  LS_STABLE-COL = 'X'.



  "## ##

  CALL METHOD GC_GRID->REFRESH_TABLE_DISPLAY

    EXPORTING

      IS_STABLE = LS_STABLE.



  IF SY-SUBRC <> 0.

  ENDIF.



ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  FILL_HEAER

*&---------------------------------------------------------------------*

*       ## ## ## ###

*----------------------------------------------------------------------*




FORM FILL_HEAER .

  "1. #### ## 5### ##

  PERFORM GET_NEXT_MBLNR CHANGING GS_MKPF-MBLNR.



  "2. #### WE(##### ## ##)

  GS_MKPF-BLART = 'WE'.



  "3. ###

  GS_MKPF-BLDAT = GS_PO_HEADER-BEDAT.






*  "4. ###, #### (#### ##)# ## ## # ##




ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  GET_NEXT_MBLNR

*&---------------------------------------------------------------------*

*       #### ## ##

*----------------------------------------------------------------------*




FORM GET_NEXT_MBLNR  CHANGING P_MBLNR.

  DATA : LV_MAX LIKE ZMKPF24-MBLNR.



  SELECT MAX( MBLNR ) INTO LV_MAX FROM ZMKPF24.



  IF LV_MAX <> 0.

    P_MBLNR = LV_MAX + 1.

  ELSE.

    P_MBLNR = '5000000000'.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  ALV_HANDLER_DATA_CHANGED

*&---------------------------------------------------------------------*

*       LAYOUT## ## ### # ### ###

*----------------------------------------------------------------------*




FORM ALV_HANDLER_DATA_CHANGED  USING    P_DATA_CHANGED TYPE REF TO CL_ALV_CHANGED_DATA_PROTOCOL

                                        P_ONF4

                                        P_ONF4_BEFORE

                                        P_ONF4_AFTER

                                        P_UCOMM.

  DATA : LS_MODI TYPE LVC_S_MODI.



  LOOP AT P_DATA_CHANGED->MT_GOOD_CELLS INTO LS_MODI.

    READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.



    "1. ## ##

    IF LS_MODI-FIELDNAME = 'CHECK'.

      IF LS_MODI-VALUE = 'X'. "### ##(####)##

        GS_ITEM-BWART = '101'.

        MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

      ELSE.

        CLEAR GS_ITEM-BWART.  "##### CLEAR (102# ## ##)

      ENDIF.

    ENDIF.



    "2. ## ## ## ##

    IF LS_MODI-FIELDNAME = 'GR_QTY'.

      GS_ITEM-GR_QTY = LS_MODI-VALUE.



      "2-1. ## ## ## VALID ##

      IF GS_ITEM-GR_QTY > GS_ITEM-OPEN_QTY.

        MESSAGE '## ## ### ######' TYPE 'I'.

        GS_ITEM-GR_QTY = GS_ITEM-OPEN_QTY.



        "2-2. ALV## ##

        P_DATA_CHANGED->MODIFY_CELL(

          EXPORTING I_ROW_ID = LS_MODI-ROW_ID

                    I_FIELDNAME = 'GR_QTY'

                    I_VALUE = GS_ITEM-GR_QTY ).

      ENDIF.



      IF GS_ITEM-GR_QTY < 0.

        MESSAGE '## ## ### #####' TYPE 'I'.

        GS_ITEM-GR_QTY = GS_ITEM-OPEN_QTY.



        "2-2. ALV## ##

        P_DATA_CHANGED->MODIFY_CELL(

          EXPORTING I_ROW_ID = LS_MODI-ROW_ID

                    I_FIELDNAME = 'GR_QTY'

                    I_VALUE = GS_ITEM-GR_QTY ).

      ENDIF.



      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.

  ENDLOOP.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  ALV_DATA_CHANGED_FINISHED

*&---------------------------------------------------------------------*

*       ## ## ## ## ### ##

*----------------------------------------------------------------------*




FORM ALV_DATA_CHANGED_FINISHED  USING    P_MODIFIED

                                         P_GOOD_CELLS TYPE LVC_T_MODI..

  DATA : LS_GOOD TYPE LVC_S_MODI.



  LOOP AT P_GOOD_CELLS INTO LS_GOOD.

    "1. #### # ####

    READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_GOOD-ROW_ID.

    IF SY-SUBRC <> 0.

      CONTINUE.

    ENDIF.



    "2. ####




*    MODIFY GT_ITEM FROM GS_ITEM INDEX LS_GOOD-ROW_ID.




  ENDLOOP.



  "3. ALV REFRESH

  PERFORM REFRESH.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  REFRESH_LAYOUT_VALUE

*&---------------------------------------------------------------------*

*       LAYOUT## #### ## # ##

*----------------------------------------------------------------------*




FORM REFRESH_LAYOUT_VALUE .

  IF GS_MKPF-BUDAT IS NOT INITIAL.

    GS_MKPF-MJAHR = GS_MKPF-BUDAT(4).

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  BTN_CREATE

*&---------------------------------------------------------------------*

*       ## (## ## ##)

*----------------------------------------------------------------------*




FORM BTN_CREATE .

  "1. ## ## ####

  DATA : LS_MKPF LIKE ZMKPF24.

  GS_MKPF-BLDAT = GS_PO_HEADER-BEDAT.

  GS_MKPF-EBELN = P_EBELN.

  GS_MKPF-WERKS = P_WERKS.

  MOVE-CORRESPONDING GS_MKPF TO LS_MKPF.

  INSERT ZMKPF24 FROM LS_MKPF.



  "2. ### ## ####

  DATA : LS_MSEG LIKE ZMSEG24,

         LV_ZEILE LIKE ZMSEG24-ZEILE.



  LV_ZEILE = 0.

  LOOP AT GT_ITEM INTO GS_ITEM.

    "1. ## ## ## ## ## ###

    IF GS_ITEM-CHECK <> 'X'.

      CONTINUE.

    ENDIF.

    CLEAR GS_MSEG.

    CLEAR LS_MSEG.



    "2. ### ##

    GS_MSEG-MBLNR = GS_MKPF-MBLNR.  "######

    GS_MSEG-MJAHR = GS_MKPF-MJAHR.  "####

    GS_MSEG-ZEILE = GS_ITEM-EBELP.  "PO## ## ### ## (### ##)

    GS_MSEG-MATNR = GS_ITEM-MATNR.  "####

    GS_MSEG-WERKS = GS_ITEM-WERKS.  "###

    GS_MSEG-LGORT = GS_ITEM-LGORT.  "####

    GS_MSEG-LIFNR = GS_ITEM-LIFNR.  "###

    GS_MSEG-WAERS = GS_ITEM-WAERS.  "##

    GS_MSEG-MENGE = GS_ITEM-GR_QTY. "## ## ##

    GS_MSEG-MEINS = GS_ITEM-MEINS.  "##

    GS_MSEG-EBELN = GS_ITEM-EBELN.  "######

    GS_MSEG-BWART = GS_ITEM-BWART.  "####

    GS_MSEG-BUKRS = GS_PO_HEADER-BUKRS. "####




*    GS_MSEG-GJAHR = "####

*    GS_MSEG-ZZEILE = "####

*    GS_MSEG-ZEBELP = "####

*    GS_MSEG-SHKZG = "### (S : ##, H : ##)

*    GS_MSEG-DMBTR = "##




    MOVE-CORRESPONDING GS_MSEG TO LS_MSEG.

    INSERT ZMSEG24 FROM LS_MSEG.



    IF SY-SUBRC <> 0.

      MESSAGE 'ZMSEG24 INSERT ##' TYPE 'E'.

    ENDIF.

    LV_ZEILE = LV_ZEILE + 1.



    "3. #### ## - PO #### ## ####

    UPDATE ZEKPO24

      SET WEMNG = WEMNG + GS_MSEG-MENGE

      WHERE EBELN = GS_MSEG-EBELN "######

        AND EBELP = GS_ITEM-EBELP."##



  ENDLOOP.

  MESSAGE '## ##' && GS_MKPF-MBLNR && ' ## #######' TYPE 'I'.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CHECK_DATA_BEFORE_CREATE

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




FORM CHECK_DATA_BEFORE_CREATE .

  DATA : LV_COUNT TYPE I VALUE 0.



  "1. ## ## ##

   IF GS_MKPF-BUDAT IS INITIAL  "###

   OR GS_MKPF-BLART IS INITIAL. "####? ####?

     MESSAGE '## ### ## ######' TYPE 'E'.

   ENDIF.



  "2. ### ## ##

   LOOP AT GT_ITEM INTO GS_ITEM.

     IF GS_ITEM-CHECK = 'X'.

       LV_COUNT = LV_COUNT + 1.

     ELSE.

       CONTINUE.

     ENDIF.



     IF GS_ITEM-EBELP IS INITIAL

     OR GS_ITEM-MATNR IS INITIAL

     OR GS_ITEM-WERKS IS INITIAL

     OR GS_ITEM-LGORT IS INITIAL

     OR GS_ITEM-LIFNR IS INITIAL

     OR GS_ITEM-WAERS IS INITIAL

     OR GS_ITEM-GR_QTY IS INITIAL

     OR GS_ITEM-MEINS IS INITIAL

     OR GS_ITEM-EBELN IS INITIAL

     OR GS_ITEM-BWART IS INITIAL.

       MESSAGE '### ### ### ## ######' TYPE 'E'.

     ENDIF.

   ENDLOOP.



  IF LV_COUNT = 0.

    MESSAGE '### ### ### 1### ######' TYPE 'E'.

  ENDIF.



ENDFORM.
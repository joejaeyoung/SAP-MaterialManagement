
*&---------------------------------------------------------------------*

*&  Include           ZMM24_004_F01

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

*&      Form  VALID_IR_INPUT_CR

*&---------------------------------------------------------------------*

*       ## ## ## ## # VALID ##

*----------------------------------------------------------------------*




FORM VALID_IR_INPUT_CR .

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

*&      Form  GET_DATAS

*&---------------------------------------------------------------------*

*       ##### ## ### ### ####

*----------------------------------------------------------------------*




FORM GET_DATAS .

  CLEAR : GS_EKKO, GT_EKPO.



  "1. ## ## #### ## ####

  "1-1. ## ##

  SELECT SINGLE * FROM ZEKKO24

    INTO CORRESPONDING FIELDS OF GS_EKKO

    WHERE EBELN = P_EBELN.



  "1-2. ### ##

  SELECT * FROM ZEKPO24

    INTO CORRESPONDING FIELDS OF TABLE GT_EKPO

    WHERE EBELN = P_EBELN

      AND WERKS = P_WERKS.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  MODIFY_DATAS

*&---------------------------------------------------------------------*

*       ## ### ## ### ## ###### ####

*----------------------------------------------------------------------*




FORM MODIFY_DATAS .

  DATA : LV_BELNR LIKE GS_RBKP-BELNR.

  "1. ## ## ## ## ###

  CLEAR GS_RBKP.

  CLEAR GT_ITEM.



  PERFORM GET_NEXT_BELNR CHANGING GS_RBKP-BELNR.  "#### ##

  GS_RBKP-GJAHR = P_DATE(4).      "####

  GS_RBKP-BLART = 'RE'.           "## (### ####, ### ### ### ##)

  GS_RBKP-BLDAT = SY-DATUM.       "###

  GS_RBKP-BUDAT = SY-DATUM.       "###

  GS_RBKP-BUKRS = GS_EKKO-BUKRS.  "####

  GS_RBKP-LIFNR = GS_EKKO-LIFNR.  "###(####)

  GS_RBKP-WAERS = GS_EKKO-WAERS.  "###




*  GS_RBKP-ZTERM = GS_EKKO-WAERS.  "####

*  GS_RBKP-XMWST = P_DATE(4).      "## ##

*  GS_RBKP-RBSTAT = P_DATE(4).     "## ##






  "2. ## ## ### ## ###

  LOOP AT GT_EKPO INTO GS_EKPO.

    CLEAR GS_ITEM.



    "2-1. PK, ### ##

    GS_ITEM-BELNR = GS_RBKP-BELNR. "######

    GS_ITEM-GJAHR = GS_RBKP-GJAHR. "####



    "2-2. ## ##

    GS_ITEM-BUZEI = SY-TABIX * 10. "#### ##



    "2-3. #### ## ##

    GS_ITEM-EBELN = GS_EKPO-EBELN. "#### ##

    GS_ITEM-EBELP = GS_EKPO-EBELP. "#### ##

    GS_ITEM-MATNR = GS_EKPO-MATNR. "## ##

    GS_ITEM-TXZ01 = GS_EKPO-MAKTX. "## ## (MAKTX# ##)

    GS_ITEM-WERKS = GS_EKPO-WERKS. "###

    GS_ITEM-MEINS = GS_EKPO-MEINS. "##

    GS_ITEM-BSTME = GS_EKPO-MEINS. "## (## ## / ## ##)

    GS_ITEM-WAERS = GS_RBKP-WAERS. "###

    "2-4. ## ##

    GS_ITEM-MENGE = GS_EKPO-MENGE. "#### ##

    GS_ITEM-WEMNG = GS_EKPO-WEMNG. "## ##

    GS_ITEM-REMNG = GS_EKPO-REMNG. "## ## ##

    GS_ITEM-OPEN_QTY = GS_ITEM-MENGE - GS_ITEM-REMNG.

    IF GS_ITEM-OPEN_QTY <= 0.

      CONTINUE.

    ENDIF.






*    "2-5. ## ## ##

*    GS_RSEG-WRBTR. "####

*    GS_RSEG-WMWST. "##

*

*    "2-6. ###

*    GS_RSEG-SGTXT = ''. "###






    APPEND GS_ITEM TO GT_ITEM.

  ENDLOOP.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  GET_NEXT_BELNR

*&---------------------------------------------------------------------*

*       #### ## ##

*----------------------------------------------------------------------*




FORM GET_NEXT_BELNR  CHANGING P_BELNR.

  DATA : LV_MAX LIKE ZRBKP24-BELNR.



  SELECT MAX( BELNR ) INTO LV_MAX

    FROM ZRBKP24

    WHERE BELNR < '5100000000'.



   IF LV_MAX <> 0.

     P_BELNR = LV_MAX + 1.

   ELSE.

     P_BELNR = '5000000000'.

   ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  MAKE_FIELDCATALOG_101

*&---------------------------------------------------------------------*

*       SUBSCREEN ALV### ######

*----------------------------------------------------------------------*




FORM MAKE_FIELDCATALOG_101 .

  "1. ####

  CLEAR GS_FC.

  GS_FC-COL_POS = 1.

  GS_FC-FIELDNAME = 'CHECK'.

  GS_FC-COLTEXT = '##'.

  GS_FC-CHECKBOX = 'X'.

  GS_FC-EDIT = 'X'.

  APPEND GS_FC TO GT_FC.



  "2. #### -> ### ##




*  CLEAR GS_FC.

*  GS_FC-COL_POS = 2.

*  GS_FC-FIELDNAME = 'EBELN'.

*  GS_FC-COLTEXT = '####'.

*  APPEND GS_FC TO GT_FC.






  "3. #### ##

  CLEAR GS_FC.

  GS_FC-COL_POS = 3.

  GS_FC-FIELDNAME = 'EBELN'.

  GS_FC-COLTEXT = '######'.

  APPEND GS_FC TO GT_FC.



  "4. #### ## ###

  CLEAR GS_FC.

  GS_FC-COL_POS = 4.

  GS_FC-FIELDNAME = 'EBELP'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 5.

  GS_FC-FIELDNAME = 'MATNR'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 6.

  GS_FC-FIELDNAME = 'TXZ01'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 7.

  GS_FC-FIELDNAME = 'WERKS'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  "4. ####

  CLEAR GS_FC.

  GS_FC-COL_POS = 8.

  GS_FC-FIELDNAME = 'WRBTR'.

  GS_FC-COLTEXT = '####'.

  GS_FC-CFIELDNAME = 'WAERS'.

  APPEND GS_FC TO GT_FC.



  "4. ##

  CLEAR GS_FC.

  GS_FC-COL_POS = 9.

  GS_FC-FIELDNAME = 'STPRS'.

  GS_FC-COLTEXT = '##'.

  GS_FC-CFIELDNAME = 'WAERS'.

  GS_FC-EDIT = 'X'.

  GS_FC-NO_SIGN = 'X'.

  APPEND GS_FC TO GT_FC.



  "4. ###

  CLEAR GS_FC.

  GS_FC-COL_POS = 10.

  GS_FC-FIELDNAME = 'WAERS'.

  GS_FC-COLTEXT = '###'.

  GS_FC-EDIT = 'X'.

  APPEND GS_FC TO GT_FC.





  "4. #### ##

  CLEAR GS_FC.

  GS_FC-COL_POS = 11.

  GS_FC-FIELDNAME = 'MENGE'.

  GS_FC-COLTEXT = '#### ##'.

  GS_FC-QFIELDNAME = 'MEINS'.

  GS_FC-NO_SIGN = 'X'.

  GS_FC-REF_TABLE = 'ZRSEG24'.

  GS_FC-REF_FIELD = 'MENGE'.

  APPEND GS_FC TO GT_FC.



 "4. ## ## ##

  CLEAR GS_FC.

  GS_FC-COL_POS = 12.

  GS_FC-FIELDNAME = 'REMNG'.

  GS_FC-COLTEXT = '## ## ##'.

  GS_FC-QFIELDNAME = 'MEINS'.

  GS_FC-NO_SIGN = 'X'.

  GS_FC-REF_TABLE = 'ZRSEG24'.

  GS_FC-REF_FIELD = 'MENGE'.

  APPEND GS_FC TO GT_FC.



 "4. ## ## ##

  CLEAR GS_FC.

  GS_FC-COL_POS = 13.

  GS_FC-FIELDNAME = 'OPEN_QTY'.

  GS_FC-COLTEXT = '## ## ##'.

  GS_FC-QFIELDNAME = 'MEINS'.

  GS_FC-NO_SIGN = 'X'.

  GS_FC-REF_TABLE = 'ZRSEG24'.

  GS_FC-REF_FIELD = 'MENGE'.

  APPEND GS_FC TO GT_FC.



 "4. ## ## ##

  CLEAR GS_FC.

  GS_FC-COL_POS = 14.

  GS_FC-FIELDNAME = 'IR_QTY'.

  GS_FC-COLTEXT = '## ## ##'.

  GS_FC-QFIELDNAME = 'MEINS'.

  GS_FC-NO_SIGN = 'X'.

  GS_FC-EDIT = 'X'.

  GS_FC-REF_TABLE = 'ZRSEG24'.

  GS_FC-REF_FIELD = 'MENGE'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 15.

  GS_FC-FIELDNAME = 'MEINS'.

  GS_FC-COLTEXT = '##'.

  GS_FC-EDIT = 'X'.

  APPEND GS_FC TO GT_FC.



  "5. ##

  CLEAR GS_FC.

  GS_FC-COL_POS = 16.

  GS_FC-FIELDNAME = 'WMWST'.

  GS_FC-COLTEXT = '##'.

  GS_FC-CFIELDNAME = 'WAERS'.

  APPEND GS_FC TO GT_FC.



  "6. ##

  CLEAR GS_FC.

  GS_FC-COL_POS = 17.

  GS_FC-FIELDNAME = 'DMBTR'.

  GS_FC-COLTEXT = '##'.

  GS_FC-CFIELDNAME = 'WAERS'.

  APPEND GS_FC TO GT_FC.



  "7. ## -> ### ##




*  CLEAR GS_FC.

*  GS_FC-COL_POS = 8.

*  GS_FC-FIELDNAME = 'MAKTX'.

*  GS_FC-COLTEXT = '##'.

*  APPEND GS_FC TO GT_FC.



*  "8. ####

*  CLEAR GS_FC.

*  GS_FC-COL_POS = 18.

*  GS_FC-FIELDNAME = 'MWSKZ'.

*  GS_FC-COLTEXT = '####'.

*  APPEND GS_FC TO GT_FC.






  "9. ###

  CLEAR GS_FC.

  GS_FC-COL_POS = 19.

  GS_FC-FIELDNAME = 'SGTXT'.

  GS_FC-COLTEXT = '###'.

  GS_FC-EDIT = 'X'.

  APPEND GS_FC TO GT_FC.



  "10. ### -> ### ##




*  CLEAR GS_FC.

*  GS_FC-COL_POS = 11.

*  GS_FC-FIELDNAME = 'OPEN_QTY'.

*  GS_FC-COLTEXT = '###'.

*  GS_FC-QFIELDNAME = 'MEINS'.

*  APPEND GS_FC TO GT_FC.






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



  IF GC_GRID_210 IS BOUND.

    CALL METHOD GC_GRID_210->REGISTER_EDIT_EVENT

      EXPORTING

        I_EVENT_ID = CL_GUI_ALV_GRID=>MC_EVT_MODIFIED.



    SET HANDLER GO_EVENT->HANDLER_DATA_CHANGED FOR GC_GRID_210.

    SET HANDLER GO_EVENT->HANDLER_DATA_CHANGED_FINISHED FOR GC_GRID_210.

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

*&      Form  ALV_HANDLER_DATA_CHANGED

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




FORM ALV_HANDLER_DATA_CHANGED  USING    P_DATA_CHANGED TYPE REF TO CL_ALV_CHANGED_DATA_PROTOCOL

                                        P_ONF4

                                        P_ONF4_BEFORE

                                        P_ONF4_AFTER

                                        P_UCOMM.

  DATA : LS_MODI TYPE LVC_S_MODI.





  LOOP AT P_DATA_CHANGED->MT_GOOD_CELLS INTO LS_MODI.

    READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.



    "1. ##

    IF LS_MODI-FIELDNAME = 'STPRS'.

      GS_ITEM-STPRS = LS_MODI-VALUE.

    ENDIF.



    "2. ##

    IF LS_MODI-FIELDNAME = 'IR_QTY'.

      GS_ITEM-IR_QTY = LS_MODI-VALUE.



      IF GS_ITEM-IR_QTY > GS_ITEM-OPEN_QTY.

        MESSAGE '## ## ### ######' TYPE 'I'.

        GS_ITEM-IR_QTY  = GS_ITEM-OPEN_QTY.



        P_DATA_CHANGED->MODIFY_CELL(

          EXPORTING I_ROW_ID = LS_MODI-ROW_ID

                    I_FIELDNAME = 'IR_QTY'

                    I_VALUE = GS_ITEM-IR_QTY ).

      ENDIF.

    ENDIF.



    "3. ###

    IF LS_MODI-FIELDNAME = 'SGTXT'.

      GS_ITEM-SGTXT = LS_MODI-VALUE.

    ENDIF.

    MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    PERFORM CAL_TOTAL_BY_TAXCODE.

  ENDLOOP.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  ALV_DATA_CHANGED_FINISHED

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




FORM ALV_DATA_CHANGED_FINISHED  USING    P_MODIFIED

                                         P_GOOD_CELLS TYPE LVC_T_MODI.

  DATA : LS_GOOD TYPE LVC_S_MODI.

  LOOP AT P_GOOD_CELLS INTO LS_GOOD.

    "1. #### # ####

    READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_GOOD-ROW_ID.

    IF SY-SUBRC <> 0.

      CONTINUE.

    ENDIF.

  ENDLOOP.

  PERFORM REFRESH.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  REFRESH_LAYOUT_VALUE

*&---------------------------------------------------------------------*

*       LAYOUT## #### ## # ##

*----------------------------------------------------------------------*




FORM REFRESH_LAYOUT_VALUE .

  "1. ### BLDAT



  "2. ### ###

  IF GS_RBKP-BUDAT IS NOT INITIAL.

    GS_RBKP-GJAHR = GS_RBKP-BUDAT(4). "#### ##

  ENDIF.



  "3. ## RMWWR

  IF GS_RBKP-RMWWR IS INITIAL.

    CLEAR GS_RBKP-WMWST.

  ENDIF.



  "4. #### MWSKZ

  IF GS_RBKP-MWSKZ IS NOT INITIAL AND GS_RBKP-RMWWR IS NOT INITIAL.

    CASE GS_RBKP-MWSKZ.

      WHEN 'V1'.  "#### 10%

        GS_RBKP-WMWST = GS_RBKP-RMWWR * 1 / 10.

      WHEN 'V2'.  "#### 0%

        GS_RBKP-WMWST = GS_RBKP-RMWWR * 0.

      WHEN 'V3'.  "####0%

        GS_RBKP-WMWST = GS_RBKP-RMWWR * 0.

      WHEN 'V4'.  "#####

        GS_RBKP-WMWST = GS_RBKP-RMWWR * 0.

      WHEN 'V5'.  "######

        GS_RBKP-WMWST = GS_RBKP-RMWWR * 1 / 10.

    ENDCASE.

  ENDIF.



  "#### ## ##

  PERFORM HANDLE_MWSKZ.



  "5. ### BKTXT



ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  BTN_SIMUL

*&---------------------------------------------------------------------*

*       ##### ## ## ##

*----------------------------------------------------------------------*




FORM BTN_SIMUL .

  DATA : LV_ITEM_TOTAL LIKE ZRBKP24-RMWWR,

         LV_HEAD_TOTAL LIKE ZRBKP24-RMWWR,

         LV_TAX_TOTAL LIKE ZRBKP24-WMWST,

         LV_CHECK TYPE I VALUE 0.



  PERFORM CHECK_DATA_BEFORE_CREATE.



  "1. ## ## ## ###

  CLEAR : LV_ITEM_TOTAL, LV_TAX_TOTAL.

  LOOP AT GT_ITEM INTO GS_ITEM.

    IF GS_ITEM-CHECK <> 'X'.

      CONTINUE.

    ENDIF.

    LV_CHECK = LV_CHECK + 1.



    LV_ITEM_TOTAL = LV_ITEM_TOTAL + GS_ITEM-DMBTR.

  ENDLOOP.



  "2. ### ## ## ###

  LV_HEAD_TOTAL = GS_RBKP-RMWWR.

  GV_LEFT_MONEY = LV_HEAD_TOTAL - LV_ITEM_TOTAL.



  "3. ### ##

  IF LV_CHECK > 0 AND GV_LEFT_MONEY = 0.

    GV_SIGNAL = ICON_LED_GREEN. "###

  ELSE.

    GV_SIGNAL = ICON_LED_RED. "###

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  BTN_CREATE

*&---------------------------------------------------------------------*

*       #### ##

*----------------------------------------------------------------------*




FORM BTN_CREATE .

  "## DB# ##

  DATA : LS_RBKP LIKE ZRBKP24.

  MOVE-CORRESPONDING GS_RBKP TO LS_RBKP.

  LS_RBKP-EBELN = P_EBELN.

  LS_RBKP-WERKS = P_WERKS.

  INSERT ZRBKP24 FROM LS_RBKP.



  "### ## ####

  DATA : LS_RSEG LIKE ZRSEG24.

  LOOP AT GT_ITEM INTO GS_ITEM.

    IF GS_ITEM-CHECK <> 'X'.

      CONTINUE.

    ENDIF.



    GS_ITEM-BUZEI = GS_ITEM-EBELP.  "PO# #### ### ##

    MOVE-CORRESPONDING GS_ITEM TO LS_RSEG.

    INSERT ZRSEG24 FROM LS_RSEG.



    UPDATE ZEKPO24

      SET REMNG = REMNG + GS_ITEM-IR_QTY

      WHERE EBELN = GS_ITEM-EBELN

        AND EBELP = Gs_ITEM-EBELP.

  ENDLOOP.



  MESSAGE '## ##' && LS_RBKP-BELNR && ' ## #######' TYPE 'I'.

  CLEAR OK_CODE.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  HANDLE_MWSKZ

*&---------------------------------------------------------------------*

*       ## ## ## ##

*----------------------------------------------------------------------*




FORM HANDLE_MWSKZ .

  "1. ### ## ### ####

  IF GS_RBKP-MWSKZ IS NOT INITIAL.

    LOOP AT GT_ITEM INTO GS_ITEM.

      "1. #### ## ## ## ##

      GS_ITEM-MWSKZ = GS_RBKP-MWSKZ.



      "2. #### ### ## # ## ##

      IF GS_ITEM-WRBTR IS NOT INITIAL.

        CASE GS_ITEM-MWSKZ. "## ##

          WHEN 'V1'.  "#### 10%

            GS_ITEM-WMWST = GS_ITEM-WRBTR * 1 / 10.

          WHEN 'V2'.  "#### 0%

            GS_ITEM-WMWST = GS_ITEM-WRBTR * 0.

          WHEN 'V3'.  "####0%

            GS_ITEM-WMWST = GS_ITEM-WRBTR * 0.

          WHEN 'V4'.  "#####

            GS_ITEM-WMWST = GS_ITEM-WRBTR * 0.

          WHEN 'V5'.  "######

            GS_ITEM-WMWST = GS_ITEM-WRBTR * 1 / 10 .

        ENDCASE.



        GS_ITEM-DMBTR = GS_ITEM-WRBTR + GS_ITEM-WMWST."##

      ENDIF.

      MODIFY GT_ITEM FROM GS_ITEM.

    ENDLOOP.

  ENDIF.



  "2. ### ##### #### ###

  IF GS_RBKP-MWSKZ IS INITIAL.

    "1. #### ## ##, ##, ##  CLEAR

    LOOP AT GT_ITEM INTO GS_ITEM.

      CLEAR GS_ITEM-MWSKZ. "####

      CLEAR GS_ITEM-WMWST. "##

      CLEAR GS_ITEM-DMBTR. "##

      MODIFY GT_ITEM FROM GS_ITEM.

    ENDLOOP.

  ENDIF.



  "3. ## REFRESH

  PERFORM REFRESH.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CHECK_DATA_BEFORE_CREATE

*&---------------------------------------------------------------------*

*       ## # ### ### ##

*----------------------------------------------------------------------*




FORM CHECK_DATA_BEFORE_CREATE .

  DATA : LV_COUNT TYPE I VALUE 0.



  "1. ## ## ##

  IF GS_RBKP-BLDAT IS INITIAL

  OR GS_RBKP-BUDAT IS INITIAL

  OR GS_RBKP-RMWWR IS INITIAL

  OR GS_RBKP-MWSKZ IS INITIAL

  OR GS_RBKP-BKTXT IS INITIAL.

    MESSAGE '## ### ## ######' TYPE 'S' DISPLAY LIKE 'E'.

    LEAVE TO SCREEN SY-DYNNR.

  ENDIF.



  "2. ### ## ##

  LOOP AT GT_ITEM INTO GS_ITEM.

    IF GS_ITEM-CHECK = 'X'.

      LV_COUNT = LV_COUNT + 1.

    ELSE.

      CONTINUE.

    ENDIF.



    IF GS_ITEM-STPRS IS INITIAL

    OR GS_ITEM-WAERS IS INITIAL

    OR GS_ITEM-IR_QTY IS INITIAL

    OR GS_ITEM-MEINS IS INITIAL

    OR GS_ITEM-SGTXT IS INITIAL.

      MESSAGE '### ### ### ## ######.' TYPE 'S' DISPLAY LIKE 'E'.

      LEAVE TO SCREEN SY-DYNNR.

    ENDIF.

  ENDLOOP.



  "2-1. ### ## # ## 0 ##

  IF LV_COUNT = 0.

    MESSAGE '### ### ### 1# ## ######' TYPE 'S' DISPLAY LIKE 'E'.

    LEAVE TO SCREEN SY-DYNNR.

  ENDIF.



  "3. ##### ##

  IF OK_CODE <> 'BTN_SIMUL'.

    IF GV_LEFT_MONEY <> 0 OR GV_SIGNAL = ICON_LED_RED.

      MESSAGE '###### ######' TYPE 'S' DISPLAY LIKE 'E'.

      LEAVE TO SCREEN SY-DYNNR.

    ENDIF.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CAL_TOTAL_BY_TAXCODE

*&---------------------------------------------------------------------*

*       ##### ## ##

*----------------------------------------------------------------------*




FORM CAL_TOTAL_BY_TAXCODE .

  DATA : LV_TAX TYPE P DECIMALS 2,

         LV_TOTAL_TAX TYPE P DECIMALS 2.



  CASE GS_RBKP-MWSKZ.

    WHEN 'V1'. LV_TAX = C_TAX_V1.

    WHEN 'V2'. LV_TAX = C_TAX_V2.

    WHEN 'V3'. LV_TAX = C_TAX_V3.

    WHEN 'V4'. LV_TAX = C_TAX_V4.

    WHEN 'V5'. LV_TAX = C_TAX_V5.

  ENDCASE.



  LOOP AT GT_ITEM INTO GS_ITEM.

    "1. #### ##

    GS_ITEM-WRBTR = GS_ITEM-STPRS * GS_ITEM-IR_QTY.



    "2. ## ##

    GS_ITEM-WMWST = GS_ITEM-WRBTR * LV_TAX.



    "3. ## ## ##

    LV_TOTAL_TAX = LV_TOTAL_TAX + GS_ITEM-WMWST.



    "4. ## ## ##

    GS_ITEM-DMBTR = GS_ITEM-WRBTR + GS_ITEM-WMWST.



    MODIFY GT_ITEM FROM GS_ITEM INDEX SY-TABIX.

  ENDLOOP.



  "5. ## ## ##

  GS_RBKP-WMWST = LV_TOTAL_TAX.

ENDFORM.
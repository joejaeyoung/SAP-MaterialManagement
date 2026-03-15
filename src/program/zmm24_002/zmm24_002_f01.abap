
*&---------------------------------------------------------------------*

*&  Include           ZMM24_002_F01

*&---------------------------------------------------------------------*



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

*       #####(P_LIFNR OR P_LIFNR2) ### ## (## #####)

*----------------------------------------------------------------------*




FORM VALID_SCREEN_INPUT .

  DATA : LS_ZLFA1 LIKE ZLFA1_24.

  DATA : LV_LIFNR TYPE LIFNR.



  "0. SCREEN ## # (P_LIFNR, P_LIFNR2) # ####

  IF RB_CR = 'X'.

    LV_LIFNR = P_LIFNR.

    IF P_BUKRS IS INITIAL OR P_LIFNR IS INITIAL OR P_BEDAT IS INITIAL.

      MESSAGE '## ## # ######' TYPE 'I'.

      STOP.

    ENDIF.

  ELSE.

    LV_LIFNR = P_LIFNR2.

    IF P_BUKRS2 IS INITIAL OR P_LIFNR2 IS INITIAL OR P_EBELN IS INITIAL.

      MESSAGE '## ## # ######' TYPE 'I'.

      STOP.

    ENDIF.

  ENDIF.



  "1. ZLFA1_24## #### ### #### ##

  SELECT SINGLE * FROM ZLFA1_24

    INTO CORRESPONDING FIELDS OF LS_ZLFA1

    WHERE LIFNR = LV_LIFNR.



  IF LS_ZLFA1 IS INITIAL OR SY-SUBRC <> 0.

    MESSAGE '#### ## ### ## ###' TYPE 'I'.

    STOP.

  ENDIF.



  GV_BUKRS = P_BUKRS.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  FILL_VENDOR

*&---------------------------------------------------------------------*

*       PO ## ### (##, ##)

*----------------------------------------------------------------------*




FORM FILL_VENDOR .

  DATA : LS_ZLFA1 LIKE ZLFA1_24.

  DATA : LS_ZLFB1 LIKE ZLFB1_24.

  DATA : LS_ZLFM1 LIKE ZLFM1_24.

  DATA : LV_LIFNR TYPE LIFNR.



  "0. SCREEN ## # (P_LIFNR, P_LIFNR2) # ####

  IF RB_CR = 'X'.

    LV_LIFNR = P_LIFNR.

  ELSE.

    LV_LIFNR = P_LIFNR2.

  ENDIF.



  "1. ZLFA1_24## # ####

  SELECT SINGLE * FROM ZLFA1_24

    INTO CORRESPONDING FIELDS OF LS_ZLFA1

    WHERE LIFNR = LV_LIFNR.

  MOVE-CORRESPONDING LS_ZLFA1 TO GS_HEADER.



  "2. ZLFB1_24## # ####

  SELECT SINGLE * FROM ZLFB1_24

    INTO CORRESPONDING FIELDS OF LS_ZLFB1

    WHERE LIFNR = LV_LIFNR.

  MOVE-CORRESPONDING LS_ZLFB1 TO GS_HEADER.



  "3. ZLFM1_24## # ####

  SELECT SINGLE * FROM ZLFM1_24

    INTO CORRESPONDING FIELDS OF LS_ZLFM1

    WHERE LIFNR = LV_LIFNR.

  MOVE-CORRESPONDING LS_ZLFM1 TO GS_HEADER.



  "4. ### # ###

  GS_HEADER-BEDAT = P_BEDAT.

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

  GS_FC-FIELDNAME = 'EBELP'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 2.

  GS_FC-FIELDNAME = 'MATNR'.

  GS_FC-COLTEXT = '####'.

  GS_FC-EDIT = 'X'.

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

  GS_FC-EDIT = 'X'.

  GS_FC-REF_TABLE = 'EKPO'.

  GS_FC-REF_FIELD = 'MENGE'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 5.

  GS_FC-FIELDNAME = 'STPRS'.

  GS_FC-COLTEXT = '##'.

  GS_FC-CFIELDNAME = 'WAERS'.

  GS_FC-EDIT = 'X'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 6.

  GS_FC-FIELDNAME = 'MEINS'.

  GS_FC-COLTEXT = '##'.

  GS_FC-EDIT = 'X'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 7.

  GS_FC-FIELDNAME = 'WAERS'.

  GS_FC-COLTEXT = '##'.

  GS_FC-EDIT = 'X'. "###### ####?

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 8.

  GS_FC-FIELDNAME = 'MWSKZ'.

  GS_FC-COLTEXT = '####'.

  GS_FC-EDIT = 'X'. "###### ####?

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 9.

  GS_FC-FIELDNAME = 'PRDAT'.

  GS_FC-COLTEXT = '###'.

  GS_FC-EDIT = 'X'. "###### ####?

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 10.

  GS_FC-FIELDNAME = 'WERKS'.

  GS_FC-COLTEXT = '###'.

  GS_FC-EDIT = 'X'. "###### ####?

  GS_FC-REF_TABLE = 'ZMARA24'.

  GS_FC-REF_FIELD = 'WERKS'.

  GS_FC-OUTPUTLEN = '10'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 11.

  GS_FC-FIELDNAME = 'LGORT'.

  GS_FC-COLTEXT = '####'.

  GS_FC-EDIT = 'X'. "###### ####?

  GS_FC-REF_TABLE = 'ZMARA24'.

  GS_FC-REF_FIELD = 'LGORT'.

  GS_FC-OUTPUTLEN = '10'.

  APPEND GS_FC TO GT_FC.



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

*&      Form  BTN_ADD

*&---------------------------------------------------------------------*

*       #### ## ### 1# ##

*----------------------------------------------------------------------*




FORM BTN_ADD .

  DATA : LV_EBELP TYPE ZEKPO24-EBELP.



  "## ## ## ### ### (10, 20, 30, ...)

  PERFORM GET_NEXT_EBELP CHANGING LV_EBELP.

  CLEAR GS_ITEM.

  GS_ITEM-EBELP = LV_EBELP.



  APPEND GS_ITEM TO GT_ITEM.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  GET_NEXT_EBELP

*&---------------------------------------------------------------------*

*       #### # ## ### ##

*----------------------------------------------------------------------*




FORM GET_NEXT_EBELP CHANGING P_EBELP TYPE ZEKPO24-EBELP.

  DATA: LV_MAX_EBELP TYPE ZEKPO24-EBELP,

        LV_INT       TYPE I.






*  " ZEKPO24 ##### ## EBELP ##

*  SELECT MAX( EBELP ) INTO LV_MAX_EBELP FROM ZEKPO24.






  "GT_OUTPUT## ## EBELOP ##

  LOOP AT GT_ITEM INTO DATA(LS_LINE).

    IF LS_LINE-EBELP > LV_MAX_EBELP.

      LV_MAX_EBELP = LS_LINE-EBELP.

    ENDIF.

  ENDLOOP.



  IF SY-SUBRC = 0 AND LV_MAX_EBELP IS NOT INITIAL.

    " NUMC # ### ##

    LV_INT = LV_MAX_EBELP.

    " 10 ## ##

    LV_INT = LV_INT + 10.

    " ## NUMC #### ##

    P_EBELP = LV_INT.

  ELSE.

    " # # ##

    P_EBELP = '00010'.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  BTN_DEL

*&---------------------------------------------------------------------*

*       ### ## ## (#### ### ##)

*----------------------------------------------------------------------*




FORM BTN_DEL .

  "### # ##

  DATA : LT_ROWS TYPE LVC_T_ROW,

         LS_ROW TYPE LVC_S_ROW.

  "# ###

  DATA : LV_NUM TYPE N LENGTH 5 VALUE '00010',

         LV_INT TYPE I.





  "1. ### ROW INDEX ####

  CALL METHOD GC_GRID->GET_SELECTED_ROWS

    IMPORTING

      ET_INDEX_ROWS = LT_ROWS.



  "2. ### # ### ## ### ##

  IF LT_ROWS IS INITIAL.

    MESSAGE '### ## #####.' TYPE 'S'.

    RETURN.

  ENDIF.



  "3. ### ## ## -> # INDEX## ##

  SORT LT_ROWS BY INDEX DESCENDING.



  "4. ### ##

  LOOP AT LT_ROWS INTO LS_ROW.

    DELETE GT_ITEM INDEX LS_ROW-INDEX.

  ENDLOOP.



  "5. ## ### ###

  LOOP AT GT_ITEM INTO GS_ITEM.

    AT FIRST.

      GS_ITEM-EBELP = LV_NUM.

      MODIFY GT_ITEM FROM GS_ITEM TRANSPORTING EBELP.

      CONTINUE.

    ENDAT.



    " NUMC # ### ##

    LV_INT = LV_NUM.

    " 10 ## ##

    LV_INT = LV_INT + 10.

    " ## NUMC #### ##

    LV_NUM = LV_INT.

    GS_ITEM-EBELP = LV_NUM.



    MODIFY GT_ITEM FROM GS_ITEM TRANSPORTING EBELP.

  ENDLOOP.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  BTN_CREATE

*&---------------------------------------------------------------------*

*       #### ##

*----------------------------------------------------------------------*




FORM BTN_CREATE .

  DATA : LT_ALV LIKE TABLE OF GS_ITABLE,

         LS_ALV LIKE GS_ITABLE.



  "# ### ## ##

  IF GT_ITEM IS INITIAL.

    MESSAGE '### ### ######' TYPE 'E'.

    RETURN .

  ENDIF.



  LOOP AT GT_ITEM INTO GS_ITEM.

    IF GS_ITEM-MWSKZ IS INITIAL

      OR GS_ITEM-MATNR IS INITIAL

      OR GS_ITEM-MAKTX IS INITIAL

      OR GS_ITEM-MENGE IS INITIAL

      OR GS_ITEM-MEINS IS INITIAL

      OR GS_ITEM-PRDAT IS INITIAL

      OR GS_ITEM-WERKS IS INITIAL

      OR GS_ITEM-LGORT IS INITIAL

      OR GS_ITEM-WAERS IS INITIAL

      OR GS_ITEM-STPRS IS INITIAL.

      MESSAGE '### ### ######' TYPE 'E'.

      RETURN .

    ENDIF.



  ENDLOOP.



  "1. #### ## ##

  DATA : LV_EBELN LIKE ZEKKO24-EBELN VALUE '4500000000'.

  PERFORM GET_NEXT_EBELN CHANGING LV_EBELN.



  "2. #### ## ### ##

  MOVE-CORRESPONDING GS_HEADER TO GS_HTABLE.

  GS_HTABLE-EBELN = LV_EBELN.

  GS_HTABLE-WAERS = GS_ITEM-WAERS.

  INSERT ZEKKO24 FROM GS_HTABLE.



  "3. #### ## ### ##

  CALL METHOD GC_GRID->CHECK_CHANGED_DATA.

  LOOP AT GT_ITEM INTO GS_ITEM.

    CLEAR GS_ITABLE.

    MOVE-CORRESPONDING GS_ITEM TO GS_ITABLE.

    GS_ITABLE-EBELN = LV_EBELN.



    INSERT ZEKPO24 FROM GS_ITABLE.

  ENDLOOP.



  MESSAGE 'PO' && LV_EBELN && ' ## #######' TYPE 'I'.



ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  GET_NEXT_EBELN

*&---------------------------------------------------------------------*

*       #### ## ## ##

*----------------------------------------------------------------------*




FORM GET_NEXT_EBELN  CHANGING P_EBELN.

  DATA : LV_MAX LIKE ZEKKO24-EBELN.



  SELECT MAX( EBELN ) INTO LV_MAX FROM ZEKKO24.



  IF LV_MAX <> 0.

    P_EBELN = LV_MAX + 1.

  ELSE.

    P_EBELN = '4500000000'.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  ALV_HANDLER_DATA_CHANGED

*&---------------------------------------------------------------------*

*       ## ## # ### ## ##

*----------------------------------------------------------------------*




FORM ALV_HANDLER_DATA_CHANGED  USING    P_DATA_CHANGED TYPE REF TO CL_ALV_CHANGED_DATA_PROTOCOL

                                        P_ONF4

                                        P_ONF4_BEFORE

                                        P_ONF4_AFTER

                                        P_UCOMM.

  DATA : LS_MODI TYPE LVC_S_MODI.



  LOOP AT P_DATA_CHANGED->MT_GOOD_CELLS INTO LS_MODI.

    "# ## ##

    IF LS_MODI-VALUE IS INITIAL.

      CONTINUE.

    ENDIF.



    IF LS_MODI-FIELDNAME = 'MATNR'. "####

      READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.

      GS_ITEM-MATNR = LS_MODI-VALUE.

      "### ## # ###

      SELECT SINGLE ZMATNAME FROM ZMARA24

        INTO GS_ITEM-MAKTX

        WHERE ZMATNR = GS_ITEM-MATNR.

      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.



    IF LS_MODI-FIELDNAME = 'MAKTX'. "###

      READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.

      GS_ITEM-MAKTX = LS_MODI-VALUE.

      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.



    IF LS_MODI-FIELDNAME = 'MENGE'. "PO##

      READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.

      GS_ITEM-MENGE = LS_MODI-VALUE.

      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.



    IF LS_MODI-FIELDNAME = 'STPRS'. "##

      READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.

      GS_ITEM-STPRS = LS_MODI-VALUE.

      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.



    IF LS_MODI-FIELDNAME = 'MEINS'. "##

      READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.

      GS_ITEM-MEINS = LS_MODI-VALUE.

      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.



    IF LS_MODI-FIELDNAME = 'WAERS'. "##

      READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.

      GS_ITEM-WAERS = LS_MODI-VALUE.

      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.



    IF LS_MODI-FIELDNAME = 'MWSKZ'. "####

      READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.

      GS_ITEM-MWSKZ = LS_MODI-VALUE.

      IF GS_ITEM-MWSKZ <> 'V1' OR GS_ITEM-MWSKZ <> 'V2'

        OR GS_ITEM-MWSKZ <> 'V3' OR GS_ITEM-MWSKZ <> 'V4'

        OR GS_ITEM-MWSKZ <> 'V5'.

        MESSAGE '#### ## #### ###.' TYPE 'I'.



        GS_ITEM-MWSKZ = 'V1'.

        P_DATA_CHANGED->MODIFY_CELL(

          EXPORTING I_ROW_ID = LS_MODI-ROW_ID

                    I_FIELDNAME = 'MWSKZ'

                    I_VALUE = GS_ITEM-MWSKZ ).

      ENDIF.

      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.



    IF LS_MODI-FIELDNAME = 'PRDAT'. "###

      READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.

      GS_ITEM-PRDAT = LS_MODI-VALUE.

      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.



    IF LS_MODI-FIELDNAME = 'WERKS'. "###

      READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.

      GS_ITEM-WERKS = LS_MODI-VALUE.

      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.



    IF LS_MODI-FIELDNAME = 'LGORT'. "####

      READ TABLE GT_ITEM INTO GS_ITEM INDEX LS_MODI-ROW_ID.

      GS_ITEM-LGORT = LS_MODI-VALUE.

      MODIFY GT_ITEM FROM GS_ITEM INDEX LS_MODI-ROW_ID.

    ENDIF.

  ENDLOOP.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  ALV_DATA_CHANGED_FINISHED

*&---------------------------------------------------------------------*

*       ## ## ## ## ### VALID ## # ##

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



    "2. GS_ITEM# ## VALID #### PERFORM# ##

    PERFORM VALID_ITEM USING LS_GOOD-FIELDNAME CHANGING GS_ITEM.



    MODIFY GT_ITEM FROM GS_ITEM INDEX LS_GOOD-ROW_ID.

  ENDLOOP.



  "3. ALV REFRESH

  PERFORM REFRESH.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  VALID_ITEM

*&---------------------------------------------------------------------*

*       GS_ITEM# ## # VALID ##

*----------------------------------------------------------------------*




FORM VALID_ITEM  USING    P_GOOD_FIELDNAME

                 CHANGING P_ITEM LIKE GS_ITEM.



  DATA : LS_ITEM LIKE GS_ITEM.



  CASE P_GOOD_FIELDNAME.

    "1. #### - ZMARA24 ##

    WHEN 'MATNR'.

      SELECT SINGLE ZMATNR

        FROM ZMARA24

        INTO LS_ITEM-MATNR

        WHERE ZMATNR = P_ITEM-MATNR.



    IF SY-SUBRC <> 0.

      CLEAR P_ITEM-MATNR.

      MESSAGE '#### ## #######' TYPE 'I'.

    ENDIF.



    "2. ### - ##### #### # (TODO - ## # ##)

    WHEN 'PRDAT'.

      IF P_ITEM-PRDAT < GS_HEADER-BEDAT. "BEDAT = ###

        CLEAR P_ITEM-PRDAT.

        MESSAGE '#### ##### #### ###.' TYPE 'I'.

      ENDIF.



  "3. ### - ZMARA24 ##

    WHEN 'WERKS'.

      SELECT SINGLE WERKS

        FROM ZMARA24

        INTO LS_ITEM-WERKS

        WHERE WERKS = P_ITEM-WERKS.



    IF SY-SUBRC <> 0.

      CLEAR P_ITEM-WERKS.

      MESSAGE '#### ## ######.' TYPE 'I'.

    ENDIF.



  "4. #### - ## ## + ### + ####

    WHEN 'LGORT'.

      SELECT SINGLE LGORT

        FROM ZMARA24

        INTO LS_ITEM-LGORT

        WHERE ZMATNR = P_ITEM-MATNR

          AND WERKS = P_ITEM-WERKS

          AND LGORT = P_ITEM-LGORT.



    IF SY-SUBRC <> 0.

      CLEAR P_ITEM-LGORT.

      MESSAGE '## ### # ##### ####.' TYPE 'I'.

    ENDIF.



  ENDCASE.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CLASS_EVENT

*&---------------------------------------------------------------------*

*       ### ### ##

*----------------------------------------------------------------------*




FORM CLASS_EVENT .

  "### ### ##

  CREATE OBJECT GO_EVENT.



  CALL METHOD GC_GRID->REGISTER_EDIT_EVENT

    EXPORTING

      I_EVENT_ID = CL_GUI_ALV_GRID=>MC_EVT_MODIFIED.



  SET HANDLER GO_EVENT->HANDLER_DATA_CHANGED FOR GC_GRID.

  SET HANDLER GO_EVENT->HANDLER_DATA_CHANGED_FINISHED FOR GC_GRID.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  VALID_INPUT_DATA

*&---------------------------------------------------------------------*

*       ### ##

*----------------------------------------------------------------------*




FORM VALID_INPUT_DATA.

  SELECT * FROM ZLFB1_24

    INTO CORRESPONDING FIELDS OF TABLE GT_LFB1

    WHERE BUKRS = P_BUKRS

      AND LIFNR = P_LIFNR.



  IF GT_LFB1 IS INITIAL.

    MESSAGE '### #### #### ####' TYPE 'I'.

    STOP.

  ENDIF.

ENDFORM.
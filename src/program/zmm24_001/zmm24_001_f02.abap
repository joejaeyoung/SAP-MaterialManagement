
*&---------------------------------------------------------------------*

*&  Include           ZMM24_001_F02

*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*

*&      Form  GET_VENDOR_DATA

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*

*  -->  p1        text

*  <--  p2        text

*----------------------------------------------------------------------*




FORM GET_VENDOR_DATA .

  CLEAR GT_ALV_OUTPUT.

  CLEAR GS_ALV_OUTPUT.



  SELECT * FROM ZLFA1_24 AS A

    INNER JOIN ZLFB1_24 AS B ON A~LIFNR = B~LIFNR

    INNER JOIN ZLFM1_24 AS C ON A~LIFNR = C~LIFNR

    INTO CORRESPONDING FIELDS OF TABLE GT_ALV_OUTPUT

    WHERE A~LIFNR = P_LIFNR "#####

      AND BUKRS = P_BUKRS. "####KMOLMKOLMLML;,P,PKMMKIOP.;['.[;.[;.





  IF GT_ALV_OUTPUT IS INITIAL.

    MESSAGE '#### #### #### ####' TYPE 'I'.

    STOP.

  ENDIF.



  LOOP AT GT_ALV_OUTPUT INTO GS_ALV_OUTPUT.

  ENDLOOP.

ENDFORM.




*&---------------------------------------------------------------------*

*&      Form  CREATE_OBJECT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*

*  -->  p1        text

*  <--  p2        text

*----------------------------------------------------------------------*




FORM CREATE_OBJECT .

  CREATE OBJECT GC_DOCKING

    EXPORTING

      REPID = SY-REPID

      DYNNR = SY-DYNNR

      EXTENSION = 2000

      NAME = '### ##'.



  CREATE OBJECT GC_GRID

   EXPORTING

     I_PARENT = GC_DOCKING.

ENDFORM.




*&---------------------------------------------------------------------*

*&      Form  FIELD_CATALOG

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*

*  -->  p1        text

*  <--  p2        text

*----------------------------------------------------------------------*




FORM FIELD_CATALOG .

  CLEAR : GS_FC, GT_FC.



  GS_FC-COL_POS = 1.

  GS_FC-FIELDNAME = 'LIFNR'.

  GS_FC-COLTEXT = '#####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 2.

  GS_FC-FIELDNAME = 'NAME1'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 3.

  GS_FC-FIELDNAME = 'LAND1'.

  GS_FC-COLTEXT = '###'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 4.

  GS_FC-FIELDNAME = 'KTOKK'.

  GS_FC-COLTEXT = '#####'.

  APPEND GS_FC TO GT_FC.



  IF GS_ALV_OUTPUT-KTOKK = '3000'.

    CLEAR GS_FC.

    GS_FC-COL_POS = 5.

    GS_FC-FIELDNAME = 'STCD1'.

    GS_FC-COLTEXT = '####'.

    GS_FC-EDIT = 'X'.

    APPEND GS_FC TO GT_FC.

  ENDIF.



  IF GS_ALV_OUTPUT-KTOKK <> '2000' AND GS_ALV_OUTPUT-KTOKK <> '3000'.

    CLEAR GS_FC.

    GS_FC-COL_POS = 6.

    GS_FC-FIELDNAME = 'STCD2'.

    GS_FC-COLTEXT = '#####'.

    GS_FC-EDIT = 'X'.

    APPEND GS_FC TO GT_FC.

  ENDIF.



  CLEAR GS_FC.

  GS_FC-COL_POS = 7.

  GS_FC-FIELDNAME = 'STRAS'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 8.

  GS_FC-FIELDNAME = 'BUKRS'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 9.

  GS_FC-FIELDNAME = 'AKONT'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 10.

  GS_FC-FIELDNAME = 'ZTERM'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 11.

  GS_FC-FIELDNAME = 'EKORG'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 12.

  GS_FC-FIELDNAME = 'EKGRP'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 10.

  GS_FC-FIELDNAME = 'WAERS'.

  GS_FC-COLTEXT = '##'.

  APPEND GS_FC TO GT_FC.



  CLEAR GS_FC.

  GS_FC-COL_POS = 11.

  GS_FC-FIELDNAME = 'MWSKZ'.

  GS_FC-COLTEXT = '####'.

  APPEND GS_FC TO GT_FC.

ENDFORM.




*&---------------------------------------------------------------------*

*&      Form  ALV_LAYOUT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*

*  -->  p1        text

*  <--  p2        text

*----------------------------------------------------------------------*




FORM ALV_LAYOUT .

  GS_LAYOUT-ZEBRA = 'X'.

ENDFORM.




*&---------------------------------------------------------------------*

*&      Form  CALL_ALV

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*

*  -->  p1        text

*  <--  p2        text

*----------------------------------------------------------------------*




FORM CALL_ALV .

  DATA : GT_EXCLUDE TYPE UI_FUNCTIONS.



  "1. ### ## ## ## ##

  APPEND CL_GUI_ALV_GRID=>MC_FC_LOC_INSERT_ROW TO GT_EXCLUDE.

  APPEND CL_GUI_ALV_GRID=>MC_FC_LOC_APPEND_ROW TO GT_EXCLUDE.

  APPEND CL_GUI_ALV_GRID=>MC_FC_LOC_DELETE_ROW TO GT_EXCLUDE.

  APPEND CL_GUI_ALV_GRID=>MC_FC_LOC_COPY_ROW TO GT_EXCLUDE.

  APPEND CL_GUI_ALV_GRID=>MC_FC_LOC_CUT TO GT_EXCLUDE.

  APPEND CL_GUI_ALV_GRID=>MC_FC_LOC_PASTE TO GT_EXCLUDE.

  APPEND CL_GUI_ALV_GRID=>MC_FC_LOC_PASTE_NEW_ROW TO GT_EXCLUDE.





  CALL METHOD GC_GRID->SET_TABLE_FOR_FIRST_DISPLAY

    EXPORTING

      IS_LAYOUT = GS_LAYOUT

      IT_TOOLBAR_EXCLUDING = GT_EXCLUDE

    CHANGING

      IT_OUTTAB = GT_ALV_OUTPUT

      IT_FIELDCATALOG = GT_FC.





ENDFORM.




*&---------------------------------------------------------------------*

*&      Form  ALV_HANDLER_DATA_CHANGED

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*

*      -->P_ER_DATA_CHANGED  text

*      -->P_E_ONF4  text

*      -->P_E_ONF4_BEFORE  text

*      -->P_E_ONF4_AFTER  text

*      -->P_E_UCOMM  text

*----------------------------------------------------------------------*




FORM ALV_HANDLER_DATA_CHANGED  USING    P_DATA_CHANGED TYPE REF TO CL_ALV_CHANGED_DATA_PROTOCOL

                                        P_ONF4

                                        P_ONF4_BEFORE

                                        P_ONF4_AFTER

                                        P_UCOMM.

  DATA : LS_MODI TYPE LVC_S_MODI.

  DATA : LV_BUKRS LIKE ZLFB1_24-BUKRS.

  DATA : LV_ANSWER TYPE C.

  DATA : LV_OLD_VALUE TYPE ZLFA1_24-STCD2.

  DATA : LS_LINE TYPE ZLFA1_24. "## ### #### ######



  LOOP AT P_DATA_CHANGED->MT_GOOD_CELLS INTO LS_MODI.

    "### ## ##

    IF LS_MODI-FIELDNAME = 'STCD2'.

      PERFORM POPUP_TO_CONFIRM CHANGING LV_ANSWER.



      READ TABLE GT_ALV_OUTPUT INTO GS_ALV_OUTPUT INDEX LS_MODI-ROW_ID.

      LV_OLD_VALUE = GS_ALV_OUTPUT-STCD2.

      GS_ALV_OUTPUT-STCD2 = LS_MODI-VALUE.



      IF GS_ALV_OUTPUT-STCD2 IS INITIAL.

        MESSAGE '### ### ### # ####' TYPE 'I'.

        CALL METHOD P_DATA_CHANGED->MODIFY_CELL

          EXPORTING

            I_ROW_ID = LS_MODI-ROW_ID

            I_FIELDNAME = LS_MODI-FIELDNAME

            I_VALUE = LV_OLD_VALUE.

        EXIT.

      ENDIF.



      IF LV_ANSWER = '1'.

        MODIFY GT_ALV_OUTPUT FROM GS_ALV_OUTPUT INDEX LS_MODI-ROW_ID.

        MOVE-CORRESPONDING GS_ALV_OUTPUT TO LS_LINE.

        MODIFY ZLFA1_24 FROM LS_LINE.

        PERFORM GET_VENDOR_DATA.

      ELSE.

        CALL METHOD P_DATA_CHANGED->MODIFY_CELL

          EXPORTING

            I_ROW_ID = LS_MODI-ROW_ID

            I_FIELDNAME = LS_MODI-FIELDNAME

            I_VALUE = LV_OLD_VALUE.

      ENDIF.

    ENDIF.



    "#### ##

    IF LS_MODI-FIELDNAME = 'STCD1'.

      PERFORM POPUP_TO_CONFIRM CHANGING LV_ANSWER.



      READ TABLE GT_ALV_OUTPUT INTO GS_ALV_OUTPUT INDEX LS_MODI-ROW_ID.

      LV_OLD_VALUE = GS_ALV_OUTPUT-STCD1.

      GS_ALV_OUTPUT-STCD1 = LS_MODI-VALUE.



      IF GS_ALV_OUTPUT-STCD1 IS INITIAL.

        MESSAGE '##### ### # ####' TYPE 'I'.

        CALL METHOD P_DATA_CHANGED->MODIFY_CELL

          EXPORTING

            I_ROW_ID = LS_MODI-ROW_ID

            I_FIELDNAME = LS_MODI-FIELDNAME

            I_VALUE = LV_OLD_VALUE.

        EXIT.

      ENDIF.



      IF LV_ANSWER = '1'.

        MODIFY GT_ALV_OUTPUT FROM GS_ALV_OUTPUT INDEX LS_MODI-ROW_ID.

        MOVE-CORRESPONDING GS_ALV_OUTPUT TO LS_LINE.

        MODIFY ZLFA1_24 FROM LS_LINE.

        PERFORM GET_VENDOR_DATA.

      ELSE.

        CALL METHOD P_DATA_CHANGED->MODIFY_CELL

          EXPORTING

            I_ROW_ID = LS_MODI-ROW_ID

            I_FIELDNAME = LS_MODI-FIELDNAME

            I_VALUE = LV_OLD_VALUE.

      ENDIF.

    ENDIF.

  ENDLOOP.

  PERFORM REFRESH.



ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  POPUP_TO_CONFIRM

*&---------------------------------------------------------------------*

*       ##### ## ## ## ##

*----------------------------------------------------------------------*




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








*&---------------------------------------------------------------------*

*&      Form  REFRESH

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*

*  -->  p1        text

*  <--  p2        text

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

*&      Form  UPDATE_DATA

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*

*  -->  p1        text

*  <--  p2        text

*----------------------------------------------------------------------*




FORM UPDATE_DATA .

  DATA : LS_LINE TYPE ZLFA1_24. "## ### #### ######

  CLEAR GS_ALV_OUTPUT.



  LOOP AT GT_ALV_OUTPUT INTO GS_ALV_OUTPUT.

    MOVE-CORRESPONDING GS_ALV_OUTPUT TO LS_LINE.



    MODIFY ZLFA1_24 FROM LS_LINE.

  ENDLOOP.



ENDFORM.




*&---------------------------------------------------------------------*

*&      Form  CLASS_EVENT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*

*  -->  p1        text

*  <--  p2        text

*----------------------------------------------------------------------*




FORM CLASS_EVENT .

  "### ### ##

  CREATE OBJECT GO_EVENT.



  CALL METHOD GC_GRID->REGISTER_EDIT_EVENT

    EXPORTING

      I_EVENT_ID = CL_GUI_ALV_GRID=>MC_EVT_MODIFIED.



  SET HANDLER GO_EVENT->HANDLER_DATA_CHANGED FOR GC_GRID.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  ALV_DATA_CHANGED_FINISHED

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




FORM ALV_DATA_CHANGED_FINISHED  USING    P_E_MODIFIED

                                         P_ET_GOOD_CELLS.



ENDFORM.

*&---------------------------------------------------------------------*

*&  Include           ZMM24_001_F01_SCR

*&---------------------------------------------------------------------*



*&---------------------------------------------------------------------*

*&      Form  SCREEN_MODIFY

*&---------------------------------------------------------------------*

*       ## ### ##, ## ### ## ####.

*----------------------------------------------------------------------*




FORM SCREEN_MODIFY .

  LOOP AT SCREEN.

    "1. ## ## ## #

    IF RB_CR = 'X'.

      "P_LIFNR (#####) ##

      IF SCREEN-GROUP1 = 'DSP'. "#### ##(#####) ##

        SCREEN-ACTIVE = 0.      "## ####

        SCREEN-INVISIBLE = 1.   "## ##

        SCREEN-REQUIRED = 0.    "## ### ##

        MODIFY SCREEN.

      ENDIF.



      "P_KTOKK (#####) ##

      IF SCREEN-GROUP1 = 'CR1'.

        SCREEN-ACTIVE = 1.      "## ###

        SCREEN-INVISIBLE = 0.   "## ##

        SCREEN-REQUIRED = 2.    "## ## ##

        MODIFY SCREEN.

      ENDIF.

    ENDIF.



    "2. ## ## ## #

    IF RB_DSP = 'X'.

      "P_KTOKK (#####) ##

      IF SCREEN-GROUP1 = 'CR1'. "## ## ##(#####) ##

        SCREEN-ACTIVE = 0.      "## ####

        SCREEN-INVISIBLE = 1.   "## ##

        SCREEN-REQUIRED = 0.    "## ### ##

        MODIFY SCREEN.

      ENDIF.



      "P_LIFNR (#####) ##

      IF SCREEN-GROUP1 = 'DSP'. "#### ##(#####) ##

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

*       #### ## ##### ####.

*----------------------------------------------------------------------*




FORM VALID_SCREEN_INPUT .

  IF RB_CR = 'X'. "### ##

    IF P_KTOKK IS INITIAL OR P_BUKRS IS INITIAL.

      MESSAGE '## ### ######' TYPE 'I'.

      STOP.

    ENDIF.

  ELSE. "### ##

    IF P_BUKRS IS INITIAL OR P_LIFNR IS INITIAL.

      MESSAGE '## ### ######' TYPE 'I'.

      STOP.

    ENDIF.

  ENDIF.





ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  SAVE_NEW_VENDOR

*&---------------------------------------------------------------------*

*       ### ## ## ##

*----------------------------------------------------------------------*




FORM SAVE_NEW_VENDOR .

  "1. ##### #### ####

  DATA : LV_MAX_LIFNR TYPE ZLFA1_24-LIFNR.

  PERFORM GET_MAX_LIFNR CHANGING LV_MAX_LIFNR.



  "2. ## ## # #### ##

  PERFORM GET_VALUE_LAYOUT USING LV_MAX_LIFNR.



  "3. ## ## ##

  PERFORM VALIDATE_INPUT.

  IF SY-SUBRC <> 0.

    RETURN.

  ENDIF.



  "4. DB ##

  PERFORM SAVE_TO_DATABASE USING LV_MAX_LIFNR.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  GET_MAX_LIFNR

*&---------------------------------------------------------------------*

*       ## ### ### ## ## ### ###

*----------------------------------------------------------------------*




FORM GET_MAX_LIFNR  CHANGING P_MAX_LIFNR.

  DATA : LV_MAX_LIFNR TYPE I.



  SELECT MAX( LIFNR ) INTO P_MAX_LIFNR FROM ZLFA1_24.



  IF SY-SUBRC = 0 AND P_MAX_LIFNR IS NOT INITIAL.

    LV_MAX_LIFNR = P_MAX_LIFNR. "### ### ##

    LV_MAX_LIFNR = LV_MAX_LIFNR + 1.

    P_MAX_LIFNR = LV_MAX_LIFNR. "### ## ### ##



    "LEADING ZERO ##

    CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'

      EXPORTING

        INPUT = P_MAX_LIFNR

      IMPORTING

        OUTPUT = P_MAX_LIFNR.

  ELSE.

    " # ## #####

    P_MAX_LIFNR = '1000000000'.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  VALIDATE_INPUT

*&---------------------------------------------------------------------*

*       ### ##

*----------------------------------------------------------------------*




FORM VALIDATE_INPUT .



ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  SAVE_TO_DATABASE

*&---------------------------------------------------------------------*

*       ## ### DATABASE# ##

*----------------------------------------------------------------------*




FORM SAVE_TO_DATABASE  USING    P_MAX_LIFNR.

  "1. LFA1 (#####) INSERT

  INSERT ZLFA1_24 FROM GS_LFA1.




*  IF SY-SUBRC <> 0.

*    MESSAGE '##### ## ##' TYPE 'E'.

*    ROLLBACK WORK.

*    RETURN.

*  ENDIF.






  "2. LFB1 (#### ###) INSERT

  INSERT ZLFB1_24 FROM GS_LFB1.

  IF SY-SUBRC <> 0.

    MESSAGE '#### ### ## ##' TYPE 'E'.

    ROLLBACK WORK.

    RETURN.

  ENDIF.



  "3. LFM1 (#### ###) INSERT

  INSERT ZLFM1_24 FROM GS_LFM1.

  IF SY-SUBRC <> 0.

    MESSAGE '#### ### ## ##' TYPE 'E'.

    ROLLBACK WORK.

    RETURN.

  ENDIF.



  MESSAGE |### { P_MAX_LIFNR }# #######.| TYPE 'S'.



  CLEAR: GS_LFA1, GS_LFB1, GS_LFM1.

  GV_INPUT_MODE = 'V'.

ENDFORM.




*&---------------------------------------------------------------------*

*&      Form  GET_VALUE_LAYOUT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




FORM GET_VALUE_LAYOUT USING P_MAX_LIFNR.

  CLEAR : GS_LFA1, GS_LFB1, GS_LFM1.



  "LFA1

  GS_LFA1-LIFNR = P_MAX_LIFNR.

  GS_LFA1-NAME1 = GV_NAME1.

  GS_LFA1-LAND1 = GV_LAND1.

  GS_LFA1-STRAS = GV_STRAS.

  GS_LFA1-KTOKK = GV_KTOKK.

  GS_LFA1-STCD1 = GV_STCD1.

  GS_LFA1-STCD2 = GV_STCD2.



  "LFB1

  GS_LFB1-LIFNR = P_MAX_LIFNR.

  GS_LFB1-BUKRS = GV_BUKRS.

  GS_LFB1-AKONT = GV_AKONT.

  GS_LFB1-ZTERM = GV_ZTERM.



  "LFM1

  GS_LFM1-LIFNR = P_MAX_LIFNR.

  GS_LFM1-EKORG = GV_EKORG.

  GS_LFM1-EKGRP = GV_EKGRP.

  GS_LFM1-WAERS = GV_WAERS.

  GS_LFM1-MWSKZ = GV_MWSKZ.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  CHECK_INPUT_VENDOR_DATA

*&---------------------------------------------------------------------*

*       ## ### ### ### ##

*----------------------------------------------------------------------*




FORM CHECK_INPUT_VENDOR_DATA CHANGING P_FLAG.

  P_FLAG = 1.



  "1. ####

  IF GV_NAME1 IS INITIAL.

    P_FLAG = 0.

  ENDIF.



  "2. ###

  IF GV_LAND1 IS INITIAL.

    P_FLAG = 0.

  ENDIF.



  "3. ####

  IF P_KTOKK = '3000' AND P_KTOKK <> '2000'.  "3000## ##

    IF GV_STCD1 IS INITIAL.

      P_FLAG = 0.

    ENDIF.

  ENDIF.



  "4. ### ##

  IF P_KTOKK <> '3000' AND P_KTOKK <> '2000'.  "2000, 3000## ##

    IF GV_STCD2 IS INITIAL.

      P_FLAG = 0.

    ENDIF.

  ENDIF.



  "5. ##

  IF GV_STRAS IS INITIAL.

    P_FLAG = 0.

  ENDIF.



  "6. ####

  IF GV_AKONT IS INITIAL.

    P_FLAG = 0.

  ENDIF.



  "7. ## ##

  IF GV_ZTERM IS INITIAL.

    P_FLAG = 0.

  ENDIF.



  "8. ####

  IF GV_EKORG IS INITIAL.

    P_FLAG = 0.

  ENDIF.



  "9. ####

  IF GV_EKGRP IS INITIAL.

    P_FLAG = 0.

  ENDIF.



  "10. ######

  IF GV_WAERS IS INITIAL.

    P_FLAG = 0.

  ENDIF.



  "11. ####

  IF GV_MWSKZ IS INITIAL.

    P_FLAG = 0.

  ENDIF.

ENDFORM.






*&---------------------------------------------------------------------*

*&      Form  ERASE_ALL_DATA

*&---------------------------------------------------------------------*

*       ## #### ## ### ## CLEAR

*----------------------------------------------------------------------*




FORM ERASE_ALL_DATA .

  CLEAR GV_NAME1.

  CLEAR GV_LAND1.

  CLEAR GV_STRAS.

  CLEAR GV_STCD1.

  CLEAR GV_STCD2.

  CLEAR GV_AKONT.

  CLEAR GV_ZTERM.

  CLEAR GV_EKORG.

  CLEAR GV_EKGRP.

  CLEAR GV_WAERS.

  CLEAR GV_MWSKZ.

  CLEAR ZLFB1_24-AKONT.

  CLEAR ZLFB1_24-ZTERM.

  CLEAR ZLFM1_24-MWSKZ.

ENDFORM.
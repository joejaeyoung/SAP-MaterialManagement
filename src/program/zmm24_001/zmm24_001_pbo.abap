
*&---------------------------------------------------------------------*

*&  Include           ZMM24_001_PBO

*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*

*&      Module  STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




MODULE STATUS_0100 OUTPUT.

  SET PF-STATUS 'S100'.

  SET TITLEBAR 'T100'.

ENDMODULE.




*&---------------------------------------------------------------------*

*&      Module  PBO_0100  OUTPUT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




MODULE PBO_0100 OUTPUT.

  LOOP AT SCREEN.

    IF SCREEN-GROUP1 = 'INP' OR SCREEN-GROUP2 = 'INP'.

      IF GV_INPUT_MODE = 'A'. "## ### #

        IF SCREEN-NAME = 'GV_BUKRS' OR SCREEN-NAME = 'GV_KTOKK'.

          SCREEN-INPUT = 0.

        ELSE.

          SCREEN-INPUT = 1.

        ENDIF.

      ELSE.

        SCREEN-INPUT = 0.

      ENDIF.

      MODIFY SCREEN.

    ENDIF.



    IF SCREEN-GROUP1 = 'M1'. "M1 #### (###, ##) ##

      IF P_KTOKK = '3000'.

        SCREEN-ACTIVE = '1'. "####

      ELSE.

        SCREEN-ACTIVE = '0'. "## (##### #### ##)

      ENDIF.

      MODIFY SCREEN.

    ENDIF.



    IF SCREEN-GROUP1 = 'M2'. "M2 ### ## (###, ##) ##

      IF P_KTOKK = '2000' OR P_KTOKK = '3000'.

        SCREEN-ACTIVE = '0'.  "##

      ELSE.

        SCREEN-ACTIVE = '1'.  "##

      ENDIF.

      MODIFY SCREEN.

    ENDIF.

  ENDLOOP.

ENDMODULE.




*&---------------------------------------------------------------------*

*&      Module  STATUS_0200  OUTPUT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




MODULE STATUS_0200 OUTPUT.

  SET PF-STATUS 'S200'.

  SET TITLEBAR 'T200'.

ENDMODULE.




*&---------------------------------------------------------------------*

*&      Module  SET_ALV  OUTPUT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




MODULE SET_ALV OUTPUT.

  IF GC_DOCKING IS INITIAL.

    PERFORM CREATE_OBJECT.

    PERFORM FIELD_CATALOG.

    PERFORM ALV_LAYOUT.

    "PERFORM ALV_SORT.

    PERFORM CLASS_EVENT.

    PERFORM CALL_ALV.

  ELSE.

    PERFORM REFRESH.

  ENDIF.

ENDMODULE.
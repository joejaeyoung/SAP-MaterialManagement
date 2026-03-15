
*&---------------------------------------------------------------------*

*&  Include           ZMM24_002_PAI

*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*

*&      Module  USER_COMMAND_0100  INPUT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0100 INPUT.

  CASE OK_CODE.

    WHEN 'BTN_ADD'.

      PERFORM BTN_ADD.

    WHEN 'BTN_DEL'.

      PERFORM BTN_DEL.

    WHEN 'BTN_CREATE'.

      PERFORM BTN_CREATE.

      LEAVE TO SCREEN 0.

  ENDCASE.

  CALL METHOD GC_GRID->CHECK_CHANGED_DATA.

  PERFORM REFRESH.

ENDMODULE.




*&---------------------------------------------------------------------*

*&      Module  EXIT_COMMAND  INPUT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




MODULE EXIT_COMMAND INPUT.

  CASE OK_CODE.

    WHEN 'CANC'.

      LEAVE TO SCREEN 0.

    WHEN 'BACK'.

      LEAVE TO SCREEN 0.

    WHEN 'EXIT'.

      LEAVE PROGRAM.

    ENDCASE.

ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  USER_COMMAND_0101  INPUT

*&---------------------------------------------------------------------*

*       101 ### 100 #### ##

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0101 INPUT.

  CALL METHOD CL_GUI_CFW=>DISPATCH.

ENDMODULE.
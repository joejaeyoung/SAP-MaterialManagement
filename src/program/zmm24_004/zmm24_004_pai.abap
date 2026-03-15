
*&---------------------------------------------------------------------*

*&  Include           ZMM24_004_PAI

*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*

*&      Module  EXIT_COMMAND  INPUT

*&---------------------------------------------------------------------*

*       ## ##

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

*&      Module  USER_COMMAND_0100  INPUT

*&---------------------------------------------------------------------*

*       100# ## ## ### ##

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0100 INPUT.

  PERFORM REFRESH_LAYOUT_VALUE.



  CASE OK_CODE.

    WHEN 'BTN_SIMUL'. "##### ##

      PERFORM BTN_SIMUL.

    WHEN 'BTN_CREATE'.  "## ## ##

      PERFORM CHECK_DATA_BEFORE_CREATE.

      PERFORM BTN_CREATE.

      GV_SIGNAL = ICON_LED_RED.

      PERFORM GET_DATAS.

      PERFORM MODIFY_DATAS.

  ENDCASE.

  PERFORM REFRESH.



ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  USER_COMMAND_0110  INPUT

*&---------------------------------------------------------------------*

*       110 ### 100 #### ##

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0110 INPUT.

  CALL METHOD CL_GUI_CFW=>DISPATCH.

ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  USER_COMMAND_0120  INPUT

*&---------------------------------------------------------------------*

*       120 ### 100 #### ##

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0120 INPUT.

  CALL METHOD CL_GUI_CFW=>DISPATCH.

ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  USER_COMMAND_0200  INPUT

*&---------------------------------------------------------------------*

*       200# ## ## ### ##

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0200 INPUT.

  CALL METHOD CL_GUI_CFW=>DISPATCH.



  CASE OK_CODE.

    WHEN 'BTN_DEL'. "# ### ## ## ##

      PERFORM BTN_DEL.

      PERFORM REFRESH_SCREEN.




*    WHEN 'BTN_FI'.  "FI## (##)




    WHEN 'REFRESH_SCREEN'.  "##

      PERFORM REFRESH_SCREEN.

   ENDCASE.

   PERFORM REFRESH2.

ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  USER_COMMAND_0210  INPUT

*&---------------------------------------------------------------------*

*       210 ### 200 #### ##

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0210 INPUT.

  CALL METHOD CL_GUI_CFW=>DISPATCH.

ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  HANDLE_TAX_DATA  INPUT

*&---------------------------------------------------------------------*

*       #### ##

*----------------------------------------------------------------------*




MODULE HANDLE_TAX_DATA INPUT.

  IF OK_CODE = 'LB_TAX'.

    PERFORM CAL_TOTAL_BY_TAXCODE.

  ENDIF.

ENDMODULE.
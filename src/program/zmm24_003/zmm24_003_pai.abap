
*&---------------------------------------------------------------------*

*&  Include           ZMM24_003_PAI

*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*

*&      Module  USER_COMMAND_0100  INPUT

*&---------------------------------------------------------------------*

*       100# ## ## ### ##

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0100 INPUT.

  PERFORM REFRESH_LAYOUT_VALUE.



  CASE OK_CODE.

    WHEN 'BTN_CREATE'.  "## ## ##

      PERFORM CHECK_DATA_BEFORE_CREATE.

      PERFORM BTN_CREATE.

      PERFORM GET_PO_ITEMS.

      PERFORM MODIFY_PO_ITEMS.

      PERFORM FILL_HEAER. "## ## ## ## ###

   ENDCASE.

   PERFORM REFRESH.

ENDMODULE.






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

*&      Module  USER_COMMAND_0101  INPUT

*&---------------------------------------------------------------------*

*       101 ### 100 #### ##

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0101 INPUT.

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

*&      Module  USER_COMMAND_0201  INPUT

*&---------------------------------------------------------------------*

*       201 ### 200 #### ##

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0201 INPUT.

  CALL METHOD CL_GUI_CFW=>DISPATCH.

ENDMODULE.

*&---------------------------------------------------------------------*

*&  Include           ZMM24_001_PAI

*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*

*&      Module  USER_COMMAND_0100  INPUT

*&---------------------------------------------------------------------*

*       text

*----------------------------------------------------------------------*




MODULE USER_COMMAND_0100 INPUT.

  DATA : LV_FLAG TYPE I VALUE 0.



  GV_AKONT = ZLFB1_24-AKONT.

  GV_ZTERM = ZLFB1_24-ZTERM.

  GV_MWSKZ = ZLFM1_24-MWSKZ.



  CASE OK_CODE.

    WHEN 'BTN_ADD'.  " ## ## (## ## ##)

      GV_INPUT_MODE = 'A'.



    WHEN 'BTN_CREATE'.  " ##### ##

      GV_INPUT_MODE = 'V'.

      PERFORM CHECK_INPUT_VENDOR_DATA CHANGING LV_FLAG.



      IF LV_FLAG = 1.

        PERFORM SAVE_NEW_VENDOR.

        PERFORM ERASE_ALL_DATA.

      ELSE.

        MESSAGE '## #### ######' TYPE 'I'.

        GV_INPUT_MODE = 'A'.

      ENDIF.

  ENDCASE.

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
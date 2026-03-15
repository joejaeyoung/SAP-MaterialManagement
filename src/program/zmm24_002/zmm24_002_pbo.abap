
*&---------------------------------------------------------------------*

*&  Include           ZMM24_002_PBO

*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*

*&      Module  STATUS_0100  OUTPUT

*&---------------------------------------------------------------------*

*       100# ### PBO

*----------------------------------------------------------------------*




MODULE STATUS_0100 OUTPUT.

  SET PF-STATUS 'S100'.

  SET TITLEBAR 'T100'.

ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  STATUS_0101  OUTPUT

*&---------------------------------------------------------------------*




MODULE STATUS_0101 OUTPUT.




*  SET PF-STATUS 'xxxxxxxx'.

*  SET TITLEBAR 'xxx'.




ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  SET_ALV_101  OUTPUT

*&---------------------------------------------------------------------*

*       SUBSCREEN ##

*----------------------------------------------------------------------*




MODULE SET_ALV_101 OUTPUT.

  IF GC_CONTAINER IS INITIAL.

    "1. #### ##

    CREATE OBJECT GC_CONTAINER

      EXPORTING

        CONTAINER_NAME = 'CON01'.



    "2. ALV GRID ##

    CREATE OBJECT GC_GRID

      EXPORTING

        I_PARENT = GC_CONTAINER.



    "3. LAYOUT ##

    DATA : LS_LAYOUT TYPE LVC_S_LAYO.

    CLEAR LS_LAYOUT.

    LS_LAYOUT-NO_TOOLBAR = 'X'. "ALV ## ## ##



    "4. ###### ##

    PERFORM MAKE_FIELDCATALOG_101.



    "5. ### ### ##

    PERFORM CLASS_EVENT.



    "5. ALV # ##

    CALL METHOD GC_GRID->SET_TABLE_FOR_FIRST_DISPLAY

      EXPORTING

        IS_LAYOUT = LS_LAYOUT

      CHANGING

        IT_OUTTAB = GT_ITEM

        IT_FIELDCATALOG = GT_FC.

  ELSE.

    PERFORM REFRESH.

  ENDIF.



ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  SET_ALV  OUTPUT

*&---------------------------------------------------------------------*

*       ### ### ##

*----------------------------------------------------------------------*




MODULE SET_ALV OUTPUT.

ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  STATUS_0200  OUTPUT

*&---------------------------------------------------------------------*

*       200# ### PBO

*----------------------------------------------------------------------*




MODULE STATUS_0200 OUTPUT.

  SET PF-STATUS 'STATUS_0200'.

  SET TITLEBAR 'T200'.

ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  SET_ALV_200  OUTPUT

*&---------------------------------------------------------------------*

*       200# ALV ## ##

*----------------------------------------------------------------------*




MODULE SET_ALV_200 OUTPUT.

  PERFORM CREATE_OBJECT_200.

  PERFORM FIELD_CATALOG_200.




*  PERFORM ALV_LAYOUT_200.

*  PERFORM ALV_SORT_200.




  PERFORM CALL_ALV_200.

ENDMODULE.
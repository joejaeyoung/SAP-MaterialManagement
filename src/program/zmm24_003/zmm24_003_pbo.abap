
*&---------------------------------------------------------------------*

*&  Include           ZMM24_003_PBO

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

*&      Module  STATUS_0200  OUTPUT

*&---------------------------------------------------------------------*

*       200# ### PBO

*----------------------------------------------------------------------*




MODULE STATUS_0200 OUTPUT.

  SET PF-STATUS 'S200'.

  SET TITLEBAR 'T200'.

ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  SET_ALV_201  OUTPUT

*&---------------------------------------------------------------------*

*       SUBSCREEN ##

*----------------------------------------------------------------------*




MODULE SET_ALV_201 OUTPUT.

  IF GC_CONTAINER_201 IS INITIAL.

    "1. #### ##

    CREATE OBJECT GC_CONTAINER_201

      EXPORTING

        CONTAINER_NAME = 'CON02'.



    "2. ALV GRID ##

    CREATE OBJECT GC_GRID_201

      EXPORTING

        I_PARENT = GC_CONTAINER_201.



    "3. LAYOUT ##

    DATA : LS_LAYOUT2 TYPE LVC_S_LAYO.

    CLEAR LS_LAYOUT2.

    LS_LAYOUT2-NO_TOOLBAR = 'X'. "ALV ## ## ##

    LS_LAYOUT2-SEL_MODE = 'A'.  "SELECT ALL ##



    DATA : LS_SORT TYPE LVC_S_SORT.

    DATA : LT_SORT TYPE LVC_T_SORT.



    CLEAR LS_SORT.

    LS_SORT-SPOS = 1.

    LS_SORT-FIELDNAME = 'BWART'.

    LS_SORT-UP = 'X'.

    APPEND LS_SORT TO LT_SORT.



    "4. ###### ##

    PERFORM MAKE_FIELDCATALOG_201.



    "5. ### ### ##

    PERFORM CLASS_EVENT.



    "5. ALV # ##

    CLEAR GT_MSEG.

    CALL METHOD GC_GRID_201->SET_TABLE_FOR_FIRST_DISPLAY

      EXPORTING

        IS_LAYOUT = LS_LAYOUT2

      CHANGING

        IT_OUTTAB = GT_MSEG

        IT_FIELDCATALOG = GT_FC

        IT_SORT = LT_SORT.

  ELSE.

    PERFORM REFRESH2.

  ENDIF.

ENDMODULE.






*&---------------------------------------------------------------------*

*&      Module  CREATE_LEFT_TREE  OUTPUT

*&---------------------------------------------------------------------*

*       ### GR## ## TREE ##

*----------------------------------------------------------------------*




MODULE CREATE_LEFT_TREE OUTPUT.

  IF GC_CON_TREE IS INITIAL.

    CREATE OBJECT GC_CON_TREE

      EXPORTING CONTAINER_NAME = 'CON_TREE'.



    CREATE OBJECT GO_TREE

      EXPORTING

        PARENT = GC_CON_TREE

        NODE_SELECTION_MODE = CL_GUI_SIMPLE_TREE=>NODE_SEL_MODE_SINGLE.



    PERFORM CLASS_EVENT.



    DATA : LT_EVENTS TYPE CNTL_SIMPLE_EVENTS,

           LS_EVENT TYPE CNTL_SIMPLE_EVENT.

    LS_EVENT-EVENTID = CL_GUI_SIMPLE_TREE=>EVENTID_NODE_DOUBLE_CLICK.

    LS_EVENT-APPL_EVENT = 'X'.

    APPEND LS_EVENT TO LT_EVENTS.

    GO_TREE->SET_REGISTERED_EVENTS( EVENTS = LT_EVENTS ).



    PERFORM BUILD_TREE_NODES.

  ENDIF.

ENDMODULE.
# Table: ZEKPO24

| Row | Field name | Position | Key | Data element | Domain | Datatype | Length | Lowercase | Domain text |
|---|---|---|---|---|---|---|---|---|---|
| 1 | MANDT | 1 | X | MANDT | MANDT | CLNT | 3 |  | Client |
| 2 | EBELN | 2 | X | EBELN | EBELN | CHAR | 10 |  | Purchasing Document Number |
| 3 | EBELP | 3 | X |  |  | NUMC | 5 |  | - - - # |
| 4 | MWSKZ | 4 |  | ZMWSKZ24 | ZMWSKZ24 | CHAR | 2 |  | - |
| 5 | .INCLUDE | 5 |  | ZEKPODATA24 |  |  | 0 |  | - - - : -# - |
| 6 | MATNR | 6 |  | ZMATNR24 | ZMATNR24 | CHAR | 10 |  | - |
| 7 | MAKTX | 7 |  | ZMATNAME24 | ZMATNAME24 | CHAR | 20 |  | -# |
| 8 | MENGE | 8 |  | BSTMG | MENG13 | QUAN | 13 |  | Purchase Order Quantity |
| 9 | MEINS | 9 |  | MEINS | MEINS | UNIT | 3 | X | Base Unit of Measure |
| 10 | BPRME | 10 |  | BBPRM | MEINS | UNIT | 3 | X | Order Price Unit (Purchasing) |
| 11 | PRDAT | 11 |  | PREDT | DATUM | DATS | 8 |  | Date of Price Determination |
| 12 | WERKS | 12 |  | ZWERKS24 | ZWERKS24 | CHAR | 4 |  | -# |
| 13 | LGORT | 13 |  | ZLGORT24 | ZLGORT24 | CHAR | 4 |  | - |
| 14 | STPRS | 14 |  | STPRS | WERT11V | CURR | 11 |  | Standard price |
| 15 | WEMNG | 15 |  | BSTMG | MENG13 | QUAN | 13 |  | Purchase Order Quantity |
| 16 | REMNG | 16 |  | BSTMG | MENG13 | QUAN | 13 |  | Purchase Order Quantity |

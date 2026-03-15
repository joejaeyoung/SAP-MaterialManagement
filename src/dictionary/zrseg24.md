# Table: ZRSEG24

| Row | Field name | Position | Key | Data element | Domain | Datatype | Length | Lowercase | Domain text |
|---|---|---|---|---|---|---|---|---|---|
| 1 | MANDT | 1 | X | MANDT | MANDT | CLNT | 3 |  | Client |
| 2 | BELNR | 2 | X | RE_BELNR | BELNR | CHAR | 10 |  | Document Number of an Invoice Document |
| 3 | GJAHR | 3 | X | GJAHR | GJAHR | NUMC | 4 |  | Fiscal Year |
| 4 | BUZEI | 4 | X | RBLGP | NUMC6 | NUMC | 6 |  | Document Item in Invoice Document |
| 5 | EBELN | 5 |  | EBELN | EBELN | CHAR | 10 |  | Purchasing Document Number |
| 6 | EBELP | 6 |  | EBELP | EBELP | NUMC | 5 |  | Item Number of Purchasing Document |
| 7 | MATNR | 7 |  | ZMATNR24 | ZMATNR24 | CHAR | 10 |  | - |
| 8 | TXZ01 | 8 |  | ZMATNAME24 | ZMATNAME24 | CHAR | 20 |  | -# |
| 9 | WERKS | 9 |  | WERKS_D | WERKS | CHAR | 4 |  | Plant |
| 10 | WRBTR | 10 |  | WRBTR | WERT7 | CURR | 13 |  | Amount in document currency |
| 11 | MENGE | 11 |  | MENGE_D | MENG13 | QUAN | 13 |  | Quantity |
| 12 | BSTME | 12 |  | BSTME | MEINS | UNIT | 3 | X | Purchase Order Unit of Measure |
| 13 | MWSKZ | 13 |  | ZMWSKZ24 | ZMWSKZ24 | CHAR | 2 |  | - |
| 14 | WMWST | 14 |  | FWSTEV | WERTV7 | CURR | 13 |  | Tax Amount in Document Currency with +/- Sign |
| 15 | SGTXT | 15 |  | SGTXT | TEXT50 | CHAR | 50 | X | Item Text |
| 16 | WAERS | 16 |  | WAERS | WAERS | CUKY | 5 |  | Currency Key |
| 17 | MEINS | 17 |  | MEINS | MEINS | UNIT | 3 | X | Base Unit of Measure |
| 18 | LOEKZ | 18 |  |  |  | CHAR | 1 |  | - - -# |

# Table: ZMSEG24

| Row | Field name | Position | Key | Data element | Domain | Datatype | Length | Lowercase | Domain text |
|---|---|---|---|---|---|---|---|---|---|
| 1 | MANDT | 1 | X | MANDT | MANDT | CLNT | 3 |  | Client |
| 2 | MBLNR | 2 | X | MBLNR | BELNR | CHAR | 10 |  | Number of Material Document |
| 3 | MJAHR | 3 | X | MJAHR | GJAHR | NUMC | 4 |  | Material Document Year |
| 4 | ZEILE | 4 | X | MBLPO | MBLPO | NUMC | 4 |  | Item in Material Document |
| 5 | BWART | 5 |  | BWART | BWART | CHAR | 3 |  | Movement type (inventory management) |
| 6 | MATNR | 6 |  | ZMATNR24 | ZMATNR24 | CHAR | 10 |  | - |
| 7 | WERKS | 7 |  | WERKS_D | WERKS | CHAR | 4 |  | Plant |
| 8 | LGORT | 8 |  | ZLGORT24 | ZLGORT24 | CHAR | 4 |  | - |
| 9 | LIFNR | 9 |  | ELIFN | LIFNR | CHAR | 10 |  | Vendor's account number |
| 10 | WAERS | 10 |  | WAERS | WAERS | CUKY | 5 |  | Currency Key |
| 11 | MENGE | 11 |  | MENGE_D | MENG13 | QUAN | 13 |  | Quantity |
| 12 | MEINS | 12 |  | MEINS | MEINS | UNIT | 3 | X | Base Unit of Measure |
| 13 | EBELN | 13 |  | BSTNR | EBELN | CHAR | 10 |  | Purchase order number |
| 14 | BUKRS | 14 |  | BUKRS | BUKRS | CHAR | 4 |  | Company Code |
| 15 | GJAHR | 15 |  | GJAHR | GJAHR | NUMC | 4 |  | Fiscal Year |
| 16 | SHKZG | 16 |  | SHKZG | SHKZG | CHAR | 1 |  | Debit/Credit Indicator |
| 17 | DMBTR | 17 |  | DMBTR | WERT7 | CURR | 13 |  | Amount in local currency |
| 18 | .INCLUDE | 18 |  | ZBELNR24 |  |  | 0 |  | - |
| 19 | ZZEILE | 19 |  | DZEILE | ZEILE | NUMC | 3 |  | Line Number |
| 20 | ZEBELP | 20 |  | EBELP | EBELP | NUMC | 5 |  | Item Number of Purchasing Document |

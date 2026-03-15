# Table: ZMARA24

| Row | Field name | Position | Key | Data element | Domain | Datatype | Length | Lowercase | Domain text |
|---|---|---|---|---|---|---|---|---|---|
| 1 | MANDT | 1 | X | MANDT | MANDT | CLNT | 3 |  | Client |
| 2 | WERKS | 2 | X | ZWERKS24 | ZWERKS24 | CHAR | 4 |  | -# |
| 3 | LGORT | 3 | X | ZLGORT24 | ZLGORT24 | CHAR | 4 |  | - |
| 4 | ZMATNR | 4 | X | ZMATNR24 | ZMATNR24 | CHAR | 10 |  | - |
| 5 | ZMATNAME | 5 |  | ZMATNAME24 | ZMATNAME24 | CHAR | 20 |  | -# |
| 6 | MTART | 6 |  | ZMTARTT24 | ZMTARTT24 | CHAR | 4 |  | - |
| 7 | STPRS | 7 |  | STPRS | WERT11V | CURR | 11 |  | Standard price |
| 8 | WAERS | 8 |  | WAERS | WAERS | CUKY | 5 |  | Currency Key |
| 9 | MENGE | 9 |  | MENGE_D | MENG13 | QUAN | 13 |  | Quantity |
| 10 | MEINS | 10 |  | MEINS | MEINS | UNIT | 3 | X | Base Unit of Measure |
| 11 | .INCLUDE | 11 |  | ZEDS24_002 |  |  | 0 |  | - |
| 12 | CRNAME | 12 |  | CRNAM | USNAM | CHAR | 12 |  | Created By |
| 13 | CRDATE | 13 |  | CRDAT | DATUM | DATS | 8 |  | Creation date |
| 14 | CRZEIT | 14 |  | CEPLUZEIT | TIMES | TIMS | 6 |  | Time created |
| 15 | AENAME | 15 |  | AENAM | USNAM | CHAR | 12 |  | Name of person who changed object |
| 16 | AEDATE | 16 |  | AEDAT | DATUM | DATS | 8 |  | Date of Last Change |
| 17 | AEZEIT | 17 |  | AEZEIT | UHRZT | TIMS | 6 |  | Time of Change |

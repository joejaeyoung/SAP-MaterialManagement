# Table: ZLFA1_24

| Row | Field name | Position | Key | Data element | Domain | Datatype | Length | Lowercase | Domain text |
|---|---|---|---|---|---|---|---|---|---|
| 1 | MANDT | 1 | X | MANDT | MANDT | CLNT | 3 |  | Client |
| 2 | LIFNR | 2 | X |  |  | CHAR | 10 |  | -# |
| 3 | NAME1 | 3 |  |  |  | CHAR | 35 |  | - |
| 4 | LAND1 | 4 |  |  |  | CHAR | 3 |  | -# |
| 5 | STRAS | 5 |  |  |  | CHAR | 35 |  | - |
| 6 | .INCLUDE | 6 |  | ZSI_LFA1_24 |  |  | 0 |  | - -# (- -) |
| 7 | KTOKK | 7 |  | ZTOKK24 | ZTOKK24 | CHAR | 4 |  | - |
| 8 | STCD1 | 8 |  |  |  | CHAR | 16 |  | - |
| 9 | STCD2 | 9 |  |  |  | CHAR | 11 |  | -# |
| 10 | .INCLUDE | 10 |  | ZEDS24_002 |  |  | 0 |  | - |
| 11 | CRNAME | 11 |  | CRNAM | USNAM | CHAR | 12 |  | Created By |
| 12 | CRDATE | 12 |  | CRDAT | DATUM | DATS | 8 |  | Creation date |
| 13 | CRZEIT | 13 |  | CEPLUZEIT | TIMES | TIMS | 6 |  | Time created |
| 14 | AENAME | 14 |  | AENAM | USNAM | CHAR | 12 |  | Name of person who changed object |
| 15 | AEDATE | 15 |  | AEDAT | DATUM | DATS | 8 |  | Date of Last Change |
| 16 | AEZEIT | 16 |  | AEZEIT | UHRZT | TIMS | 6 |  | Time of Change |

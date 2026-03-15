# Table: ZEKKO24

| Row | Field name | Position | Key | Data element | Domain | Datatype | Length | Lowercase | Domain text |
|---|---|---|---|---|---|---|---|---|---|
| 1 | MANDT | 1 | X | MANDT | MANDT | CLNT | 3 |  | Client |
| 2 | EBELN | 2 | X | EBELN | EBELN | CHAR | 10 |  | Purchasing Document Number |
| 3 | .INCLUDE | 3 |  | ZEKKODATA24 |  |  | 0 |  | - - : -# - |
| 4 | BUKRS | 4 |  |  |  | CHAR | 4 |  | - |
| 5 | EKGRP | 5 |  |  |  | CHAR | 3 |  | - |
| 6 | EKORG | 6 |  |  |  | CHAR | 4 |  | - |
| 7 | LIFNR | 7 |  |  |  | CHAR | 10 |  | -# |
| 8 | BEDAT | 8 |  | EBDAT | DATUM | DATS | 8 |  | Purchasing Document Date |
| 9 | WAERS | 9 |  | WAERS | WAERS | CUKY | 5 |  | Currency Key |

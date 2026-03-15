# Table: ZRBKP24

| Row | Field name | Position | Key | Data element | Domain | Datatype | Length | Lowercase | Domain text |
|---|---|---|---|---|---|---|---|---|---|
| 1 | MANDT | 1 | X | MANDT | MANDT | CLNT | 3 |  | Client |
| 2 | BELNR | 2 | X | RE_BELNR | BELNR | CHAR | 10 |  | Document Number of an Invoice Document |
| 3 | GJAHR | 3 | X | GJAHR | GJAHR | NUMC | 4 |  | Fiscal Year |
| 4 | BLART | 4 |  | BLART | BLART | CHAR | 2 |  | Document type |
| 5 | BLDAT | 5 |  | BLDAT | DATUM | DATS | 8 |  | Document Date in Document |
| 6 | BUDAT | 6 |  | BUDAT | DATUM | DATS | 8 |  | Posting Date in the Document |
| 7 | BUKRS | 7 |  | BUKRS | BUKRS | CHAR | 4 |  | Company Code |
| 8 | LIFNR | 8 |  | LIFNR | LIFNR | CHAR | 10 |  | Account Number of Vendor or Creditor |
| 9 | WAERS | 9 |  | WAERS | WAERS | CUKY | 5 |  | Currency Key |
| 10 | ZTERM | 10 |  | ZTERM24 | ZTERM24 | CHAR | 4 |  | - |
| 11 | BKTXT | 11 |  | BKTXT | TEXT25 | CHAR | 25 | X | Document Header Text |
| 12 | XMWST | 12 |  | XMWST | XFELD | CHAR | 1 |  | Calculate tax automatically |
| 13 | MWSKZ | 13 |  | ZMWSKZ24 | ZMWSKZ24 | CHAR | 2 |  | - |
| 14 | WMWST | 14 |  | FWSTEV | WERTV7 | CURR | 13 |  | Tax Amount in Document Currency with +/- Sign |
| 15 | RMWWR | 15 |  | RMWWR | WERT7 | CURR | 13 |  | Gross invoice amount in document currency |
| 16 | STBLG | 16 |  | STBLG | BELNR | CHAR | 10 |  | Reverse Document Number |
| 17 | STJAH | 17 |  | STJAH | GJAHR | NUMC | 4 |  | Reverse document fiscal year |
| 18 | RBSTAT | 18 |  | RBSTAT | RBSTAT | CHAR | 1 |  | Invoice document status |
| 19 | EBELN | 19 |  | BSTNR | EBELN | CHAR | 10 |  | Purchase order number |
| 20 | WERKS | 20 |  | WERKS_D | WERKS | CHAR | 4 |  | Plant |
| 21 | XBLNR | 21 |  | RE_BELNR | BELNR | CHAR | 10 |  | Document Number of an Invoice Document |

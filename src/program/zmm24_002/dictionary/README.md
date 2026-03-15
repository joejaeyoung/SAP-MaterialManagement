# Dictionary Tables
이 폴더에는 다음 테이블 정의가 포함되어 있습니다.

## 테이블 목록

| 테이블명 | 설명 | 필드 수 | Key 필드 |
|---------|------|---------|----------|
| [ZBELNR24](zbelnr24.md) 📄 [HTML](zbelnr24.html) | - | 2 | - |
| [ZEKKO24](zekko24.md) 📄 [HTML](zekko24.html) | - | 9 | MANDT, EBELN |
| [ZEKKODATA24](zekkodata24.md) 📄 [HTML](zekkodata24.html) | - | 6 | - |
| [ZEKPO24](zekpo24.md) 📄 [HTML](zekpo24.html) | - | 30 | MANDT, EBELN, EBELP |
| [ZEKPODATA24](zekpodata24.md) 📄 [HTML](zekpodata24.html) | - | 20 | - |
| [ZLFA1_24](zlfa1_24.md) 📄 [HTML](zlfa1_24.html) | - | 22 | MANDT, LIFNR |
| [ZLFB1_24](zlfb1_24.md) 📄 [HTML](zlfb1_24.html) | - | 33 | MANDT, LIFNR, BUKRS |
| [ZLFM1_24](zlfm1_24.md) 📄 [HTML](zlfm1_24.html) | - | 13 | MANDT, LIFNR, EKORG |
| [ZLFM211_24](zlfm211_24.md) 📄 [HTML](zlfm211_24.html) | - | 9 | - |
| [ZMARA24](zmara24.md) 📄 [HTML](zmara24.html) | - | 32 | MANDT, WERKS, LGORT ... (+1) |
| [ZMKPF24](zmkpf24.md) 📄 [HTML](zmkpf24.html) | - | 8 | MANDT, MBLNR, MJAHR |
| [ZMSEG24](zmseg24.md) 📄 [HTML](zmseg24.html) | - | 27 | MANDT, MBLNR, MJAHR ... (+1) |
| [ZRBKP24](zrbkp24.md) 📄 [HTML](zrbkp24.html) | - | 50 | MANDT, BELNR, GJAHR |
| [ZRSEG24](zrseg24.md) 📄 [HTML](zrseg24.html) | - | 23 | MANDT, BELNR, GJAHR ... (+1) |
| [ZSI_LFA1_24](zsi_lfa1_24.md) 📄 [HTML](zsi_lfa1_24.html) | - | 9 | - |
| [ZSI_LFB1_24](zsi_lfb1_24.md) 📄 [HTML](zsi_lfb1_24.html) | - | 29 | - |
| [ZTCURR24](ztcurr24.md) 📄 [HTML](ztcurr24.html) | - | 10 | MANDT, KURST, FCURR ... (+2) |

---

## 테이블 상세 정보

### ZBELNR24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `ZZEILE` | NUMC | 3 | Line Number |
| `ZEBELP` | NUMC | 5 | Item Number of Purchasing Document |

**데이터 타입:** NUMC(2)

📋 [마크다운으로 보기](zbelnr24.md) | 📄 [HTML로 보기](zbelnr24.html)

---

### ZEKKO24

**Key 필드:** `MANDT, EBELN`

**INCLUDE 구조:** ZEKKODATA24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `BUKRS` | CHAR | 4 | - |
| `EKGRP` | CHAR | 3 | - |
| `EKORG` | CHAR | 4 | - |
| `LIFNR` | CHAR | 10 | ##### |
| `BEDAT` | DATS | 8 | Purchasing Document Date |

*... 외 1개 필드*

**데이터 타입:** CHAR(5), CLNT(1), DATS(1), CUKY(1)

📋 [마크다운으로 보기](zekko24.md) | 📄 [HTML로 보기](zekko24.html)

---

### ZEKKODATA24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `BUKRS` | CHAR | 4 | - |
| `EKGRP` | CHAR | 3 | - |
| `EKORG` | CHAR | 4 | - |
| `LIFNR` | CHAR | 10 | ##### |
| `BEDAT` | DATS | 8 | Purchasing Document Date |

*... 외 1개 필드*

**데이터 타입:** CHAR(4), DATS(1), CUKY(1)

📋 [마크다운으로 보기](zekkodata24.md) | 📄 [HTML로 보기](zekkodata24.html)

---

### ZEKPO24

**Key 필드:** `MANDT, EBELN, EBELP`

**INCLUDE 구조:** ZEKPODATA24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `MWSKZ` | CHAR | 2 | - |
| `MATNR` | CHAR | 10 | - |
| `MAKTX` | CHAR | 20 | ### |
| `MENGE` | QUAN | 13 | Purchase Order Quantity |
| `MEINS` | UNIT | 3 | Base Unit of Measure |

*... 외 5개 필드*

**데이터 타입:** CHAR(6), QUAN(3), UNIT(2), CLNT(1), NUMC(1)

📋 [마크다운으로 보기](zekpo24.md) | 📄 [HTML로 보기](zekpo24.html)

---

### ZEKPODATA24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `MATNR` | CHAR | 10 | - |
| `MAKTX` | CHAR | 20 | ### |
| `MENGE` | QUAN | 13 | Purchase Order Quantity |
| `MEINS` | UNIT | 3 | Base Unit of Measure |
| `BPRME` | UNIT | 3 | Order Price Unit (Purchasing) |

*... 외 5개 필드*

**데이터 타입:** CHAR(4), QUAN(3), UNIT(2), DATS(1), CURR(1)

📋 [마크다운으로 보기](zekpodata24.md) | 📄 [HTML로 보기](zekpodata24.html)

---

### ZLFA1_24

**Key 필드:** `MANDT, LIFNR`

**INCLUDE 구조:** ZSI_LFA1_24, ZEDS24_002

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `NAME1` | CHAR | 35 | - |
| `LAND1` | CHAR | 3 | ### |
| `STRAS` | CHAR | 35 | - |
| `KTOKK` | CHAR | 4 | - |
| `STCD1` | CHAR | 16 | - |

*... 외 5개 필드*

**데이터 타입:** CHAR(9), DATS(2), TIMS(2), CLNT(1)

📋 [마크다운으로 보기](zlfa1_24.md) | 📄 [HTML로 보기](zlfa1_24.html)

---

### ZLFB1_24

**Key 필드:** `MANDT, LIFNR, BUKRS`

**INCLUDE 구조:** ZSI_LFB1_24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `LOEVM` | CHAR | 1 | ##### |
| `AKONT` | CHAR | 10 | - |
| `ZTERM` | CHAR | 4 | - |

**데이터 타입:** CHAR(5), CLNT(1)

📋 [마크다운으로 보기](zlfb1_24.md) | 📄 [HTML로 보기](zlfb1_24.html)

---

### ZLFM1_24

**Key 필드:** `MANDT, LIFNR, EKORG`

**INCLUDE 구조:** ZLFM211_24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `EKGRP` | CHAR | 3 | - |
| `LOEVM` | CHAR | 1 | ##### |
| `WAERS` | CUKY | 5 | ###### |
| `MWSKZ` | CHAR | 2 | - |

**데이터 타입:** CHAR(5), CLNT(1), CUKY(1)

📋 [마크다운으로 보기](zlfm1_24.md) | 📄 [HTML로 보기](zlfm1_24.html)

---

### ZLFM211_24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `EKGRP` | CHAR | 3 | - |
| `LOEVM` | CHAR | 1 | ##### |
| `WAERS` | CUKY | 5 | ###### |
| `MWSKZ` | CHAR | 2 | - |

**데이터 타입:** CHAR(3), CUKY(1)

📋 [마크다운으로 보기](zlfm211_24.md) | 📄 [HTML로 보기](zlfm211_24.html)

---

### ZMARA24

**Key 필드:** `MANDT, WERKS, LGORT, ZMATNR`

**INCLUDE 구조:** ZEDS24_002

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `ZMATNAME` | CHAR | 20 | ### |
| `MTART` | CHAR | 4 | - |
| `STPRS` | CURR | 11 | Standard price |
| `WAERS` | CUKY | 5 | Currency Key |
| `MENGE` | QUAN | 13 | Quantity |

*... 외 5개 필드*

**데이터 타입:** CHAR(7), DATS(2), TIMS(2), CLNT(1), CURR(1)

📋 [마크다운으로 보기](zmara24.md) | 📄 [HTML로 보기](zmara24.html)

---

### ZMKPF24

**Key 필드:** `MANDT, MBLNR, MJAHR`

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `BLART` | CHAR | 2 | Document type |
| `BLDAT` | DATS | 8 | Document Date in Document |
| `BUDAT` | DATS | 8 | Posting Date in the Document |
| `EBELN` | CHAR | 10 | Purchase order number |
| `WERKS` | CHAR | 4 | Plant |

**데이터 타입:** CHAR(4), DATS(2), CLNT(1), NUMC(1)

📋 [마크다운으로 보기](zmkpf24.md) | 📄 [HTML로 보기](zmkpf24.html)

---

### ZMSEG24

**Key 필드:** `MANDT, MBLNR, MJAHR, ZEILE`

**INCLUDE 구조:** ZBELNR24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `BWART` | CHAR | 3 | Movement type (inventory management) |
| `MATNR` | CHAR | 10 | - |
| `WERKS` | CHAR | 4 | Plant |
| `LGORT` | CHAR | 4 | - |
| `LIFNR` | CHAR | 10 | Vendor's account number |

*... 외 5개 필드*

**데이터 타입:** CHAR(9), NUMC(5), CLNT(1), CUKY(1), QUAN(1)

📋 [마크다운으로 보기](zmseg24.md) | 📄 [HTML로 보기](zmseg24.html)

---

### ZRBKP24

**Key 필드:** `MANDT, BELNR, GJAHR`

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `BLART` | CHAR | 2 | Document type |
| `BLDAT` | DATS | 8 | Document Date in Document |
| `BUDAT` | DATS | 8 | Posting Date in the Document |
| `BUKRS` | CHAR | 4 | Company Code |
| `LIFNR` | CHAR | 10 | Account Number of Vendor or Creditor |

*... 외 5개 필드*

**데이터 타입:** CHAR(13), NUMC(2), DATS(2), CURR(2), CLNT(1)

📋 [마크다운으로 보기](zrbkp24.md) | 📄 [HTML로 보기](zrbkp24.html)

---

### ZRSEG24

**Key 필드:** `MANDT, BELNR, GJAHR, BUZEI`

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `EBELN` | CHAR | 10 | Purchasing Document Number |
| `EBELP` | NUMC | 5 | Item Number of Purchasing Document |
| `MATNR` | CHAR | 10 | - |
| `TXZ01` | CHAR | 20 | ### |
| `WERKS` | CHAR | 4 | Plant |

*... 외 5개 필드*

**데이터 타입:** CHAR(8), NUMC(3), CURR(2), UNIT(2), CLNT(1)

📋 [마크다운으로 보기](zrseg24.md) | 📄 [HTML로 보기](zrseg24.html)

---

### ZSI_LFA1_24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `KTOKK` | CHAR | 4 | - |
| `STCD1` | CHAR | 16 | - |
| `STCD2` | CHAR | 11 | ##### |

**데이터 타입:** CHAR(3)

📋 [마크다운으로 보기](zsi_lfa1_24.md) | 📄 [HTML로 보기](zsi_lfa1_24.html)

---

### ZSI_LFB1_24

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `LOEVM` | CHAR | 1 | ##### |
| `AKONT` | CHAR | 10 | - |
| `ZTERM` | CHAR | 4 | - |

**데이터 타입:** CHAR(3)

📋 [마크다운으로 보기](zsi_lfb1_24.md) | 📄 [HTML로 보기](zsi_lfb1_24.html)

---

### ZTCURR24

**Key 필드:** `MANDT, KURST, FCURR, TCURR, GDATU`

**주요 필드:**

| 필드명 | 데이터 타입 | 길이 | 설명 |
|--------|------------|------|------|
| `UKURS` | DEC | 9 | Exchange Rate |
| `FFACT` | DEC | 9 | Ratio for the "from" currency units |
| `TFACT` | DEC | 9 | Ratio for the "to" currency units |
| `WRITER` | CHAR | 12 | - |
| `EDATE` | DATS | 8 | - |

**데이터 타입:** CHAR(3), DEC(3), CUKY(2), CLNT(1), DATS(1)

📋 [마크다운으로 보기](ztcurr24.md) | 📄 [HTML로 보기](ztcurr24.html)

---

> 💡 **팁**: 각 테이블명을 클릭하면 상세한 테이블 구조를 확인할 수 있습니다.

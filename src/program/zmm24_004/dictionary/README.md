# Dictionary Tables
이 폴더에는 다음 테이블 정의가 포함되어 있습니다.

## 테이블 목록

| 테이블명 | 설명 | 필드 수 | Key 필드 |
|---------|------|---------|----------|
| [ZEKKO24](zekko24.md) 📄 [HTML](zekko24.html) | - | 9 | MANDT, EBELN |
| [ZEKPO24](zekpo24.md) 📄 [HTML](zekpo24.html) | - | 30 | MANDT, EBELN, EBELP |
| [ZMSEG24](zmseg24.md) 📄 [HTML](zmseg24.html) | - | 27 | MANDT, MBLNR, MJAHR ... (+1) |
| [ZRBKP24](zrbkp24.md) 📄 [HTML](zrbkp24.html) | - | 50 | MANDT, BELNR, GJAHR |
| [ZRSEG24](zrseg24.md) 📄 [HTML](zrseg24.html) | - | 23 | MANDT, BELNR, GJAHR ... (+1) |

---

## 테이블 상세 정보

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

> 💡 **팁**: 각 테이블명을 클릭하면 상세한 테이블 구조를 확인할 수 있습니다.

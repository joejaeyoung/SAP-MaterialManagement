📦 SAP Material Management CBO Development Project

  SAP의 표준 MM(자재 관리) 프로세스를 모방하여, Custom Table(CBO)과 ABAP Program을 통해 자재 마스터부터
  송장 검증까지의 전체 구매 사이클을 구현한 프로젝트입니다.

  ---


  📋 프로젝트 요약
   * 분야: SAP ERP (ABAP 개발)
   * 개발 기간: 2025.10 - 2025.12
   * 개발 환경: SAP NetWeaver AS ABAP 7.5x 이상
   * 핵심 기술: ABAP Dictionary, Module Pool Programming, ALV Grid, Open SQL

  ---

  🏗️ CBO 데이터 모델 (Dictionary)
  표준 테이블 대신 직접 설계한 CBO 테이블을 사용하여 데이터 간의 관계를 구축했습니다.


  1. 마스터 데이터 (Master Data)
   * 자재 마스터 (ZMARA24): 자재의 기본 정보 및 단위 관리 (표준: MARA)
   * 공급업체 마스터 (ZLFA1_24): 구매처 정보 관리 (표준: LFA1)


  2. 구매 프로세스 (Purchasing)
   * 구매 오더 헤더 (ZEKKO24): 발주서의 상단 정보 (표준: EKKO)
   * 구매 오더 아이템 (ZEKPO24): 발주서의 품목별 상세 정보 (표준: EKPO)


  3. 입고 및 재고 (Inventory)
   * 자재 문서 헤더 (ZMKPF24): 입고 시 생성되는 문서 헤더 (표준: MKPF)
   * 자재 문서 아이템 (ZMSEG24): 입고 품목 및 수량 정보 (표준: MSEG)


  4. 송장 검증 (Accounting)
   * 송장 헤더 (ZRBKP24): 대금 청구 문서의 헤더 (표준: RBKP)
   * 송장 아이템 (ZRSEG24): 송장 품목별 상세 정보 (표준: RSEG)

  ---

  🚀 CBO 프로세스 흐름 (The Flow)

  프로젝트는 구매 관리의 표준 5단계 흐름에 따라 프로그램이 모듈화되어 있습니다.


  [Phase 1] 마스터 데이터 구성
   * 프로그램: zmm24_000 (자재), zmm24_001 (공급업체)
   * 내용: 자재 코드 및 공급업체 마스터를 생성하고 관리하는 CRUD 기능 구현.


  [Phase 2] 구매 오더 (Purchase Order)
   * 프로그램: zmm24_002
   * 내용: 등록된 자재와 업체를 기반으로 구매 발주서 생성. Header-Item 구조의 화면 제어.


  [Phase 3] 입고 처리 (Goods Receipt)
   * 프로그램: zmm24_003
   * 내용: PO 번호를 참조하여 실제 입고 수량 확정. 입고 완료 시 재고 테이블(ZMARA24 등) 수량 업데이트.


  [Phase 4] 송장 검증 (Invoice Verification)
   * 프로그램: zmm24_004
   * 내용: 발주(PO) - 입고(GR) - 송장(IV) 간의 3-Way Matching 로직을 통해 최종 대금 지급 데이터 생성.

  ---


  🛠️ 기술적 특징 및 아키텍처
   * ABAP Modularization:
       - TOP: 전역 변수 및 데이터 선언
       - SCR: Selection Screen 및 다이얼로그 화면 정의
       - PBO/PAI: 화면 이벤트 제어 로직
       - F01/F02: 비즈니스 로직(Subroutine) 분리
   * UI/UX 구현:
       - Module Pool: 트랜잭션 화면 개발
       - ALV Grid: 데이터 조회, 정렬, 필터링 및 엑셀 다운로드 기능
   * Data Consistency: Open SQL을 이용한 테이블 간 트랜잭션 처리 및 데이터 정합성 유지.

  ---

  📂 프로젝트 구조
```
   1 /srcs
   2 ├── dictionary/           # CBO 테이블 정의 (Markdown/HTML)
   3 └── program/
   4     ├── zmm24_000/        # 자재 마스터 (Material)
   5     ├── zmm24_001/        # 공급업체 마스터 (Vendor)
   6     ├── zmm24_002/        # 구매 오더 (PO)
   7     ├── zmm24_003/        # 입고 처리 (GR)
   8     └── zmm24_004/        # 송장 검증 (IV)
```

  ---
  📄 참고 자료
   * 상세 설계서 및 흐름도는 docs/CBO_MM_Project.pptx 파일에 포함되어 있습니다.

# PC Modding AI 플랫폼

## 서비스 개요

이 프로젝트는 초보 사용자를 위한 AI 기반 컴퓨터 조립 및 업그레이드 진단 플랫폼입니다. 사용자는 예산과 원하는 용도, 장비를 입력하면, 플랫폼이 내부 데이터와 AI 자연어 분석을 활용해 최적의 PC 부품 세트와 시뮬레이터 장비 조합을 추천합니다.

주요 기능:
- 일반 PC 부품(CPU, GPU, RAM, 메인보드, 파워, 케이스, 스토리지) 호환성 검증
- 기존 PC 사양 대비 업그레이드 추천
- 자연어 요청 기반 맞춤 견적 생성
- 레이싱 콕핏, 플라이트 스틱, 커스텀 수랭 빌드 등의 시뮬레이터 장비 추천

## 특화 판매 장비 리스트

플랫폼은 고급 시뮬레이터 장비를 주요 상품으로 포함합니다. 현재 구현된 모킹 데이터에는 다음 장비들이 포함되어 있습니다.

### 레이싱 장비
- **Fanatec Podium DD1**
  - 다이렉트 드라이브(DD) 기반 레이싱 휠
  - 1080도 회전 범위
  - 강력한 force feedback 지원

- **Fanatec ClubSport V3 Pedals**
  - 조절식 유압 페달 세트
  - 아날로그 센싱

- **Fanatec ClubSport Shifter SQ**
  - H-패턴 시프터
  - 6단 기어 지원

- **Logitech G923**
  - USB 연결 기반 레이싱 휠
  - TrueForce force feedback 지원

### 레이싱 콕핏
- **Fanatec Podium Racing Cockpit**
  - 휠 베이스 장착 규격을 고려한 레이싱 콕핏
  - 조절식 좌석과 다양한 휠 마운트 호환

- **Playseat Evolution**
  - 범용 레이싱 콕핏 구조
  - 단단한 시트 위치와 휠 베이스 장착 지원

- **Next Level Racing F-GT Elite**
  - 고급형 레이싱 콕핏
  - USB 및 시트 호환성 고려 설계

### 비행 시뮬레이터
- **Thrustmaster HOTAS Warthog**
  - 고성능 플라이트 스틱 및 스로틀 세트
  - Hall Effect 센서 기반 정밀 입력
  - 19개 버튼 및 스로틀 포함

- **Thrustmaster T.Flight HOTAS 4**
  - 엔트리급 플라이트 스틱 및 스로틀
  - 포텐셔미터 센서
  - VR 및 시뮬레이션 게임에 적합

## 하이엔드 모딩 기술

이 플랫폼은 고급 커스텀 수랭 빌드 부품을 포함한 모딩 기술을 다룹니다. 주요 구성 요소 및 호환성 검증 기준은 다음과 같습니다.

### 커스텀 수랭 빌드 구성 요소
- **Water Block (수로판)**
  - 지원 소켓: LGA1700, LGA1200, AM4 등
  - CPU 소켓 호환성 필수
  - 최대 유량(L/min) 정보 포함

- **Radiator (라디에이터)**
  - 팬 개수와 크기
  - 두께 및 설치 가능한 케이스 규격

- **Pump (펌프)**
  - 최대 유량 및 최대 헤드 압력
  - SATA 또는 DC 전원 커넥터 지원

- **Reservoir (저장소)**
  - 케이스 마운트 타입
  - 저장 용량(mL)

- **Tube (튜브)**
  - 내경/외경(mm)
  - 길이(mm)

- **Fitting (피팅)**
  - 규격 예: 1/4인치
  - 90도, 직선 등 타입별 호환성

- **Coolant (냉각수)**
  - 색상, 용량, 열전도도
  - 시스템 안정성 검증에 활용

### 호환성 검증 기준
- CPU 소켓과 메인보드 소켓 일치 여부
- RAM 타입과 메인보드 지원 메모리 타입 일치 여부
- 메인보드 메모리 슬롯 수와 RAM 모듈 수
- GPU 길이와 케이스 최대 GPU 장착 길이
- PSU 전력 용량과 GPU/CPU TDP 합산 예측
- PSU 전원 커넥터 유무(24핀, PCIe 8핀 등)
- 케이스 폼팩터와 메인보드 폼팩터 호환성

## 기술 스택 요약

이 플랫폼은 다음 기술 스택을 기반으로 구현되었습니다.

- **백엔드 서비스**: Dart
  - `pc_backend_service.dart`에서 데이터 모델, 호환성 검사, 추천 알고리즘, 자연어/AI 연동 로직 구현

- **프론트엔드**: Flutter
  - `lib/main.dart`, `lib/pc_matching_screen.dart`에서 사용자 인터페이스 구성
  - 예산 입력, 장비 선택, 추천 견적 표시 UI 제공

- **자연어 인지 엔진**: OpenAI API
  - 사용자의 자연어 요청을 분석하여 예산, 목적, 장비 유형을 구조화
  - AI 응답을 파싱해 `getCustomBuildEstimate`와 연계

## 실행 방법

1. Flutter SDK가 설치된 환경에서 프로젝트 루트로 이동합니다.
2. `flutter pub get` 명령으로 의존 패키지를 설치합니다.
3. `flutter run -d chrome` 또는 `flutter run`으로 앱을 실행합니다.

## 프로젝트 구성

- `pc_backend_service.dart`: PC 부품 데이터 모델, 호환성 검사, AI 기반 추천 로직
- `lib/pc_matching_screen.dart`: Flutter UI 화면
- `lib/main.dart`: 앱 시작점, `PcMatchingScreen`을 홈 화면으로 설정
- `pubspec.yaml`: 프로젝트 패키지 의존성

## 개발 목표

이 플랫폼은 PC 조립과 업그레이드에 익숙하지 않은 초보 사용자에게도 쉽게 접근 가능한 AI 추천 경험을 제공합니다. 특히 레이싱/비행 시뮬레이션 장비와 커스텀 수랭 모딩을 특화한 상품 구성으로, 게이밍 전문 사용자층을 겨냥한 서비스로 확장할 수 있습니다.

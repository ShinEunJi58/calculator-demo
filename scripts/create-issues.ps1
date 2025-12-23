# GitHub Issues 생성 스크립트
# ROADMAP.md의 주요 작업들을 GitHub 이슈로 생성합니다.

# Phase 1: 프로젝트 초기 설정

## Issue 1: 개발 환경 설정
gh issue create `
  --title "[Phase 1] 개발 환경 설정" `
  --label "enhancement,phase-1" `
  --body @"
## 작업 배경
공학용 전자계산기 웹앱 개발을 위한 기본 개발 환경을 구축합니다. Vite, Tailwind CSS, Vitest 등 필요한 도구들을 설정하여 효율적인 개발 환경을 마련합니다.

## 작업 내용
- [ ] Node.js 프로젝트 초기화
  - [ ] \`npm init -y\` 실행
  - [ ] \`package.json\` 설정
- [ ] Vite 설치 및 설정
  - [ ] \`npm install -D vite\` 실행
  - [ ] \`vite.config.js\` 생성 (GitHub Pages base path 설정)
- [ ] Tailwind CSS 설치 및 설정
  - [ ] \`npm install -D tailwindcss postcss autoprefixer\` 실행
  - [ ] \`npx tailwindcss init -p\` 실행
  - [ ] \`tailwind.config.js\` 커스텀 설정 (컬러, 폰트 등)
- [ ] 테스트 프레임워크 설정
  - [ ] \`npm install -D vitest\` 실행
  - [ ] \`vitest.config.js\` 생성
- [ ] ESLint & Prettier 설정
  - [ ] \`npm install -D eslint prettier\` 실행
  - [ ] \`.eslintrc.js\` 생성
  - [ ] \`.prettierrc\` 생성

## 인수 조건
- [ ] \`npm run dev\` 명령어로 개발 서버 실행 가능
- [ ] \`npm run build\` 명령어로 프로덕션 빌드 가능
- [ ] \`npm run test\` 명령어로 테스트 실행 가능
- [ ] Tailwind CSS가 정상적으로 적용됨
- [ ] ESLint와 Prettier가 정상적으로 동작함

## 참고 사항
- TechSpec.md의 기술 스택 참고
- Vite base path: \`/calculator-demo/\`
- Tailwind 커스텀 컬러: primary, background-dark, surface-dark 등
"@

## Issue 2: 프로젝트 구조 생성
gh issue create `
  --title "[Phase 1] 프로젝트 구조 생성" `
  --label "enhancement,phase-1" `
  --body @"
## 작업 배경
코드의 유지보수성과 확장성을 위해 명확한 디렉토리 구조를 설정합니다. 코어 로직, UI 컴포넌트, 테스트 파일을 분리하여 관리합니다.

## 작업 내용
- [ ] src/ 디렉토리 생성
- [ ] src/styles/ 디렉토리 생성
  - [ ] index.css 생성
  - [ ] animations.css 생성
- [ ] src/js/ 디렉토리 생성
  - [ ] calculator.js 생성
  - [ ] ui.js 생성
  - [ ] keyboard.js 생성
  - [ ] storage.js 생성
  - [ ] utils.js 생성
- [ ] src/components/ 디렉토리 생성
  - [ ] display.js 생성
  - [ ] keypad.js 생성
  - [ ] header.js 생성
  - [ ] history.js 생성
- [ ] tests/ 디렉토리 생성
  - [ ] calculator.test.js 생성
  - [ ] storage.test.js 생성
  - [ ] utils.test.js 생성
- [ ] index.html 기본 템플릿 생성
- [ ] main.js 진입점 생성

## 인수 조건
- [ ] 모든 디렉토리와 파일이 생성됨
- [ ] 각 파일에 기본 구조(export, import 등)가 작성됨
- [ ] index.html에 기본 HTML 구조가 작성됨
- [ ] main.js에서 필요한 모듈을 import할 수 있음

## 참고 사항
- TechSpec.md의 프로젝트 구조 참고
- 각 파일은 빈 파일이 아닌 기본 구조를 포함해야 함
"@

## Issue 3: GitHub Actions CI/CD 설정
gh issue create `
  --title "[Phase 1] GitHub Actions CI/CD 설정" `
  --label "enhancement,phase-1,ci-cd" `
  --body @"
## 작업 배경
코드 푸시 시 자동으로 빌드, 테스트, 배포가 이루어지도록 CI/CD 파이프라인을 구축합니다. GitHub Pages를 통해 자동 배포를 설정합니다.

## 작업 내용
- [ ] \`.github/workflows/deploy.yml\` 생성
  - [ ] Node.js 설정 (v20)
  - [ ] 의존성 설치 (npm ci)
  - [ ] Lint 실행
  - [ ] 테스트 실행
  - [ ] 빌드 실행
  - [ ] GitHub Pages 배포
- [ ] GitHub Pages 설정 확인
  - [ ] Settings > Pages에서 Source를 GitHub Actions로 설정
- [ ] CI/CD 파이프라인 테스트
  - [ ] 테스트 커밋 푸시
  - [ ] Actions 탭에서 워크플로우 실행 확인

## 인수 조건
- [ ] main 브랜치에 푸시 시 자동으로 워크플로우가 실행됨
- [ ] 모든 단계(lint, test, build, deploy)가 성공적으로 완료됨
- [ ] GitHub Pages에 배포된 사이트가 정상적으로 접근 가능함
- [ ] 배포 URL: https://shineun ji58.github.io/calculator-demo/

## 참고 사항
- TechSpec.md의 GitHub Actions 워크플로우 참고
- 권한 설정: contents: read, pages: write, id-token: write
"@

# Phase 2: 기본 계산기 구현

## Issue 4: Calculator 클래스 - 덧셈 기능 (TDD)
gh issue create `
  --title "[Phase 2] Calculator 클래스 - 덧셈 기능 구현 (TDD)" `
  --label "enhancement,phase-2,tdd,core-logic" `
  --body @"
## 작업 배경
계산기의 가장 기본이 되는 덧셈 기능을 TDD 방식으로 구현합니다. 이는 다른 연산 기능의 기반이 됩니다.

## 작업 내용
### Red (테스트 작성)
- [ ] 양수 덧셈 테스트 작성
  - 예: \`add(2, 3)\` → \`5\`
- [ ] 음수 덧셈 테스트 작성
  - 예: \`add(-2, -3)\` → \`-5\`
- [ ] 소수점 덧셈 테스트 작성
  - 예: \`add(0.1, 0.2)\` → \`0.3\`

### Green (구현)
- [ ] \`Calculator\` 클래스 생성
- [ ] \`add(a, b)\` 메서드 구현
- [ ] 모든 테스트 통과 확인

### Refactor (리팩토링)
- [ ] 코드 정리 및 최적화
- [ ] 주석 추가
- [ ] 테스트 재실행하여 통과 확인

## 인수 조건
- [ ] 모든 덧셈 테스트가 통과함
- [ ] 코드 커버리지 95% 이상
- [ ] ESLint 규칙 준수
- [ ] SOLID 원칙 준수 (SRP: Calculator는 계산만 담당)

## 참고 사항
- TDD 규칙 문서 참고 (docs/rules/tdd.md)
- 정밀도 문제 해결: Math.round 또는 toFixed 사용
"@

## Issue 5: Calculator 클래스 - 사칙연산 기능 (TDD)
gh issue create `
  --title "[Phase 2] Calculator 클래스 - 뺄셈, 곱셈, 나눗셈 구현 (TDD)" `
  --label "enhancement,phase-2,tdd,core-logic" `
  --body @"
## 작업 배경
덧셈에 이어 나머지 기본 사칙연산(뺄셈, 곱셈, 나눗셈)을 TDD 방식으로 구현합니다.

## 작업 내용
### 뺄셈 (subtract)
- [ ] 테스트 작성: 기본 뺄셈
- [ ] 테스트 작성: 음수 결과
- [ ] 구현: \`Calculator.subtract(a, b)\`
- [ ] 리팩토링

### 곱셈 (multiply)
- [ ] 테스트 작성: 기본 곱셈
- [ ] 테스트 작성: 0 곱셈
- [ ] 테스트 작성: 음수 곱셈
- [ ] 구현: \`Calculator.multiply(a, b)\`
- [ ] 리팩토링

### 나눗셈 (divide)
- [ ] 테스트 작성: 기본 나눗셈
- [ ] 테스트 작성: 0으로 나누기 에러
- [ ] 테스트 작성: 소수점 결과
- [ ] 구현: \`Calculator.divide(a, b)\`
- [ ] 리팩토링

## 인수 조건
- [ ] 모든 사칙연산 테스트가 통과함
- [ ] 0으로 나누기 시 적절한 에러 메시지 반환
- [ ] 코드 커버리지 95% 이상
- [ ] SOLID 원칙 준수

## 참고 사항
- 나눗셈 에러 처리: \`divide(a, 0)\` → \`"Error"\` 또는 예외 발생
- 부동소수점 정밀도 문제 고려
"@

## Issue 6: Calculator 클래스 - 추가 기능 (TDD)
gh issue create `
  --title "[Phase 2] Calculator 클래스 - 퍼센트, 부호 변경, 초기화 (TDD)" `
  --label "enhancement,phase-2,tdd,core-logic" `
  --body @"
## 작업 배경
기본 사칙연산 외에 계산기에 필요한 추가 기능들을 TDD 방식으로 구현합니다.

## 작업 내용
### 퍼센트 계산 (percentage)
- [ ] 테스트 작성
- [ ] 구현: \`Calculator.percentage(value)\`
- [ ] 리팩토링

### 부호 변경 (toggleSign)
- [ ] 테스트 작성
- [ ] 구현: \`Calculator.toggleSign(value)\`
- [ ] 리팩토링

### 초기화 기능
- [ ] 테스트 작성: 전체 초기화 (AC)
- [ ] 테스트 작성: 현재 값만 초기화 (C)
- [ ] 구현: \`Calculator.clear()\`, \`Calculator.clearAll()\`
- [ ] 리팩토링

## 인수 조건
- [ ] 모든 추가 기능 테스트가 통과함
- [ ] 퍼센트 계산이 정확함 (예: 100의 20% = 20)
- [ ] 부호 변경이 정확함 (5 → -5, -5 → 5)
- [ ] 초기화 후 상태가 올바르게 리셋됨
- [ ] 코드 커버리지 95% 이상

## 참고 사항
- clear()는 현재 입력만 지움
- clearAll()은 모든 상태를 초기화
"@

## Issue 7: 유틸리티 함수 구현 (TDD)
gh issue create `
  --title "[Phase 2] 유틸리티 함수 - 포맷팅 및 검증 (TDD)" `
  --label "enhancement,phase-2,tdd,core-logic" `
  --body @"
## 작업 배경
숫자 포맷팅과 입력 검증 등 계산기에 필요한 유틸리티 함수들을 TDD 방식으로 구현합니다.

## 작업 내용
### 숫자 포맷팅 (formatNumber)
- [ ] 테스트 작성: 천 단위 콤마
  - 예: \`1234\` → \`"1,234"\`
- [ ] 테스트 작성: 소수점 처리
  - 예: \`1234.56\` → \`"1,234.56"\`
- [ ] 구현: \`formatNumber(num)\`
- [ ] 리팩토링

### 입력 검증 (validateInput)
- [ ] 테스트 작성: 유효한 입력
- [ ] 테스트 작성: 무효한 입력
- [ ] 구현: \`validateInput(input)\`
- [ ] 리팩토링

## 인수 조건
- [ ] 모든 유틸리티 함수 테스트가 통과함
- [ ] 천 단위 콤마가 정확하게 삽입됨
- [ ] 소수점이 올바르게 처리됨
- [ ] 유효하지 않은 입력이 적절히 거부됨
- [ ] 코드 커버리지 90% 이상

## 참고 사항
- \`toLocaleString()\` 메서드 활용 가능
- 입력 검증: 숫자, 연산자, 소수점만 허용
"@

## Issue 8: 기본 UI 구조 및 스타일링
gh issue create `
  --title "[Phase 2] 기본 UI 구조 및 Tailwind CSS 스타일링" `
  --label "enhancement,phase-2,ui" `
  --body @"
## 작업 배경
계산기의 기본 UI 구조를 HTML로 작성하고 Tailwind CSS를 사용하여 디자인 시스템에 맞게 스타일링합니다.

## 작업 내용
### HTML 구조
- [ ] index.html 기본 구조 작성
- [ ] 헤더 영역 마크업 (모드 선택, 히스토리 버튼)
- [ ] 디스플레이 영역 마크업 (계산식, 결과)
- [ ] 키패드 영역 마크업 (버튼 그리드)

### Tailwind CSS 스타일링
- [ ] 컬러 시스템 적용 (primary, background-dark 등)
- [ ] 타이포그래피 적용 (Inter 폰트)
- [ ] 레이아웃 그리드 구현 (4열)
- [ ] 다크/라이트 모드 스타일

### 애니메이션
- [ ] animations.css 작성
- [ ] fadeIn 애니메이션
- [ ] 버튼 클릭 효과 (scale-95)

## 인수 조건
- [ ] 디자인 레퍼런스(design_reference/)와 일치하는 UI
- [ ] 다크/라이트 모드가 정상적으로 전환됨
- [ ] 모든 버튼이 올바르게 배치됨
- [ ] 반응형 레이아웃 동작 (모바일 우선)
- [ ] 애니메이션이 부드럽게 동작함 (60fps)

## 참고 사항
- 디자인 레퍼런스: docs/design_reference/
- Tailwind 설정: tailwind.config.js
- 최대 너비: 448px (max-w-md)
"@

## Issue 9: UI 컴포넌트 및 이벤트 처리
gh issue create `
  --title "[Phase 2] UI 컴포넌트 구현 및 이벤트 처리" `
  --label "enhancement,phase-2,ui" `
  --body @"
## 작업 배경
UI 컴포넌트를 모듈화하고, 버튼 클릭 및 키보드 입력 이벤트를 처리하여 계산기를 동작시킵니다.

## 작업 내용
### UI 컴포넌트
- [ ] header.js 구현 (모드 선택, 히스토리 버튼)
- [ ] display.js 구현 (계산식, 결과 표시)
- [ ] keypad.js 구현 (버튼 그리드 생성)
- [ ] ui.js 구현 (updateDisplay, updateExpression, showError 등)

### 이벤트 처리
- [ ] 버튼 클릭 이벤트 핸들러
  - [ ] 숫자 버튼
  - [ ] 연산자 버튼
  - [ ] 기능 버튼 (AC, ±, %)
  - [ ] 등호 버튼
- [ ] 키보드 입력 핸들러
  - [ ] 숫자 키 (0-9)
  - [ ] 연산자 키 (+, -, *, /)
  - [ ] 특수 키 (Enter, Escape, Backspace)

### 통합
- [ ] main.js에서 Calculator와 UI 연결
- [ ] 이벤트 리스너 설정

## 인수 조건
- [ ] 모든 버튼 클릭이 정상적으로 동작함
- [ ] 키보드 입력이 정상적으로 동작함
- [ ] 계산 결과가 디스플레이에 올바르게 표시됨
- [ ] 에러 메시지가 적절히 표시됨
- [ ] 버튼 클릭 시 애니메이션 동작

## 참고 사항
- Calculator 클래스와 UI를 분리 (SOLID - SRP)
- 이벤트 위임 패턴 사용 고려
"@

## Issue 10: Phase 2 테스트 및 검증
gh issue create `
  --title "[Phase 2] 기본 계산기 테스트 및 검증" `
  --label "testing,phase-2" `
  --body @"
## 작업 배경
Phase 2에서 구현한 기본 계산기의 모든 기능이 정상적으로 동작하는지 테스트하고 검증합니다.

## 작업 내용
### 자동화 테스트
- [ ] 코어 로직 단위 테스트 실행
  - [ ] Calculator 클래스 모든 메서드
  - [ ] 유틸리티 함수
- [ ] 코드 커버리지 확인 (90%+ 목표)
- [ ] 코어 로직 통합 테스트
  - [ ] 연속 계산 시나리오
  - [ ] 에러 처리 시나리오

### 수동 테스트
- [ ] UI 동작 확인
  - [ ] 버튼 클릭 반응
  - [ ] 키보드 입력
  - [ ] 애니메이션
- [ ] 크로스 브라우저 테스트
  - [ ] Chrome
  - [ ] Safari
  - [ ] Firefox
  - [ ] Edge

### 버그 수정
- [ ] 발견된 버그 수정
- [ ] 리팩토링

## 인수 조건
- [ ] 모든 자동화 테스트 통과
- [ ] 코드 커버리지 90% 이상
- [ ] 모든 브라우저에서 정상 동작
- [ ] 알려진 버그 없음
- [ ] 성능 요구사항 충족 (버튼 응답 < 100ms)

## 참고 사항
- 테스트 실행: \`npm run test\`
- 커버리지 확인: \`npm run test:coverage\`
"@

Write-Host "GitHub Issues 생성 완료!" -ForegroundColor Green
Write-Host "총 10개의 이슈가 생성되었습니다." -ForegroundColor Green

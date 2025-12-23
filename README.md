# 공학용 전자계산기 (Scientific Calculator)

[![Deploy to GitHub Pages](https://github.com/ShinEunJi58/calculator-demo/actions/workflows/deploy.yml/badge.svg)](https://github.com/ShinEunJi58/calculator-demo/actions/workflows/deploy.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> 모던하고 직관적인 UI/UX를 갖춘 웹 기반 공학용 전자계산기

![Calculator Preview](./docs/design_reference/screen.png)

## 🌟 주요 기능

### 📱 Standard 모드
- ✅ 기본 사칙연산 (+, -, ×, ÷)
- ✅ 퍼센트 계산 (%)
- ✅ 부호 변경 (+/-)
- ✅ 전체 지우기 (AC)

### 🔬 Scientific 모드
- ✅ 삼각함수 (sin, cos, tan, asin, acos, atan)
- ✅ 로그 함수 (log, ln)
- ✅ 지수 함수 (x², x³, xʸ, eˣ, 10ˣ)
- ✅ 제곱근 (√, ∛, ⁿ√)
- ✅ 팩토리얼 (n!)
- ✅ 괄호 연산
- ✅ 상수 (π, e)
- ✅ 각도 단위 전환 (DEG/RAD/GRAD)

### 🎨 UI/UX
- ✅ 다크/라이트 모드
- ✅ 반응형 디자인 (모바일 우선)
- ✅ 부드러운 애니메이션 (60fps)
- ✅ 키보드 입력 지원
- ✅ 계산 히스토리

## 🚀 데모

**Live Demo**: [https://shineun ji58.github.io/calculator-demo/](https://shineun ji58.github.io/calculator-demo/)

## 🛠️ 기술 스택

- **Frontend**: HTML5, JavaScript (ES6+), Tailwind CSS
- **Build Tool**: Vite
- **Testing**: Vitest
- **Math Engine**: Math.js
- **CI/CD**: GitHub Actions
- **Deployment**: GitHub Pages

## 📦 설치 및 실행

### 사전 요구사항
- Node.js 18.x 이상
- npm 9.x 이상

### 설치
```bash
# 저장소 클론
git clone https://github.com/ShinEunJi58/calculator-demo.git
cd calculator-demo

# 의존성 설치
npm install
```

### 개발 서버 실행
```bash
npm run dev
```
브라우저에서 `http://localhost:5173` 접속

### 프로덕션 빌드
```bash
npm run build
```

### 테스트 실행
```bash
# 단위 테스트
npm run test

# 테스트 (Watch 모드)
npm run test:watch

# 커버리지 확인
npm run test:coverage
```

## 📁 프로젝트 구조

```
calculator-demo/
├── .github/
│   ├── workflows/
│   │   └── deploy.yml          # GitHub Actions CI/CD
│   └── ISSUE_TEMPLATE/
│       └── feature.yml          # 이슈 템플릿
├── docs/
│   ├── PRD.md                   # 제품 요구사항 문서
│   ├── TechSpec.md              # 기술 명세서
│   ├── ROADMAP.md               # 구현 로드맵
│   ├── design_reference/        # 디자인 레퍼런스
│   └── rules/
│       ├── tdd.md               # TDD 규칙
│       └── solid.md             # SOLID 원칙
├── src/
│   ├── index.html
│   ├── main.js
│   ├── styles/
│   │   ├── index.css
│   │   └── animations.css
│   ├── js/
│   │   ├── calculator.js        # 계산 로직 (TDD)
│   │   ├── storage.js           # 스토리지 관리 (TDD)
│   │   ├── utils.js             # 유틸리티 (TDD)
│   │   ├── ui.js                # UI 업데이트
│   │   └── keyboard.js          # 키보드 입력
│   └── components/
│       ├── display.js
│       ├── keypad.js
│       ├── header.js
│       └── history.js
├── tests/
│   ├── calculator.test.js
│   ├── storage.test.js
│   └── utils.test.js
└── scripts/
    └── create-issues.ps1        # GitHub 이슈 생성 스크립트
```

## 🧪 개발 원칙

### TDD (Test-Driven Development)
코어 로직(계산, 스토리지, 유틸리티)은 **TDD 방식**으로 구현합니다.
- 🔴 Red: 실패하는 테스트 작성
- 🟢 Green: 테스트를 통과하는 최소 코드 작성
- 🔵 Refactor: 코드 개선

자세한 내용: [docs/rules/tdd.md](./docs/rules/tdd.md)

### SOLID 원칙
모든 코드는 **SOLID 원칙**을 따릅니다.
- **S**RP: 단일 책임 원칙
- **O**CP: 개방/폐쇄 원칙
- **L**SP: 리스코프 치환 원칙
- **I**SP: 인터페이스 분리 원칙
- **D**IP: 의존성 역전 원칙

자세한 내용: [docs/rules/solid.md](./docs/rules/solid.md)

## 📊 테스트 커버리지

| 영역 | 목표 | 현재 |
|------|------|------|
| 계산 로직 | 95%+ | - |
| 스토리지 | 90%+ | - |
| 유틸리티 | 90%+ | - |
| **전체 (코어 로직)** | **90%+** | - |

*참고: UI 컴포넌트는 수동 테스트로 검증합니다.*

## 🗺️ 로드맵

### ✅ Phase 1: 프로젝트 초기 설정 (Week 1, Day 1-2)
- [x] 개발 환경 설정
- [x] 프로젝트 구조 생성
- [x] GitHub Actions CI/CD 설정

### 🚧 Phase 2: 기본 계산기 구현 (Week 1, Day 3-7)
- [ ] 계산기 코어 로직 (TDD)
- [ ] UI 구현
- [ ] 이벤트 처리

### 📅 Phase 3: 공학용 기능 구현 (Week 2-3)
- [ ] 삼각함수, 로그, 지수 함수 (TDD)
- [ ] Scientific 모드 UI
- [ ] Math.js 통합

### 📅 Phase 4: 히스토리 & 설정 (Week 4)
- [ ] 히스토리 기능 (TDD)
- [ ] 테마 전환
- [ ] 설정 관리

### 📅 Phase 5: 최적화 & 배포 (Week 5)
- [ ] 성능 최적화
- [ ] 접근성 개선
- [ ] 문서화
- [ ] 배포

자세한 로드맵: [docs/ROADMAP.md](./docs/ROADMAP.md)

## 🤝 기여하기

기여를 환영합니다! 다음 단계를 따라주세요:

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### 개발 가이드
- 코어 로직은 TDD로 개발
- SOLID 원칙 준수
- ESLint 규칙 준수
- 커밋 메시지는 [Conventional Commits](https://www.conventionalcommits.org/) 형식 사용

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.

## 👥 제작자

- **ShinEunJi58** - [GitHub](https://github.com/ShinEunJi58)

## 📚 문서

- [PRD (Product Requirements Document)](./docs/PRD.md)
- [Tech Spec (Technical Specification)](./docs/TechSpec.md)
- [ROADMAP (Implementation Roadmap)](./docs/ROADMAP.md)
- [TDD Rules](./docs/rules/tdd.md)
- [SOLID Principles](./docs/rules/solid.md)

## 🙏 감사의 말

- 디자인 레퍼런스: Stitch Design System
- 아이콘: [Material Symbols](https://fonts.google.com/icons)
- 폰트: [Inter](https://fonts.google.com/specimen/Inter)

---

**Made with ❤️ by ShinEunJi58**

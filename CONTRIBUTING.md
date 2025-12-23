# Contribution Guidelines

## 기여 방법

이 프로젝트에 기여해주셔서 감사합니다! 다음 가이드라인을 따라주세요.

## 개발 환경 설정

1. **저장소 Fork 및 Clone**
   ```bash
   git clone https://github.com/YOUR_USERNAME/calculator-demo.git
   cd calculator-demo
   ```

2. **의존성 설치**
   ```bash
   npm install
   ```

3. **개발 서버 실행**
   ```bash
   npm run dev
   ```

## 코딩 규칙

### TDD (Test-Driven Development)
- 코어 로직(calculator.js, storage.js, utils.js)은 **반드시 TDD**로 개발
- Red → Green → Refactor 사이클 준수
- 테스트 커버리지 90% 이상 유지

자세한 내용: [docs/rules/tdd.md](./docs/rules/tdd.md)

### SOLID 원칙
- 모든 코드는 SOLID 원칙을 따름
- 각 클래스는 단일 책임만 가짐
- 확장에는 열려있고 수정에는 닫혀있음

자세한 내용: [docs/rules/solid.md](./docs/rules/solid.md)

### 코드 스타일
- ESLint 규칙 준수
- Prettier로 포맷팅
- 실행: `npm run lint` 및 `npm run format`

## 커밋 메시지

[Conventional Commits](https://www.conventionalcommits.org/) 형식을 사용합니다:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type
- `feat`: 새로운 기능
- `fix`: 버그 수정
- `docs`: 문서 변경
- `style`: 코드 포맷팅 (기능 변경 없음)
- `refactor`: 리팩토링
- `test`: 테스트 추가/수정
- `chore`: 빌드, 설정 변경

### 예시
```
feat(calculator): add multiplication function

- Implement multiply method with TDD
- Add tests for positive, negative, and zero cases
- Coverage: 95%

Closes #5
```

## Pull Request 프로세스

1. **브랜치 생성**
   ```bash
   git checkout -b feature/amazing-feature
   ```

2. **변경사항 커밋**
   ```bash
   git commit -m "feat: add amazing feature"
   ```

3. **테스트 실행**
   ```bash
   npm run test
   npm run lint
   ```

4. **푸시**
   ```bash
   git push origin feature/amazing-feature
   ```

5. **Pull Request 생성**
   - 작업 배경, 변경 내용, 테스트 결과 포함
   - 관련 이슈 번호 연결

## 이슈 생성

GitHub Issues를 사용하여 버그 리포트나 기능 제안을 해주세요.

### 버그 리포트
- 재현 단계
- 예상 동작
- 실제 동작
- 스크린샷 (가능한 경우)

### 기능 제안
- 작업 배경
- 제안 내용
- 예상 효과

## 질문

질문이 있으시면 [GitHub Discussions](https://github.com/ShinEunJi58/calculator-demo/discussions)를 이용해주세요.

---

다시 한 번 기여해주셔서 감사합니다! 🙏

# Tech Spec: 공학용 전자계산기 웹앱

## 문서 정보
- **프로젝트명**: Scientific Calculator Web App
- **버전**: 1.0
- **작성일**: 2025-12-23
- **작성자**: Development Team
- **관련 문서**: [PRD.md](./PRD.md)

---

## 1. 기술 스택 개요

### 1.1 프론트엔드 기술

| 기술 | 버전 | 용도 | 선택 이유 |
|------|------|------|-----------|
| **HTML5** | - | 마크업 | 웹 표준, 시맨틱 태그 지원 |
| **Tailwind CSS** | 3.x | 스타일링 | 디자인 시스템 일관성, 빠른 개발, 디자인 파일과 호환 |
| **JavaScript (ES6+)** | ES2020+ | 로직 구현 | 모던 문법, 브라우저 네이티브 지원 |
| **Math.js** | 12.x | 계산 엔진 | 고정밀 계산, 공학용 함수 지원 |

### 1.2 개발 도구

| 도구 | 버전 | 용도 |
|------|------|------|
| **Vite** | 5.x | 빌드 도구 |
| **ESLint** | 8.x | 코드 품질 |
| **Prettier** | 3.x | 코드 포맷팅 |
| **Vitest** | 1.x | 단위 테스트 |

### 1.3 외부 라이브러리

```json
{
  "dependencies": {
    "mathjs": "^12.0.0"
  },
  "devDependencies": {
    "vite": "^5.0.0",
    "tailwindcss": "^3.4.0",
    "autoprefixer": "^10.4.0",
    "postcss": "^8.4.0",
    "eslint": "^8.0.0",
    "prettier": "^3.0.0",
    "vitest": "^1.0.0"
  }
}
```

---

## 2. 아키텍처 설계

### 2.1 프로젝트 구조

```
calculator-demo/
├── public/
│   └── favicon.ico
├── src/
│   ├── index.html              # 메인 HTML
│   ├── main.js                 # 앱 진입점
│   ├── styles/
│   │   ├── index.css           # Tailwind 설정 + 커스텀 스타일
│   │   └── animations.css      # 애니메이션 정의
│   ├── js/
│   │   ├── calculator.js       # 계산기 핵심 로직
│   │   ├── ui.js               # UI 업데이트 로직
│   │   ├── keyboard.js         # 키보드 입력 핸들러
│   │   ├── storage.js          # 로컬 스토리지 관리
│   │   └── utils.js            # 유틸리티 함수
│   └── components/
│       ├── display.js          # 디스플레이 컴포넌트
│       ├── keypad.js           # 키패드 컴포넌트
│       ├── header.js           # 헤더 컴포넌트
│       └── history.js          # 히스토리 패널 컴포넌트
├── tests/
│   ├── calculator.test.js
│   ├── ui.test.js
│   └── utils.test.js
├── docs/
│   ├── PRD.md
│   ├── TechSpec.md
│   └── design_reference/
├── .gitignore
├── package.json
├── vite.config.js
├── tailwind.config.js
├── postcss.config.js
└── README.md
```

### 2.2 아키텍처 패턴

**MVC (Model-View-Controller) 변형**

```
┌─────────────────────────────────────────┐
│              User Interface             │
│         (index.html + Tailwind)         │
└─────────────────┬───────────────────────┘
                  │
        ┌─────────┴─────────┐
        │                   │
┌───────▼────────┐  ┌──────▼──────┐
│   Controller   │  │    View     │
│   (main.js)    │  │   (ui.js)   │
│                │  │             │
│ - Event Handle │  │ - DOM Update│
│ - State Mgmt   │  │ - Animation │
└───────┬────────┘  └─────────────┘
        │
┌───────▼────────┐
│     Model      │
│ (calculator.js)│
│                │
│ - Calculation  │
│ - Validation   │
│ - Math Logic   │
└────────────────┘
```

---

## 3. 핵심 모듈 설계

### 3.1 Calculator 모듈 (`calculator.js`)

**책임**: 모든 계산 로직 처리

```javascript
class Calculator {
  constructor() {
    this.currentValue = '0';
    this.previousValue = null;
    this.operator = null;
    this.expression = '';
    this.mode = 'standard'; // 'standard' | 'scientific'
    this.angleUnit = 'DEG'; // 'DEG' | 'RAD' | 'GRAD'
  }

  // 핵심 메서드
  inputNumber(num) { }
  inputOperator(op) { }
  calculate() { }
  clear() { }
  clearAll() { }
  toggleSign() { }
  percentage() { }
  
  // 공학용 함수
  sin(value) { }
  cos(value) { }
  tan(value) { }
  log(value) { }
  ln(value) { }
  sqrt(value) { }
  power(base, exponent) { }
  factorial(n) { }
}
```

**주요 기능**:
- 사칙연산 (+, -, ×, ÷)
- 공학용 함수 (삼각함수, 로그, 지수, 제곱근 등)
- 각도 단위 변환 (DEG ↔ RAD ↔ GRAD)
- 에러 처리 및 검증

### 3.2 UI 모듈 (`ui.js`)

**책임**: DOM 조작 및 화면 업데이트

```javascript
class UI {
  constructor() {
    this.displayElement = document.querySelector('#display');
    this.expressionElement = document.querySelector('#expression');
  }

  updateDisplay(value) { }
  updateExpression(expr) { }
  showError(message) { }
  animateButton(button) { }
  toggleTheme(theme) { }
  showHistory(history) { }
  hideHistory() { }
}
```

**주요 기능**:
- 디스플레이 업데이트 (숫자 포맷팅, 천 단위 콤마)
- 애니메이션 트리거
- 테마 전환
- 히스토리 패널 표시/숨김

### 3.3 Storage 모듈 (`storage.js`)

**책임**: 로컬 스토리지 관리

```javascript
class Storage {
  static KEYS = {
    HISTORY: 'calc_history',
    SETTINGS: 'calc_settings'
  };

  static saveHistory(history) { }
  static loadHistory() { }
  static saveSettings(settings) { }
  static loadSettings() { }
  static clearHistory() { }
}
```

**데이터 스키마**:

```typescript
// History Item
interface HistoryItem {
  id: string;           // UUID
  expression: string;   // "1234 + 56"
  result: string;       // "1290"
  timestamp: string;    // ISO 8601
}

// Settings
interface Settings {
  theme: 'light' | 'dark';
  angleUnit: 'DEG' | 'RAD' | 'GRAD';
  soundEnabled: boolean;
  hapticEnabled: boolean;
}
```

### 3.4 Keyboard 모듈 (`keyboard.js`)

**책임**: 키보드 입력 처리

```javascript
class KeyboardHandler {
  constructor(calculator, ui) {
    this.calculator = calculator;
    this.ui = ui;
    this.setupListeners();
  }

  setupListeners() {
    document.addEventListener('keydown', this.handleKeyPress.bind(this));
  }

  handleKeyPress(event) {
    const keyMap = {
      '0-9': 'number',
      '+': 'add',
      '-': 'subtract',
      '*': 'multiply',
      '/': 'divide',
      'Enter': 'equals',
      'Escape': 'clear',
      'Backspace': 'delete',
      '%': 'percent',
      '.': 'decimal'
    };
    // 키 매핑 및 처리
  }
}
```

---

## 4. 상태 관리

### 4.1 애플리케이션 상태

```javascript
const AppState = {
  calculator: {
    currentValue: '0',
    previousValue: null,
    operator: null,
    expression: '',
    mode: 'standard',
    angleUnit: 'DEG',
    lastResult: null
  },
  ui: {
    theme: 'dark',
    historyVisible: false,
    modeExpanded: false
  },
  history: [],
  settings: {
    soundEnabled: true,
    hapticEnabled: true
  }
};
```

### 4.2 상태 업데이트 플로우

```
User Input → Event Handler → Calculator Logic → State Update → UI Update
```

---

## 5. 계산 엔진 구현

### 5.1 Math.js 통합

```javascript
import { create, all } from 'mathjs';

const math = create(all, {
  number: 'BigNumber',      // 고정밀 계산
  precision: 64             // 64비트 정밀도
});

// 사용 예시
function calculate(expression) {
  try {
    const result = math.evaluate(expression);
    return math.format(result, { precision: 14 });
  } catch (error) {
    return 'Error';
  }
}
```

### 5.2 각도 단위 변환

```javascript
function convertAngle(value, from, to) {
  const conversions = {
    'DEG_TO_RAD': (deg) => deg * (Math.PI / 180),
    'RAD_TO_DEG': (rad) => rad * (180 / Math.PI),
    'DEG_TO_GRAD': (deg) => deg * (10 / 9),
    'GRAD_TO_DEG': (grad) => grad * (9 / 10),
    'RAD_TO_GRAD': (rad) => rad * (200 / Math.PI),
    'GRAD_TO_RAD': (grad) => grad * (Math.PI / 200)
  };
  
  const key = `${from}_TO_${to}`;
  return conversions[key] ? conversions[key](value) : value;
}
```

### 5.3 에러 처리

```javascript
function safeCalculate(expression) {
  try {
    // 0으로 나누기 체크
    if (expression.includes('/ 0') || expression.includes('/0')) {
      throw new Error('Cannot divide by 0');
    }
    
    // 계산 실행
    const result = math.evaluate(expression);
    
    // 오버플로우 체크
    if (!isFinite(result)) {
      throw new Error('Overflow');
    }
    
    return result;
  } catch (error) {
    console.error('Calculation error:', error);
    return 'Error';
  }
}
```

---

## 6. UI 컴포넌트 구현

### 6.1 디스플레이 컴포넌트

```javascript
// display.js
export function createDisplay() {
  return `
    <main class="flex-1 flex flex-col justify-end px-6 pb-6 pt-10 relative">
      <!-- Background decoration -->
      <div class="absolute top-0 right-0 w-64 h-64 bg-primary/5 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2 pointer-events-none"></div>
      
      <!-- Expression -->
      <div id="expression" class="w-full text-right mb-2">
        <h2 class="text-slate-400 dark:text-slate-400 text-xl md:text-2xl font-medium tracking-wide">
          <!-- 계산식 표시 -->
        </h2>
      </div>
      
      <!-- Result -->
      <div id="display" class="w-full text-right">
        <h1 class="text-slate-800 dark:text-white text-[4rem] md:text-[5rem] font-bold leading-none tracking-tight">
          0
        </h1>
      </div>
    </main>
  `;
}
```

### 6.2 키패드 컴포넌트

```javascript
// keypad.js
export function createKeypad() {
  const buttons = [
    { label: 'AC', type: 'function', action: 'clear' },
    { label: '±', type: 'function', action: 'toggleSign', icon: 'exposure' },
    { label: '%', type: 'function', action: 'percent', icon: 'percent' },
    { label: '÷', type: 'operator', action: 'divide', icon: 'azm' },
    // ... 나머지 버튼들
  ];
  
  return `
    <div class="grid grid-cols-4 gap-3">
      ${buttons.map(btn => createButton(btn)).join('')}
    </div>
  `;
}

function createButton(btn) {
  const classes = getButtonClasses(btn.type);
  return `
    <button 
      class="${classes}"
      data-action="${btn.action}"
      data-value="${btn.label}">
      ${btn.icon ? `<span class="material-symbols-outlined">${btn.icon}</span>` : btn.label}
    </button>
  `;
}
```

### 6.3 히스토리 컴포넌트

```javascript
// history.js
export function createHistoryPanel(history) {
  return `
    <div id="history-panel" class="fixed inset-y-0 right-0 w-80 bg-white dark:bg-surface-dark shadow-2xl transform translate-x-full transition-transform duration-300">
      <div class="p-5">
        <div class="flex items-center justify-between mb-4">
          <h3 class="text-lg font-semibold">History</h3>
          <button id="close-history" class="p-2 rounded-full hover:bg-black/5 dark:hover:bg-white/10">
            <span class="material-symbols-outlined">close</span>
          </button>
        </div>
        
        <div class="space-y-2">
          ${history.map(item => `
            <div class="p-3 rounded-lg bg-slate-50 dark:bg-key-func cursor-pointer hover:bg-slate-100 dark:hover:bg-slate-700 transition-colors">
              <div class="text-sm text-slate-500 dark:text-slate-400">${item.expression}</div>
              <div class="text-xl font-semibold">${item.result}</div>
            </div>
          `).join('')}
        </div>
      </div>
    </div>
  `;
}
```

---

## 7. 스타일링 시스템

### 7.1 Tailwind 설정 (`tailwind.config.js`)

```javascript
export default {
  darkMode: 'class',
  content: ['./src/**/*.{html,js}'],
  theme: {
    extend: {
      colors: {
        'primary': '#135bec',
        'primary-hover': '#1d4ed8',
        'background-light': '#f6f6f8',
        'background-dark': '#101622',
        'surface-dark': '#1C2533',
        'surface-light': '#E2E8F0',
        'key-func': '#2E3A52',
      },
      fontFamily: {
        'display': ['Inter', 'sans-serif']
      },
      borderRadius: {
        'DEFAULT': '0.25rem',
        'lg': '0.5rem',
        'xl': '0.75rem',
        '2xl': '1rem',
        '3xl': '1.5rem',
        'full': '9999px'
      },
    },
  },
  plugins: [],
};
```

### 7.2 커스텀 애니메이션 (`animations.css`)

```css
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes slideUp {
  from {
    transform: translateY(100%);
  }
  to {
    transform: translateY(0);
  }
}

.animate-fade-in {
  animation: fadeIn 0.5s ease-out forwards;
}

.animate-slide-up {
  animation: slideUp 0.3s ease-out forwards;
}

/* 버튼 클릭 효과 */
.button-press {
  transform: scale(0.95);
  transition: transform 0.1s ease-out;
}
```

---

## 8. 이벤트 처리

### 8.1 이벤트 리스너 설정

```javascript
// main.js
function setupEventListeners() {
  // 버튼 클릭
  document.querySelectorAll('button[data-action]').forEach(button => {
    button.addEventListener('click', handleButtonClick);
  });
  
  // 키보드 입력
  document.addEventListener('keydown', handleKeyPress);
  
  // 테마 전환
  document.getElementById('theme-toggle')?.addEventListener('click', toggleTheme);
  
  // 히스토리
  document.getElementById('history-btn')?.addEventListener('click', showHistory);
}
```

### 8.2 이벤트 핸들러

```javascript
function handleButtonClick(event) {
  const button = event.currentTarget;
  const action = button.dataset.action;
  const value = button.dataset.value;
  
  // 애니메이션
  animateButton(button);
  
  // 액션 처리
  switch (action) {
    case 'number':
      calculator.inputNumber(value);
      break;
    case 'operator':
      calculator.inputOperator(value);
      break;
    case 'equals':
      calculator.calculate();
      break;
    case 'clear':
      calculator.clearAll();
      break;
    // ... 기타 액션
  }
  
  // UI 업데이트
  ui.updateDisplay(calculator.currentValue);
  ui.updateExpression(calculator.expression);
}
```

---

## 9. 성능 최적화

### 9.1 최적화 전략

| 영역 | 기법 | 목표 |
|------|------|------|
| **로딩** | Code splitting, Lazy loading | < 2초 초기 로드 |
| **렌더링** | Virtual DOM 미사용, 직접 DOM 조작 | 60fps 유지 |
| **계산** | Web Worker (복잡한 계산) | < 50ms 응답 |
| **애니메이션** | CSS transforms, GPU 가속 | 부드러운 전환 |
| **메모리** | 히스토리 제한 (50개), 이벤트 리스너 정리 | 메모리 누수 방지 |

### 9.2 번들 최적화

```javascript
// vite.config.js
export default {
  build: {
    minify: 'terser',
    terserOptions: {
      compress: {
        drop_console: true,
        drop_debugger: true
      }
    },
    rollupOptions: {
      output: {
        manualChunks: {
          'math': ['mathjs']
        }
      }
    }
  }
};
```

---

## 10. 테스트 전략

### 10.1 단위 테스트

```javascript
// tests/calculator.test.js
import { describe, it, expect } from 'vitest';
import { Calculator } from '../src/js/calculator.js';

describe('Calculator', () => {
  it('should add two numbers correctly', () => {
    const calc = new Calculator();
    calc.inputNumber('5');
    calc.inputOperator('+');
    calc.inputNumber('3');
    calc.calculate();
    expect(calc.currentValue).toBe('8');
  });
  
  it('should handle division by zero', () => {
    const calc = new Calculator();
    calc.inputNumber('5');
    calc.inputOperator('/');
    calc.inputNumber('0');
    calc.calculate();
    expect(calc.currentValue).toBe('Error');
  });
  
  // 더 많은 테스트...
});
```

### 10.2 테스트 커버리지 목표

- **계산 로직**: 95%+
- **스토리지 로직**: 90%+
- **유틸리티**: 90%+
- **전체 코어 로직**: 90%+

**참고**: UI 컴포넌트는 테스트 커버리지에서 제외됩니다 (수동 테스트로 검증).

---

## 11. 빌드 및 배포

### 11.1 빌드 스크립트

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "test": "vitest",
    "test:ui": "vitest --ui",
    "lint": "eslint src/**/*.js",
    "format": "prettier --write src/**/*.{js,css,html}"
  }
}
```

### 11.2 배포 설정 (GitHub Pages)

#### Vite 설정

```javascript
// vite.config.js
export default {
  base: '/calculator-demo/', // GitHub 저장소 이름으로 변경
  build: {
    outDir: 'dist',
    assetsDir: 'assets'
  }
};
```

#### GitHub Actions 워크플로우

```yaml
# .github/workflows/deploy.yml
name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

# GitHub Pages 배포 권한 설정
permissions:
  contents: read
  pages: write
  id-token: write

# 동시 배포 방지
concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  # 빌드 작업
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      
      - name: Install dependencies
        run: npm ci
      
      - name: Lint
        run: npm run lint
      
      - name: Run tests
        run: npm run test
      
      - name: Build
        run: npm run build
      
      - name: Setup Pages
        uses: actions/configure-pages@v4
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: './dist'
  
  # 배포 작업
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    if: github.ref == 'refs/heads/main'
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

---

## 12. 브라우저 호환성

### 12.1 Polyfill 전략

```javascript
// main.js
// ES6+ 기능 체크 및 폴리필
if (!Array.prototype.includes) {
  // Polyfill for older browsers
}

if (!Object.entries) {
  // Polyfill for older browsers
}
```

### 12.2 CSS Autoprefixer

```javascript
// postcss.config.js
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {
      overrideBrowserslist: [
        'last 2 versions',
        '> 1%',
        'not dead'
      ]
    }
  }
};
```

---

## 13. 보안 고려사항

### 13.1 입력 검증

```javascript
function sanitizeInput(input) {
  // XSS 방지
  const sanitized = input.replace(/<script[^>]*>.*?<\/script>/gi, '');
  
  // 허용된 문자만 통과
  const allowed = /^[0-9+\-*/().%\s]+$/;
  if (!allowed.test(sanitized)) {
    throw new Error('Invalid input');
  }
  
  return sanitized;
}
```

### 13.2 CSP (Content Security Policy)

```html
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self'; 
               style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; 
               font-src 'self' https://fonts.gstatic.com;">
```

---

## 14. 접근성 (A11y)

### 14.1 ARIA 레이블

```html
<button 
  aria-label="Add"
  role="button"
  tabindex="0">
  <span class="material-symbols-outlined">add</span>
</button>
```

### 14.2 키보드 네비게이션

```javascript
// 모든 버튼에 tabindex 설정
// Enter/Space로 버튼 활성화
// Escape로 모달/패널 닫기
```

---

## 15. 모니터링 및 로깅

### 15.1 에러 로깅

```javascript
class ErrorLogger {
  static log(error, context) {
    const errorData = {
      message: error.message,
      stack: error.stack,
      context,
      timestamp: new Date().toISOString(),
      userAgent: navigator.userAgent
    };
    
    console.error('Error logged:', errorData);
    
    // 프로덕션에서는 외부 서비스로 전송
    // sendToErrorTracking(errorData);
  }
}
```

### 15.2 성능 모니터링

```javascript
// Performance API 사용
const perfData = performance.getEntriesByType('navigation')[0];
console.log('Page load time:', perfData.loadEventEnd - perfData.fetchStart);
```

---

## 16. 향후 확장성

### 16.1 플러그인 시스템 (Phase 2)

```javascript
class CalculatorPlugin {
  constructor(calculator) {
    this.calculator = calculator;
  }
  
  register() {
    // 플러그인 등록
  }
  
  execute() {
    // 플러그인 실행
  }
}

// 사용 예시
const unitConverter = new UnitConverterPlugin(calculator);
unitConverter.register();
```

### 16.2 PWA 지원 (Phase 3)

```javascript
// service-worker.js
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open('calculator-v1').then((cache) => {
      return cache.addAll([
        '/',
        '/index.html',
        '/main.js',
        '/styles.css'
      ]);
    })
  );
});
```

---

## 17. 개발 워크플로우

### 17.1 Git 브랜치 전략

```
main (프로덕션)
  ├── develop (개발)
  │   ├── feature/calculator-logic
  │   ├── feature/ui-components
  │   └── feature/history-panel
  └── hotfix/critical-bug
```

### 17.2 코드 리뷰 체크리스트

- [ ] 코드 스타일 준수 (ESLint/Prettier)
- [ ] 단위 테스트 작성 및 통과
- [ ] 접근성 검증 (ARIA, 키보드 네비게이션)
- [ ] 성능 영향 확인
- [ ] 브라우저 호환성 테스트
- [ ] 보안 취약점 검토

---

## 18. 참고 자료

### 18.1 기술 문서
- [Math.js Documentation](https://mathjs.org/docs/)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Vite Documentation](https://vitejs.dev/)
- [Vitest Documentation](https://vitest.dev/)

### 18.2 디자인 가이드
- [Material Design](https://material.io/design)
- [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/WAI/WCAG21/quickref/)

---

**문서 버전**: 1.0  
**최종 수정일**: 2025-12-23  
**승인 상태**: Draft

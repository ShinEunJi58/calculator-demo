# SOLID 원칙

## 개요
이 프로젝트의 모든 코드는 **SOLID 원칙**을 따라 구현합니다.

---

## SOLID 원칙

### 1. SRP (Single Responsibility Principle) - 단일 책임 원칙

**"하나의 클래스는 하나의 책임만 가져야 한다"**

#### ✅ 올바른 예시

```javascript
// 각 클래스가 하나의 책임만 가짐
class Calculator {
  add(a, b) { return a + b; }
  subtract(a, b) { return a - b; }
}

class DisplayFormatter {
  formatNumber(num) {
    return num.toLocaleString();
  }
}

class HistoryManager {
  saveHistory(item) { /* ... */ }
  loadHistory() { /* ... */ }
}
```

#### ❌ 잘못된 예시

```javascript
// 하나의 클래스가 여러 책임을 가짐
class Calculator {
  add(a, b) { return a + b; }
  
  // 책임 위반: 포맷팅은 별도 클래스로
  formatNumber(num) {
    return num.toLocaleString();
  }
  
  // 책임 위반: 히스토리 관리는 별도 클래스로
  saveHistory(item) {
    localStorage.setItem('history', JSON.stringify(item));
  }
}
```

---

### 2. OCP (Open/Closed Principle) - 개방/폐쇄 원칙

**"확장에는 열려있고, 수정에는 닫혀있어야 한다"**

#### ✅ 올바른 예시

```javascript
// 기본 연산 인터페이스
class Operation {
  execute(a, b) {
    throw new Error('Must implement execute method');
  }
}

// 확장 가능한 구조
class AddOperation extends Operation {
  execute(a, b) { return a + b; }
}

class SubtractOperation extends Operation {
  execute(a, b) { return a - b; }
}

// 새로운 연산 추가 시 기존 코드 수정 불필요
class MultiplyOperation extends Operation {
  execute(a, b) { return a * b; }
}

class Calculator {
  constructor() {
    this.operations = new Map();
  }
  
  registerOperation(symbol, operation) {
    this.operations.set(symbol, operation);
  }
  
  calculate(a, symbol, b) {
    const operation = this.operations.get(symbol);
    return operation.execute(a, b);
  }
}
```

#### ❌ 잘못된 예시

```javascript
// 새로운 연산 추가 시 기존 코드 수정 필요
class Calculator {
  calculate(a, operator, b) {
    if (operator === '+') return a + b;
    if (operator === '-') return a - b;
    // 새로운 연산 추가 시 이 메서드를 계속 수정해야 함
  }
}
```

---

### 3. LSP (Liskov Substitution Principle) - 리스코프 치환 원칙

**"자식 클래스는 부모 클래스를 대체할 수 있어야 한다"**

#### ✅ 올바른 예시

```javascript
class Storage {
  save(key, value) { /* ... */ }
  load(key) { /* ... */ }
}

class LocalStorage extends Storage {
  save(key, value) {
    localStorage.setItem(key, JSON.stringify(value));
  }
  
  load(key) {
    return JSON.parse(localStorage.getItem(key));
  }
}

class SessionStorage extends Storage {
  save(key, value) {
    sessionStorage.setItem(key, JSON.stringify(value));
  }
  
  load(key) {
    return JSON.parse(sessionStorage.getItem(key));
  }
}

// 어떤 Storage 구현체를 사용해도 동일하게 작동
function saveHistory(storage, history) {
  storage.save('history', history);
}
```

---

### 4. ISP (Interface Segregation Principle) - 인터페이스 분리 원칙

**"클라이언트는 사용하지 않는 인터페이스에 의존하지 않아야 한다"**

#### ✅ 올바른 예시

```javascript
// 인터페이스를 작게 분리
class BasicCalculator {
  add(a, b) { return a + b; }
  subtract(a, b) { return a - b; }
}

class ScientificCalculator extends BasicCalculator {
  sin(x) { return Math.sin(x); }
  cos(x) { return Math.cos(x); }
  log(x) { return Math.log(x); }
}

// 기본 계산만 필요한 곳에서는 BasicCalculator만 사용
class SimpleUI {
  constructor(calculator) {
    this.calculator = calculator; // BasicCalculator
  }
}
```

#### ❌ 잘못된 예시

```javascript
// 모든 기능이 하나의 큰 인터페이스에
class Calculator {
  add(a, b) { /* ... */ }
  subtract(a, b) { /* ... */ }
  sin(x) { /* ... */ }
  cos(x) { /* ... */ }
  // 기본 계산만 필요한 클라이언트도 모든 메서드를 알아야 함
}
```

---

### 5. DIP (Dependency Inversion Principle) - 의존성 역전 원칙

**"구체화가 아닌 추상화에 의존해야 한다"**

#### ✅ 올바른 예시

```javascript
// 추상화된 인터페이스
class CalculationEngine {
  evaluate(expression) {
    throw new Error('Must implement evaluate method');
  }
}

// 구체적인 구현
class MathJsEngine extends CalculationEngine {
  evaluate(expression) {
    return math.evaluate(expression);
  }
}

class NativeEngine extends CalculationEngine {
  evaluate(expression) {
    return eval(expression); // 실제로는 사용 금지
  }
}

// 추상화에 의존
class Calculator {
  constructor(engine) {
    this.engine = engine; // CalculationEngine 타입
  }
  
  calculate(expression) {
    return this.engine.evaluate(expression);
  }
}

// 사용
const calc = new Calculator(new MathJsEngine());
```

#### ❌ 잘못된 예시

```javascript
// 구체적인 구현에 직접 의존
class Calculator {
  constructor() {
    this.mathjs = math; // 구체적인 라이브러리에 직접 의존
  }
  
  calculate(expression) {
    return this.mathjs.evaluate(expression);
  }
}
```

---

## 프로젝트 적용 예시

### Calculator 모듈 구조

```javascript
// 1. SRP: 각 클래스가 하나의 책임
class Calculator {
  // 계산 로직만 담당
}

class HistoryManager {
  // 히스토리 관리만 담당
}

class DisplayFormatter {
  // 화면 포맷팅만 담당
}

// 2. OCP: 확장 가능한 연산 시스템
class OperationRegistry {
  constructor() {
    this.operations = new Map();
  }
  
  register(symbol, operation) {
    this.operations.set(symbol, operation);
  }
  
  get(symbol) {
    return this.operations.get(symbol);
  }
}

// 3. LSP: Storage 추상화
class Storage {
  save(key, value) {}
  load(key) {}
}

class LocalStorageAdapter extends Storage {
  save(key, value) {
    localStorage.setItem(key, JSON.stringify(value));
  }
  
  load(key) {
    return JSON.parse(localStorage.getItem(key) || 'null');
  }
}

// 4. ISP: 인터페이스 분리
class BasicOperations {
  add(a, b) {}
  subtract(a, b) {}
  multiply(a, b) {}
  divide(a, b) {}
}

class ScientificOperations {
  sin(x) {}
  cos(x) {}
  tan(x) {}
  log(x) {}
}

// 5. DIP: 의존성 주입
class Calculator {
  constructor(storage, formatter) {
    this.storage = storage;       // Storage 인터페이스에 의존
    this.formatter = formatter;   // Formatter 인터페이스에 의존
  }
}
```

---

## SOLID 체크리스트

코드 작성 시 다음을 확인하세요:

### SRP
- [ ] 각 클래스가 하나의 책임만 가지는가?
- [ ] 클래스를 수정해야 하는 이유가 하나뿐인가?

### OCP
- [ ] 새로운 기능 추가 시 기존 코드를 수정하지 않아도 되는가?
- [ ] 확장 가능한 구조로 설계되었는가?

### LSP
- [ ] 자식 클래스가 부모 클래스를 완전히 대체할 수 있는가?
- [ ] 부모 클래스의 계약을 위반하지 않는가?

### ISP
- [ ] 클라이언트가 사용하지 않는 메서드에 의존하지 않는가?
- [ ] 인터페이스가 적절히 분리되어 있는가?

### DIP
- [ ] 구체적인 구현이 아닌 추상화에 의존하는가?
- [ ] 의존성 주입을 사용하는가?

---

## 참고 자료

- [Clean Code (Robert C. Martin)](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882)
- [SOLID Principles](https://en.wikipedia.org/wiki/SOLID)
- [Agile Software Development, Principles, Patterns, and Practices](https://www.amazon.com/Software-Development-Principles-Patterns-Practices/dp/0135974445)

---

**규칙 버전**: 1.0  
**최종 수정일**: 2025-12-23

/**
 * Calculator Core Logic
 * Handles arithmetic operations and state management
 */
export class Calculator {
    constructor() {
        this.displayValue = '0';
        this.firstOperand = null;
        this.waitingForSecondOperand = false;
        this.operator = null;
        this.expression = '';
    }

    // Input digit
    inputDigit(digit) {
        if (this.waitingForSecondOperand) {
            this.displayValue = String(digit);
            this.waitingForSecondOperand = false;
        } else {
            this.displayValue = this.displayValue === '0' ? String(digit) : this.displayValue + digit;
        }
    }

    // Input decimal point
    inputDecimal(dot) {
        if (this.waitingForSecondOperand) {
            this.displayValue = '0.';
            this.waitingForSecondOperand = false;
            return;
        }

        if (!this.displayValue.includes(dot)) {
            this.displayValue += dot;
        }
    }

    // Handle operations
    handleOperator(nextOperator) {
        const inputValue = parseFloat(this.displayValue);

        if (this.operator && this.waitingForSecondOperand) {
            this.operator = nextOperator;
            return;
        }

        if (this.firstOperand == null && !isNaN(inputValue)) {
            this.firstOperand = inputValue;
        } else if (this.operator) {
            const result = this.performCalculation(this.operator, this.firstOperand, inputValue);

            this.displayValue = `${parseFloat(result.toFixed(7))}`;
            this.firstOperand = result;
        }

        this.waitingForSecondOperand = true;
        this.operator = nextOperator;
        this.expression = `${this.firstOperand} ${this.operator}`;
    }

    // Perform calculation
    performCalculation(operator, firstOperand, secondOperand) {
        switch (operator) {
            case '+': return firstOperand + secondOperand;
            case '-': return firstOperand - secondOperand;
            case '×':
            case '*': return firstOperand * secondOperand;
            case '÷':
            case '/':
                if (secondOperand === 0) return NaN;
                return firstOperand / secondOperand;
            default: return secondOperand;
        }
    }

    // Calculate result (=)
    calculate() {
        if (!this.operator || !this.firstOperand) return;

        const inputValue = parseFloat(this.displayValue);
        const result = this.performCalculation(this.operator, this.firstOperand, inputValue);

        // Update expression for display logic could be handled differently, 
        // but core state needs update
        const historyExpr = `${this.firstOperand} ${this.operator} ${inputValue} =`;

        this.displayValue = `${parseFloat(result.toFixed(7))}`;
        this.firstOperand = null;
        this.operator = null;
        this.waitingForSecondOperand = false;
        this.expression = ''; // Clear current expression

        return historyExpr;
    }

    // Reset (AC)
    reset() {
        this.displayValue = '0';
        this.firstOperand = null;
        this.waitingForSecondOperand = false;
        this.operator = null;
        this.expression = '';
    }
}

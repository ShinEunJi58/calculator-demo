/**
 * UI Manager
 * Handles DOM updates and event binding
 */
import { Calculator } from './calculator.js';

export class CalculatorUI {
    constructor() {
        this.calculator = new Calculator();

        // DOM Elements
        this.displayElement = document.querySelector('#result');
        this.expressionElement = document.querySelector('#expression');
        this.keypadElement = document.querySelector('#keypad-container');

        this.bindEvents();
    }

    updateDisplay() {
        // Format with commas using Intl.NumberFormat
        const value = this.calculator.displayValue;

        // Handle comma for display
        const parts = value.split('.');
        parts[0] = parseInt(parts[0]).toLocaleString();

        this.displayElement.textContent = parts.join('.');

        // Update expression display if exists
        if (this.calculator.operator) {
            this.expressionElement.textContent = `${this.calculator.firstOperand} ${this.calculator.operator}`;
        } else {
            this.expressionElement.textContent = '';
        }
    }

    bindEvents() {
        this.keypadElement.addEventListener('click', (event) => {
            const { target } = event;
            const btn = target.closest('button');

            if (!btn) return;

            // Handle numbers
            if (btn.classList.contains('btn-num')) {
                const value = btn.textContent.trim();

                if (value === '.') {
                    this.calculator.inputDecimal(value);
                } else {
                    this.calculator.inputDigit(value);
                }
            }

            // Handle operators
            if (btn.classList.contains('btn-op')) {
                const value = btn.textContent.trim();
                this.calculator.handleOperator(value);
            }

            // Handle equal
            if (btn.classList.contains('btn-equal')) {
                const history = this.calculator.calculate();
                if (history) {
                    this.expressionElement.textContent = history;
                }
            }

            // Handle functions
            if (btn.classList.contains('btn-func')) {
                const value = btn.textContent.trim();

                if (value === 'AC') {
                    this.calculator.reset();
                    this.expressionElement.textContent = '';
                }

                // Add backspace logic here if needed
                if (value === 'percent') { // Assuming icon mapping
                    // Percent logic
                }
            }

            this.updateDisplay();
        });
    }
}

import './styles/index.css';
import { CalculatorUI } from './js/ui.js';

// Initialize app
document.addEventListener('DOMContentLoaded', () => {
    console.log('Calculator app initializing...');
    new CalculatorUI();
});


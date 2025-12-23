import './styles/index.css';
import { CalculatorUI } from './js/ui.js';

// Initialize app
document.addEventListener('DOMContentLoaded', () => {
    console.log('Calculator app initializing...');
    new CalculatorUI();

    // Register Service Worker for PWA
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('/sw.js').then(registration => {
                console.log('SW registered: ', registration);
            }).catch(registrationError => {
                console.log('SW registration failed: ', registrationError);
            });
        });
    }
});


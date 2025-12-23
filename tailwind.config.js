/** @type {import('tailwindcss').Config} */
export default {
    content: [
        "./src/**/*.{html,js,ts,jsx,tsx}",
    ],
    darkMode: "class",
    theme: {
        extend: {
            colors: {
                "primary": "#135bec",
                "primary-hover": "#1d4ed8",
                "background-light": "#f6f6f8",
                "background-dark": "#101622",
                "surface-dark": "#1C2533",
                "surface-light": "#E2E8F0",
                "key-func": "#2E3A52",
                "key-operator": "#135bec",
                "text-main": "#FFFFFF",
                "text-sub": "#94A3B8"
            },
            fontFamily: {
                "display": ["Inter", "sans-serif"]
            },
            borderRadius: {
                "2xl": "1rem",
                "3xl": "1.5rem",
            },
        },
    },
    plugins: [],
}

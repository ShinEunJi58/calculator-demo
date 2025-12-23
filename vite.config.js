import { defineConfig } from 'vite'

export default defineConfig({
    base: '/calculator-demo/',
    build: {
        outDir: 'dist',
        assetsDir: 'assets',
        emptyOutDir: true
    }
})

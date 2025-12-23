import { defineConfig } from 'vite'

export default defineConfig({
    base: '/calculator-demo/',
    root: 'src',
    build: {
        outDir: '../dist',
        assetsDir: 'assets',
        emptyOutDir: true
    }
})

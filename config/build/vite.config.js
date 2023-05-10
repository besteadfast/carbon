import { defineConfig } from 'vite'
import banner from 'vite-plugin-banner'
import compression from 'vite-plugin-compression'
import legacy from '@vitejs/plugin-legacy'
import manifestSRI from 'vite-plugin-manifest-sri'
import restart from 'vite-plugin-restart'
import vue from '@vitejs/plugin-vue'
import { viteCommonjs } from '@originjs/vite-plugin-commonjs'
import postcss from './postcss.config.js'
import pkg from '../../package.json'
import * as path from 'path'

const bannerContent = `/**
 * name: ${pkg.name}
 * version: v${pkg.version}
 * description: ${pkg.description}
 * author: ${pkg.author}
 */`

// https://vitejs.dev/config/
export default defineConfig(({ command }) => {
	return {
		base: command === 'serve' ? '' : '/dist/',
		build: {
			emptyOutDir: true,
			manifest: true,
			outDir: './web/dist/',
			rollupOptions: {
				input: {
					main: './src/js/main.js',
				},
				output: {
					sourcemap: true,
				},
			},
		},
		css: {
			postcss,
		},
		plugins: [
			banner(bannerContent),
			compression({
				filter: /\.(js|mjs|json|css|map)$/i,
			}),
			legacy({
				targets: ['defaults', 'not IE 11'],
			}),
			manifestSRI(),
			restart({
				reload: ['./src/templates/**/*'],
			}),
			vue(),
			viteCommonjs(),
		],
		resolve: {
			alias: {
				'@src': path.resolve(__dirname, '../../src'),
				'@build': path.resolve(__dirname, '.'),
				'vue': 'vue/dist/vue.esm-bundler.js',
			},
			preserveSymlinks: true,
		},
		server: {
			host: '127.0.0.1',
			port: 8080,
			strictPort: true,
			watch: {
				ignored: ['**/storage/**', '**/vendor/**', '**/web/cpresources/**'],
			},
		},
	}
})

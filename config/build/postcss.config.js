import postcssImport from 'postcss-import'
import tailwindcssNesting from 'tailwindcss/nesting'
import tailwindcss from 'tailwindcss'
import tailwindcssConfig from './tailwind.config.cjs'
import autoprefixer from 'autoprefixer'

export default {
	plugins: [
		postcssImport,
		tailwindcssNesting,
		tailwindcss({
			config: tailwindcssConfig,
		}),
		autoprefixer,
	],
}

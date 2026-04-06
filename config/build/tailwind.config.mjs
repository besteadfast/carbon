import { colors, icons, typography, shadows } from './carbon.mjs'
import { interactVariantPlugin } from './plugins/interact.mjs'
import {
	typographyElementsList,
	typographyPlugin,
} from './plugins/typography.mjs'

const rootFontSize = 16

const convertToRem = function (pixelValue) {
	let calc = pixelValue / rootFontSize
	return calc.toFixed(10) + 'rem'
}

const generateSteps = function (start, end, multiple = 1, callback) {
	let steps = {}
	const values = Array.from(
		new Array(end - start + 1),
		(v, k) => k + start
	).filter((n) => n % multiple === 0)
	values.forEach((val) => {
		steps[val] = callback(val)
	})
	return steps
}

const generateIconSpacingValues = () =>
	Object.entries(icons).reduce(
		(acc, [name, { size }]) => ({
			...acc,
			[`icon-${name}`]: size,
		}),
		{}
	)

const generateIconSafelist = () =>
	Object.keys(generateIconSpacingValues()).reduce(
		(acc, iconName) => [`w-${iconName}`, `h-${iconName}`, ...acc],
		[]
	)

export default {
	important: '#appcss',
	content: ['./src/templates/**/*.{twig,html}', './src/js/**/*.{js,vue}'],
	safelist: [...typographyElementsList, ...generateIconSafelist()],
	theme: {
		extend: {
			borderWidth: {
				1: '1px',
			},
		},
		screens: {
			'tiny': '375px',
			'xs': '560px',
			'sm': '640px',
			'md': '768px',
			'lg': '1024px',
			'xl': '1300px',
			'2xl':'1600px',
		},
		maxWidth: {
			none: 'none',
			wide: '1440px',
		},
		colors: {
			transparent: 'transparent',
			current: 'currentColor',
			...colors,
		},
		fontFamily: Object.keys(typography.fonts).reduce(
			(acc, font) => ({
				...acc,
				[font]: typography.fonts[font].family,
			}),
			{
				// Add default font families
				sans: ['Inter', 'system-ui', 'sans-serif'],
				serif: ['Georgia', 'serif'],
				mono: ['Menlo', 'Monaco', 'monospace'],
			}
		),
		fontWeight: {
			thin: '100',
			light: '300',
			normal: '400',
			medium: '500',
			semibold: '600',
			bold: '700',
			extrabold: '800',
			black: '900',
		},
		fontSize: generateSteps(8, 72, 1, (val) => {
			return convertToRem(val)
		}),
		lineHeight: {
			100: '1',
			130: '1.3',
			160: '1.6',
			// 110: '1.1',
			// 120: '1.2',
		},
		letterSpacing: {
			'-01': '-.01em',
			'-025': '-.025em',
			'0': '0',
			'004':'.004em',
			'01': '.01em',
			'02': '.02em',
			'03': '.03em',
			'04': '.04em',
			'05': '.05em',
			'06': '.06em',
			'07': '.07em',
			'08': '.08em',
			'09': '.09em',
			'10': '.1em',
			'20': '.20em',
		},
		dropShadow: {
			none: 'none',
			...shadows,
		},
		boxShadow: {
			none: 'none',
			...shadows,
		},
		borderRadius: {
			none: '0px',
			DEFAULT: '20px', // This value should be replaced with the most common border radius value
			full: '50%',
			pill: '9999px',
		},
		spacing: () => ({
			inherit: 'inherit',
			...generateIconSpacingValues(),
			0: '0px',
			s1: '4px',
			s2: '8px',
			s3: '12px',
			s4: '16px',
			s5: '20px',
			s6: '24px',
			s7: '32px',
			s8: '40px',
			s9: '48px',
			s10: '64px',
			s11: '80px',
			s12: '96px',
			s13: '120px',
			s14: '160px',
		}),
	},
	corePlugins: {
		container: false,
	},
	plugins: [typographyPlugin, interactVariantPlugin],
}

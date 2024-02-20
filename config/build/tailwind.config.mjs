import { colors, icons, typography, shadows } from './carbon.mjs'
import { interactVariantPlugin } from './plugins/interact.mjs'
import { generateScreens } from './plugins/screens.mjs'
import {
	typographyElementsList,
	typographyPlugin,
} from './plugins/typography.mjs';

import lineClampPlugin from '@tailwindcss/line-clamp'

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
			...generateScreens({
				'tiny': 375,
				'xs': 560,
				'sm': 640,
				'md': 768,
				'lg': 1024,
				'xl': 1300,
				'2xl': 1600,
			}),
		},
		maxWidth: {
			none: 'none',
			text: '800px',
			content: '1024px',
			wide: '1440px',
			full: '100%',
		},
		colors: {
			transparent: 'transparent',
			current: 'currentColor',
			...colors,
		},
		fontFamily: Object.keys(typography.fonts).reduce(
			(acc, font) => ({
				...acc,
				[font]: typography.fonts[font],
			}),
			{}
		),
		fontSize: generateSteps(8, 72, 1, (val) => {
			return convertToRem(val)
		}),
		lineHeight: generateSteps(100, 200, 10, (val) => {
			return val / 100
		}),
		letterSpacing: {
			'-01': '-.01em',
			'0': '0',
			'01': '.01em',
			'012': '.012em',
			'02': '.02em',
			'03': '.03em',
			'04': '.04em',
			'05': '.05em',
			'06': '.06em',
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
			DEFAULT: '0px', // This value should be replaced with the most common border radius value
			full: '50%',
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
	plugins: [typographyPlugin, lineClampPlugin, interactVariantPlugin],
}

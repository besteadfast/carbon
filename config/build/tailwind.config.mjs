import { colors, icons, typography, shadows } from './carbon.mjs'
import { interactVariantPlugin } from './plugins/interact.mjs'
const {
	typographyElementsList,
	typographyPlugin,
} = require('./plugins/typography.mjs')

const lineClampPlugin = require('@tailwindcss/line-clamp')

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

const generateDelaySafelist = function (start, end, numbersOnly) {
	
	const values = Array.from(
		{ length: Math.floor((end - start) / 50) + 1 },
		(_, index) => start + (index * 50)
	);

	if( numbersOnly ) {
		console.log(numbersOnly)
		return values.reduce((acc, value) => {
			acc[value] = `${value}ms`;
			return acc;
		}, {});
	} else {
		return values.map(value => `delay-${value}`)
	}
	
}

export default {
	important: '#appcss',
	content: ['./src/templates/**/*.{twig,html}', './src/js/**/*.{js,vue}'],
	safelist: [...generateDelaySafelist(100, 600), ...typographyElementsList, ...generateIconSafelist()],
	theme: {
		extend: {
			transitionDelay: generateDelaySafelist(100, 600, true),
			keyframes: {
				left: {
					'0%': {
						transform: 'translateX(-25%)',
						opacity: 0
					},
					'50%': {
						transform: 'translateX(5%)'
					},
					'100%': {
						transform: 'translateX(0)',
						opacity: 100
					}
				},
				right: {
					'0%': {
						transform: 'translateX(25%)',
						opacity: 0
					},
					'50%': {
						transform: 'translateX(-5%)'
					},
					'100%': {
						transform: 'translateX(0)',
						opacity: 100
					}
				}
			},
			animation: {
				'from-left': 'left 0.5s linear',
				'from-right': 'right 0.5s linear'
			},
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
			{}
		),
		fontSize: generateSteps(8, 72, 1, (val) => {
			return convertToRem(val)
		}),
		lineHeight: {
			100: '1',
			// 110: '1.1',
			// 120: '1.2',
		},
		letterSpacing: {
			'-1': '-.01em',
			'0': '0',
			'1': '.01em',
			'1-2': '.012em',
			'2': '.02em',
			'3': '.03em',
			'4': '.04em',
			'5': '.05em',
			'6': '.06em',
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

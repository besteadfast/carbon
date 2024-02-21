import plugin from 'tailwindcss/plugin'
import { colors, typography } from '../carbon.mjs'
import { createRequire } from 'node:module'

const typographyElements = Object.keys(typography.styles).reduce((acc, curr) => {
	return ['h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'p'].includes(curr)
		? { ...acc, [curr]: [`.t-${curr}`, `${curr}:not([class^='t-'])`] }
		: { ...acc, [curr]: [`.t-${curr}`] }
}, {})

export const typographyElementSelectorList = Object.values(typographyElements).flat()

let ruleSetsByScreen = {}

const basePseudoElement = {
	content: '""',
	width: 0,
	height: 0,
	display: 'block',
}

async function loadFontMetrics(fontKey, fontName) {
	const fontNameTokens = fontName.split(' ')
	fontNameTokens[0] = fontNameTokens[0].toLowerCase()
	const camelCaseFontName = fontNameTokens.join('')
	const require = createRequire(import.meta.url)
	const fontModuleName = require.resolve(`@capsizecss/metrics/${camelCaseFontName}`)
	try {
		const fontMetrics = await import(fontModuleName)
		return [fontKey, fontMetrics.default]
	} catch (error) {
		console.error(`Failed to import font metrics for ${fontName}:`, error)
	}
}

let metrics = {}

const metricsPromises = Object.entries(typography.fonts).map(([key, value]) => {
	return loadFontMetrics(key, value[0])
})
await Promise.all(metricsPromises).then((values) => {
	values.forEach(([key, value]) => {
		metrics[key] = value
	})
})

const combineWithDefaults = (() => {
	let optionalMissingKeysLogged = false
	const defaultSettings = typography.styles.DEFAULT

	return (settings, requiredKeys) => {
		const keys = Array.from(
			settings
				? new Set([...Object.keys(settings), ...Object.keys(defaultSettings)])
				: Object.keys(defaultSettings)
		)
		let missingKeys = false
		const combined = {}

		keys.forEach((key) => {
			if (settings && key in settings) {
				combined[key] = settings[key]
			} else {
				combined[key] = defaultSettings[key]
				if (requiredKeys.includes(key)) {
					missingKeys = true
				}
			}
		})
		if (missingKeys && !optionalMissingKeysLogged) {
			console.info(
				'Info - Some required keys not explicitly defined on typography objects. Will fall back to defaults.'
			)
			optionalMissingKeysLogged = true
		}

		return combined
	}
})()

const generateIs = (selectors) => {
	if (Array.isArray(selectors)) {
		return ':is(' + selectors.join(', ') + ')'
	}
	return selectors
}

const getScreenSize = (screen, theme) => {
	return screen === 'base' ? 'base' : theme('screens.' + screen).replace('px', '')
}

const generateRuleSetsByScreen = (screenSize, selector, rules) => {
	ruleSetsByScreen[screenSize] = {
		...ruleSetsByScreen[screenSize],
		[selector]: {
			...(ruleSetsByScreen[screenSize] && {
				...ruleSetsByScreen[screenSize][selector],
			}),
			...rules,
		},
	}
}

const calculateTopOffset = (
	{ ascent, descent, unitsPerEm, xHeight, capHeight },
	lineHeight,
	isUppercase
) => {
	const normalizedTextHeight = (ascent - descent) / unitsPerEm
	let lineHeightDifference = lineHeight / 100 - normalizedTextHeight
	let lineHeightScale = lineHeightDifference / 2
	const fromTop = isUppercase
		? (ascent - capHeight) / unitsPerEm
		: (ascent - xHeight - (capHeight - xHeight) / 2) / unitsPerEm
	const offset = fromTop + lineHeightScale
	return offset
}

const calculateBottomOffset = ({ ascent, descent, unitsPerEm }, lineHeight) => {
	const normalizedTextHeight = (ascent - descent) / unitsPerEm
	const lineHeightDifference = lineHeight / 100 - normalizedTextHeight
	const lineHeightScale = lineHeightDifference / 2
	const offset = -descent / unitsPerEm + lineHeightScale
	return offset
}

export const typographyPlugin = plugin(function ({ addBase, theme }) {
	if (!typography.styles) {
		throw new Error(`Missing typography.styles object (in carbon.mjs)`)
	}
	if (!typography.styles.DEFAULT) {
		throw new Error('Missing DEFAULT key/value pair in typography.styles object (in carbon.mjs)')
	}

	const typographyKeys = ['fontFamily', 'fontWeight', 'fontSize', 'lineHeight']
	const missingKeys = typographyKeys.filter(
		(key) => !Object.keys(typography.styles.DEFAULT).includes(key)
	)

	if (missingKeys.length) {
		const missingKeysString = missingKeys.join(', ')
		throw new Error(
			`Required property or properties (${missingKeysString}) are not definied in the default typography settings object.`
		)
	}

	Object.entries(typographyElements).forEach(([element, selectors]) => {
		const settings = combineWithDefaults(typography.styles[element], typographyKeys)
		const selector = generateIs(selectors)

		generateRuleSetsByScreen('base', selector, {
			fontFamily: theme('fontFamily.' + settings.fontFamily),
			fontWeight: theme('fontWeight.' + settings.fontWeight),
			...(settings.letterSpacing && {
				letterSpacing: theme('letterSpacing.' + settings.letterSpacing),
			}),
			...(settings.uppercase && { textTransform: 'uppercase' }),
			paddingTop: '1px',
			paddingBottom: '1px',
		})

		// handle text color
		if (settings.textColor) {
			let [name, shade] = settings.textColor.split('-')
			generateRuleSetsByScreen('base', selector, {
				color: colors[name][shade],
			})
		}

		// handle font sizes (responsively)
		Object.entries(settings.fontSize).forEach(([screen, fontSize]) => {
			const screenSize = getScreenSize(screen, theme)
			generateRuleSetsByScreen(screenSize, selector, {
				fontSize: theme('fontSize.' + fontSize),
			})
		})

		Object.entries(settings.lineHeight).forEach(([screen, lineHeight]) => {
			const screenSize = getScreenSize(screen, theme)
			generateRuleSetsByScreen(screenSize, selector, {
				lineHeight: theme('lineHeight.' + lineHeight),
			})
		})

		Object.entries(settings.lineHeight).forEach(async ([screen, lineHeight]) => {
			const screenSize = getScreenSize(screen, theme)
			const currMetrics = metrics[settings.fontFamily]
			const topOffset = calculateTopOffset(currMetrics, lineHeight, settings.uppercase)
			const bottomOffset = calculateBottomOffset(currMetrics, lineHeight)
			generateRuleSetsByScreen(screenSize, selector + '::before', {
				...basePseudoElement,
				marginTop: `calc(-${topOffset}em - 1px)`,
			})
			generateRuleSetsByScreen(screenSize, selector + '::after', {
				...basePseudoElement,
				marginBottom: `calc(-${bottomOffset}em - 1px)`,
			})
		})

		// generate combination selectors, e.g. sh + h1
		if (settings.spacing) {
			Object.entries(settings.spacing).forEach(([comboElement, spacers]) => {
				const comboSelector = generateIs(typographyElements[comboElement]) + ' + ' + selector

				// handle spacing between siblings (responsively)
				Object.entries(spacers).forEach(([screen, spacerSize]) => {
					const screenSize = getScreenSize(screen, theme)
					generateRuleSetsByScreen(screenSize, comboSelector, {
						marginTop: theme('spacing.' + spacerSize),
					})
				})
			})
		}
	})

	const allMediaScreens = Object.keys(ruleSetsByScreen).filter((screen) => screen !== 'base')
	const sortedMediaScreens = [...allMediaScreens].sort((a, b) => parseInt(a) - parseInt(b))

	const mediaRuleSets = sortedMediaScreens.reduce(
		(acc, screen) => ({
			...acc,
			['@media (min-width: ' + screen + 'px)']: {
				...ruleSetsByScreen[screen],
			},
		}),
		{}
	)

	let typographyRuleSets = {
		...ruleSetsByScreen.base,
		...mediaRuleSets,
	}

	addBase(typographyRuleSets)
})

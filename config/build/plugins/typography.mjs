import tailwindcssPlugin from 'tailwindcss/plugin'
import { colors, typography } from '../carbon.mjs'
import { createStyleObject } from '@capsizecss/core'

const typographyElements = Object.keys(typography.styles).reduce((acc, curr) => {
	return ['h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'p'].includes(curr)
		? { ...acc, [curr]: [`.t-${curr}`, `${curr}:not([class^='t-']):not([class*=' t-'])`] }
		: { ...acc, [curr]: [`.t-${curr}`] }
}, {})

let ruleSetsByScreen = {}

const generateIs = (selectors) => {
	if (Array.isArray(selectors)) {
		return ':is(' + selectors.join(', ') + ')'
	}
	return selectors
}

const getScreenSize = (screen, theme) => {
	return screen === 'base'
		? 'base'
		: theme('screens.' + screen).replace('px', '')
}

const getMetrics = (family) => {
	if (!typography.fonts[family]) {
		throw Error(`Font family "${family}" not found in typography.fonts`	)
	}
	return typography.fonts[family].metrics
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

const generateCapsizeStyles = (settings, fontSize, lineHeight) => {
	if (!settings.fontFamily || !fontSize || !lineHeight) {
		return {}
	}
	
	const metrics = getMetrics(settings.fontFamily)
	
	const pixelLineHeight = parseInt(fontSize) * (parseInt(lineHeight) / 100)
	
	const shouldUseMidCap = !settings.uppercase
	
	if (shouldUseMidCap) {
		// Difference between cap position and mid-cap position
		const midCapDiff = (metrics.capHeight - metrics.xHeight) / 2
		
		// Generate base Capsize styles
		const baseStyles = createStyleObject({
			fontSize: parseInt(fontSize),
			leading: pixelLineHeight,
			fontMetrics: metrics,
		})
		
		// Adjust the ::before pseudo-element for mid-cap trimming
		if (baseStyles['::before']) {
			const originalMargin = parseFloat(baseStyles['::before'].marginBottom)
			baseStyles['::before'].marginBottom = `${originalMargin - (midCapDiff / metrics.unitsPerEm)}em`
		}
				
		return baseStyles
	}

	// For uppercase text, use normal cap height trimming
	return createStyleObject({
		fontSize: parseInt(fontSize),
		leading: pixelLineHeight,
		fontMetrics: metrics,
	})
}

export const typographyElementsList = Object.values(typographyElements).flat()

export const typographyPlugin = tailwindcssPlugin(function ({ addBase, theme }) {
	// sh
	if (typography.styles) {
		Object.entries(typography.styles).forEach(([element, settings]) => {
			// handle root-level styles
			const selector = generateIs(typographyElements[element])
			const baseStyles = {
				...(settings.fontFamily && {
					fontFamily: theme('fontFamily.' + settings.fontFamily),
				}),
				...(settings.fontWeight && {
					fontWeight: theme('fontWeight.' + settings.fontWeight),
				}),
				...(settings.letterSpacing && {
					letterSpacing: theme('letterSpacing.' + settings.letterSpacing),
				}),
				...(settings.uppercase && { textTransform: 'uppercase' }),
			}
			
			generateRuleSetsByScreen('base', selector, baseStyles)

			// handle text color
			if (settings.textColor) {
				let [name, shade] = settings.textColor.split('-')
				generateRuleSetsByScreen('base', selector, {
					color: colors[name][shade],
				})
			}

			// handle font sizes and line heights with Capsize
			if (settings.fontSize && settings.lineHeight) {
				// Get all unique screens from fontSize and lineHeight
				const screens = new Set([
					...Object.keys(settings.fontSize),
					...Object.keys(settings.lineHeight)
				])
				
				screens.forEach(screen => {
					const fontSize = settings.fontSize[screen] || settings.fontSize.base
					const lineHeight = settings.lineHeight[screen] || settings.lineHeight.base
					const screenSize = getScreenSize(screen, theme)
					
					if (fontSize && lineHeight) {
						// Generate Capsize styles
						const capsizeStyles = generateCapsizeStyles(
							{ ...settings, element }, 
							fontSize, 
							lineHeight
						)
						
						// Apply Capsize styles (which includes font size and line height)
						generateRuleSetsByScreen(screenSize, selector, capsizeStyles)
						
						// Apply pseudo-elements separately if they exist
						if (capsizeStyles['::before']) {
							generateRuleSetsByScreen(screenSize, selector + '::before', {
								...capsizeStyles['::before']
							})
						}
						
						if (capsizeStyles['::after']) {
							generateRuleSetsByScreen(screenSize, selector + '::after', {
								...capsizeStyles['::after']
							})
						}
					}
				})
			}

			// generate combination selectors, e.g. sh + h1
			if (settings.spacing) {
				Object.entries(settings.spacing).forEach(([comboElement, spacers]) => {
					const comboSelector =
						generateIs(typographyElements[comboElement]) + ' + ' + selector

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
	}

	const allMediaScreens = Object.keys(ruleSetsByScreen).filter(
		(screen) => screen !== 'base'
	)
	const sortedMediaScreens = [...allMediaScreens].sort(
		(a, b) => parseInt(a) - parseInt(b)
	)

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
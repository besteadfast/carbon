const plugin = require('tailwindcss/plugin')
const { colors, typography } = require('../stallion.cjs')

const typographyElements = {
	'sh': ['.faux-sh'],
	'h1': ["h1:not([class*='faux-'])", '.faux-h1'],
	'h2': ["h2:not([class*='faux-'])", '.faux-h2'],
	'h3': ["h3:not([class*='faux-'])", '.faux-h3'],
	'h4': ["h4:not([class*='faux-'])", '.faux-h4'],
	'h5': ["h5:not([class*='faux-'])", '.faux-h5'],
	'h6': ["h6:not([class*='faux-'])", '.faux-h6'],
	'p-lg': ['.faux-p-lg'],
	'p': ["p:not([class*='faux-'])", '.faux-p'],
	'p-sm': ['.faux-p-sm'],
	'p-xs': ['.faux-p-xs'],
	'list': [
		'ul:not(.list-none):not(.splide__list)',
		'ol:not(.list-none):not(.splide__list)',
	],
	'list-1': ':is(ul, ol):not(.list-none):not(.splide__list) > li',
	'list-2': ':is(ul, ol):not(.list-none):not(.splide__list) :is(ul, ol) > li',
	'list-3':
		':is(ul, ol):not(.list-none):not(.splide__list) :is(ul, ol) :is(ul, ol) > li',
	'bq': ["blockquote:not([class*='faux-'])", '.faux-blockquote'],
}

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

const getOffset = (family) => {
	return typography.fonts[family].offset
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

const calculateOffset = (lineHeight, offset) => {
	let lineHeightDifference = lineHeight / 100 - 1
	let lineHeightScale = lineHeightDifference / 2

	return offset + lineHeightScale
}

const typographyElementsList = Object.values(typographyElements).flat()

const typographyPlugin = plugin(function ({ addBase, theme }) {
	// sh
	if (typography.styles) {
		Object.entries(typography.styles).forEach(([element, settings]) => {
			// handle root-level styles
			const selector = generateIs(typographyElements[element])
			generateRuleSetsByScreen('base', selector, {
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
				...(settings.fontSize && settings.lineHeight && { paddingTop: '1px' }),
				...(settings.fontSize &&
					settings.lineHeight && { paddingBottom: '1px' }),
			})

			// handle text color
			if (settings.textColor) {
				let [name, shade] = settings.textColor.split('-')
				generateRuleSetsByScreen('base', selector, {
					color: colors[name][shade],
				})
			}

			// handle font sizes (responsively)
			if (settings.fontSize) {
				Object.entries(settings.fontSize).forEach(([screen, fontSize]) => {
					const screenSize = getScreenSize(screen, theme)
					generateRuleSetsByScreen(screenSize, selector, {
						fontSize: theme('fontSize.' + fontSize),
					})
				})
			}

			// handle line height (responsively)
			if (settings.lineHeight) {
				Object.entries(settings.lineHeight).forEach(([screen, lineHeight]) => {
					const screenSize = getScreenSize(screen, theme)
					generateRuleSetsByScreen(screenSize, selector, {
						lineHeight: theme('lineHeight.' + lineHeight),
					})
				})
			}

			// handle offset (responsively)
			if (settings.lineHeight) {
				Object.entries(settings.lineHeight).forEach(([screen, lineHeight]) => {
					const topOffset = settings.uppercase ? 'cap' : 'midCap'
					const screenSize = getScreenSize(screen, theme)
					generateRuleSetsByScreen(screenSize, selector + '::before', {
						content: '""',
						width: 0,
						height: 0,
						display: 'block',
						marginTop:
							'calc(-' +
							calculateOffset(
								lineHeight,
								getOffset(settings.fontFamily)[topOffset]
							) +
							'em - 1px)',
					})
					generateRuleSetsByScreen(screenSize, selector + '::after', {
						content: '""',
						width: 0,
						height: 0,
						display: 'block',
						marginBottom:
							'calc(-' +
							calculateOffset(
								lineHeight,
								getOffset(settings.fontFamily).baseline
							) +
							'em - 1px)',
					})

					// List-specific offset styling
					if (element.includes('list-')) {
						// Add top offset to nested uls since the li text won't have a negative bottom margin
						generateRuleSetsByScreen(
							screenSize,
							selector + ' > ul::before, ' + selector + ' > ol::before',
							{
								content: '""',
								width: 0,
								height: 0,
								display: 'block',
								marginBottom:
									'calc(-' +
									calculateOffset(
										lineHeight,
										getOffset(settings.fontFamily).baseline
									) +
									'em - 1px)',
							}
						)
						// Add offset to bullets so they line up correctly
						generateRuleSetsByScreen(
							screenSize,
							selector +
								' > .bullet::before, ' +
								selector +
								' > .bullet::after',
							{
								marginTop:
									'calc(-' +
									calculateOffset(
										lineHeight,
										getOffset(settings.fontFamily)[topOffset]
									) +
									'em)',
								marginBottom:
									'calc(-' +
									calculateOffset(
										lineHeight,
										getOffset(settings.fontFamily).baseline
									) +
									'em)',
							}
						)
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

module.exports = {
	typographyElementsList,
	typographyPlugin,
}

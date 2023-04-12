const colors = {
	white: '#ffffff',
	black: '#000000',

	// Example brand color
	blue: {
		900: '#ffffff',
		800: '#ffffff',
		700: '#ffffff',
		600: '#ffffff',
		500: '#ffffff',
		400: '#ffffff',
		300: '#ffffff',
		200: '#ffffff',
		100: '#ffffff',
		50: '#ffffff',
	},
}

const icons = {
	// Example icon size
	12: { abbr: '12', size: '12px', folder: '12' },
}

const shadows = {
	// Example shadow
	'card': '0px 4px 24px 2px rgba(17, 72, 102, .08)',
}

const typography = {
	fonts: {
		// Example font
		work: {
			family: ['Work Sans', 'sans-serif'],
			offset: { cap: 0.19, midCap: 0.24, baseline: 0.16 },
		},
	},

	styles: {
		// Example typography style
		h1: {
			fontFamily: 'work',
			fontWeight: 'bold',
			fontSize: { base: '40', md: '52' },
			lineHeight: { base: '130' },
			letterSpacing: '1-2',
			uppercase: false,
			spacing: {
				h1: { base: 's9', md: 's9' },
				h2: { base: 's10', md: 's9' },
				p: { base: 's10', md: 's12' },
				'p-sm': { base: 's10', md: 's12' },
				list: { base: 's10', md: 's12' },
			},
		},
	},
}

module.exports = {
	colors,
	icons,
	shadows,
	typography,
}

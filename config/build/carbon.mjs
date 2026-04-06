export const colors = {
	white: '#ffffff',
	black: '#000000',

	// Default Tailwind colors
	gray: {
		50: '#f9fafb',
		100: '#f3f4f6',
		200: '#e5e7eb',
		300: '#d1d5db',
		400: '#9ca3af',
		500: '#6b7280',
		600: '#4b5563',
		700: '#374151',
		800: '#1f2937',
		900: '#111827',
	},
	blue: {
		50: '#eff6ff',
		100: '#dbeafe',
		200: '#bfdbfe',
		300: '#93c5fd',
		400: '#60a5fa',
		500: '#3b82f6',
		600: '#2563eb',
		700: '#1d4ed8',
		800: '#1e40af',
		900: '#1e3a8a',
	},
}

export const icons = {
	// Example icon size
	12: { abbr: '12', size: '12px', folder: '12' },
}

export const shadows = {
	// Example shadow
	card: '0px 4px 24px 2px rgba(17, 72, 102, .08)',
}

export const typography = {
	fonts: 	{
		"area-normal": {
			"family": [
				"area-normal",
				"sans-serif"
			],
			"metrics": {
				"capHeight": 780,
				"ascent": 1300,
				"descent": -340,
				"lineGap": 0,
				"unitsPerEm": 1000,
				"xHeight": 558
			}
		},
		"area-normal-light": {
			"family": [
				"area-normal-light",
				"sans-serif"
			],
			"metrics": {
				"capHeight": 780,
				"ascent": 1263,
				"descent": -248,
				"lineGap": 0,
				"unitsPerEm": 1000,
				"xHeight": 551
			}
		},
		"inter-variable": {
			"family": [
				"inter-variable",
				"sans-serif"
			],
			"metrics": {
				"capHeight": 2048,
				"ascent": 3072,
				"descent": -900,
				"lineGap": 0,
				"unitsPerEm": 2816,
				"xHeight": 1536
			}
		},
		"geist-mono": {
			"family": [
				"Geist Mono",
				"sans-serif"
			],
			"metrics": {
				"capHeight": 710,
				"ascent": 1005,
				"descent": -295,
				"lineGap": 0,
				"unitsPerEm": 1000,
				"xHeight": 530
			}
		},
		"playwrite-dk-uloopet-guides": {
			"family": [
				"Playwrite DK Uloopet Guides",
				"sans-serif"
			],
			"metrics": {
				"capHeight": 875,
				"ascent": 1275,
				"descent": -375,
				"lineGap": 0,
				"unitsPerEm": 1000,
				"xHeight": 500
			}
		}
	},
	styles: {
		h1: {
			fontFamily: 'inter-variable',
			fontWeight: 'bold',
			fontSize: { base: '40', md: '52' },
			lineHeight: { base: '130' },
			letterSpacing: '-025',
			uppercase: false,
		},
		h2: {
			fontFamily: 'area-normal',
			fontWeight: 'bold',
			fontSize: { base: '32', md: '40' },
			lineHeight: { base: '130' },
			letterSpacing: '-025',
			uppercase: false,
		},
		h3: {
			fontFamily: 'area-normal-light',
			fontWeight: 'bold',
			fontSize: { base: '24', md: '32' },
			lineHeight: { base: '130' },
			letterSpacing: '0',
			uppercase: false,
		},
		h4: {
			fontFamily: 'geist-mono',
			fontWeight: 'bold',
			fontSize: { base: '20', md: '24' },
			lineHeight: { base: '130' },
			letterSpacing: '0',
			uppercase: true,
		},
		p: {
			fontFamily: 'geist-mono',
			fontWeight: 'normal',
			fontSize: { base: '16', md: '18' },
			lineHeight: { base: '160' },
			letterSpacing: '0',
			uppercase: false,
		},
		'p-sm': {
			fontFamily: 'area-normal',
			fontWeight: 'normal',
			fontSize: { base: '14', md: '16' },
			lineHeight: { base: '160' },
			letterSpacing: '0',
			uppercase: false,
		},
	},
}

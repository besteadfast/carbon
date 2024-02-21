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
	fonts: {
		work: ['Work Sans', 'sans-serif'],
	},
	styles: {
		DEFAULT: {
			fontFamily: 'work',
			fontWeight: 'normal',
			fontSize: { base: '16', md: '18' },
			lineHeight: { base: '160', md: '150' },
			spacing: {
				'h1': { base: 's9', md: 's10' },
				'h2': { base: 's9', md: 's10' },
				'h3': { base: 's9', md: 's10' },
				'h4': { base: 's9', md: 's10' },
				'h5': { base: 's8', md: 's8' },
				'h6': { base: 's8', md: 's8' },
				'p': { base: 's8', md: 's9' },
				'p-lg': { base: 's9', md: 's10' },
				'p-sm': { base: 's8', md: 's9' },
				'p-xs': { base: 's8', md: 's9' },
			},
		},
		h1: {
			fontWeight: 'bold',
			fontSize: { base: '40', md: '52' },
			lineHeight: { base: '130' },
			letterSpacing: '1-2',
			uppercase: false,
			spacing: {
				'h1': { base: 's9', md: 's9' },
				'h2': { base: 's10', md: 's9' },
				'p': { base: 's10', md: 's12' },
				'p-sm': { base: 's10', md: 's12' },
			},
		},
		p: {}
	},
}

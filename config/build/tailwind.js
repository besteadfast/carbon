let rootFontSize = 16;

let convertToRem = function(pixelValue) {
	let calc = pixelValue / rootFontSize;
	return calc.toFixed(10) + 'rem';
};

let generateSpacing = function(start, end, multiple = 1) {
	let spacingObject = {};
	const pixelValues = Array.from(new Array(end - start + 1), (v, k) => k + start).filter((n) => n % multiple === 0);
	pixelValues.forEach((val) => {
		spacingObject[val] = val + 'px'; //convertToRem(val);
	});
	return spacingObject;
};

module.exports = {
	important: '#app',
	theme: {
		screens: {
			'sm':   '640px',
			'md':   '768px',
			'lg':   '1024px',
			'xl':   '1280px',
			'2xl':  '1536px',
		},
		colors: {
			transparent: 'transparent',
			current: 'currentColor',
			white: '#ffffff',
			black: '#000000',
		},
		iconSizes: {
		},
		fontFamily: {
            sans: [
                'Arial',
                'sans-serif'
            ],
        },
		fontSize: {
            'tiny': convertToRem(12),
            'xs':   convertToRem(13),
            'sm':   convertToRem(14),
            'base': convertToRem(16), 
            'md':   convertToRem(18), 
            'lg':   convertToRem(20), 
            'xl':   convertToRem(30),  
            '2xl':  convertToRem(35),
            '3xl':  convertToRem(40), 
        },
		fontWeight: {
            light:      300,
            normal:     400,
            medium:     500,
            semibold:   600,
            bold:       700,
        },
        lineHeight: {
            'none': '1',
            '1':    '1.2',
            '2':    '1.4',
            '3':    '1.6',
            '4':    '1.75',
            '5':    '2',
        },
		spacing: (theme) => ({
			...theme('iconSizes'),
			'0': '0px',
			px: '1px',
			's1': '4px',
			's2': '8px',
			's3': '12px',
			's4': '16px',
			's5': '20px',
			's6': '24px',
			's7': '32px',
			's8': '40px',
			's9': '48px',
			's10': '64px',
			's11': '80px',
			's12': '96px',
			's13': '120px',
			's14': '160px',
			...generateSpacing(1, 35),
		}),
	},
	purge: false,
};

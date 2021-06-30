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
      // 'icon-tiny': '16px'
		},
		fontFamily: {
            sans: [
                'Arial',
                'sans-serif'
            ],
        },
		fontSize: {
            '12':  convertToRem(12),
            '13':  convertToRem(13),
            '14':  convertToRem(14),
            '15':  convertToRem(15),
            '16':  convertToRem(16),
            '17':  convertToRem(17),
            '18':  convertToRem(18),
            '19':  convertToRem(19),
            '20':  convertToRem(20),
            '21':  convertToRem(21),
            '22':  convertToRem(22),
            '23':  convertToRem(23),
            '24':  convertToRem(24),
            '25':  convertToRem(25),
            '26':  convertToRem(26),
            '27':  convertToRem(27),
            '28':  convertToRem(28),
            '29':  convertToRem(29),
            '30':  convertToRem(30),
            '31':  convertToRem(31),
            '32':  convertToRem(32),
            '33':  convertToRem(33),
            '34':  convertToRem(34),
            '35':  convertToRem(35),
            '36':  convertToRem(36),
            '37':  convertToRem(37),
            '38':  convertToRem(38),
            '39':  convertToRem(39),
            '40':  convertToRem(40),
        },
        lineHeight: {
            '25':     '.25',
            '75':     '.75',
			'100':    '1',
            '120':    '1.2',
            '130':    '1.3',
            '140':    '1.4',
            '150':    '1.5',
            '160':    '1.6',
            '170':    '1.7',
            '180':    '1.8',
            '190':    '1.9',
            '200':    '200',
            '210':    '2.1',
            '220':    '2.2',
            '230':    '2.3',
            '240':    '2.4',
            '250':    '2.5',
        },
		spacing: (theme) => ({
			...theme('iconSizes'),
			'0': '0px',
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
			...generateSpacing(1, 10),
		}),
	},
	purge: false,
};

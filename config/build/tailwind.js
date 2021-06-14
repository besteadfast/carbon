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
		colors: {
			transparent: 'transparent',
			current: 'currentColor',
			white: '#ffffff',
			black: '#000000',
		},
		iconSizes: {
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
			...generateSpacing(35, 75, 5),
			...generateSpacing(80, 150, 10),
			...generateSpacing(200, 500, 50),
		}),
	},
	purge: false,
};

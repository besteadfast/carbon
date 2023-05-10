module.exports = {
	multipass: true,
	plugins: [
		'preset-default',
		'removeDimensions',
		{
			name: 'convertColors',
			params: {
				currentColor: true,
			},
		},
		{
			name: 'addAttributesToSVGElement',
			params: {
				attribute: 'id="icon-definition"',
			},
		},
	],
}

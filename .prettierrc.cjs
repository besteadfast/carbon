module.exports = {
	printWidth: 80,
	// tabWidth: editorConfig,
	// useTabs: editorConfig,
	semi: false,
	singleQuote: true,
	quoteProps: 'consistent',
	jsxSingleQuote: true,
	trailingComma: 'es5',
	bracketSpacing: true,
	bracketSameLine: false,
	arrowParens: 'always',
	proseWrap: 'preserve',
	htmlWhitespaceSensitivity: 'css',
	vueIndentScriptAndStyle: false,
	// endOfLine: editorConfig,
	embeddedLanguageFormatting: 'auto',
	overrides: [
		{
			files: '*.vue',
			options: {
				singleAttributePerLine: true,
			},
		},
	],
}

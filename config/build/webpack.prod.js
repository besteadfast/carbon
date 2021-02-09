const path = require('path');
const webpack = require('webpack');

const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');

const MiniCssExtractPlugin = require('mini-css-extract-plugin');

const TailwindCss = require('tailwindcss');

const pkg = require('../../package.json');

module.exports = merge(common, {
	mode: 'production',
	module: {
		rules: [
			{
				test: /\.js$/,
				exclude: [/(node_modules)/],
				use: {
					loader: 'babel-loader',
					options: {
						cacheDirectory: true,
						presets: [
							[
								'@babel/preset-env',
								{
									modules: false,
									corejs: {
										version: 3,
										proposals: true,
									},
									debug: false,
									useBuiltIns: 'usage',
									targets: {
										browsers:
											pkg.browserslist.modernBrowsers,
									},
								},
							],
						],
						plugins: ['@babel/plugin-transform-runtime'],
						sourceType: 'unambiguous',
					},
				},
			},
			{
				test: /\.(pcss|postcss|less|css)$/,
				use: [
					{
						loader: MiniCssExtractPlugin.loader,
						options: {
							esModule: false,
						},
					},
					{
						loader: 'css-loader',
						options: {
							sourceMap: false,
							url: false,
							import: false,
						},
					},
					{
						loader: 'postcss-loader',
						options: {
							postcssOptions: {
								path: path.resolve(__dirname),
								plugins: [
									'postcss-import',
									TailwindCss('./config/build/tailwind.js'),
									'postcss-nested',
								],
							},
						},
					},
					{
						loader: 'less-loader',
					},
				],
			},
			{
				test: /\.vue$/,
				loader: 'vue-loader',
			},
		],
	},
	plugins: [
		new MiniCssExtractPlugin({
			filename: path.join('./css', '[name].css'),
		}),
		new webpack.EnvironmentPlugin({
			BUILD: 'web',
			NODE_ENV: 'production',
		}),
	],
});

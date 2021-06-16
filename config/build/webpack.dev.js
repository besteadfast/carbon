const path = require('path');
const webpack = require('webpack');

const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');

const TailwindCss = require('tailwindcss');

const pkg = require('../../package.json');

module.exports = merge(common, {
	mode: 'development',
	devtool: false,
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
										browsers: pkg.browserslist.modernBrowsers,
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
					'style-loader',
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
								plugins: ['postcss-import', TailwindCss('./config/build/tailwind.js'), 'postcss-nested'],
							},
						},
					},
					'less-loader',
				],
			},
			{
				test: /\.vue$/,
				loader: 'vue-loader',
			},
		],
	},
	plugins: [
		new webpack.HotModuleReplacementPlugin(),
		new webpack.EnvironmentPlugin({
			BUILD: 'web',
			NODE_ENV: 'development',
		}),
	],
	devServer: {
		client: {
			progress: false,
		},
		devMiddleware: {
			publicPath: '/dist/',
		},
		firewall: false,
		headers: {
			'Access-Control-Allow-Origin': '*',
		},
		host: '0.0.0.0',
		port: 8080,
		public: 'http://localhost:8080',
		static: {
			directory: path.resolve(__dirname, '../../src/templates'),
			publicPath: '/',
			watch: {
				ignored: /node_modules/,
			},
		},
	},
	output: {
		filename: path.join('./js', '[name].js'),
		path: path.resolve(__dirname, '../../web/dist'),
		publicPath: 'http://localhost:8080/dist/',
	},
});

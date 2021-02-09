const path = require('path');

// Webpack Plugins
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const { WebpackManifestPlugin } = require('webpack-manifest-plugin');
const { VueLoaderPlugin } = require('vue-loader');

module.exports = {
	context: path.resolve(__dirname, '../../src'),
	entry: [
		'/js/main.js',
		'/css/main.pcss',
	],
	output: {
		filename: path.join('./js', '[name].js'),
		path: path.resolve(__dirname, '../../web/dist'),
		publicPath: '/dist/',
	},
	resolve: {
		alias: {
			vue: 'vue/dist/vue.js',
		},
		extensions: ['.js', '.vue', '.json'],
	},
	plugins: [
		new CleanWebpackPlugin(),
		new WebpackManifestPlugin({
			fileName: 'manifest.json',
			basePath: '',
			map: (file) => {
				file.name = file.name.replace(/(\.[a-f0-9]{32})(\..*)$/, '$2');
				return file;
			},
		}),
		new VueLoaderPlugin(),
	],
};

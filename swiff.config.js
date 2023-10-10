// Set this to the remote environment you want to interact with: ['production', 'staging']
const remoteEnvironment = 'production'

const defaultConfig = {
	server: {},
	local: {
		ddev: true,
	},
	disabled: ['folderPush', 'databasePush', 'composerPull']
}

const environmentConfigs = {
	production: {
		server: {
			user: 'serverpilot',
			host: '[serverIp]',
			appPath: 'apps/[appName]/',
			port: 22
		}
	},
	staging: {
		server: {
			user: 'serverpilot',
			host: '[serverIp]',
			appPath: 'apps/[appName]/',
			port: 22
		}
	},
}

const environmentConfig = environmentConfigs[remoteEnvironment]

module.exports = {
	...defaultConfig,
	...environmentConfig
 };

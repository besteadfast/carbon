const prod = {
	user: "serverpilot",
	host: "[serverIp]",
	appPath: "apps/[appName]/",
}

const staging = {
	user: "serverpilot",
	host: "[serverIp]",
	appPath: "apps/[appName]/",
}

module.exports = {
	server: {
	 user: prod.user,
	 host: prod.host,
	 appPath: prod.appPath,
	 port: 22,
	},
	local: {
	 ddev: true,
	},
	disabled: ["folderPush", "databasePush"],
 };

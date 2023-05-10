module.exports = {
	server: {
	 user: "serverpilot",
	 host: "[serverIp]",
	 appPath: "apps/[appName]/",
	 port: 22,
	},
	local: {
	 ddev: true,
	},
	disabled: ["folderPush", "databasePush"],
 };

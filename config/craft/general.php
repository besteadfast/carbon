<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

use craft\helpers\App;

return [
	'aliases' => [
		'@appUrl' => App::env('APP_URL'),
		'@web' => '@appUrl',
		'@webroot' => CRAFT_BASE_PATH . '/web',
	],

	// Default Week Start Day (0 = Sunday, 1 = Monday...)
	'defaultWeekStartDay' => 0,

	// Whether generated URLs should omit "index.php"
	'omitScriptNameInUrls' => true,

	// Control panel trigger word
	'cpTrigger' => App::env('CP_TRIGGER') ?: 'admin',

	// The secure key Craft will use for hashing and encrypting data
	'securityKey' => App::env('CRAFT_SECURITY_KEY'),

	// Whether Dev Mode should be enabled (see https://craftcms.com/guides/what-dev-mode-does)
	'devMode' => App::env('CRAFT_DEV_MODE'),

	// Whether administrative changes should be allowed
	'allowAdminChanges' => App::env('CRAFT_ALLOW_ADMIN_CHANGES'),

	// Whether Craft should allow system and plugin updates in the control panel, and plugin installation from the Plugin Store
	'allowUpdates' => false,

	// Whether GIF files should be cleansed/transformed
	'transformGifs' => false,

	// Whether the GraphQL API should be enabled
	'enableGql' => false,

	// The timezone of the site
	'timezone' => 'America/New_York',

	'maxUploadFileSize' => 524288000, // 500MB
];

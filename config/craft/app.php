<?php
/**
 * Yii Application Config
 *
 * Edit this file at your own risk!
 *
 * The array returned by this file will get merged with
 * vendor/craftcms/cms/src/config/app.php and app.[web|console].php, when
 * Craft's bootstrap script is defining the configuration for the entire
 * application.
 *
 * You can define custom modules and system components, and even override the
 * built-in system components.
 *
 * If you want to modify the application config for *only* web requests or
 * *only* console requests, create an app.web.php or app.console.php file in
 * your config/ folder, alongside this one.
 */

use craft\helpers\App;

$appConfig = [
	'components' => [
		'deprecator' => [
			'throwExceptions' => App::env('CRAFT_DEV_MODE'),
		],
		'queue' => [
				'class' => craft\queue\Queue::class,
				'ttr' => 60 * 60,
		],
	],
	'id' => App::env('APP_ID') ?: 'CraftCMS',
	'modules' => [
			'my-module' => \modules\Module::class,
	],
	//'bootstrap' => ['my-module'],
];

/*
	Hey! 👋
	If you need to conditionally modify the config based
	on environment variables, do it here before you return
*/

return $appConfig;

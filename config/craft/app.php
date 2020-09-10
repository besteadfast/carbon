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

return [
	'id' => App::env('APP_ID') ?: 'CraftCMS',
	'modules' => [],
	'bootstrap' => [],
	'components' => [
        'cache' => [
            'class' => yii\redis\Cache::class,
            'defaultDuration' => 86400,
            'keyPrefix' => getenv('REDIS_KEY_PREFIX'),
        ],
		'deprecator' => [
			'throwExceptions' => App::env('DEV_MODE'),
		],
		'redis' => [
			'class' => yii\redis\Connection::class,
			'hostname' => getenv('REDIS_HOST'),
			'port' => getenv('REDIS_PORT'),
			'password' => getenv('REDIS_PASSWORD'),
		],
		'session' => function() {
			$config = craft\helpers\App::sessionConfig();
			$config['class'] = yii\redis\Session::class;
			return Craft::createObject($config);
		},
    ],
];

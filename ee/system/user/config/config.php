<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$config['index_page'] = 'index.php';
$config['enable_devlog_alerts'] = 'n';
$config['site_license_key'] = '';
// ExpressionEngine Config Items
// Find more configs and overrides at
// https://docs.expressionengine.com/latest/general/system-configuration-overrides.html

$config['base_path'] = '/var/www/html/public/';
$config['app_version'] = '7.1.6';
$config['encryption_key'] = 'dcfe3c46b4c908b9d832a2d0df4dca4e4a527276';
$config['session_crypt_key'] = '4b5b5402d0f8a7837a2591356f7d953a397c3427';
$config['database'] = array(
	'expressionengine' => array(
		'hostname' => 'db',
		'database' => 'expressionengine',
		'username' => 'test',
		'password' => 'password',
		'dbprefix' => 'exp_',
		'char_set' => 'utf8mb4',
		'dbcollat' => 'utf8mb4_unicode_ci',
		'port'     => ''
	),
);
$config['show_ee_news'] = 'y';

$config['mime_whitelist_additions'] = array(
    'image/webp'
);



// EOF
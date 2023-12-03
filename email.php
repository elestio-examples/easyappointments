<?php defined('BASEPATH') or exit('No direct script access allowed');

// Add custom values by settings them to the $config array.
// Example: $config['smtp_host'] = 'smtp.gmail.com';
// @link https://codeigniter.com/user_guide/libraries/email.html

$config['useragent'] = 'Easy!Appointments';
$config['protocol'] = 'smtp';
$config['mailtype'] = 'html';
$config['smtp_debug'] = '1';
$config['smtp_auth'] = FALSE;
$config['smtp_host'] = '172.17.0.1';
$config['smtp_port'] = 25;

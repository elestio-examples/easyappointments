<?php defined('BASEPATH') or exit('No direct script access allowed');

// Add custom values by settings them to the $config array.
// Example: $config['smtp_host'] = 'smtp.gmail.com';
// @link https://codeigniter.com/user_guide/libraries/email.html

$config['useragent'] = 'Easy!Appointments';
$config['protocol'] = 'smtp'; // or 'smtp'
$config['mailtype'] = 'html'; // or 'text'
$config['smtp_debug'] = '1'; // or '1'
$config['smtp_auth'] = TRUE; //or FALSE for anonymous relay.
$config['smtp_host'] = 'SMTP_HOST_TO_CHANGE';
$config['smtp_user'] = 'SMTP_USER_TO_CHANGE';
$config['smtp_pass'] = 'SMTP_PASS_TO_CHANGE';
$config['smtp_crypto'] = 'ssl'; // or 'tls'
$config['smtp_port'] = 465;

<?php
require_once "vendor/autoload.php";

use Dotenv\Dotenv;

Dotenv::createImmutable(__DIR__)->load();
// DEVELOPMENT: Set the session save path to a directory within the project
const STATUS = 'production'; // Change to 'development' for development mode
// const STATUS = 'development'; // Uncomment for development mode
if (STATUS === 'development') {
	if (!is_dir(__DIR__ . '/.sessions')) {
		mkdir(__DIR__ . '/.sessions', 0777, true);
	}
	session_save_path(__DIR__ . '/.sessions');
}
session_start();

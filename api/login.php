<?php
require_once __DIR__ . '/../autoload.php';

use Auth\App as AuthApp;

$app_key = $_GET['app_key'] ?? null;
if (!$app_key) {
    exit("Stop!");
}
$app = AuthApp::fromKey($app_key);
if (!$app) {
    exit("App not found!");
}
$html_providers = $app->html_providers();
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <form action="">
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <input type="hidden" name="app_key" value="<?php echo $app_key; ?>">
            <button type="submit">Login</button>
            <button type="button">Cancel</button>
        </div>
    </form>
    <?php echo $app->html_providers(); ?>
</body>
</html>
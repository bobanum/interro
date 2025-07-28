<?php
include_once "../autoload.php";

use Auth\Auth;
use Auth\Response;

$response = Auth::main();
$response->send();
(new Response('', 200))->send(false);
include "routes.php";

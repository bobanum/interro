<?php

use RestInPeace\Response;
use RestInPeace\RestInPeace;
use RestInPeace\Router;

$response = RestInPeace::baseRoutes()
    ?: Response::fromCode(404);
// Router::get('/#num/#alpha?', function ($id, $nom) {
// 	return [$id, $nom];
// });
// Router::get('/#num', function ($code) {
// 	return new Response(Response::$HTTP[$code]);
// });
// (new Auth\Response())->sendHeaders();
// Response::reply($response);
$response->send();
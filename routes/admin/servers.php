<?php
$router->group(['prefix' => 'servers'],function ($router)
{
	$router->get('ajaxIndex','ServersController@ajaxIndex')->name('servers.ajaxIndex');
});
$router->resource('servers','ServersController',['except' => ['show']]);
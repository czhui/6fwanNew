<?php
$router->group(['prefix' => 'help'],function ($router)
{
	$router->get('ajaxIndex','HelpController@ajaxIndex')->name('help.ajaxIndex');
});
$router->resource('help','HelpController',['except' => ['show']]);
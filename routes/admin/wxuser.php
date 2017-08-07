<?php
$router->group(['prefix' => 'wxuser'],function ($router)
{
	$router->get('ajaxIndex','WxuserController@ajaxIndex')->name('wxuser.ajaxIndex');
});
$router->resource('wxuser','WxuserController',['except' => ['show']]);
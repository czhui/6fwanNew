<?php
$router->group(['prefix' => 'notice'],function ($router)
{
	$router->get('orderable','NoticeController@orderable')->name('notice.orderable');
});
$router->resource('notice','NoticeController');
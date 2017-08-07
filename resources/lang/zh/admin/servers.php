<?php
return [
	'title' 	=> '服务器管理',
	'desc' 		=> '服务器列表',
	'create' 	=> '添加服务器',
	'edit' 		=> '修改服务器',
	'model' 	=> [
		'id' 			=> 'ID',
		'name' 			=> '服务器名称',
		'config' 		=> '服务器配置',
        'status' 		=> '状态',
        'created_at' 	=> '创建时间',
        'updated_at' 	=> '修改时间',
	],
	'status'	=> [
		'normal' 		=> '开启',
		'stop' 			=> '停止',
	],
	'action' => [
		'create' => '<i class="fa fa-plus"></i> 添加服务器',
	],

];
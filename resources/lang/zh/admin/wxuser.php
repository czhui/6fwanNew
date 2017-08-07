<?php
return [
	'title' 	=> '微信玩家管理',
	'desc' 		=> '微信玩家列表',
	'model' 	=> [
		'userid' 			=> '玩家编码',
		'nickname' 			=> '玩家名称',
		'headimgurl' 		=> '玩家头像',
        'money' 			=> '玩家房卡',
        'created_at' 		=> '创建时间',
        'updated_at' 		=> '修改时间',
        'status' 			=> '状态',
	],
	'status'	=> [
		'normal' 		=> '开启',
		'stop' 			=> '停止',
	],
	// 'action' => [
	// 	'create' => '<i class="fa fa-plus"></i> 添加微信玩家',
	// ],

];
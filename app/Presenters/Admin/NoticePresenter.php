<?php
namespace App\Presenters\Admin;

class NoticePresenter
{
	public function NoticeNestable($notices)
	{
		$notice = trans('admin/notice.type');

		if ($notice) {
			$item = '';
			foreach ($notice as $k => $v) {
				$not['name'] = $v;
				$not['key'] = $k;
				$item.= $this->getNestableItem($not);
			}
			return $item;
		}
	}

	/**
	 * 返回菜单HTML代码
	 * @param  [type]                   $notice [description]
	 * @return [type]                         [description]
	 */
	protected function getNestableItem($notice)
	{
		// if ($notice['child']) {
		// 	return $this->getHandleList($notice['id'],$notice['name'],$notice['child']);
		// }
		// $labelInfo = $notice['pid'] == 0 ?  'label-info':'label-warning';
		$labelInfo = 'label-info';
		return <<<Eof
				<li class="dd-item dd3-item" data-id="{$notice['key']}">
                    <div class="dd-handle dd3-handle">Drag</div>
                    <div class="dd3-content"><span class="label {$labelInfo}"></span> {$notice['name']} {$this->getActionButtons($notice['key'])}</div>
                </li>
Eof;
	}
	/**
	 * 判断是否有子集
	 * @author 晚黎
	 * @date   2016-11-04T11:05:28+0800
	 * @param  [type]                   $id    [description]
	 * @param  [type]                   $name  [description]
	 * @param  [type]                   $child [description]
	 * @return [type]                          [description]
	 */
	protected function getHandleList($id,$name,$child)
	{
		$handle = '';
		if ($child) {
			foreach ($child as $v) {
				$handle .= $this->getNestableItem($v);
			}
		}
		$html = <<<Eof
		<li class="dd-item dd3-item" data-id="{$id}">
            <div class="dd-handle dd3-handle">Drag</div>
            <div class="dd3-content">
            	<span class="label label-info"></span> {$name} {$this->getActionButtons($id)}
            </div>
            <ol class="dd-list">
                {$handle}
            </ol>
        </li>
Eof;
		return $html;
	}

	/**
	 * 菜单按钮
	 * @param  [type]                   $id   [description]
	 * @param  boolean                  $bool [description]
	 * @return [type]                         [description]
	 */
	protected function getActionButtons($id)
	{
		$action = '<div class="pull-right">';
		if (auth()->user()->can(config('admin.permissions.notice.show'))) {
			$action .= '<a href="javascript:;" class="btn btn-xs tooltips showInfo" data-href="'.url('admin/notice',[$id]).'" data-toggle="tooltip" data-original-title="'.trans('admin/action.actionButton.show').'"  data-placement="top"><i class="fa fa-eye"></i></a>';
		}
		if (auth()->user()->can(config('admin.permissions.notice.edit'))) {
			$action .= '<a href="javascript:;" data-href="'.url('admin/notice/'.$id.'/edit').'" class="btn btn-xs tooltips editMenu" data-toggle="tooltip"data-original-title="'.trans('admin/action.actionButton.edit').'"  data-placement="top"><i class="fa fa-edit"></i></a>';
		}
		if (auth()->user()->can(config('admin.permissions.notice.destroy'))) {
			$action .= '<a href="javascript:;" class="btn btn-xs tooltips destroy_item" data-id="'.$id.'" data-original-title="'.trans('admin/action.actionButton.destroy').'"data-toggle="tooltip"  data-placement="top"><i class="fa fa-trash"></i><form action="'.url('admin/notice',[$id]).'" method="POST" style="display:none"><input type="hidden"name="_method" value="delete"><input type="hidden" name="_token" value="'.csrf_token().'"></form></a>';
		}
		$action .= '</div>';
		return $action;
	}
	/**
	 * 根据用户不同的权限显示不同的内容
	 * @return [type]                   [description]
	 */
	public function canCreateNotice()
	{
		$canCreateNotice = auth()->user()->can(config('admin.permissions.notice.create'));

		$title = $canCreateNotice ?  trans('admin/notice.welcome'):trans('admin/notice.sorry');
		$desc = $canCreateNotice ? trans('admin/notice.description'):trans('admin/notice.description_sorry');
		$createButton = $canCreateNotice ? '<br><a href="javascript:;" class="btn btn-primary m-t create_menu">'.trans('admin/notice.action.create').'</a>':'';
		return <<<Eof
		<div class="middle-box text-center animated fadeInRightBig">
            <h3 class="font-bold">{$title}</h3>
            <div class="error-desc">
                {$desc}{$createButton}
            </div>
        </div>
Eof;
	}
	/**
	 * 添加修改菜单关系select
	 * @param  [type]                   $notices [description]
	 * @param  string                   $pid   [description]
	 * @return [type]                          [description]
	 */
	public function topNoticeList($menus,$pid = '')
	{
		$html = '<option value="0">'.trans('admin/menu.topMenu').'</option>';
		if ($menus) {
			foreach ($menus as $v) {
				$html .= '<option value="'.$v['id'].'" '.$this->checkMenu($v['id'],$pid).'>'.$v['name'].'</option>';
			}
		}
		return $html;
	}

	public function checkResource($menuId,$pid)
	{
		if ($pid !== '') {
			if ($menuId == $pid) {
				return 'selected="selected"';
			}
			return '';
		}
		return '';
	}
	/**
	 * 获取菜单关系名称
	 * @param  [type]     $menus [所有菜单数据]
	 * @param  [type]     $pid   [菜单关系pid]
	 * @return [type]            [description]
	 */
	public function topResourceName($menus,$pid)
	{
		if ($pid == 0) {
			return '顶级菜单';
		}
		if ($menus) {
			foreach ($menus as $v) {
				if ($v['id'] == $pid) {
					return $v['name'];
				}
			}
		}
		return '';
	}
	/**
	 * 多级菜单显示
	 * @param  [type]     $childResource [子菜单数据]
	 * @return [type]                [HTML]
	 */
	public function childResource($childResource)
	{
		$html = '';
		if ($childResource) {
			foreach ($childResource as $v) {
				$html .= '<li class="'.active_class(if_uri_pattern(explode(',',$v['active'])),'active').'"><a href="'.url($v['url']).'">'.$v['name'].'</a></li>';
			}
		}
		return $html;
	}
}
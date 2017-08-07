<?php
namespace App\Service\Admin;
use App\Repositories\Eloquent\Admin\NoticeRepositoryEloquent;
use App\Service\Admin\BaseService;
use Exception,DB;
/**
* 通告service
*/
class NoticeService extends BaseService
{
	private $notice;

	public function __construct(NoticeRepositoryEloquent $notice)
	{
		$this->notice = $notice;
	}

	/**
	 * 递归通告数据
	 * @param  [type]                   $notices [数据库或缓存中查询出来的数据]
	 * @param  integer                  $pid   [菜单关系id]
	 * @return [type]                          [description]
	 */
	public function sortNotice($notices,$pid=0)
	{
		$arr = [];
		if (empty($notices)) {
			return '';
		}
		foreach ($notices as $key => $v) {
			if ($v['pid'] == $pid) {
				$arr[$key] = $v;
				$arr[$key]['child'] = self::sortNotice($notices,$v['id']);
			}
		}
		return $arr;
	}
	/**
	 * 获取菜单数据
	 * @return [type]                   [description]
	 */
	public function getNoticeList()
	{
		$noticeList = $this->notice->allNotice();
		if ($noticeList) {
			// $noticeList = $this->sortNotice($notices);

		// var_dump($noticeList);exit;
			// foreach ($noticeList as $key => &$v) {
			// 	if ($v['child']) {
			// 		$sort = array_column($v['child'], 'sort');
			// 		array_multisort($sort,SORT_DESC,$v['child']);
			// 	}
			// }
			return $noticeList;
			
		}
		return '';
	}
	/**
	 * 添加菜单
	 * @param  [type]                   $attributes [表单数据]
	 * @return [type]                               [Boolean]
	 */
	public function storeNotice($attributes)
	{
		try {
			$result = $this->notice->create($attributes);
			return [
				'status' => $result,
				'message' => $result ? trans('admin/alert.notice.create_success'):trans('admin/alert.notice.create_error'),
			];
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
	}
	/**
	 * 根据菜单ID查找数据
	 * @param  [type]                   $id [description]
	 * @return [type]                       [description]
	 */
	public function findNoticeById($id)
	{
		$notice = $this->notice->find($id);
		if ($notice){
			return $notice;
		}
		// TODO替换正查找不到数据错误页面
		abort(404);
	}
	/**
	 * 修改菜单数据
	 * @param  [type]     $attributes [表单数据]
	 * @param  [type]     $id         [resource路由id]
	 * @return [type]                 [Array]
	 */
	public function updateNotice($attributes,$id)
	{
		// 防止用户恶意修改表单id，如果id不一致直接跳转500
		if ($attributes['id'] != $id) {
			return [
				'status' => false,
				'message' => trans('admin/errors.user_error'),
			];
		}
		try {
			$isUpdate = $this->notice->update($attributes,$id);
			if ($isUpdate) {
				// 更新缓存
				$this->sortResourceSetCache();
			}
			return [
				'status' => $isUpdate,
				'message' => $isUpdate ? trans('admin/alert.notice.edit_success'):trans('admin/alert.notice.edit_error'),
			];
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
		

	}
	/**
	 * 删除菜单
	 * @param  [type]     $id [菜单ID]
	 * @return [type]         [description]
	 */
	public function destroyNotice($id)
	{
		try {
			$isDestroy = $this->notice->delete($id);
			flash_info($isDestroy,trans('admin/alert.notice.destroy_success'),trans('admin/alert.notice.destroy_error'));
			return $isDestroy;
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
	}

	public function orderable($nestableData)
	{
		try {
			$dataArray = json_decode($nestableData,true);
			$menus = array_values($this->getNoticeList());
			$menuCount = count($dataArray);
			$bool = false;
			DB::beginTransaction();
			foreach ($dataArray as $k => $v) {
				$sort = $menuCount - $k;
				if (!isset($menus[$k])) {
					$this->notice->update(['sort' => $sort,'pid' => 0],$v['id']);
					$bool = true;
				}else{
					if (isset($menus[$k]['id']) && $v['id'] != $menus[$k]['id']) {
						$this->notice->update(['sort' => $sort,'pid' => 0],$v['id']);
						$bool = true;
					}
				}
				if (isset($v['children']) && !empty($v['children'])) {
					$childCount = count($v['children']);
					foreach ($v['children'] as $key => $child) {
						$chidlSort = $childCount - $key;
						if (!isset($menus[$k]['child'][$key])) {
							foreach ($v['children'] as $index => $val) {
								$reIndex = $childCount - $index;
								$this->notice->update(['pid' => $v['id'],'sort' => $reIndex],$val['id']);
							}
							$bool = true;
						}else{
							if (isset($menus[$k]['child'][$key]) && ($child['id'] != $menus[$k]['child'][$key]['id'])) {
								$this->notice->update(['pid' => $v['id'],'sort' => $chidlSort],$child['id']);
								$bool = true;
							}
						}
					}
				}
			}
			DB::commit();
			return [
				'status' => $bool,
				'message' => $bool ? trans('admin/alert.notice.order_success'):trans('admin/alert.notice.order_error')
			];
		} catch (Exception $e) {
			// 错误信息发送邮件
			DB::rollBack();
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
	}
}
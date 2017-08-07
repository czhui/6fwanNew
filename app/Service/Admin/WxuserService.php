<?php
namespace App\Service\Admin;
use App\Repositories\Eloquent\Admin\WxuserRepositoryEloquent;
use App\Service\Admin\BaseService;
use Exception;
/**
* 微信玩家service
*/
class WxuserService extends BaseService
{

	private $wxuser;

	function __construct(WxuserRepositoryEloquent $wxuser)
	{
		$this->wxuser =  $wxuser;
	}
	/**
	 * datatables获取数据
	 * @return [type]                   [description]
	 */
	public function ajaxIndex()
	{
		// datatables请求次数
		$draw = request('draw', 1);
		// 开始条数
		$start = request('start', config('admin.golbal.list.start'));
		// 每页显示数目
		$length = request('length', config('admin.golbal.list.length'));
		// datatables是否启用模糊搜索
		$search['regex'] = request('search.regex', false);
		// 搜索框中的值
		$search['value'] = request('search.value', '');
		// 排序
		$order['name'] = request('columns.' .request('order.0.column',0) . '.name');
		$order['dir'] = request('order.0.dir','asc');

		$result = $this->wxuser->getWxuserList($start,$length,$search,$order);

		$wxuser = [];

		if ($result['wxusers']) {
			foreach ($result['wxusers'] as $v) {
				$v->actionButton = $v->getActionButtonAttribute();
				$v['statu'] = $v['status'] == 'normal' ? trans('admin/wxuser.status.normal') : trans('admin/wxuser.status.stop') ;
				$wxuser[] = $v;
			}
		}

		return [
			'draw' => $draw,
			'recordsTotal' => $result['count'],
			'recordsFiltered' => $result['count'],
			'data' => $wxuser,
		];
	}
	/**
	 * 修改状态
	 * @param  [type]                   $attributes [表单数据]
	 * @param  [type]                   $id         [resource路由传递过来的id]
	 * @return [type]                               [true or false]
	 */
	public function updateStatus($attributes,$id)
	{
		// 防止用户恶意修改表单id，如果id不一致直接跳转500
		if ($attributes['id'] != $id) {
			abort(500);
		}
		try {
			$result = $this->wxuser->update($attributes,$id);
			flash_info($result,trans('admin/alert.wxuser.prohibit_success'),trans('admin/alert.wxuser.prohibit_error'));
			return $result;
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
	}
}
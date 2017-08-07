<?php
namespace App\Service\Admin;
use App\Repositories\Eloquent\Admin\ServersRepositoryEloquent;
use App\Service\Admin\BaseService;
use Exception;
/**
* 服务器service
*/
class ServersService extends BaseService
{

	private $servers;

	function __construct(ServersRepositoryEloquent $servers)
	{
		$this->servers =  $servers;
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

		$result = $this->servers->getServersList($start,$length,$search,$order);

		$servers = [];

		if ($result['servers']) {
			foreach ($result['servers'] as $v) {
				$v->actionButton = $v->getActionButtonAttribute();
				$v['statu'] = $v['status'] == 'normal' ? trans('admin/servers.status.normal') : trans('admin/servers.status.stop') ;
				$servers[] = $v;
			}
		}

		return [
			'draw' => $draw,
			'recordsTotal' => $result['count'],
			'recordsFiltered' => $result['count'],
			'data' => $servers,
		];
	}
	/**
	 * 添加服务器
	 * @param  [type]                   $formData [表单中所有的数据]
	 * @return [type]                             [true or false]
	 */
	public function storeServers($formData)
	{
		try {
			$result = $this->servers->create($formData);
			flash_info($result,trans('admin/alert.servers.create_success'),trans('admin/alert.servers.create_error'));
			return $result;
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
	}
	/**
	 * 根据ID获取服务器数据
	 * @param  [type]                   $id [权限id]
	 * @return [type]                       [查询出来的权限对象，查不到数据时跳转404]
	 */
	public function editView($id)
	{
		$servers =  $this->servers->find($id);
		if ($servers) {
			return $servers;
		}
		abort(404);
	}
	/**
	 * 修改权限
	 * @param  [type]                   $attributes [表单数据]
	 * @param  [type]                   $id         [resource路由传递过来的id]
	 * @return [type]                               [true or false]
	 */
	public function updateServers($attributes,$id)
	{
		// 防止用户恶意修改表单id，如果id不一致直接跳转500
		if ($attributes['id'] != $id) {
			abort(500);
		}
		try {
			$result = $this->servers->update($attributes,$id);
			flash_info($result,trans('admin/alert.servers.edit_success'),trans('admin/alert.servers.edit_error'));
			return $result;
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
	}
	/**
	 * 权限暂不做状态管理，直接删除
	 * @param  [type]                   $id [权限id]
	 * @return [type]                       [true or false]
	 */
	public function destroyServers($id)
	{
		try {
			$result = $this->servers->delete($id);
			flash_info($result,trans('admin/alert.servers.destroy_success'),trans('admin/alert.servers.destroy_error'));
			return $result;
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
		
	}
}
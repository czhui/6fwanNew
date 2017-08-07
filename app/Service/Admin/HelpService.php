<?php
namespace App\Service\Admin;
use App\Repositories\Eloquent\Admin\HelpRepositoryEloquent;
use App\Service\Admin\BaseService;
use Exception;
/**
* 玩家service
*/
class HelpService extends BaseService
{

	private $help;

	function __construct(HelpRepositoryEloquent $help)
	{
		$this->help =  $help;
	}
	/**
	 * datatables获取玩法数据
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

		$result = $this->help->getHelpList($start,$length,$search,$order);

		$helps = [];

		if ($result['helps']) {
			foreach ($result['helps'] as $v) {
				$v->actionButton = $v->getActionButtonAttribute();
				//选择字符串长度和解释
				$v['contents'] = mb_substr(strip_tags(htmlspecialchars_decode( $v['contents'] )),0,80,'UTF-8')."...." ;
				$helps[] = $v;
			}
		}

		return [
			'draw' => $draw,
			'recordsTotal' => $result['count'],
			'recordsFiltered' => $result['count'],
			'data' => $helps,
		];
	}
	/**
	 * 添加玩法
	 * @param  [type]                   $formData [表单中所有的数据]
	 * @return [type]                             [true or false]
	 */
	public function storeHelp($formData)
	{
		try {
			$result = $this->help->create($formData);
			flash_info($result,trans('admin/alert.help.create_success'),trans('admin/alert.help.create_error'));
			return $result;
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
	}
	/**
	 * 根据ID获取玩法数据
	 * @param  [type]                   $id [权限id]
	 * @return [type]                       [查询出来的权限对象，查不到数据时跳转404]
	 */
	public function editView($id)
	{
		$help =  $this->help->find($id);
		if ($help) {
			return $help;
		}
		abort(404);
	}
	/**
	 * 修改玩法
	 * @param  [type]                   $attributes [表单数据]
	 * @param  [type]                   $id         [resource路由传递过来的id]
	 * @return [type]                               [true or false]
	 */
	public function updateHelp($attributes,$id)
	{
		// 防止用户恶意修改表单id，如果id不一致直接跳转500
		if ($attributes['id'] != $id) {
			abort(500);
		}
		try {
			$result = $this->help->update($attributes,$id);
			flash_info($result,trans('admin/alert.help.edit_success'),trans('admin/alert.help.edit_error'));
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
	public function destroyHelp($id)
	{
		try {
			$result = $this->help->delete($id);
			flash_info($result,trans('admin/alert.help.destroy_success'),trans('admin/alert.help.destroy_error'));
			return $result;
		} catch (Exception $e) {
			// 错误信息发送邮件
			$this->sendSystemErrorMail(env('MAIL_SYSTEMERROR',''),$e);
			return false;
		}
		
	}
}
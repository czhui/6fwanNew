<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service\Admin\WxuserService;
use App\Http\Requests\Admin\WxuserRequest;

class WxuserController extends Controller
{
    private $wxuser;

    public function __construct(WxuserService $wxuser)
    {
        // 自定义权限中间件
        $this->middleware('check.permission:wxuser');
        $this->wxuser = $wxuser;
    }
    /**
     * 微信用户列表
     */
    public function index()
    {
        return view('admin.wxuser.list');
    }
    /**
     * datatables获取数据
     * @return [type]     [description]
     */
    public function ajaxIndex()
    {	
        $responseData = $this->wxuser->ajaxIndex();
        return response()->json($responseData);
    }

    /**
     * 修改微信用户
     * @param  WxuserRequest        $request [description]
     * @param  [type]                   $id      [description]
     * @return [type]                            [description]
     */
    public function update(WxuserRequest $request, $id)
    {
        $this->wxuser->updateStatus($request->all(),$id);
        return redirect('admin/wxuser');
    }
}

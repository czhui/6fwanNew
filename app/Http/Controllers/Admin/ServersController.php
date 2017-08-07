<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service\Admin\ServersService;
use App\Http\Requests\Admin\ServersRequest;

class ServersController extends Controller
{
    private $servers;

    public function __construct(ServersService $servers)
    {
        // 自定义权限中间件
        $this->middleware('check.permission:servers');
        $this->servers = $servers;
    }
    /**
     * 服务器列表
     */
    public function index()
    {
        return view('admin.servers.list');
    }
    /**
     * datatables获取数据
     * @return [type]     [description]
     */
    public function ajaxIndex()
    {	
        $responseData = $this->servers->ajaxIndex();
        return response()->json($responseData);
    }

    /**
     * 添加服务器视图
     * @return [type]                   [description]
     */
    public function create()
    {
        return view('admin.servers.create');
    }

    /**
     * 添加服务器
     * @param  serversRequest        $request [description]
     * @return [type]                            [description]
     */
    public function store(serversRequest $request)
    {
        $this->servers->storeServers($request->all());
        return redirect('admin/servers');
    }

    /**
     * 修改权限服务器
     * @param  [type]                   $id [description]
     * @return [type]                       [description]
     */
    public function edit($id)
    {
        $servers = $this->servers->editView($id);
        return view('admin.servers.edit')->with(compact('servers'));
    }

    /**
     * 修改服务器
     * @param  serversRequest        $request [description]
     * @param  [type]                   $id      [description]
     * @return [type]                            [description]
     */
    public function update(serversRequest $request, $id)
    {
        $this->servers->updateServers($request->all(),$id);
        return redirect('admin/servers');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->servers->destroyServers($id);
        return redirect('admin/servers');
    }
}

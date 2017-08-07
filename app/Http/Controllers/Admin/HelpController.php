<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service\Admin\HelpService;
use App\Http\Requests\Admin\HelpRequest;

class HelpController extends Controller
{
    private $help;

    public function __construct(HelpService $help)
    {
        // 自定义权限中间件
        $this->middleware('check.permission:help');
        $this->help = $help;
    }
    /**
     * 玩法列表
     */
    public function index()
    {
        return view('admin.help.list');
    }
    /**
     * datatables获取数据
     * @return [type]     [description]
     */
    public function ajaxIndex()
    {	
        $responseData = $this->help->ajaxIndex();
        return response()->json($responseData);
    }

    /**
     * 添加玩法视图
     * @return [type]                   [description]
     */
    public function create()
    {
        return view('admin.help.create');
    }

    /**
     * 添加玩法
     * @param  HelpRequest        $request [description]
     * @return [type]                            [description]
     */
    public function store(HelpRequest $request)
    {
        $this->help->storeHelp($request->all());
        return redirect('admin/help');
    }

    /**
     * 修改玩法视图
     * @param  [type]                   $id [description]
     * @return [type]                       [description]
     */
    public function edit($id)
    {
        $help = $this->help->editView($id);
        return view('admin.help.edit')->with(compact('help'));
    }

    /**
     * 修改玩法
     * @param  HelpRequest        $request [description]
     * @param  [type]                   $id      [description]
     * @return [type]                            [description]
     */
    public function update(HelpRequest $request, $id)
    {
        $this->help->updateHelp($request->all(),$id);
        return redirect('admin/help');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->help->destroyHelp($id);
        return redirect('admin/help');
    }
}

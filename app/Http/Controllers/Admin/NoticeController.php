<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service\Admin\NoticeService;
use App\Http\Requests\Admin\NoticeRequest;
class NoticeController extends Controller
{
    private $notice;

    public function __construct(NoticeService $notice)
    {
        // 自定义权限中间件
        $this->middleware('check.permission:notice');
        $this->notice = $notice;
    }

    /**
     * 通告列表
     * @return [type]                   [description]
     */
    public function index()
    {

        // var_dump($this->notice->getNoticeList());exit;
        $notices = $this->notice->getNoticeList();

        return view('admin.notice.list')->with(compact('notices'));
    }

    /**
     * 添加通告视图
     * @return [type]                   [description]
     */
    public function create()
    {
        $notices = $this->notice->getResourceList();
        return view('admin.notice.create')->with(compact('notices'));
    }

    /**
     * 添加通告
     * @param  NoticeRequest              $request [description]
     * @return [type]                            [description]
     */
    public function store(NoticeRequest $request)
    {
        $responseData = $this->notice->storeNotice($request->all());
        return response()->json($responseData);
    }

    /**
     * 查看通告详细数据
     * @param  [type]     $id [description]
     * @return [type]         [description]
     */
    public function show($id)
    {
        $notices = $this->notice->getNoticeList();
        $notice = $this->notice->findNoticeById($id);
        return view('admin.notice.show')->with(compact('notice','notices'));
    }

    /**
     * 修改菜单通告
     * @param  [type]                   $id [description]
     * @return [type]                       [description]
     */
    public function edit($id)
    {
        $notice = $this->notice->findNoticeById($id);
        $notices = $this->notice->getNoticeList();
        return view('admin.notice.edit')->with(compact('notice','notices'));
    }

    /**
     * 修改通告数据
     * @param  NoticeRequest              $request [description]
     * @param  [type]                   $id      [description]
     * @return [type]                            [description]
     */
    public function update(NoticeRequest $request, $id)
    {
        $responseData = $this->notice->updateNotice($request->all(),$id);
        return response()->json($responseData);
    }

    /**
     * 删除通告
     * @param  [type]     $id [description]
     * @return [type]         [description]
     */
    public function destroy($id)
    {
        $this->notice->destroyNotice($id);
        return redirect('admin/notice');
    }

    public function orderable()
    {
        $responseData = $this->notice->orderable(request('nestable',''));
        return response()->json($responseData);
    }
}

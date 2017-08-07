<?php
namespace App\Repositories\Eloquent\Admin;
use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\Contracts\Admin\ServersRepository;
use App\Models\Admin\Servers;
/**
 * Class PermissionRepositoryEloquent
 * @package namespace App\Repositories\Eloquent;
 */
class ServersRepositoryEloquent extends BaseRepository implements ServersRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Servers::class;
    }
    /**
     * 查询权限并分页
     * @param  [type]                   $start  [起始数目]
     * @param  [type]                   $length [读取条数]
     * @param  [type]                   $search [搜索数组数据]
     * @param  [type]                   $order  [排序数组数据]
     * @return [type]                           [查询结果集，包含查询的数量及查询的结果对象]
     */
    public function getServersList($start,$length,$search,$order)
    {
        $server = $this->model;
        if ($search['value']) {
            if($search['regex'] == 'true'){
                $server = $server->where('name', 'like', "%{$search['value']}%");
            }else{
                $server = $server->where('name', $search['value']);
            }
        }

        $count = $server->count();
        
        $server = $server->orderBy($order['name'], $order['dir']);

        $servers = $server->offset($start)->limit($length)->get();

        return compact('count','servers');
    }


}

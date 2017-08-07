<?php
namespace App\Repositories\Eloquent\Admin;
use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\Contracts\Admin\WxuserRepository;
use App\Models\Admin\Wxuser;
/**
 * Class PermissionRepositoryEloquent
 * @package namespace App\Repositories\Eloquent;
 */
class WxuserRepositoryEloquent extends BaseRepository implements WxuserRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Wxuser::class;
    }
    /**
     * 查询权限并分页
     * @param  [type]                   $start  [起始数目]
     * @param  [type]                   $length [读取条数]
     * @param  [type]                   $search [搜索数组数据]
     * @param  [type]                   $order  [排序数组数据]
     * @return [type]                           [查询结果集，包含查询的数量及查询的结果对象]
     */
    public function getWxuserList($start,$length,$search,$order)
    {
        $wxuser = $this->model;
        $table = $wxuser['table'];
        $table_join = $wxuser['table_join'];
        
        $wxuser = $wxuser->Join($table_join, $table.'.userid', '=', $table_join.'.trader_id')->select($table.'.*', $table_join.'.money');

        if ($search['value']) {
            if($search['regex'] == 'true'){

                $wxuser = $wxuser->where($table.'.userid', 'like', "%{$search['value']}%")->orWhere($table.'.nickname','like', "%{$search['value']}%");
            }else{
                $wxuser = $wxuser->where($table.'.userid', $search['value'])->orWhere($table.'.nickname','like', "%{$search['value']}%");
            }
        }

        // var_dump($wxuser->toSql());exit;

        $count = $wxuser->count();
        
        $wxuser = $wxuser->orderBy($order['name'], $order['dir']);

        $wxusers = $wxuser->offset($start)->limit($length)->get();

        return compact('count','wxusers');
    }


}

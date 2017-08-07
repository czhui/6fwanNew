<?php
namespace App\Repositories\Eloquent\Admin;
use Prettus\Repository\Eloquent\BaseRepository;
use Prettus\Repository\Criteria\RequestCriteria;
use App\Repositories\Contracts\Admin\HelpRepository;
use App\Models\Admin\Help;
/**
 * Class PermissionRepositoryEloquent
 * @package namespace App\Repositories\Eloquent;
 */
class HelpRepositoryEloquent extends BaseRepository implements HelpRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Help::class;
    }
    /**
     * 查询权限并分页
     * @param  [type]                   $start  [起始数目]
     * @param  [type]                   $length [读取条数]
     * @param  [type]                   $search [搜索数组数据]
     * @param  [type]                   $order  [排序数组数据]
     * @return [type]                           [查询结果集，包含查询的数量及查询的结果对象]
     */
    public function getHelpList($start,$length,$search,$order)
    {
        $help = $this->model;
        if ($search['value']) {
            if($search['regex'] == 'true'){
                $help = $help->where('name', 'like', "%{$search['value']}%");
            }else{
                $help = $help->where('name', $search['value']);
            }
        }

        $count = $help->count();
        
        $help = $help->orderBy($order['name'], $order['dir']);

        $helps = $help->offset($start)->limit($length)->get();

        return compact('count','helps');
    }


}

<?php
namespace App\Repositories\Eloquent\Admin;
use Prettus\Repository\Eloquent\BaseRepository;
use App\Repositories\Contracts\Admin\NoticeRepository;
use App\Models\Admin\Notice;
/**
 * 
 */
class NoticeRepositoryEloquent extends BaseRepository implements NoticeRepository
{
    /**
     * Specify Model class name
     *
     * @return string
     */
    public function model()
    {
        return Notice::class;
    }

    public function allNotice()
    {
    	return $this->model->orderBy('sort','desc')->select('id','type')->get()->toArray();
    }

    public function createNotice($attributes)
    {
        $model = new $this->model;
        return $model->fill($attributes)->save();
    }
}

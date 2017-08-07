<?php
namespace App\Models\Admin;
use Illuminate\Database\Eloquent\Model;
use App\Traits\ActionButtonAttributeTrait;
class Notice extends Model
{
	use ActionButtonAttributeTrait;

	private $action = 'notices';

    protected $fillable = ['id','name','content','type','gameid','sort'];

    public function setSortAttribute($value)
    {
    	if ($value && is_numeric($value)) {
	        $this->attributes['sort'] = intval($value);
    	}else{
    		$this->attributes['sort'] = 0;
    	}
    }
}

<?php
namespace App\Models\Admin;
use Illuminate\Database\Eloquent\Model;
use App\Traits\ActionButtonAttributeTrait;
class Wxuser extends Model
{
    use ActionButtonAttributeTrait;

    protected $connection = 'mysql_center';
    protected $table = "qp_user";
    protected $table_join = "trader_info";

    protected $fillable = ['id','userid','openid','unionid','reg_time','last_time','serverid','gameid','sex','nickname','headimgurl','status'];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
    }

}

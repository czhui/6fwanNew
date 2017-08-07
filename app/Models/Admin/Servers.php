<?php
namespace App\Models\Admin;
use Illuminate\Database\Eloquent\Model;
use App\Traits\ActionButtonAttributeTrait;
class Servers extends Model
{
    use ActionButtonAttributeTrait;

    private $action = 'servers';

    protected $fillable = ['id','name','config','status','gameid'];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
    }

}

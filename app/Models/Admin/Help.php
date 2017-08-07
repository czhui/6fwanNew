<?php
namespace App\Models\Admin;
use Illuminate\Database\Eloquent\Model;
use App\Traits\ActionButtonAttributeTrait;
class Help extends Model
{
    use ActionButtonAttributeTrait;

    private $action = 'helps';

    protected $fillable = ['id','name','contents','sort','gameid'];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
    }

}

<?php
namespace App\Http\Requests\Admin;
use Illuminate\Foundation\Http\FormRequest;
class ResourceRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules['content'] = 'required';
        $rules['gameid'] = 'required';
        // 添加权限
        if (request()->isMethod('PUT') || request()->isMethod('PATH')) {
            // 修改时 request()->method() 方法返回的是 PUT或PATCH
            $rules['id'] = 'numeric|required';
        }
        return $rules;
        return [
            'content'      => 'required',
            'gameid'      => 'required',
        ];
    }
    /**
     * 验证信息
     * @return [type]                   [description]
     */
    public function messages()
    {
        return [
            'required'  => trans('validation.required'),
            'numeric'   => trans('validation.numeric'),
        ];
    }
    /**
     * 字段名称
     * @return [type]                   [description]
     */
    public function attributes()
    {
        return [
            'content'       => trans('admin/resource.model.content'),
            'gameid'      => trans('admin/resource.model.gameid'),
            'id'        => trans('admin/resource.model.id'),
        ];
    }
}

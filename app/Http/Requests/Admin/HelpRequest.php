<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class HelpRequest extends FormRequest
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
        $rules['name']      = 'required';
        $rules['sort']      = 'required';
        // 添加权限
        if (request()->isMethod('POST')) {
            $rules['contents']  = 'required';
        }else{
            // 修改时 request()->method() 方法返回的是 PUT或PATCH
            $rules['contents'] = 'required|unique:help,contents,'.$this->id;
            $rules['id'] = 'numeric|required';
        }
        return $rules;
    }

    /**
     * 字段名称
     */
    public function attributes()
    {
        return [
            'id'        => trans('admin/help.model.id'),
            'name'      => trans('admin/help.model.name'),
            'contents'  => trans('admin/help.model.contents'),
            'sort'      => trans('admin/help.model.sort'),
        ];
    }
}

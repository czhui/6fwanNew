<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class WxuserRequest extends FormRequest
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
        $rules['userid'] = 'numeric';

        // 添加权限
        if (request()->isMethod('POST')) {
            $rules['status']  = 'required';
        }else{
            // 修改时 request()->method() 方法返回的是 PUT或PATCH
            $rules['status'] = 'required|unique:wxuser,status,'.$this->id;
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
            'id'        => trans('admin/wxuser.model.id'),
            'status'    => trans('admin/wxuser.model.status'),
        ];
    }
}

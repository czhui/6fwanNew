@extends('layouts.admin')

@section('css')
<link href="{{asset('vendors/summernote/summernote.css')}}" rel="stylesheet">
<link href="{{asset('vendors/summernote/summernote-bs3.css')}}" rel="stylesheet">
<style>
  .note-editor .note-editable{
    border: 1px solid #f4f4f4;
  }
</style>
@endsection

@section('content')
<div class="row wrapper border-bottom white-bg page-heading">
  <div class="col-lg-10">
    <h2>{!!trans('admin/help.title')!!}</h2>
    <ol class="breadcrumb">
        <li>
            <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
        </li>
        <li>
            <a href="{{url('admin/help')}}">{!!trans('admin/breadcrumb.help.list')!!}</a>
        </li>
        <li class="active">
            <strong>{!!trans('admin/breadcrumb.help.create')!!}</strong>
        </li>
    </ol>
  </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="row">
    <div class="col-lg-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>{!!trans('admin/help.create')!!}</h5>
          <div class="ibox-tools">
              <a class="collapse-link">
                  <i class="fa fa-chevron-up"></i>
              </a>
              <a class="close-link">
                  <i class="fa fa-times"></i>
              </a>
          </div>
        </div>
        <div class="ibox-content">
          <form method="post" action="{{url('admin/help')}}" class="form-horizontal">
            {{csrf_field()}}
            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
              <label class="col-sm-2 control-label">{{trans('admin/help.model.name')}}</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="name" value="{{old('name')}}" placeholder="{{trans('admin/help.model.name')}}"> 
                @if ($errors->has('name'))
                <span class="help-block m-b-none text-danger">{{ $errors->first('name') }}</span>
                @endif
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group{{ $errors->has('sort') ? ' has-error' : '' }}">
              <label class="col-sm-2 control-label">{{trans('admin/help.model.sort')}}</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="sort" value="{{old('sort')}}" placeholder="{{trans('admin/help.model.sort')}}"> 
                @if ($errors->has('sort'))
                <span class="help-block m-b-none text-danger">{{ $errors->first('sort') }}</span>
                @endif
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group{{ $errors->has('contents') ? ' has-error' : '' }}">
              <label class="col-sm-2 control-label">{{trans('admin/help.model.contents')}}</label>
              <div class="col-sm-10">
                <textarea name="contents" id="" cols="30" rows="10" class="summernote click2edit">{{old('contents')}}</textarea>
                @if ($errors->has('contents'))
                <span class="help-block m-b-none text-danger">{{ $errors->first('contents') }}</span>
                @endif
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-2">
                  <a class="btn btn-white" href="{{url()->previous()}}">{!!trans('admin/action.actionButton.cancel')!!}</a>
                  <button class="btn btn-primary" type="submit">{!!trans('admin/action.actionButton.submit')!!}</button>
              </div>
            </div>
          </form>
        </div>
    </div>
  	</div>
  </div>
</div>
@endsection

@section('js')
<script src="{{asset('vendors/summernote/summernote.min.js')}}"></script>
<script>
$(document).ready(function(){

    $('.summernote').summernote({
      height:300,
      minHeight: null, 
      maxHeight: null,
      focus: true
    });

});
var edit = function() {
    $('.click2edit').summernote({focus: true});
};
var save = function() {
    var aHTML = $('.click2edit').code(); //save HTML If you need(aHTML: array).
    $('.click2edit').destroy();
};
</script>
@endsection
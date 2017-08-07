@extends('layouts.admin')
@section('content')
<div class="row wrapper border-bottom white-bg page-heading">
  <div class="col-lg-10">
    <h2>{!!trans('admin/servers.title')!!}</h2>
    <ol class="breadcrumb">
        <li>
            <a href="{{url('admin/dash')}}">{!!trans('admin/breadcrumb.home')!!}</a>
        </li>
        <li>
            <a href="{{url('admin/servers')}}">{!!trans('admin/breadcrumb.servers.list')!!}</a>
        </li>
        <li class="active">
            <strong>{!!trans('admin/breadcrumb.servers.edit')!!}</strong>
        </li>
    </ol>
  </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="row">
    <div class="col-lg-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>{!!trans('admin/servers.edit')!!}</h5>
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
          <form method="post" action="{{url('admin/servers/'.$servers->id)}}" class="form-horizontal">
            {{csrf_field()}}
            {{method_field('PUT')}}
            <input type="hidden" name="id" value="{{$servers->id}}">
            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
              <label class="col-sm-2 control-label">{{trans('admin/servers.model.name')}}</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="name" value="{{old('name',$servers->name) }}" placeholder="{{trans('admin/servers.model.name')}}"> 
                @if ($errors->has('name'))
                <span class="help-block m-b-none text-danger">{{ $errors->first('name') }}</span>
                @endif
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group{{ $errors->has('config') ? ' has-error' : '' }}">
              <label class="col-sm-2 control-label">{{trans('admin/servers.model.config')}}</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="config" value="{{old('config',$servers->config)}}" placeholder="{{trans('admin/servers.model.config')}}"> 
                @if ($errors->has('config'))
                <span class="help-block m-b-none text-danger">{{ $errors->first('config') }}</span>
                @endif
              </div>
            </div>
            <div class="hr-line-dashed"></div>
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
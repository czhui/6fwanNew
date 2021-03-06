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
            <strong>{!!trans('admin/breadcrumb.servers.create')!!}</strong>
        </li>
    </ol>
  </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="row">
    <div class="col-lg-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>{!!trans('admin/servers.create')!!}</h5>
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
          <form method="post" action="{{url('admin/servers')}}" class="form-horizontal">
            {{csrf_field()}}
            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
              <label class="col-sm-2 control-label">{{trans('admin/servers.model.name')}}</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="name" value="{{old('name')}}" placeholder="{{trans('admin/servers.model.name')}}"> 
                @if ($errors->has('name'))
                <span class="help-block m-b-none text-danger">{{ $errors->first('name') }}</span>
                @endif
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group{{ $errors->has('config') ? ' has-error' : '' }}">
              <label class="col-sm-2 control-label">{{trans('admin/servers.model.config')}}</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="config" value="{{old('config')}}" placeholder="{{trans('admin/servers.model.config')}}"> 
                @if ($errors->has('config'))
                <span class="help-block m-b-none text-danger">{{ $errors->first('config') }}</span>
                @endif
              </div>
            </div>


            
            <div class="hr-line-dashed"></div>
            <div class="form-group{{ $errors->has('status') ? ' has-error' : '' }}">
              <label class="col-sm-2 control-label">{{trans('admin/servers.model.status')}}</label>
              <div class="col-sm-10">
                <!-- <input type="text" class="form-control" name="config" value="{{old('config')}}" placeholder="{{trans('admin/servers.model.config')}}">  -->

                <div class="radio radio-info radio-inline">
                    <input type="radio" id="normal" value="normal" name="status" checked="">
                    <label for="normal">开启</label>
                </div>
                <div class="radio radio-inline">
                    <input type="radio" id="stop" value="stop" name="status">
                    <label for="stop">停止</label>
                </div>
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
<script>
  // var elem = document.querySelector('.js-switch');
  // var switchery = new Switchery(elem, { color: '#18a8bf' });
</script>
@endsection
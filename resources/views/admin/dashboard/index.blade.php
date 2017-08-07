@extends('layouts.admin')
@section('content')
<div class="wrapper wrapper-content">
  <div class="row">
    <div class="col-lg-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-success pull-right">今天</span>
                <h5>在线人数</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">40 886,200</h1>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-info pull-right">今天</span>
                <h5>注册人数</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">275,800</h1>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-primary pull-right">今天</span>
                <h5>玩家购买房卡</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">106,120</h1>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-danger pull-right">今天</span>
                <h5>代理购买房卡</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">80,600</h1>
            </div>
        </div>
    </div>
  </div>


</div>
@endsection
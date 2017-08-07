@inject('menuPresenter','App\Presenters\Admin\MenuPresenter')
<div class="ibox float-e-margins animated bounceIn formBox" id="showBox">
  <div class="ibox-title">
    <h5>{{trans('admin/help.info')}}</h5>
    <div class="ibox-tools">
      <a class="close-link">
          <i class="fa fa-times"></i>
      </a>
    </div>
  </div>
  <div class="ibox-content">
    <form class="form-horizontal" id="showForm">
      <div class="form-group">
        <label class="col-sm-3 control-label">{{trans('admin/help.model.name')}}</label>
        <div class="col-sm-9">
          <p class="form-control-static">{{$help->name}}</p>
        </div>
      </div>
      <div class="hr-line-dashed"></div>
      <div class="form-group">
        <label class="col-sm-3 control-label">{{trans('admin/help.model.contents')}}</label>
        <div class="col-sm-9">
          <p class="form-control-static">{{$help->contents}}</p>
        </div>
      </div>
      <div class="hr-line-dashed"></div>
      <div class="form-group">
        <label class="col-sm-3 control-label">{{trans('admin/help.model.sort')}}</label>
        <div class="col-sm-9">
          <p class="form-control-static">{{$help->sort}}</p>
        </div>
      </div>
      <div class="hr-line-dashed"></div>
      <div class="form-group">
          <div class="col-sm-4 col-sm-offset-2">
              <a class="btn btn-white close-link">{!!trans('admin/action.actionButton.close')!!}</a>
          </div>
      </div>
    </form>
  </div>
</div>
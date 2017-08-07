@inject('noticePreseter','App\Presenters\Admin\NoticePresenter')
<div class="ibox float-e-margins animated bounceIn formBox" id="editBox">
  <div class="ibox-title">
    <h5>{{trans('admin/notice.edit')}}</h5>
    <div class="ibox-tools">
      <a class="close-link">
          <i class="fa fa-times"></i>
      </a>
    </div>
  </div>
  <div class="ibox-content">
    <form method="post" action="{{url('admin/notice',[$notice->id])}}" class="form-horizontal" id="editForm">
      {!!csrf_field()!!}
      {{method_field('PUT')}}
      <input type="hidden" name="id" value="{{$notice->id}}">
      <div class="form-group">
        <label class="col-sm-2 control-label">{{trans('admin/notice.model.name')}}</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" placeholder="{{trans('admin/notice.model.name')}}" name="name" value="{{$notice->name}}">
        </div>
      </div>
      <div class="hr-line-dashed"></div>
      <div class="form-group">
        <label class="col-sm-2 control-label">{{trans('admin/notice.model.type')}}</label>
        <div class="col-sm-10">
          <select class="form-control" name="type">
            {!!$noticePresenter->topNoticeList($notices,$notice->type)!!}
          </select>
        </div>
      </div>
      <div class="hr-line-dashed"></div>
      <div class="form-group">
        <label class="col-sm-2 control-label">{{trans('admin/notice.model.content')}}</label>
        <div class="col-sm-10">
          <textarea name="content" cols="30" rows="10" placeholder="{{trans('admin/notice.model.content')}}">{{$notice->content}}</textarea>
          <!-- <input type="text" class="form-control" placeholder="{{trans('admin/notice.model.content')}}" name="content" value="{{$notice->content}}"> -->
        </div>
      </div>
      <div class="hr-line-dashed"></div>
      <div class="form-group">
          <div class="col-sm-4 col-sm-offset-2">
              <a class="btn btn-white close-link">{!!trans('admin/action.actionButton.close')!!}</a>
              <button class="btn btn-primary editButton ladda-button"  data-style="zoom-in">{!!trans('admin/action.actionButton.submit')!!}</button>
          </div>
      </div>
    </form>
  </div>
</div>
@inject('menuPresenter','App\Presenters\Admin\MenuPresenter')
<style>
  #nowTime{
    float: right;
    width: 100px;
    margin-top: 10px;
    font-size: 15px;
    color: #fff;
  }
</style>
<nav class="navbar-default navbar-static-side" role="navigation">
  <div class="sidebar-collapse">
    <ul class="nav metismenu" id="side-menu">
      <li class="nav-header">
          <div class="dropdown profile-element"> 
              <span>
                <img alt="image" class="img-circle" src="{{asset('admin/img/profile_small.jpg')}}" />
              </span>
              <span id="nowTime"></span>
              <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                  <span class="clear"> <span class="block m-t-xs"> {{getUser()->name}} <strong class="font-bold"></strong>
                   </span> <span class="text-muted text-xs block">管理员 <b class="caret"></b></span> </span> </a>
              <ul class="dropdown-menu animated fadeInRight m-t-xs">
                  <li><a href="#">个人信息</a></li>
                  <li class="divider"></li>
                  <li><a href="#">修改密码</a></li>
              </ul>
          </div>
          <div class="logo-element">
              6方
          </div>
      </li>
      {!!$menuPresenter->sidebarMenuList($sidebarMenu)!!}
    </ul>
  </div>
</nav>
<script type="text/javascript"> 

</script>
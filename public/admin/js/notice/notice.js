var NoticeList = function() {
  var noticeInit = function(){
    $('#nestable').nestable({
      "maxDepth":2
    }).on('change',function () {
      var list = window.JSON.stringify($('#nestable').nestable('serialize'));
      console.log(list);
      $.ajax({
        url:'/admin/notice/orderable',
        data:{
          nestable:list
        },
        dataType:'json',
        success:function (response) {
          if (response.status) {
            layer.msg(response.message);
          }
        }
      });
    });
    var notice = {
      box:'.noticeBox',
      createNotice:'.create_notice',
      close:'.close-link',
      createForm:'#createBox',
      middleBox:'.middle-box',
      createButton:'.createButton',
    };
    /**
     * 添加菜单
     */
    $(notice.box).on('click',notice.createMenu,function () {
      $.ajax({
        url:'/admin/notice/create',
        dataType:'html',
        success:function (htmlData) {
          $(notice.middleBox).removeClass('fadeInRightBig').addClass('bounceOut').hide();
          $(notice.box).append(htmlData);
        }
      });
    });

    $(notice.box).on('click',notice.close,function () {
      $('.formBox').removeClass('bounceIn').addClass('bounceOut').remove();
      $(notice.middleBox).removeClass('bounceOut').addClass('bounceIn').show();
    });

    $('.tooltips').tooltip();
    /**
     * 添加菜单
     */
    $(notice.box).on('click','.createButton',function () {
      var l = $(this).ladda();
      var _item = $(this);
      var _form = $('#createForm');
      $.ajax({
        url:'/admin/notice',
        type:'post',
        dataType: 'json',
        data:_form.serializeArray(),
        headers : {
          'X-CSRF-TOKEN': $("input[name='_token']").val()
        },
        beforeSend : function(){
          l.ladda( 'start' );
          _item.attr('disabled','true');
        },
        success:function (response) {
          layer.msg(response.message);
          setTimeout(function(){
            window.location.href = '/admin/notice';
          }, 1000);
        }
      }).fail(function(response) {
        if(response.status == 422){
          var data = $.parseJSON(response.responseText);
          var layerStr = "";
          for(var i in data){
            layerStr += "<div>"+data[i]+"</div>";
          }
          layer.msg(layerStr);
        }
      }).always(function () {
        l.ladda('stop');
        _item.removeAttr('disabled');
      });;
    });
    /**
     * 修改菜单表单
     */
    $('#nestable').on('click','.editMenu',function () {
      var _item = $(this);
      $.ajax({
        url:_item.attr('data-href'),
        dataType:'html',
        success:function (htmlData) {
          var box = $(notice.middleBox);
          if (box.is(':visible')) {
            $(notice.middleBox).removeClass('fadeInRightBig').addClass('bounceOut').hide();
          }else{
            var _createForm = $('.formBox');
            // 创建表单存在的情况下
            if (_createForm.length > 0) {
              _createForm.removeClass('bounceIn').addClass('bounceOut').remove();
            }
          }
          $(notice.box).append(htmlData);
        }
      });
    });
    /**
     * 修改菜单数据
     */
    $(notice.box).on('click','.editButton',function () {
      var l = $(this).ladda();
      var _item = $(this);
      var _form = $('#editForm');

      $.ajax({
        url:_form.attr('action'),
        type:'post',
        dataType: 'json',
        data:_form.serializeArray(),
        headers : {
          'X-CSRF-TOKEN': $("input[name='_token']").val()
        },
        beforeSend : function(){
          l.ladda( 'start' );
          _item.attr('disabled','true');
        },
        success:function (response) {
          layer.msg(response.message);
          setTimeout(function(){
            window.location.href = '/admin/notice';
          }, 1000);
        }
      }).fail(function(response) {
        if(response.status == 422){
          var data = $.parseJSON(response.responseText);
          var layerStr = "";
          for(var i in data){
            layerStr += "<div>"+data[i]+"</div>";
          }
          layer.msg(layerStr);
        }
      }).always(function () {
        l.ladda('stop');
        _item.removeAttr('disabled');
      });;
    });
    /**
     * 查看菜单详细信息
     */
    $('#nestable').on('click','.showInfo',function () {
      var _item = $(this);
      $.ajax({
        url:_item.attr('data-href'),
        dataType:'html',
        success:function (htmlData) {
          var box = $(notice.middleBox);
          if (box.is(':visible')) {
            $(notice.middleBox).removeClass('fadeInRightBig').addClass('bounceOut').hide();
          }else{
            var _createForm = $('.formBox');
            // 创建表单存在的情况下
            if (_createForm.length > 0) {
              _createForm.removeClass('bounceIn').addClass('bounceOut').remove();
            }
          }
          $(notice.box).append(htmlData);
        }
      });
    });
  };

  return {
    init : noticeInit
  }
}();
$(function () {
  NoticeList.init();
});
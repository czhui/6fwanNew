function getBaseUrl() {
    var currentUrl = window.location.toString().split('/');
    var baseUrl = currentUrl[0];
    for (i = 1; i < currentUrl.length - 2; ++i) {
        baseUrl += '/' + currentUrl[i];
    }
    return baseUrl;
}
var TableDatatablesAjax = function() {
  var datatableAjax = function(){
    dt = $('.dataTablesAjax');
		ajax_datatable = dt.DataTable({
			"processing": true,
      "serverSide": true,
      "searching" : true,
      "searchDelay": 800,
      "search": {
        "regex": true
      },
      "ajax": {
        'url' : getBaseUrl() + '/admin/wxuser/ajaxIndex',
      },
      "pagingType": "full_numbers",
      "orderCellsTop": true,
      "dom" : '<"html5buttons"B>lTfgitp',
      "buttons": [
      ],
      "columns": [
        {
        	"data": "userid",
        	"name" : "userid",
          "orderable" : false,
      	},
        {
        	"data": "nickname",
        	"name" : "nickname",
        	"orderable" : false,
        },
        {
        	"data": "headimgurl",
        	"name": "headimgurl",
        	"orderable" : false,
          "render": function(data, type, row) {  
              if(data!=null){
                status = "<img src='"+data+"' width='80px'>";  
                return status;  
              }  
              return null;  
          } 
        },
        {
          "data": "money",
          "name": "money",
          "orderable" : false,
        },
        {
        	"data": "created_at",
        	"name": "created_at",
        	"orderable" : true,
        },
        {
        	"data": "updated_at",
        	"name": "updated_at",
        	"orderable" : true,
        },
        {
          "data": "status",
          "name": "status",
          "orderable" : false,
          "render": function(data, type, row) {  
              if(data!=null){
                if(data == 'normal'){
                  cla = "label-primary";
                }else{
                  cla = "label-danger";
                }
                status = "<span class='label "+cla+"'>"+row.statu+"</span>";  
                return status;  
              }  
              return null;  
          }  
        },
        {
          "data": "actionButton",
          "name": "actionButton",
          "type": "html",
          "orderable" : false,
        },
    	],
      "drawCallback": function( settings ) {
        ajax_datatable.$('.tooltips').tooltip( {
          placement : 'top',
          html : true
        });
      },
      "language": {
        url: getBaseUrl() + '/admin/i18n'
      }
    });
  };
	return {
		init : datatableAjax
	}
}();
$(function () {
  TableDatatablesAjax.init();
});

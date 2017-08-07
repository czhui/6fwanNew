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
        'url' : getBaseUrl() + '/admin/servers/ajaxIndex',
      },
      "pagingType": "full_numbers",
      "orderCellsTop": true,
      "dom" : '<"html5buttons"B>lTfgitp',
      "buttons": [
        {extend: 'copy',title: 'servers'},
        {extend: 'csv',title: 'servers'},
        {extend: 'excel', title: 'servers'},
        {extend: 'pdf', title: 'servers'},
        {extend: 'print',
         customize: function (win){
            $(win.document.body).addClass('white-bg');
            $(win.document.body).css('font-size', '10px');
            $(win.document.body).find('table')
                    .addClass('compact')
                    .css('font-size', 'inherit');
          }
        }
      ],
      "columns": [
        {
        	"data": "id",
        	"name" : "id",
      	},
        {
        	"data": "name",
        	"name" : "name",
        	"orderable" : false,
        },
        {
        	"data": "config",
        	"name": "config",
        	"orderable" : false,
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

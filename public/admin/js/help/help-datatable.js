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
        'url' : getBaseUrl() + '/admin/help/ajaxIndex',
      },
      "pagingType": "full_numbers",
      "orderCellsTop": true,
      "dom" : '<"html5buttons"B>lTfgitp',
      "buttons": [
        
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
        	"data": "contents",
        	"name": "contents",
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

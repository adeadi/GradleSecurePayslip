<style>
	table.dataTable tr.odd { background-color: #F5F5F5; }
	table.dataTable tr.even { background-color: white; }
	.datatable-ajax{font-size: 10px !important}
	.dtable th  {
        background-color: #169867 !important;
        color:white !important;
        font-size:12px !important;
        padding-right: 0px !important;

    }
   	   .dataTable thead .sorting:before{color: #737171 !important;}
       .dataTable thead .sorting:after{color: #737171 !important;}
       .table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
       		padding:0px 20px 0px 20px !important;
       }
</style>
<div class="panel panel-flat">
	<!-- DataTables -->
	<table class="table dtable datatable-ajax">
		<thead>
			<tr>
				<th>ID</th>
                <th>Staff ID</th>
                <th>Staff Name</th>
                <th>Year</th>
                <th>Action</th>
            </tr>
		</thead>
	</table>

<!-- /DataTable -->
</div>

<script type="text/javascript">
	$(document).ready(function() {

		// Override defaults
	    // ------------------------------

	    // Setting datatable defaults
	    $.extend( $.fn.dataTable.defaults, {
	        autoWidth: false,
	        columnDefs: [{ 
	            orderable: false,
	            width: '100px',
	            targets: [ 4 ]
	        }],
	        dom: '<"datatable-header"fTl><"datatable-scroll"t><"datatable-footer"ip>',
	        language: {
	            search: '<span>Filter:</span> _INPUT_',
	            lengthMenu: '<span>Show:</span> _MENU_',
	            paginate: { 'first': 'First', 'last': 'Last', 'next': '&rarr;', 'previous': '&larr;' }
	        },
	        drawCallback: function () {
	            $(this).find('tbody tr').slice(-3).find('.dropdown, .btn-group').addClass('dropup');
	        },
	        preDrawCallback: function() {
	            $(this).find('tbody tr').slice(-3).find('.dropdown, .btn-group').removeClass('dropup');
	        }
	    });


	    // Define default path for DataTables SWF file
	    $.fn.dataTable.TableTools.defaults.sSwfPath = "assets/swf/datatables/copy_csv_xls_pdf.swf"


	    // Tabletools defaults
	    $.extend(true, $.fn.DataTable.TableTools.classes, {
	        "container" : "btn-group DTTT_container", // buttons container
	        "buttons" : {
	            "normal" : "btn btn-default", // default button classes
	            "disabled" : "disabled" // disabled button classes
	        },
	        "collection" : {
	            "container" : "dropdown-menu" // collection container to take dropdown menu styling
	        },
	        "select" : {
	            "row" : "success" // selected row class
	        }
	    });


	    // Collection dropdown defaults
	    $.extend(true, $.fn.DataTable.TableTools.DEFAULTS.oTags, {
	        collection: {
	            container: "ul",
	            button: "li",
	            liner: "a"
	        }
	    });

	    var actions='<button type="button" class="btn btn-primary download btn-icon btn-rounded" data-popup="tooltip" title="download"><i class="icon-download"></i></button> <span style="padding: 10px"/>';
	    var user = "<?php echo $user['role_id']; ?>";
	    if(user == "1"){
	    	actions = actions + '<button type="button" class="btn btn-danger delete btn-icon btn-rounded" data-popup="tooltip" title="delete"><i class="icon-trash"></i></button>';
	    }
	    //$('table.datatable-ajax').DataTable();
	    var table1= $('table.datatable-ajax').DataTable({
	       // ajax: 'assets/demo_data/tables/datatable_ajax.json'
	       "processing": true,
	       "order": [[ 3, "desc" ]],
	       "sAjaxSource": 'eaform_listdb',
	       "bProcessing": true,
	       "aoColumns": [{"mDataProp": "id","visible":false}, {"mDataProp": "userid"},{"mDataProp": "name"},{"mDataProp": "created"},{"targets": -1,"data": null,"defaultContent": actions ,"width": "250px"}],
	       fnRowCallback: function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                			if($(nRow).find('td:eq(7)').text() == 'ACTIVE')
								{
									$(nRow).find('td:eq(8) .activate.btn-rounded').remove();
									$(nRow).find('td:eq(8) .resume.btn-rounded').remove();
									
								}
								else if ($(nRow).find('td:eq(7)').text() == 'INACTIVE')
								{		
										$(nRow).find('td:eq(8) .resume.btn-rounded').remove();
										$(nRow).find('td:eq(8) .deactive.btn-rounded').remove();
								}
								else if ($(nRow).find('td:eq(7)').text() == 'SUSPENDED')
								{
										$(nRow).find('td:eq(8) .deactive.btn-rounded').remove();
										$(nRow).find('td:eq(8) .activate.btn-rounded').remove();
								}
            }
	    });
		
		$("body").delegate(".download","click",function(){
				//alert(1);
				var id = table1.row($(this).parent().parent()).data().id;
				//alert(id);
				$.ajax({
					url: 'getHtml',
					type: 'POST',
					data: "source=eaform&id="+id,
					success:function(response){

						window.location.href = 'getPDF?id='+id;
					}
				})
			});

		$("body").delegate(".delete","click",function(){
				// alert(1);
				var id = table1.row($(this).parent().parent().parent()).data().id;
				showDeleteConfirm(id);
				// alert(id);
				
			});

	})

// Alert combination
function showDeleteConfirm(id){
	swal({
			title: "Are you sure want to delete this EA Form?",
			text: "You will not be able to recover this EA Form!",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#EF5350",
			confirmButtonText: "Yes, delete it!",
			cancelButtonText: "Cancel!",
			closeOnConfirm: false,
			closeOnCancel: false
		},
		function(isConfirm){
			if (isConfirm) {
				$.ajax({
					url: 'deleteEAForm',
					type: 'POST',
					data: "id="+id,
					success:function(response){
						swal({
							title: "Deleted!",
							text: "EA Form has been deleted.",
							confirmButtonColor: "#66BB6A",
							type: "success"
						}, 
						function(isConfirm){
							if(isConfirm){
								window.location.href = "<?php echo site_url('../POC/eaform_listing/'); ?>"
							}
						});
					}
				})
			}
			else {
				swal({
					title: "Cancelled",
					text: "Delete cancelled :)",
					confirmButtonColor: "#2196F3",
					type: "error"
				});
			}
		});
};

</script>
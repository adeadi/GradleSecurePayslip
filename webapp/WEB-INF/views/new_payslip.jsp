<style>
    
	#loadingDiv{
		
		 position: relative;
		 text-align:center;
		 top:100px;
	}
	.ajax-loader {
		  position: static;
		  left: 0;
		  top: 0;
		  right: 0;
		  bottom: 0;
		  margin: auto; /* presto! */
		}
</style>
<div class="panel panel-flat" style="height: 500px !important;">
			<div class="panel-body">
				<form class="form-horizontal" id="data" enctype="multipart/form-data">
					<div class="row">
						<div class="col-sm-2">
							<div class="form-group">
								<label class="control-label text-semibold">Select Month of Payslip:</label>
								<input name="dates" id="dates" type="month" class="form-control" required="required" placeholder="Place a month. ex. 06-2016">
								<span class="help-block"><i class="icon-info22"></i>   Payslip is only kept within 24 months.</span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-10">
							<div class="form-group">
								<label class="control-label text-semibold">File Upload:</label>
								<input id="slipfile" name="slipfile" class="file-input" type="file" data-preview-file-type="true" required="required">		
							</div>
						</div>
					</div>
				</form>
			</div>
	<div id="loadingDiv" style="display:none">
		  <p><img src="img/loading.gif" class="ajax-loader" /> Please Wait ...</p>
	</div>		
	<div class="alert alert-success" role="alert" style="display:none">
		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<div id="msg"><strong>Well done!</strong> Slip file successfully uploaded. </div>
	 </div>
 </div>
<script type="text/javascript">
$( document ).ready(function() {
	//
		$("body").delegate(".kv-fileinput-upload","click",function(){
			//alert(1);

			$("#loadingDiv").show();
					
		})
		$("form#data").submit(function(){
					var formData = new FormData(this);
					var ext = $('#slipfile').val().split('.').pop().toLowerCase();
						if($.inArray(ext, ['zip','txt']) == -1) {
							alert('Invalid extension,only accept zip extentions');
						}
						else
						{
							
			                   $.ajax({
								url: 'uploadslip',
								type: 'POST',
								data: formData,
								async: false,
								success: function (data) {
									//$("small#contact").html(data);
									$("#loadingDiv").hide();
									$(".alert").show();
									setTimeout(function(){ 
									$(".alert").hide();
									window.location="<?php echo site_url('POC/list_payslip'); ?>";
								}, 3000);	
								},
								cache: false,
								contentType: false,
								processData: false
							});
						
						}
					return false;
				
				});
	});
</script>
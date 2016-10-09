<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								<label class="control-label text-semibold">Enter Year of EA Form:</label>
								<input name="dates" id="dates" type="text" class="form-control" data-mask="9999" required="required" placeholder="Place a year. ex. 2016">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-10">
							<div class="form-group">
								<label class="control-label text-semibold">File Upload:</label>
								<input id="eaformFile" name="eaformFile" class="file-input" type="file" data-preview-file-type="true" required="required">		
							</div>
						</div>
					</div>
				</form>
			</div>
	<div id="loadingDiv" style="display:none">
		  <p><img src="<c:url value="/resources/images/loading.gif"/>" class="ajax-loader" /> Please Wait ...</p>
	</div>		
	<div class="alert alert-success" role="alert" style="display:none">
		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<div id="msg"><strong>Well done!</strong> EA Form successfully uploaded. </div>
	 </div>
 </div>
 
<script type="text/javascript">
var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
var csrfHeader = $("meta[name='_csrf_header']").attr("content");
var csrfToken = $("meta[name='_csrf']").attr("content");

$( document ).ready(function() {
	//
		$("body").delegate(".kv-fileinput-upload","click",function(){
			$("#loadingDiv").show();
		})

		$("form#data").submit(function(){
					var formData = new FormData(this);
					formData[csrfParameter] = csrfToken;
					var ext = $('#eaformFile').val().split('.').pop().toLowerCase();
						if($.inArray(ext, ['zip','txt']) == -1) {
							alert('Invalid extension,only accept zip extentions');
						}
						else
						{
			                   $.ajax({
								url: '<c:url value="/upload_eaform"/>',
								type: 'POST',
								data: formData,
								async: false,
								success: function (data) {
									$("#loadingDiv").hide();
									$(".alert").show();
									setTimeout(function(){ 
									$(".alert").hide();
									window.location='<c:url value="/eaform_list"/>';
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
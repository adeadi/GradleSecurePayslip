<%@ include file="/WEB-INF/includes/declare-taglibs.jspf"%>
<div class="panel panel-flat">
	<div class="panel-heading">
		<h5 class="panel-title">Staff list</h5>
		<div class="heading-elements">
			<ul class="icons-list">
				<li><a data-action="collapse"></a></li>
				<li><a data-action="reload"></a></li>
			</ul>
		</div>
	</div>

	<div class="panel-body">
		<c:if test="${not empty successMessage}">
			<div class="alert bg-success alert-styled-left">
				<button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>
				<span class="text-semibold">${successMessage}</span>
			</div>
		</c:if>
		<c:if test="${not empty errorMessage}">
			<div class="alert bg-danger alert-styled-left">
				<button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>
				<span class="text-semibold">${errorMessage}</span>
			</div>
		</c:if>
		<ul class="media-list">
			<c:forEach items="${users}" var="user" varStatus="loop">
				<li id="<c:out value ="${loop.index}"/>" class="media">
					<div class="media-left media-middle">
						<a href="#">
							<img src="<c:url value="/resources/images/placeholder.jpg"/>" class="img-circle" alt="">
						</a>
					</div>
					<div class="media-body">
						<div id="staffName" class="media-heading text-semibold"><c:out value ="${user.name}"/></div>
						<span class="text-muted"><c:out value ="${user.jobTitle}"/></span>
					</div>
					<div class="media-right media-middle">
						<ul id="actionList" class="icons-list icons-list-extended text-nowrap">
							<li><a href="#" data-toggle="modal" data-target="#edit_user" 
							   data-id="<c:out value ="${user.id}"/>" 
							   data-name="<c:out value ="${user.name}"/>"
							   data-job_title="<c:out value ="${user.jobTitle}"/>"
							   data-ic_no="<c:out value ="${user.icNo}"/>"
							   data-dept="<c:out value ="${user.dept}"/>"
							   data-address1="<c:out value ="${user.address1}"/>"
							   data-address2="<c:out value ="${user.address2}"/>"
							   data-address3="<c:out value ="${user.address3}"/>"
							   data-email="<c:out value ="${user.email}"/>">
								<i class="icon-wrench"></i>
							</a>
						</li>
							<li><a href="javascript:showDeleteConfirm('<c:out value ="${user.id}"/>');" name="delete_warning"><i class="icon-cross2"></i></a></li>
						</ul>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<!-- Primary modal -->
	<div id="edit_user" class="modal fade">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-primary">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h6 class="modal-title">STAFF</h6>
				</div>

				<div class="modal-body">
					<spring:url value="/update_user" var="updateUserUrl" />
					<form:form method="POST" modelAttribute="user" class="form-horizontal form-validate-jquery"  action="${updateUserUrl}">
						<fieldset class="content-group">
							<legend class="text-semibold">
								<i class="icon-file-text2 position-left"></i>
								Update staff information
							</legend>
							<!-- Basic text input -->
							<div class="form-group">
								<label class="control-label col-lg-3">Staff ID: <span class="text-danger">*</span></label>
								<div class="col-lg-9">
									<form:input type="text" path="id" id="id" name="id" class="form-control" readonly="true" required="required" placeholder="Please enter staff ID No" />
									<div class="has-error">
				                        <form:errors path="id" class="help-inline"/>
				                    </div>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Staff name: <span class="text-danger">*</span></label>
								<div class="col-lg-9">
									<form:input type="text" path="name" id="name" name="name" class="form-control" required="required" placeholder="Please enter staff name" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">IC/Passport: <span class="text-danger">*</span></label>
								<div class="col-lg-9">
									<form:input type="text" path="icNo" id="icNo" name="icNo" class="form-control" required="required" placeholder="Please enter IC/Passport No." />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Department: <span class="text-danger">*</span></label>
								<div class="col-lg-9">
									<form:input type="text" path="dept" id="dept" name="dept" class="form-control" required="required" placeholder="Please enter staff department" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Job Title: <span class="text-danger">*</span></label>
								<div class="col-lg-9">
									<form:input type="text" path="jobTitle" id="jobTitle" name="jobTitle" class="form-control" required="required" placeholder="Please enter staff job title" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Address 1: <span class="text-danger">*</span></label>
								<div class="col-lg-9">
									<form:input type="text" path="address1" id="address1" name="address1" class="form-control" required="required" placeholder="Please enter staff address" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Address 2: </label>
								<div class="col-lg-9">
									<form:input type="text" path="address2" id="address2" name="address2" class="form-control" placeholder="Please enter staff address" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-3">Address 3: </label>
								<div class="col-lg-9">
									<form:input type="text" path="address3" id="address3" name="address3" class="form-control" placeholder="Please enter staff address" />
								</div>
							</div>
							<!-- /basic text input -->
							
							
							<!-- Email field -->
							<div class="form-group">
								<label class="control-label col-lg-3">Email: <span class="text-danger">*</span></label>
								<div class="col-lg-9">
									<form:input type="email" path="email" id= "email" name="email" class="form-control" required="required" placeholder="Enter a valid email address" />
								</div>
							</div>
							<!-- /email field -->
			
							
							<!-- Password field -->
							<div class="form-group">
								<label class="control-label col-lg-3">Password <span class="text-danger">*</span></label>
								<div class="col-lg-9">
									<form:input type="password" path="password" id="password" name="password" class="form-control" required="required" placeholder="Minimum 5 characters allowed" />
								</div>
							</div>
							<!-- /password field -->

							<!-- Repeat password -->
							<div class="form-group">
								<label class="control-label col-lg-3">Repeat password </label>
								<div class="col-lg-9">
									<input type="password" name="repeat_password" class="form-control" placeholder="Repeat password">
								</div>
							</div>
							<!-- /repeat password -->

						</fieldset>
						<div class="text-right">
							<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Save changes</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- /primary modal -->
</div>

<script type="text/javascript">
var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
var csrfHeader = $("meta[name='_csrf_header']").attr("content");
var csrfToken = $("meta[name='_csrf']").attr("content");

	
$('#edit_user').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var modal = $(this)
  modal.find('#id').val(button.data('id'))
  modal.find('#name').val(button.data('name'))
  modal.find('#icNo').val(button.data('ic_no'))
  modal.find('#dept').val(button.data('dept'))
  modal.find('#jobTitle').val(button.data('job_title'))
  modal.find('#address1').val(button.data('address1'))
  modal.find('#address2').val(button.data('address2'))
  modal.find('#address3').val(button.data('address3'))
  modal.find('#email').val(button.data('email'))
})

// Alert combination
function showDeleteConfirm(userId){
	swal({
			title: "Are you sure want to delete this user?",
			text: "You will not be able to recover this user!",
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
				var data = {};
				data[csrfParameter] = csrfToken;
				data["id"] = userId;
				$.ajax({
					url: '<c:url value="/delete_user"/>',
					type: 'POST',
					data: data,
					success:function(response){
						swal({
							title: "Deleted!",
							text: "User has been deleted.",
							confirmButtonColor: "#66BB6A",
							type: "success"
						}, 
						function(isConfirm){
							if(isConfirm){
								window.location.href = '<c:url value="/manage_user_request"/>'
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
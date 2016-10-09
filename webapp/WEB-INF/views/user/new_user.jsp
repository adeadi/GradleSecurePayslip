<%@ include file="/WEB-INF/includes/declare-taglibs.jspf"%>
<body>
	<div class="panel panel-flat">
		<div class="panel-heading">
			<h5 class="panel-title">Add New User</h5>
			<div class="heading-elements">
				<ul class="icons-list">
					<li><a data-action="collapse"></a></li>
					<li><a data-action="reload"></a></li>
				</ul>
			</div>
		</div>

		<div class="panel-body">
			<spring:url value="/add_user" var="addUserUrl" />
			<form:form method="POST" modelAttribute="user"
				class="form-horizontal" action="${addUserUrl}">
				<fieldset class="content-group">
					<legend class="text-semibold">
						<i class="icon-file-text2 position-left"></i> Enter staff
						information
					</legend>
					<c:if test="${not empty successMessage}">
						<div class="alert bg-success alert-styled-left">
							<button type="button" class="close" data-dismiss="alert">
								<span>&times;</span><span class="sr-only">Close</span>
							</button>
							<span class="text-semibold">${successMessage}</span>
						</div>
					</c:if>
					<c:if test="${not empty errorMessage}">
						<div class="alert bg-danger alert-styled-left">
							<button type="button" class="close" data-dismiss="alert">
								<span>&times;</span><span class="sr-only">Close</span>
							</button>
							<span class="text-semibold">${errorMessage}</span>
						</div>
					</c:if>
					<!-- Basic text input -->
					<div class="form-group">
						<label class="control-label col-lg-3">Staff ID: <span
							class="text-danger">*</span></label>
						<div class="col-lg-9">
							<form:input type="text" path="id" id="id" name="id"
								class="form-control" required="required"
								placeholder="Please enter staff ID No" />
							<div class="has-error">
								<form:errors path="id" class="help-inline" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3">Staff name: <span
							class="text-danger">*</span></label>
						<div class="col-lg-9">
							<form:input type="text" path="name" id="name" name="name"
								class="form-control" required="required"
								placeholder="Please enter staff name" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3">IC/Passport: <span
							class="text-danger">*</span></label>
						<div class="col-lg-9">
							<form:input type="text" path="icNo" id="icNo" name="icNo"
								class="form-control" required="required"
								placeholder="Please enter IC/Passport No." />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3">Department: <span
							class="text-danger">*</span></label>
						<div class="col-lg-9">
							<form:input type="text" path="dept" id="dept" name="dept"
								class="form-control" required="required"
								placeholder="Please enter staff department" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3">Job Title: <span
							class="text-danger">*</span></label>
						<div class="col-lg-9">
							<form:input type="text" path="jobTitle" id="jobTitle"
								name="jobTitle" class="form-control" required="required"
								placeholder="Please enter staff job title" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3">Address 1: <span
							class="text-danger">*</span></label>
						<div class="col-lg-9">
							<form:input type="text" path="address1" id="address1"
								name="address1" class="form-control" required="required"
								placeholder="Please enter staff address" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3">Address 2: </label>
						<div class="col-lg-9">
							<form:input type="text" path="address2" id="address2"
								name="address2" class="form-control"
								placeholder="Please enter staff address" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-lg-3">Address 3: </label>
						<div class="col-lg-9">
							<form:input type="text" path="address3" id="address3"
								name="address3" class="form-control"
								placeholder="Please enter staff address" />
						</div>
					</div>
					<!-- /basic text input -->


					<!-- Email field -->
					<div class="form-group">
						<label class="control-label col-lg-3">Email: <span
							class="text-danger">*</span></label>
						<div class="col-lg-9">
							<form:input type="email" path="email" id="email" name="email"
								class="form-control" required="required"
								placeholder="Enter a valid email address" />
						</div>
					</div>
					<!-- /email field -->


					<!-- Password field -->
					<div class="form-group">
						<label class="control-label col-lg-3">Password <span
							class="text-danger">*</span></label>
						<div class="col-lg-9">
							<form:input type="password" path="password" id="password"
								name="password" class="form-control" required="required"
								placeholder="Minimum 5 characters allowed" />
						</div>
					</div>
					<!-- /password field -->


					<!-- Repeat password -->
					<!-- <div class="form-group">
					<label class="control-label col-lg-3">Repeat password <span class="text-danger">*</span></label>
					<div class="col-lg-9">
						<input type="password" name="repeat_password" class="form-control" required="required" placeholder="Repeat password">
					</div>
				</div> -->
					<!-- /repeat password -->


					<div class="text-right">
						<button type="reset" class="btn btn-default" id="reset">
							Reset <i class="icon-reload-alt position-right"></i>
						</button>
						<button type="submit" class="btn btn-primary">
							Submit <i class="icon-arrow-right14 position-right"></i>
						</button>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
</body>

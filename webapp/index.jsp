<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Limitless - Responsive Web Application Kit by Eugene Kopyov</title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/css/icons/icomoon/styles.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/core.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/components.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/colors.css" />" rel="stylesheet">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	
    <script src="<c:url value="/resources/js/plugins/loaders/pace.min.js" />"></script>
    <script src="<c:url value="/resources/js/core/libraries/jquery.min.js" />"></script>
    <script src="<c:url value="/resources/js/core/libraries/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/plugins/loaders/blockui.min.js" />"></script>
	<!-- /core JS files -->


	<!-- Theme JS files -->
    <script src="<c:url value="/resources/js/core/app.js" />"></script>
	<!-- /theme JS files -->

</head>

<body class="login-container login-cover">

	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Content area -->
				<div class="content pb-20">

					<!-- Tabbed form -->
					<form method="post" action="<c:url value="/login"/>">
						<div class="panel panel-body login-form">
							<div class="tab-content panel-body">
								<div class="tab-pane fade in active" id="basic-tab1">
									<div>
										<div class="text-center">
											<div class="icon-object border-slate-300 text-slate-300"><img src="<c:url value="/resources/images/MREPC_logo.png"/>" style="width:150px;height:70px"/></div>
											<h5 class="content-group">Login to your account <small class="display-block">Your credentials</small></h5>
										</div>
										<c:if test="${param.logout != null}">
											<div class="alert bg-success">
												<button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>
												<span class="text-semibold">Successfully logged out!</span>
											</div>
										</c:if>
										<c:if test="${not empty errorMessage}">
											<div class="alert bg-danger">
												<button type="button" class="close" data-dismiss="alert"><span>&times;</span><span class="sr-only">Close</span></button>
												<span class="text-semibold">${errorMessage}</span>
											</div>
										</c:if>
										<div class="form-group has-feedback has-feedback-left">
											<input type="text" class="form-control" placeholder="Username" id="id" name="id" required="required">
											<div class="form-control-feedback">
												<i class="icon-user text-muted"></i>
											</div>
										</div>

										<div class="form-group has-feedback has-feedback-left">
											<input type="password" class="form-control" placeholder="Password" id="password" name="password" required="required">
											<div class="form-control-feedback">
												<i class="icon-lock2 text-muted"></i>
											</div>
										</div>
										<div class="form-group login-options">
											<div class="row">
												<div class="col-sm-6">
													<label class="checkbox-inline">
														<input type="checkbox" class="styled" checked="checked">
														Remember
													</label>
												</div>

												<div class="col-sm-6 text-right">
													<a href="login_password_recover.html">Forgot password?</a>
												</div>
											</div>
										</div>
										
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										
										<div class="form-group">
											<button type="submit" id="login" class="btn bg-blue btn-block">Login <i class="icon-arrow-right14 position-right"></i></button>
										</div>
									</div>

									<div class="content-divider text-muted form-group"></div>

									<span class="help-block text-center no-margin">By continuing, you're confirming that you've read our <a href="#">Terms &amp; Conditions</a> and <a href="#">Cookie Policy</a></span>
								</div>
							</div>
						</div>
					</form>
					<!-- /tabbed form -->

				</div>
				<!-- /content area -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>
	<!-- /page container -->
</body>

</html>

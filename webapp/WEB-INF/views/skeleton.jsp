<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<!-- META SECTION -->
    <title>Payslip</title>            
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<%--     <meta name="_csrf" content="${_csrf.token}"/> --%>
<!--     default header name is X-CSRF-TOKEN -->
<%--     <meta name="_csrf_header" content="${_csrf.headerName}"/> --%>
	<sec:csrfMetaTags />
    
	<link rel="icon" href="images/maxis.ico" type="image/x-icon"/>
	
     <!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/css/icons/icomoon/styles.css"/>" rel="stylesheet">
	<link href="<c:url value="/resources/css/icons/glyphicons/glyphicons-halflings-regular.woff"/>" type="application/octet-stream">
	<link href="<c:url value="/resources/css/icons/glyphicons/glyphicons-halflings-regular.woff2"/>" type="application/octet-stream">
	<link href="<c:url value="/resources/css/icons/glyphicons/glyphicons-halflings-regular.ttf"/>" type="application/octet-stream">
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/core.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/components.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/colors.css" />" rel="stylesheet">
	<!-- /global stylesheets -->
	
	<!-- Core JS files -->
	<script data-pace-options='{"ajax": false}' src="<c:url value="/resources/js/plugins/loaders/pace.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/loaders/pace.min.js"/>"></script>
	<script src="<c:url value="/resources/js/core/libraries/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/core/libraries/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/styling/uniform.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/loaders/blockui.min.js"/>"></script>
	<!-- /core JS files -->  
	
	<!-- Theme JS files -->
	<script src="<c:url value="/resources/js/plugins/forms/validation/validate.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/selects/bootstrap_multiselect.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/inputs/touchspin.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/selects/select2.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/styling/switch.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/styling/switchery.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/styling/uniform.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/inputs/typeahead/handlebars.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/inputs/alpaca/alpaca.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/inputs/typeahead/typeahead.bundle.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/ui/prism.min.js"/>"></script>
	
	<script src="<c:url value="/resources/js/plugins/notifications/bootbox.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/notifications/sweet_alert.min.js"/>"></script>
	<script src="<c:url value="/resources/js/pages/components_modals.js"/>"></script>
	
	
	<script src="<c:url value="/resources/js/core/libraries/jquery_ui/interactions.min.js"/>"></script>
	<script src="<c:url value="/resources/js/core/libraries/jquery_ui/widgets.min.js"/>"></script>
	<script src="<c:url value="/resources/js/core/libraries/jquery_ui/effects.min.js"/>"></script>
	<script src="<c:url value="/resources/js/core/libraries/jasny_bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/extensions/mousewheel.min.js"/>"></script>
	<script src="<c:url value="/resources/js/core/libraries/jquery_ui/globalize/globalize.js"/>"></script>
	
	<script src="<c:url value="/resources/js/plugins/tables/datatables/datatables.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/tables/datatables/extensions/tools.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/uploaders/fileinput.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/inputs/autosize.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/inputs/formatter.min.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/inputs/passy.js"/>"></script>
	<script src="<c:url value="/resources/js/plugins/forms/inputs/maxlength.min.js"/>"></script>
	<script src="<c:url value="/resources/js/pages/uploader_bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/core/app.js"/>"></script>
	<script src="<c:url value="/resources/js/pages/form_validation.js"/>"></script>
	<script src="<c:url value="/resources/js/pages/jqueryui_forms.js"/>"></script>
	<script src="<c:url value="/resources/js/pages/alpaca_basic.js"/>"></script>
	<script src="<c:url value="/resources/js/pages/form_controls_extended.js"/>"></script>
	
	<script src="<c:url value="/resources/js/lib/js.cookie.js"/>"></script>
</head>
<body>
<!-- START PAGE CONTAINER -->
	<%@ include file="navbar.jsp" %>

	<div class="page-container">

		<div class="page-content">
			<%@ include file="sidebar.jsp" %>
			
			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap">
				<jsp:include page="${mainPage}" flush="true" />
			</div>
			<!-- END PAGE CONTENT WRAPPER -->
		</div>
		<!-- END PAGE CONTENT -->
	</div>
	<!-- END PAGE CONTAINER -->

</body>
</html>
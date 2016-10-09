<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Main sidebar -->
<div class="sidebar sidebar-main sidebar-default">
	<div class="sidebar-content">

		<!-- Main navigation -->
		<div class="sidebar-category sidebar-category-visible">
			<div class="category-title h6">
				<span>Main navigation</span>
				<ul class="icons-list">
					<li><a href="#" data-action="collapse"></a></li>
				</ul>
			</div>
			<div class="category-content sidebar-user">
				<div class="media">
					<a href="#" class="media-left">
						<img src="<c:url value="/resources/images/image.png"/>" class="img-circle img-sm" alt="">
					</a>
					<div class="media-body">
						<span class="media-heading text-semibold">${loginSession.user}</span>
						<div class="text-size-mini text-muted">
							<i class="icon-pin text-size-small"></i> &nbsp;Kuala Lumpur, MY
						</div>
					</div>
				</div>
			</div>
			<div class="category-content no-padding">
				<ul class="navigation navigation-main navigation-accordion">

					<!-- Main -->
					<li class="navigation-header">
						<span>Main</span>
						<i class="icon-menu" title="Main pages"></i>
					</li>
					<c:forEach items="${loginSession.parentMenu}" var="parentMenu" varStatus="loop">
						<li>
							<a href="<c:url value="${parentMenu.url}"/>" class="has-ul"><i class="<c:out value ="${parentMenu.icon}"/>"></i> <span><c:out value="${parentMenu.name}"/></span></a>
							<ul class="hidden-ul">
								<c:forEach items="${loginSession.subMenu}" var="subMenu">
									<c:if test="${subMenu.parentId == parentMenu.id}">
										<li><a href="<c:url value="${subMenu.url}"/>"><i class="<c:out value ="${subMenu.icon}"/>"></i> <span><c:out value="${subMenu.name}"/></span></a></li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
					<!-- /main -->

				</ul>
			</div>
		</div>
		<!-- /main navigation -->

	</div>

</div>
<!-- /main sidebar -->

<script type="text/javascript">
	$(document).ready(function(){

		$("body").delegate("li.monthslip","click",function(){
			var monthname = $(this).attr('mth');
			window.location.href = 'filter_payslip?m='+monthname;
			//console.log(monthname);
		})
	})
</script>
<!-- Main navbar -->
<div class="navbar navbar-inverse navbar-lg">
	<div class="navbar-header">
		<a class="navbar-brand" href="#"><img src="<c:url value="/resources/images/MREPC_logo.png"/>" style="width: 200px !important; height: 26px !important" alt=""></a>
		<ul class="nav navbar-nav pull-right visible-xs-block">
			<li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
			<li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
		</ul>
	</div>

	<div class="navbar-collapse collapse" id="navbar-mobile">
		<ul class="nav navbar-nav">
			<li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a></li>
		</ul>
		
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown dropdown-user">
				<a class="dropdown-toggle" data-toggle="dropdown"> 
					<img src="<c:url value="/resources/images/image.png" />" alt=""> 
					<span>${loginSession.user}</span> <i class="caret"></i>
				</a>

				<ul class="dropdown-menu dropdown-menu-right">
					<li>
						<a href="<c:url value="/logout"/>"><i class="icon-switch2"></i> Logout</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</div>

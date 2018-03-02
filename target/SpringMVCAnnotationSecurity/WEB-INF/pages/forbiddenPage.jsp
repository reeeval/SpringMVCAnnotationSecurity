<%@page session="false"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link type="text/css" href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet" />
		<link type="text/css" href="https://getbootstrap.com/docs/3.3/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
		<link type="text/css" href="${pageContext.request.contextPath}/js/jquery-datatable/css/jquery.dataTables.css" rel="stylesheet" />
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery_and_datatables_1_12_4.js"></script>
		
		<style type="text/css">
			.jumbotron {
				padding: 0rem 0rem !important;
			}
			
			.container {
				max-width: 80%!important;
			}
			
			.fullWidthTable {
	        	width: 100%!important;
	        }
		</style>
		
		<title>Access Denied</title>
	</head>
	<body>
		<!--<jsp:include page="_menu.jsp"/>-->
		
		<div class="container">
			<div class="header clearfix">
				<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
					<div class="collapse navbar-collapse" id="navbarCollapse">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath}/welcome">Home</a>
		                    </li>
		                    <li class="nav-item">
		                    	<a class="nav-link" href="${pageContext.request.contextPath}/userInfo">User Info</a>
		                    </li>
		                    <li class="nav-item">
		                    	<a class="nav-link" href="${pageContext.request.contextPath}/chat">Chat</a>
		                    </li>
		                    <li class="nav-item active">
		                    	<a class="nav-link" href="${pageContext.request.contextPath}/admin">Admin Page</a>
		                    </li>
		                    <c:if test="${pageContext.request.userPrincipal.name != null}">
		                    	<li class="nav-item">
		                    		<a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
		                    	</li>
		                    </c:if>
						</ul>
						<form class="form-inline mt-2 mt-md-0">
							<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
						</form>
					</div>
				</nav>
				<br/><br/><br/>
			</div>
			
			<h3 style="color:red;">${message}</h3>
		</div>
	</body>
</html>
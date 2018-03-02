<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
		
		<script type="text/javascript">
			$(document).ready(function() {
				var dtTable = $('[id$="resulttable"]').DataTable({
					order: [[0, 'desc']],
                    bFilter: false
				});
				
				$('[id$=doSearch]').click(function() {
                    var val = $.fn.dataTable.util.escapeRegex(
                        $(this).val()
                    );
                    dtTable.column(0)
                        .search( val == 'All' ? '' : '^'+val+'$', true, false )
                        .draw();
                });
			});
		</script>
		
		<title>${title}</title>
	</head>
	<body>
	
		<!--<jsp:include page="_menu.jsp" />-->
		
		<div class="container">
			<div class="header clearfix">
				<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
					<div class="collapse navbar-collapse" id="navbarCollapse">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item active">
								<a class="nav-link" href="${pageContext.request.contextPath}/welcome">Home</a>
		                    </li>
		                    <li class="nav-item">
		                    	<a class="nav-link" href="${pageContext.request.contextPath}/userInfo">User Info</a>
		                    </li>
		                    <li class="nav-item">
		                    	<a class="nav-link" href="${pageContext.request.contextPath}/chat">Chat</a>
		                    </li>
		                    <li class="nav-item">
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
				<h3 class="text-muted" >All Contacts</h3>
			</div>
			
			<div class="jumbotron">
	            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
	        </div>
	        
	        <table border=1 id="resulttable" class="display fullWidthTable">
				<thead>
					<tr>
						<th>User Id</th>
		                <th>First Name</th>
		                <th>Last Name</th>
		                <th>DOB</th>
		                <th>Email</th>
		                <th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${contacts}" var="ct">
						<tr>
							<td><c:out value="${ct.contactId}" /></td>
							<td><c:out value="${ct.firstName}" /></td>
	                    	<td><c:out value="${ct.lastName}" /></td>
	                    	<td><fmt:formatDate pattern="dd-MMM-yyyy" value="${ct.dob}" /></td>
	                    	<td><c:out value="${ct.email}" /></td>
	                    	<c:if test="${pageContext.request.userPrincipal.name != null}">
	                    		<td><a class="btn btn-info" role="button" href="${pageContext.request.contextPath}/update/<c:out value="${ct.contactId}"/>">Update</a> 
	                    		| <a class="btn btn-danger" role="button" href="${pageContext.request.contextPath}/delete/<c:out value="${ct.contactId}"/>">Delete</a></td>
	                    	</c:if>
	                    	<c:if test="${pageContext.request.userPrincipal.name == null}">
	                    		<td>-</td>
	                    	</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br/>
			<p><a class="btn btn-info" role="button" href="${pageContext.request.contextPath}/insert">Add Contact</a></p>
			
			
			<footer class="footer">
	            <p>&copy; Simple Private Inc. 2017</p>
	        </footer>
		</div>
	</body>
</html>
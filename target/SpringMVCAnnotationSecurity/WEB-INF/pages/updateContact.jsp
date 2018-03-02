<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link type="text/css" href="${pageContext.request.contextPath}/js/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />
		<link type="text/css" href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet" />
		<link type="text/css" href="https://getbootstrap.com/docs/3.3/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
		<link type="text/css" href="${pageContext.request.contextPath}/js/jquery-datatable/css/jquery.dataTables.css" rel="stylesheet" />
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery_and_datatables_1_12_4.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.12.1/jquery-ui.js"></script>
		
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
	        
	        .divHiddenText {
	        	
	        }
		</style>
		
		<title>Add New Contact</title>
	</head>
	<body>
		<script>
	        $(function() {
	            $('.date-picker').datepicker({
	            	dateFormat: 'dd/mm/yy',
	                changeMonth: true,
	                changeYear: true,
	                yearRange: '1970:2017'
	            });
	        });
	    </script>
	    <jsp:useBean id="now" class="java.util.Date"/>
	    
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
				<h3 class="text-muted">New Contact</h3>
	    	</div>
	    	
	    	<div style="max-width: 50%!important">
	    		<form:form method="POST" action="${contactId}" name="frmAddUser" modelAttribute="contact">
	    			
    				User ID : <form:input class="form-control" type="text" readonly="true" name="contactId"
			    		 path="contactId" /> <br />
			    	First Name : <form:input class="form-control"
			            type="text" name="firstName"
			             path="firstName" /> <br />
		            Last Name : <form:input class="form-control"
			            type="text" name="lastName"
			             path="lastName" /> <br />
		            DOB : <form:input
			            type="text" name="dob" placeholder="DD/MM/YYYY"
			             path="dob" cssClass="form-control date-picker" /> <br />
		            Email : <form:input class="form-control" type="text" name="email"
		            	 path="email" /> <br />
		            <input class="btn btn-success" type="submit" value="Submit" />
		            <br/><br/>
		            
<!-- 		            <div id="divHiddenText"> -->
<%-- 		            	<form:input type="text" name="createdBy" path="createdBy"/> <br /> --%>
<%-- 		            	<form:input type="text" name="createdDate" path="createdDate"/> <br /> --%>
<%-- 		            	<form:input type="text" name="lastUpdatedBy" path="lastUpdatedBy"/> <br /> --%>
<%-- 		            	<form:input type="text" name="createdDate" path="createdDate"/> <br /> --%>
<!-- 		            </div> -->
		            
			    </form:form>
	    	</div>
	    	
	    </div>
	</body>
</html>
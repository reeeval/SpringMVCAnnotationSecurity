<%@page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
		<!-- This script takes the endpoint URL parameter passed from the 
		     deployment page and makes it the action for the form.
		     You can see the endPoint parameter in the Pre-Chat form window's URL.
		-->
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link type="text/css" href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet" />
		<link type="text/css" href="https://getbootstrap.com/docs/3.3/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
		<link type="text/css" href="${pageContext.request.contextPath}/js/jquery-datatable/css/jquery.dataTables.css" rel="stylesheet" />
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery_and_datatables_1_12_4.js"></script>
		
		<script>
			(function() {
				function handlePageLoad() {
					var endpointMatcher = new RegExp("[\\?\\&]endpoint=([^&#]*)");
					document.getElementById('prechatForm').setAttribute('action', decodeURIComponent(endpointMatcher.exec(document.location.search)[1]));
				}
				if (window.addEventListener) {
					window.addEventListener('load', handlePageLoad, false);
				}
				else {
					window.attachEvent('onload', handlePageLoad, false);
				}
			})();
	    </script>
		
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
		
		<title>${title}</title>
	</head>
	<body>
		<!--<jsp:include page="_menu.jsp" />-->
		
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
		                    <li class="nav-item active">
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
			</div>
			
			<div class="jumbotron">
	            <h1>Pre chat form</h1>
	        </div>
	        
	        <div style="max-width: 50%!important">
	        	<form method="post" id="prechatForm">
	        		<!-- Detail inputs -->
					First Name: <input class="form-control" type="text" name="liveagent.prechat:contactFirstName" /><br />
					Last Name: <input class="form-control" type="text" name="liveagent.prechat:contactLastName" /><br />
					Email: <input class="form-control" type="text" name="liveagent.prechat:contactEmail" /><br />
					Subject: <input class="form-control" type="text" name="liveagent.prechat:caseSubject" /><br />
					
					<!-- Map the detail inputs to the Contact fields --> 
					<input type="hidden" name="liveagent.prechat.findorcreate.map:Contact" value="FirstName,contactFirstName;LastName,contactLastName;Email,contactEmail;" />
					 
					<!-- Try to find the Contact by email (exact match) -->
					<input type="hidden" name="liveagent.prechat.findorcreate.map.doFind:Contact" value="Email,true;" />
					<input type="hidden" name="liveagent.prechat.findorcreate.map.isExactMatch:Contact" value="Email,true;" />
					 
					<!-- If the Contact is not found, then create one with the following fields set -->
					<input type="hidden" name="liveagent.prechat.findorcreate.map.doCreate:Contact" value="FirstName,true;LastName,true;Email,true;" />
					 
					<!-- Save the Contact on the Live Chat Transcript's Contact Loookup -->
					<input type="hidden" name="liveagent.prechat.findorcreate.saveToTranscript:Contact" value="Contact" />
					 
					<!-- Show the Contact when it is found or created -->
					<input type="hidden" name="liveagent.prechat.findorcreate.showOnCreate:Contact" value="true" />
					
					<!-- Create a Case every time -->
					<input type="hidden" name="liveagent.prechat:caseOrigin" value="Chat" />
					<input type="hidden" name="liveagent.prechat.findorcreate.map:Case" value="Origin,caseOrigin;Subject,caseSubject;" />
					<input type="hidden" name="liveagent.prechat.findorcreate.map.doCreate:Case" value="Origin,true;Subject,true;" />
					<input type="hidden" name="liveagent.prechat.findorcreate.saveToTranscript:Case" value="Case" />
					<input type="hidden" name="liveagent.prechat.findorcreate.showOnCreate:Case" value="true" />
					
					<!-- Link the Contact to the Case -->
					<input type= "hidden" name="liveagent.prechat.findorcreate.linkToEntity:Contact" value="Case,ContactId" />
					<input type="submit" value="Request Chat" id="prechat_submit" />
	        	</form>
	        </div>
		</div>
	</body>
</html>
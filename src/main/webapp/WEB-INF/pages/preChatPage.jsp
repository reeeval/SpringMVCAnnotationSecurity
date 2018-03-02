<%@page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link type="text/css" href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet" />
		<link type="text/css" href="https://getbootstrap.com/docs/3.3/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
		<link type="text/css" href="${pageContext.request.contextPath}/js/jquery-datatable/css/jquery.dataTables.css" rel="stylesheet" />
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery_and_datatables_1_12_4.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.12.1/jquery-ui.js"></script>
	    
	    <!-- live agent deployment code -->
	    <script type='text/javascript' src='https://c.la1-c1cs-ukb.salesforceliveagent.com/content/g/js/42.0/deployment.js'></script>
		<script type='text/javascript'>
			liveagent.init('https://d.la1-c1cs-ukb.salesforceliveagent.com/chat', '5720k000000CaUQ', '00D0k000000D6P2');
		</script>
		
		<script type="text/javascript">
			var j$ = jQuery.noConflict();
			
			j$(document).ready(function() {
				loadButton(j$('[id$=cmbLanguage]').val());
			});
			
			function loadButton(val) {
				if (val == 'Bahasa Indonesia') {
					j$('.ID-ID').show();
					j$('.ID-EN').hide();
	                
				}
				else if (val == 'English') {
					j$('.ID-EN').show();
					j$('.ID-ID').hide();
				}
			}
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
	        
	        .buttonSize {
	        	width: 180px;
	        	height: 40px;
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
	        
	        <div style="max-width: 50%!important">
	        	Hello, and welcome to our customer service page.<br/>
				Please click the link to begin a live chat session:
	        </div>
	        
	        <br/>
	        
	        <div>
	        	<div class="form-group">
					<label for="cmbLocation">Location:</label>
					<select class="form-control" id="cmbLocation">
						<option>Indonesia</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="cmbLanguage">Language:</label>
					<select class="form-control" id="cmbLanguage" onchange="loadButton(this.value)">
						<option>Bahasa Indonesia</option>
						<option>English</option>
					</select>
				</div>
	        </div>
	        
	        <div id="div-ID-ID" class="ID-ID">
	        	<!-- Indonesia Bahasa General Button -->
	        	<img id="liveagent_button_online_5730k000000CaVT" style="display: none; border: 0px none; cursor: pointer" onclick="liveagent.startChat('5730k000000CaVT')" src="https://tvlksf-traveloka-test.cs57.force.com/tvlksite/resource/1516361691000/OnlineButton" class="buttonSize" />
	        	<img id="liveagent_button_offline_5730k000000CaVT" style="display: none; border: 0px none; " src="https://tvlksf-traveloka-test.cs57.force.com/tvlksite/resource/1516707282000/OfflineButton" class="buttonSize" />
				<script type="text/javascript">
				if (!window._laq) { window._laq = []; }
				window._laq.push(function(){liveagent.showWhenOnline('5730k000000CaVT', document.getElementById('liveagent_button_online_5730k000000CaVT'));
				liveagent.showWhenOffline('5730k000000CaVT', document.getElementById('liveagent_button_offline_5730k000000CaVT'));
				});
				</script>
	        </div>
	        
	        <div id="div-ID-EN" class="ID-EN">
	        	<!-- Indonesia English General Button -->
	        	<img id="liveagent_button_online_5730k000000CaVY" style="display: none; border: 0px none; cursor: pointer" onclick="liveagent.startChat('5730k000000CaVY')" src="https://tvlksf-traveloka-test.cs57.force.com/tvlksite/resource/1516361691000/OnlineButton" class="buttonSize" />
	        	<img id="liveagent_button_offline_5730k000000CaVY" style="display: none; border: 0px none; " src="https://tvlksf-traveloka-test.cs57.force.com/tvlksite/resource/1516707282000/OfflineButton" class="buttonSize" />
				<script type="text/javascript">
				if (!window._laq) { window._laq = []; }
				window._laq.push(function(){liveagent.showWhenOnline('5730k000000CaVY', document.getElementById('liveagent_button_online_5730k000000CaVY'));
				liveagent.showWhenOffline('5730k000000CaVY', document.getElementById('liveagent_button_offline_5730k000000CaVY'));
				});
				</script>  	
	        </div>
	        
	        
	        
	        <br/><br/>
	        
	        <!-- we can redirect chat window by using iframe; just change the method from liveagent.startChat('5730k000000CaVY') to liveagent.startChatWithWindow('5730k000000CaVY', 'chatLocation') -->
	        <!--  <iframe id="chatLocation" name="chatLocation" style="width: 300px; height: 400px"></iframe> <br/>  -->
	        
		</div>
	</body>
</html>
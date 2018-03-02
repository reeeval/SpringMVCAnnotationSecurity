<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div style="border: 1px solid #ccc;padding:5px;margin-bottom:20px;">
	<a href="${pageContext.request.contextPath}/welcome">Home</a>
	| &nbsp;
	<a href="${pageContext.request.contextPath}/userInfo">User Info</a>
	| &nbsp;
	<a href="${pageContext.request.contextPath}/admin">Admin</a>
	
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		| &nbsp;
		<a href="${pageContext.request.contextPath}/logout">Logout</a>
	</c:if>
</div>
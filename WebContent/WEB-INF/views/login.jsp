<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://localhost:8080/Tarea2NC/resources/js/login.js"></script>
</head>
<body>
	<!--<form:form action="${pageContext.request.contextPath}/login/validate" method="post" modelAttribute="form">
		<form:input path="username" type="text" id="username"/>
		<form:input path="password" type="password" id="password"/>
		<input type="submit" value="Login"/>
	</form:form>-->
	<div class="form">
		<input type="text" id="username"/>
		<input type="password" id="password"/>
		<button id="validate">Login</button>
	</div>
	<div id="error">
	</div>
</body>
</html>
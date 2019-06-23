<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script type="text/javascript"
	src="./resources/js/login.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="./resources/css/login.css" rel="stylesheet">
<link href="./resources/css/button.css" rel="stylesheet">
<link href="./resources/css/inputs.css" rel="stylesheet">
<link href="./resources/css/forms.css" rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
<link rel="icon" href="https://www.pngkey.com/png/detail/448-4480086_html5-icon-restaurant.png">
</head>
<body>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<div class="fadeIn first">
				<div id="icon">
					<div class="decolor"><span>Rustico Restaurant</span></div>
				</div>
			</div>
			<input type="text" id="username" placeholder="Username" /> <input type="password"
				id="password" placeholder="Password" />
			<button id="validate" onclick="log('${pageContext.request.contextPath}')">Login</button>
		</div>
	</div>
	<div class="alert alert-danger fixed-top" rol="alert" id="error-container">
		Credenciales erroneas
	</div>
</body>
</html>
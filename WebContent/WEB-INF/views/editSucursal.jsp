<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
	integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX"
	crossorigin="anonymous">

<!-- Material Design for Bootstrap fonts and icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
	
<link href="../resources/css/button.css" rel="stylesheet">
<link href="../resources/css/sucursales.css" rel="stylesheet">
<link href="../resources/css/inputs.css" rel="stylesheet">
<link href="../resources/css/forms.css" rel="stylesheet">
<link href="../resources/css/error.css" rel="stylesheet">
<link href="../../resources/css/button.css" rel="stylesheet">
<link href="../../resources/css/sucursales.css" rel="stylesheet">
<link href="../../resources/css/inputs.css" rel="stylesheet">
<link href="../../resources/css/forms.css" rel="stylesheet">
<link href="../../resources/css/error.css" rel="stylesheet">
<link rel="icon" href="https://www.pngkey.com/png/detail/448-4480086_html5-icon-restaurant.png">
<title>Sucursal</title>
</head>
<body>

	<div class="wrapper">
		<div id="formContent">
			<c:choose>
				<c:when test="${sucursal.sucursalC!=null }">
					<h1>Editando la sucursal ${sucursal.nombreS}</h1>
				</c:when>
				<c:otherwise>
					<h1>Creando sucursal</h1>
				</c:otherwise>
			</c:choose>
			<form:form action="${pageContext.request.contextPath}/sucursal/save"
				modelAttribute="sucursal" method="post">
				<form:hidden path="sucursalC" name="sucursalC" />
				<form:input path="nombreS" name="nombreS"
					placeholder="Nombre de la sucursal" required="required"/>
				<br>

				<label> <form:input path="ubicacionS" name="ubicacionS"
						placeholder="Ubicación de la sucursal" required="required"/>
				</label>
				<label class="time">Abre a las <input type="time"
					name="abreS" value="${sucursal.abreS}" required="required" min="00:00" max="11:59">
				</label>
				<label class="time"> Cierra a las <input type="time"
					name="cierraS" value="${sucursal.cierraS }" required="required" min="12:00" max="23:59">
				</label>
				<label> <input type="number" value="${sucursal.numMesasS}"
					name="numMesasS" placeholder="Numero de mesas" required="required" min="0">
				</label>
				<label> <form:input path="nomGerenteS" name="nomGerenteS"
						placeholder="Nombre del gerente" required="required"/>
				</label>
				<button type="submit" id="validate">Guardar</button>
			</form:form>
		</div>
	</div>
	
	<div class="back">
		<form action="${pageContext.request.contextPath}/sucursal/perfil"
			method="get">
			<input type="hidden" value="${sucursal.sucursalC}" name="code">
			<button type="submit" class="btn btn-primary bmd-btn-fab">
				<i class="material-icons">keyboard_backspace</i>
			</button>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"
		integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
		crossorigin="anonymous"></script>
	<script
		src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
		integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			$('body').bootstrapMaterialDesign();
		});
	</script>

</body>
</html>
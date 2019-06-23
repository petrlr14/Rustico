<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../resources/css/button.css" rel="stylesheet">
<link href="../resources/css/sucursales.css" rel="stylesheet">
<link href="../resources/css/inputs.css" rel="stylesheet">
<link href="../resources/css/forms.css" rel="stylesheet">
<link href="../resources/css/error.css" rel="stylesheet">
<title>Insert title here</title>
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
					name="abreS" value="${sucursal.abreS}" required="required">
				</label>
				<label class="time"> Cierra a las <input type="time"
					name="cierraS" value="${sucursal.cierraS}" required="required">
				</label>
				<label> <input type="number" value="${sucursal.numMesasS}"
					name="numMesasS" placeholder="Numero de mesas" required="required" min="0">
				</label>
				<label> <form:input path="nomGerenteS" name="nomGerenteS"
						placeholder="Nombre del gerente" required="required"/>
				</label>
				<button type="submit">Guardar</button>
			</form:form>
		</div>
	</div>

</body>
</html>
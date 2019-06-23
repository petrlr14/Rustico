<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
	integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX"
	crossorigin="anonymous">

<!-- Material Design for Bootstrap fonts and icons -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">

<link href="../resources/css/table.css" rel="stylesheet">
<link href="../resources/css/button.css" rel="stylesheet">
<link href="../resources/css/sucursales.css" rel="stylesheet">
<link href="../../resources/css/table.css" rel="stylesheet">
<link href="../../resources/css/button.css" rel="stylesheet">
<link href="../../resources/css/sucursales.css" rel="stylesheet">
</head>
<body>

	<h1>Todas las sucursales</h1>

	<div class="add">
		<form action="${pageContext.request.contextPath}/sucursal/save"
			method="get">
			<input type="hidden" value="" name="id">
			<button type="submit" class="btn btn-success bmd-btn-fab">
				<i class="material-icons">add</i>
			</button>
		</form>
	</div>

	<table class="table table-striped table-bordered"">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Nombre de la sucursal</th>
				<th scope="col">Gerente</th>
				<th scope="col">Horario</th>
				<th scope="col">Cantidad de Empleados</th>
				<th scope="col">Acci&oacute;n</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${lista}" var="suc">
				<tr>
					<td>${suc.nombreS}</td>
					<td>${suc.nomGerenteS}</td>
					<td>${suc.horario}</td>
					<td>${fn:length(suc.empleados)}</td>
					<td>
						<form action="${pageContext.request.contextPath}/sucursal/perfil"
							method="get" class="action">
							<input id="value" name="code" value="${suc.sucursalC}"
								type="hidden"> <input id="perfil" value="Ver perfil"
								type="submit">
						</form>
						<form action="${pageContext.request.contextPath}/sucursal/delete"
							method="post" class="action">
							<input id="value" name="id" value="${suc.sucursalC}"
								type="hidden"> <input id="perfil" value="Eliminar"
								type="submit" class="delete">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

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
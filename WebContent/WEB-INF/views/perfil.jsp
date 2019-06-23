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

	<div class="info">
		<h1 style="text-align: center">Perfil de la sucursal
			${sucursal.nombreS}</h1>
		<table class="table table-striped table-bordered"
			style="table-layout: fixed;">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Nombre de la sucursal
					</td>
					<th scope="col">Direcci&oacute;n
					</td>
					<th scope="col">Gerente
					</td>
					<th scope="col">Num. Mesas</th>
					<th scope="col">Horario</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${sucursal.nombreS}</td>
					<td>${sucursal.ubicacionS}</td>
					<td>${sucursal.nomGerenteS}</td>
					<td>${sucursal.numMesasS}</td>
					<td>${sucursal.horario}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<c:choose>
		<c:when test="${fn:length(listaEmpleados)>0}">
			<h2 style="text-align: center">Empleados de esta sucursal</h2>
			<table class="table table-striped table-bordered">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Nombre</th>
						<th scope="col">Edad</th>
						<th scope="col">Genero</th>
						<th scope="col">Estado</th>
						<th scope="col">Acci&oacute;n</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach items="${listaEmpleados}" var="suc">
							<tr>
								<td>${suc.nombreE}</td>
								<td>${suc.edadE}</td>
								<td>${suc.generoE}</td>
								<td>${suc.state}</td>
								<td>
									<form action="${pageContext.request.contextPath}/empleado/save"
										method="get" class="action">
										<input value="${suc.empleadoC}" type="hidden" name="id">
										<input type="hidden" value="${sucursal.sucursalC}" name="code">
										<input type="submit" value="Editar">
									</form>
									<form
										action="${pageContext.request.contextPath}/empleado/delete"
										method="post" name="delete" class="action">
										<input value="${suc.empleadoC}" type="hidden" id="code"
											name="code"> <input type="submit" value="Eliminar"
											class="delete">
									</form>
								</td>
							</tr>
						</c:forEach>
					</tr>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<h2 style="text-align: center;">No hay empleados :c</h2>
		</c:otherwise>
	</c:choose>

	<div class="add">
		<form action="${pageContext.request.contextPath}/empleado/save"
			method="get">
			<input type="hidden" value="${sucursal.sucursalC}" name="code">
			<input value="${null}" type="hidden" name="id">
			<button type="submit" class="btn btn-success bmd-btn-fab">
				<i class="material-icons">add</i>
			</button>
		</form>
	</div>

	<div class="edit">
		<form action="${pageContext.request.contextPath}/sucursal/edit"
			method="get">
			<input type="hidden" value="${sucursal.sucursalC}" name="code">
			<button type="submit" class="btn btn-warning bmd-btn-fab">
				<i class="material-icons">edit</i>
			</button>
		</form>
	</div>

	<div class="back">
		<form action="${pageContext.request.contextPath}/sucursal/"
			method="get">
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
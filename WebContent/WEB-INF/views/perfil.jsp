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
<script type="text/javascript"
	src="http://localhost:8080/Tarea2NC/resources/js/perfil.js"></script>
</head>
<body>

	<h1>Perfil de la sucursal ${sucursal.nombreS}</h1>

	<div class="info">
		<p>Nombre de la sucursal: ${sucursal.nombreS}</p>
		<p>Direcci&oacute;n: ${sucursal.ubicacionS}</p>
		<p>Gerente: ${sucursal.nomGerenteS}</p>
		<form action="${pageContext.request.contextPath}/sucursal/edit" method="get">
			<input type="hidden" value="${sucursal.sucursalC}" name="code">
			<input type="submit" value="Editar perfil">
		</form>
	</div>
	
	<h3>----------------------------------</h3>
	<form action="${pageContext.request.contextPath}/empleado/crear"
									method="get">
		<input type="hidden" value="${sucursal.sucursalC}" name="code">
		<input type="submit" value="Ingresar nuevo empleado">
	</form>
	<c:choose>
		<c:when test="${fn:length(listaEmpleados)>0}">
			<h2>Empleados de esta sucursal</h2>
			<table>
				<tr>
					<th>Nombre</th>
					<th>Edad</th>
					<th>Genero</th>
					<th>Estado</th>
					<th>Acci&oacute;n</th>
				</tr>
				<tr>
					<c:forEach items="${listaEmpleados}" var="suc">
						<tr>
							<td>${suc.nombreE}</td>
							<td>${suc.edadE}</td>
							<td>${suc.generoE}</td>
							<td>${suc.estadoE}</td>
							<td>
								<form
									action="${pageContext.request.contextPath}/empleado/editar"
									method="post">
									<input value="${suc.empleadoC}" type="hidden" name="code">
									<input type="submit" value="Editar">
								</form>
								<form
									action="${pageContext.request.contextPath}/empleado/delete"
									method="post" name="delete">
									<input value="${suc.empleadoC}" type="hidden" id="code"
										name="code"> <input type="submit" value="Eliminar">
								</form>
							</td>
						</tr>
					</c:forEach>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
			<h2>No hay empleados :c</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>
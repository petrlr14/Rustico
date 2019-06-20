<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Perfil de la sucursal ${sucursal.nombreS}</h1>

	<form action="${pageContext.request.contextPath}/sucursal/editar" method="post">
		<input value="${sucursal.sucursalC}" type="hidden" name="code">
		<input type="submit" value="Editar">
	</form>

	<div class="info">
		<p>Nombre de la sucursal: ${sucursal.nombreS}</p>
		<p>Direcci&oacute;n: ${sucursal.ubicacionS}</p>
		<p>Gerente: ${sucursal.nomGerenteS}</p>
	</div>

	<h2>Empleados de esta sucursal</h2>
	
	<table>
		<tr>
			<th>Nombre</th>
			<th>Edad</th>
			<th>Genero</th>
			<th>Estado</th>
			
		</tr>

		<c:forEach items="${listaEmpleados}" var="suc">
			<tr>
				<td>${suc.nombreE}</td>
				<td>${suc.edadE}</td>
				<td>${suc.generoE}</td>
				<td>${suc.estadoE}</td>
				
			</tr>
		</c:forEach>
	</table>
</body>
</html>
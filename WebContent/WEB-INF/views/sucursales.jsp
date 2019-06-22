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
</head>
<body>

	<h1>Todas las sucursales</h1>

	<form action="${pageContext.request.contextPath}/sucursal/save"
		method="get">
		<input type="hidden" value=""> <input type="submit"
			value="Crear una sucursal">
	</form>

	<table>
		<tr>
			<th>Gerente</th>
			<th>Nombre de la sucursal</th>
			<th>Horario</th>
			<th>Cantidad de Empleados</th>
			<th>Acci&oacute;n</th>
		</tr>


		<c:forEach items="${lista}" var="suc">
			<tr>
				<td>${suc.nomGerenteS}</td>
				<td>${suc.nombreS}</td>
				<td>${suc.horarioS}</td>
				<td>${fn:length(suc.empleados)}</td>
				<td>
					<form action="${pageContext.request.contextPath}/sucursal/perfil"
						method="get">
						<input id="value" name="code" value="${suc.sucursalC}"
							type="hidden"> <input id="perfil" value="Ver perfil"
							type="submit">
					</form>
					<form action="${pageContext.request.contextPath}/sucursal/delete"
						method="post">
						<input id="value" name="id" value="${suc.sucursalC}"
							type="hidden"> <input id="perfil" value="Eliminar"
							type="submit">
					</form>
				</td>
			</tr>
		</c:forEach>


	</table>
</body>
</html>
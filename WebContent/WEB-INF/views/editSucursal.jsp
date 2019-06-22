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
	<h1>Editando la sucursal ${sucursal.nombreS}</h1>
	
	<form:form action="${pageContext.request.contextPath}/sucursal/save" modelAttribute="sucursal" method="post">
		<form:hidden path="sucursalC" name="sucursalC"/>
		<form:input path="nombreS" name="nombreS"/>
		<form:errors path="nombreS">Error de nombre wey, mete algo</form:errors>
		<form:input path="ubicacionS" name="ubicacionS"/>
		<form:input path="horarioS" name="horarioS"/>
		<input type="number" value="${sucursal.numMesasS}" name="numMesasS">
		<form:input path="nomGerenteS" name="nomGerenteS"/>
		<input type="submit" value="Guardar">
	</form:form>
	
</body>
</html>
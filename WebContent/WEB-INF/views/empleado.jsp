
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${empledo.empleadoC!=null}">
			<h1>Editando a ${empleado.nombreE}</h1>
		</c:when>
		<c:otherwise>
			<h1>Creando Empleado</h1>
		</c:otherwise>
	</c:choose>

	<div>
		<form:form modelAttribute="empleado"
			action="${pageContext.request.contextPath}/empleado/save"
			method="post">
			<form:input path="nombreE" name="nombreE"/>
			<br>
			<form:errors path="nombreE"></form:errors>
			<br />
			<input value="${empleado.edadE}" type="number" name="edadE"
				id="edadE" required="required" />
			<br />
			<form:errors path="edadE">Edad minima es 18</form:errors>
			<form:hidden path="empleadoC" name="empleadoC" id="empleadoC" />
			<br>
			<input type="hidden" name="code" value="${idSuc}">
			<form:radiobutton path="generoE" value="H" name="generoE"/>Hombre
			<form:radiobutton path="generoE" value="M" name="generoE"/>Mujer
			<br>
			<form:errors path="generoE"></form:errors>
			<br />
			<form:radiobutton path="estadoE" value="true" name="estadoE"
				id="estadoE1" />Activo
			<form:radiobutton path="estadoE" value="false" name="estadoE"
				id="estadoE2" />Inactivo
			<br />
			<br>
			<input type="submit" value="Guardar">
		</form:form>
	</div>
</body>
</html>
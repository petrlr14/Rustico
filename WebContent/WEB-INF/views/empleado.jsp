
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./resources/css/table.css" rel="stylesheet">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="../resources/css/button.css" rel="stylesheet">
<link href="../resources/css/inputs.css" rel="stylesheet">
<link href="../resources/css/forms.css" rel="stylesheet">
<link href="../resources/css/error.css" rel="stylesheet">
</head>
<body>

	<div class="wrapper">
		<div id="formContent">
			<c:choose>
				<c:when test="${empledo.empleadoC!=null}">
					<h1>Editando a ${empleado.nombreE}</h1>
				</c:when>
				<c:otherwise>
					<h1>Creando Empleado</h1>
				</c:otherwise>
			</c:choose>
			<form:form modelAttribute="empleado"
				action="${pageContext.request.contextPath}/empleado/save"
				method="post">
				<form:input path="nombreE" name="nombreE" />
				<input value="${empleado.edadE}" type="number" name="edadE"
					id="edadE" required="required" />
				<br />
				<form:errors path="edadE">Edad minima es 18</form:errors>
				<form:hidden path="empleadoC" name="code" id="empleadoC" />
				<br>
				<input type="hidden" name="code" value="${idSuc}">
				<label> <form:radiobutton path="generoE" value="H"
						name="generoE" required="required"/> Hombre
				</label>
				<label> <form:radiobutton path="generoE" value="M"
						name="generoE" /> Mujer
				</label>
				<br>
				<form:errors path="generoE"></form:errors>
				<br />
				<label><form:radiobutton path="estadoE" value="true"
						name="estadoE" id="estadoE1" />Activo</label>
				<label><form:radiobutton path="estadoE" value="false"
						name="estadoE" id="estadoE2" />Inactivo</label>
				<br />
				<br>
				<input type="submit" value="Guardar">
			</form:form>
		</div>
	</div>
</body>
</html>
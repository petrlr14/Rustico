
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	
<link href="../resources/css/button.css" rel="stylesheet">
<link href="../resources/css/inputs.css" rel="stylesheet">
<link href="../resources/css/forms.css" rel="stylesheet">
<link href="../resources/css/error.css" rel="stylesheet">
<link href="../../resources/css/button.css" rel="stylesheet">
<link href="../../resources/css/inputs.css" rel="stylesheet">
<link href="../../resources/css/forms.css" rel="stylesheet">
<link href="../../resources/css/error.css" rel="stylesheet">
</head>
<body>

	<div class="wrapper">
		<div id="formContent">
			<c:choose>
				<c:when test="${not empty empleado.empleadoC }">
					<h1>Editando a ${empleado.nombreE}</h1>
				</c:when>
				<c:otherwise>
					<h1>Creando Empleado</h1>
				</c:otherwise>
			</c:choose>
			<form:form modelAttribute="empleado"
				action="${pageContext.request.contextPath}/empleado/save"
				method="post">
				<form:input path="nombreE" name="nombreE" placeholder="Nombre"/>
				<input value="${empleado.edadE}" type="number" name="edadE"
					id="edadE" required="required" />
				<br />
				<form:errors path="edadE"><span class="error">Edad minima es 18</span></form:errors>
				<form:hidden path="empleadoC" name="empleadoC"/>
				<br>
				<input type="hidden" name="code" value="${idSuc}">
				<input type="hidden" name="id" value="${empleado.empleadoC }"/>
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
				<button type="submit">Guardar</button>
			</form:form>
		</div>
	</div>
	
	<div class="back">
		<form action="${pageContext.request.contextPath}/sucursal/perfil"
			method="get">
			<input type="hidden" value="${idSuc}" name="code">
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
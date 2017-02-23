<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GoSoftair</title>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/registrazione.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/mycss.css"
	rel="stylesheet">
	<link
			href="${pageContext.request.contextPath}/resources/customCSS/registerOrLogin.css"
			rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
<script
		src="${pageContext.request.contextPath}/resources/customJS/registerOrLogin.js"></script>
</head>

<body id="sfondochiaro">

	<%@include file="/layout/navbar.jsp"%>


	<div class="container-fluid immagineSfondo esteso">
		</br>
		<div class="carta" id="bianca">
			<div class="row">
				<div class='col-sm-12 col-md-12 col-lg-12'>
					</br> <label class="col-md-12 personalLabel1">Per visualizzare
						questa pagina devi avere un profilo </br>
					</br>
					<a class="btn bottone1 accedi" id="accedi">ACCEDI</a>
					<a class="btn bottone1" href="${pageContext.request.contextPath}/registrazione">REGISTRATI</a>
					</label>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/layout/footer.jsp"%>

</body>
</html>
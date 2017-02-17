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
	href="${pageContext.request.contextPath}/resources/customCSS/navbar.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/registrazione.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/mycss.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
</head>

<body id="sfondochiaro" >

	<%@include file="/layout/navbar.jsp"%>


	<div class="container-fluid immagineSfondo esteso">
		</br>		
			<div class="card" id="bianco">
				<div class="row">
					<div class='col-sm-4 col-md-4 col-lg-4'>
					</br>
						<label class="col-md-12 personalLabel1">Evento creato con successo</label>
					</div>
				</div>
				<div class="row">
					<div class='col-sm-4 col-md-4 col-lg-4'>
					</br>
						<a class="btn bottone1" 
							href="${pageContext.request.contextPath}/bachecaPartite">BACHECA EVENTI</a> 
						<a class="btn bottone1" href="${pageContext.request.contextPath}/profilo/leMiePartite">I MIEI EVENTI</a>
					</div>			
			</div>
		</div>
	</div>

	<%@include file="/layout/footer.jsp"%>
	
</body>
</html>
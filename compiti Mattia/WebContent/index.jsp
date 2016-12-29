<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>GoSoftair</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/jumbotron.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.structure.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.theme.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/fileinput/css/fileinput.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/mycss.css"
	rel="stylesheet">


<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/bootstrap/img/favicon.ico">
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/jquery-ui/js/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/datetimepicker/moment-with-locales.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery.validate.min.js"></script>
	<script
	src="${pageContext.request.contextPath}/resources/fileinput/js/fileinput.min.js"></script>

<!-- js delle pagine crea partita e annuncio -->	
	<script
	src="${pageContext.request.contextPath}/resources/js/creaPartita.js"></script>
	<script
	src="${pageContext.request.contextPath}/resources/js/creaAnnuncio.js"></script>

</head>

<body>
	<%@include file="/layout/navbar.jsp"%>
	<%@include file="/layout/creaPartita.jsp"%>
<!--<%@include file="/layout/creaAnnuncio.jsp"%>-->
	<%@include file="/layout/footer.jsp"%>

</body>
</html>











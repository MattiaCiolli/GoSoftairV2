<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>GoSoftair</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/bachecaPartite.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/home.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>

<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
</head>

<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>
	
	<!-- inizio -->
	<div class="bachecaPartite">
			<div class="container-fluid">
			<div class="col-md-12 SezEventi">
			
				<div class="row">
					<div class="titoloBacheca"> Partite </div>
					<div class="sottotitoloBacheca">Vorresti provare ma non hai mai avuto occasione? Partecipa ad una delle prossime partite</div>
				
				
				<c:forEach items="${eventi}" var="evento" varStatus="loop">
					<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a href="${pageContext.request.contextPath}/evento/dettagli?idEvento=${evento.id}">
							<div class="carta">
								<img
									src="${pageContext.request.contextPath}/resources/img/${evento.immagine}"
									class="img-responsive bordino largo">
								<div class="contenuto">
									<div>
										<p class="nome">${evento.titolo}</p>
									</div>
									<div>
										<p class="luogoPartita">Luogo partita: ${posizione[loop.index][0]},${posizione[loop.index][1]}</p>
									</div>
									<div>
										<p class="descrizione">${evento.descrizione}</p>
									</div>
								</div>

							</div>
						</a>
					</div>
				</c:forEach>
			</div>
			</div>
			</div>
	</div>

<div class="centra">
<ul class="pagination">
  <li class="active"><a href="#">1</a></li>
  <li><a href="${pageContext.request.contextPath}/views/evento/bachecaPartite2.jsp">2</a></li>
</ul>
</div>
</div>

<%@include file="/layout/footer.jsp" %>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
</body>
</html>

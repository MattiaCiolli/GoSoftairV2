<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>GoSoftair</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/bachecaAnnunci.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/home.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>

</head>

<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp"%>

<!-- edit-modal 1 -->
	<div class="modal fade" data-remote="false" id="modal" tabindex="-1"
		role="dialog" aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">
						<b>Dettagli annuncio</b>
					</h4>
				</div>
				<div class="modal-body row">
					<div class="col-md-6 col-lg-6">
						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Titolo:</h4>
								<p class="list-group-item-text" id="titolo"></p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Descrizione:</h4>
								<p class="list-group-item-text" id="descrizione"></p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Prezzo:</h4>
								<p class="list-group-item-text" id="prezzo"></p>
							</a><a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Data inserzione:</h4>
								<p class="list-group-item-text" id="data"></p>
							</a>
						</div>
					</div>
					<div class="col-md-6 col-lg-6">
						<img id="imgAnnuncio" src="" />
					</div>
					<div class="col-md-12 col-lg-12">
						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Contatti:</h4>
								<p class="list-group-item-text" id="telefono"></p>
								<p class="list-group-item-text" id="emailContatti"></p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- inizio -->
	<div class="bachecaAnnunci ">
		<div class="container-fluid">
			<div class="row">
							<div class="col-lg-12 col-xs-12 col-md-12 col-sm-12 SezAnnunci">
				<div class="titoloSezione">Annunci del mercatino</div>
				<div class="sottotitoloSezione">Trova l'equipaggiamento
					migliore nel nostro mercatino </div>


				<c:forEach items="${listaAnnunci}" var="annuncio" varStatus="loop">
					<div
						class="${classeGrafica[loop.index]} col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a class="clicca" href="${pageContext.request.contextPath}/annuncio/bachecaAnnunci?idAnnuncio=${annuncio.id}" data-toggle="modal" data-target="#modal">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/${annuncio.immagine}"
									class="img-responsive largo">
								<div class="contenuto">
									<div>
										<p class="nome">${annuncio.titolo}</p>
									</div>
									<div>
										<p class="descrizione">${annuncio.descrizione}</p>
									</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
				
				</div>
			</div>
		</div>
		<div class="centra">
			<ul class="pagination">
				<li class="active"><a href="#">1</a></li>
				<li><a
					href="${pageContext.request.contextPath}/titles/bachecaAnnunci2.jsp">2</a></li>
			</ul>
		</div>
	</div>

	<%@include file="/layout/footer.jsp"%>



<script src="${pageContext.request.contextPath}/resources/customJS/modalAnnunci.js"></script>
<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
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
	href="${pageContext.request.contextPath}/resources/customCSS/iMieiAnnunci.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/customJS/modalAnnunci.js"></script>
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
					<div id="loadingedit">
						<img
							src='${pageContext.request.contextPath}/resources/fileinput/img/loading.gif'
							alt='loading...' />
					</div>
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

	<!-- fine modal 1-->
	<c:forEach items="${annunci}" var="annuncio">
		<section>
		<div class="container-fluid">
			<div class="row lateralPadding">
				<a class="clicca"
					href="${pageContext.request.contextPath}/profilo/iMieiAnnunci?idAnnuncio=${annuncio.id}"
					data-toggle="modal" data-target="#modal">
					<div
						class="cartaScura elemento col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div></div>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
							<img
								src="${pageContext.request.contextPath}/resources/img/${annuncio.immagine}"
								class="img-responsive immagineElemento">
						</div>
						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 container">
							<div class="row">
								<div class="col-lg-12">
									<p class="titolo">${annuncio.titolo}</p>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 centra">
									<p class="tag">Descrione</p>
									<p class="valore descrive">${annuncio.descrizione}</p>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 centra">
									<p class="tag">Prezzo</p>
									<p class="valore">${annuncio.prezzo}</p>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 centra">
									<p class="tag">Contatti</p>
									<p class="valore">${annuncio.numeroTelefono}</p>
								</div>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
		</section>
	</c:forEach>



	<section>
	<div class="container-fluid">
		<div class="row">
			<div class="spazietto"></div>
		</div>
	</div>
	</section>

	<%@include file="/layout/footer.jsp"%>

	</div>

</body>
</html>
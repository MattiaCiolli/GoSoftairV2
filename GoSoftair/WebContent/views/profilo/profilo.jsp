<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GoSoftair</title>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/event.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/home.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/profilo.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/customJS/modalAnnunci.js"></script>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700'
	rel='stylesheet' type='text/css'>
</head>


<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp"%>

	<!-- edit-modal 1 -->
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

	<!-- inizio -->

	<div class="container-fluid Profilo">
		<div class="contenitore">
			<div class="row ">
				<div class="col-md-4">
					<div class="list-group">
						<a
							href="${pageContext.request.contextPath}/profilo/leMieIscrizioni"
							class="list-group-item">Le mie Iscrizioni</a> <a
							href="${pageContext.request.contextPath}/profilo/iMieiAnnunci"
							class="list-group-item">I miei Annunci</a> <a
							href="${pageContext.request.contextPath}/profilo/leMiePartite"
							class="list-group-item">Le mie Partite</a> <a
							href="${pageContext.request.contextPath}/profilo/updateUtente"
							class="list-group-item">Modifica Profilo</a>
					</div>
				</div>
				<div class="col-md-8">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-xs-12 col-sm-4">
								<img class="img-thumbnail img-responsive " alt="Foto Profilo"
									src="${pageContext.request.contextPath}/resources/img/${utente.immagineProfilo}">
							</div>
							<div class="contenitoreProfilo">
								<div class="col-xs-12 col-sm-8">
									<div class="row event-description">
										<div class="span-master col-md-4">
											<span>Nome: </span>
										</div>
										<div class="span-master-2 col-md-8">
											<span>${utente.nome}</span>
										</div>
									</div>
									<div class="row event-description">
										<div class="span-master col-md-4">
											<span>Cognome: </span>
										</div>
										<div class="span-master-2 col-md-8">
											<span>${utente.cognome}</span>
										</div>
									</div>
									<div class="row event-description">
										<div class="span-master col-md-6">
											<span>Nickname</span>
										</div>
										<div class="span-master-2 col-md-6">
											<span>${utente.nickname}</span>
										</div>
									</div>
									<div class="row event-description">
										<div class="span-master col-md-4">
											<span>Email: </span>
										</div>
										<div class="span-master-2 col-md-8">
											<span>${utente.email}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Inizio Sezione ultimi eventi -->
	<section>
	<div class="container-fluid">
		<div class="row UltimiEventi">
			<h1 class="text-center titolo">Prossime Partite</h1>

			<c:choose>
				<c:when test="${sezioneEventiVuota}">
					<div class="col-lg-12 col-xs-12 col-md-12 col-sm-12">
						<div class="sottotitoloProfilo text-center">
							Non sei iscritto a nessuna partita, che cosa stai aspettando?</br> <a
								href="${pageContext.request.contextPath}/evento/bachecaPartite"
								class="btn bottonenav bottone123">Guarda la bacheca!</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="sottotitoloProfilo text-center">
						Preparati, lo scontro è vicino!</br>
					</div>
					<c:forEach items="${ultimiEventi}" var="evento">
						<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
							<a
								href="${pageContext.request.contextPath}/evento/dettagli?idEvento=${evento.id}">
								<div class="cartaScura">
									<img
										src="${pageContext.request.contextPath}/resources/img/${evento.immagine}"
										class="img-responsive largo">
									<div class="contenuto">
										<div>
											<p class="nome">${evento.titolo}</p>
										</div>
										<div>
											<p class="descrizione">${evento.descrizione}</p>
										</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	</section>
	<!-- fine sezione ultimi eventi -->

	<!-- Inizio Sezione ultimi annunci -->


	<section>
	<div class="container-fluid">
		<div class="row UltimiAnnunci">
			<h5 class="text-center titolo">Ultimi Annunci Inseriti</h5>

			<c:choose>
				<c:when test="${sezioneAnnunciVuota}">
					<div class="col-lg-12 col-xs-12 col-md-12 col-sm-12">
						<div class="sottotitoloProfilo text-center">
							Vendi qui l'attrezzatura che non ti serve più </br> <a
								href="${pageContext.request.contextPath}/annuncio/nuovo"
								class="btn bottonenav bottone123">Inizia ora!</a>
						</div>
					</div>
				</c:when>

				<c:otherwise>
					<c:forEach items="${ultimiAnnunci}" var="annuncio">
						<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
							<a
								href="${pageContext.request.contextPath}/bachecaAnnunci?idAnnuncio=${annuncio.id}">
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
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	</section>

	<!-- fine sezione ultimi annunci -->

</body>
<%@include file="/layout/footer.jsp"%>
</html>
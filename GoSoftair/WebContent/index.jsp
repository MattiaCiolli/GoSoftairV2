<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/slick/slick/slick.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/slick/slick/slick-theme.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/home.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/slick/slick/slick.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/customJS/home.js"></script>
</head>

<body>
	<%@include file="/layout/navbar.jsp"%>

	<!--Immagine di compertina, jumbotron -->
	<section class="sezioneImmagine">
	<div class="container-fluid jumboPadding">
		<row>
		<div class="jumbotron">
			<div class=" text-center">
				<h1 class="titolo">The Battle is Coming</h1>
				<p class="sottotitolo">Cosa stai aspettando?</p>
				<p></p>
			</div>
		</div>
		</row>
	</div>
	</section>

	<!--sezione features -->
	<section class="sezioneFeatures">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-xs-12 col-md-12 col-sm-12 SezioneFeautures">
				<div class="titoloFeatures">Features</div>
				<div class="featureContenuto">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<img
							src="${pageContext.request.contextPath}/resources/img/mac1.png"
							class="img-responsive mac">
						<div>
							<p class="contenutoFeatures">Trova e partecipa a una partita</p>
							<p class="altroContenuto">
								GoSoftair unisce la passione di molti giocatori di softair che
								spontaneamente organizzano <b><a
									href="${pageContext.request.contextPath}/evento/bachecaEventi?pageNum=0"
									class="link">partite</a></b>. Partecipa anche tu!
							</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<img
							src="${pageContext.request.contextPath}/resources/img/iphoneTagliato2.jpg"
							class="img-responsive iphone">
						<div>
							<p class="contenutoFeatures">Partite in real time</p>
							<p class="altroContenuto">Coordina i tuoi compagni vedendo la
								loro posizione sul tuo smartphone.</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
						<img
							src="${pageContext.request.contextPath}/resources/img/mac2.png"
							class="img-responsive mac">
						<div>
							<p class="contenutoFeatures">Gestisci le tue iscrizioni e i
								tuoi annunci</p>
							<p class="altroContenuto">
								Dal tuo profilo puoi gestire le tue partite ed avere accesso
								completo al <b><a
									href="${pageContext.request.contextPath}/annuncio/bachecaAnnunci?pageNum=0"
									class="link">mercatino</a></b>, dove puoi consultere e inserire
								annunci di compravendita.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>

	<!--sezione eventi -->
	<section>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 SezEventi">
				<div class="titoloSezione">Prossime partite</div>
				<div class="sottotitoloSezione">Vorresti provare ma non hai
					mai avuto occasione? Partecipa a una delle prossime partite</div>
				<div class="autoplay">

					<c:forEach items="${eventi}" var="evento" varStatus="loop">
						<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
							<a
								href="${pageContext.request.contextPath}/evento/dettagli?idEvento=${evento.id}">
								<div class="carta">
									<img
										src="${pageContext.request.contextPath}/resources/img/partite/big/${evento.immagine}"
										class="img-responsive bordino largo">
									<div class="contenuto">
										<div>
											<p class="nome">${evento.titolo}</p>
										</div>
										<div>
											<p class="luogoPartita">Luogo partita:
												${posizione[loop.index][0]},${posizione[loop.index][1]}</p>
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
	</section>

	<!--sezione annunci con numero di card fisse -->
	<section>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-xs-12 col-md-12 col-sm-12 SezAnnunci">
				<div class="titoloSezione">Annunci recenti del mercatino</div>
				<div class="sottotitoloSezione">Trova l'equipaggiamento
					migliore nel nostro mercatino o vendi l'attrezzatura che non usi
					pi�</div>


				<c:forEach items="${annunci}" var="annuncio" varStatus="loop">
					<div
						class="${classeGrafica[loop.index]} col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a
							href="${pageContext.request.contextPath}/annuncio/bachecaAnnunci?pageNum=0">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/annunci/big/${annuncio.immagine}"
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
	</section>
	<!--fine sezione annunci con numero di card fisse -->


	<%@include file="/layout/footer.jsp"%>

</body>
</html>
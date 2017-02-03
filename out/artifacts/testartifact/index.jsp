<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GoSoftair</title>
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/slick/slick/slick.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/slick/slick/slick-theme.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/customCSS/home.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/slick/slick/slick.min.js"></script>
</head>
<body>
	<%@include file="/layout/navbar.jsp"%>

	<!--Immagine di compertina, jumbotron -->
	<section>
		<div class="container-fluid jumboPadding">
			<row>
			<div class="jumbotron">
				<div class=" text-center">
					<h1 class="titolo">Frase ad effetto</h1>
					<p class="sottotitolo">un'altra frase ad effetto, o forse no</p>
					<p></p>
				</div>
			</div>
			</row>
		</div>
	</section>

	<!--sezione eventi -->
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 SezEventi">
					<div class="titoloSezione">
						Partite
					</div>
					<div class="autoplay">
						<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
							<a href="${pageContext.request.contextPath}/views/evento/dettagli?idEvento=0">
								<div class="carta">
									<img
										src="${pageContext.request.contextPath}/resources/img/jumbo1.jpg"
										class="img-responsive ">
									<div class="contenuto">
										<div>
											<p class="nome">Partita 1</p>
										</div>
										<div>
											<p class="descrizione">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
							<a href="${pageContext.request.contextPath}/views/evento/dettagli">
								<div class="carta">
									<img
										src="${pageContext.request.contextPath}/resources/img/jumbo2.jpg"
										class="img-responsive ">
									<div class="contenuto">
										<div>
											<p class="nome">Partita 2</p>
										</div>
										<div>
											<p class="descrizione">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										</div>
									</div>

								</div>
							</a>
						</div>
						<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
							<a href="${pageContext.request.contextPath}/views/evento/dettagli">
								<div class="carta">
									<img
										src="${pageContext.request.contextPath}/resources/img/jumbo3.jpg"
										class="img-responsive ">
									<div class="contenuto">
										<div>
											<p class="nome">Partita 3</p>
										</div>
										<div>
											<p class="descrizione">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
							<a href="${pageContext.request.contextPath}/views/evento/dettagli">
								<div class="carta">
									<img
										src="${pageContext.request.contextPath}/resources/img/jumbo4.jpg"
										class="img-responsive ">
									<div class="contenuto">
										<div>
											<p class="nome">Partita 4</p>
										</div>
										<div>
											<p class="descrizione">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
							<a href="${pageContext.request.contextPath}/views/evento/dettagli">
								<div class="carta">
									<img
										src="${pageContext.request.contextPath}/resources/img/jumbo5.jpg"
										class="img-responsive ">
									<div class="contenuto">
										<div>
											<p class="nome">Partita 5</p>
										</div>
										<div>
											<p class="descrizione">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										</div>
									</div>
								</div>
							</a>
						</div>
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
					<div class="titoloSezione">
						Annunci
					</div>
					<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a href="#">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/jumbo2.jpg"
									class="img-responsive ">
								<div class="contenuto">
									<div>
										<p class="nome">Articolo 1</p>
									</div>
									<div>
										<p class="descrizione">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="hidden-xs col-lg-4 col-md-6 col-sm-6">
						<a href="#">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/jumbo4.jpg"
									class="img-responsive ">
								<div class="contenuto">
									<div>
										<p class="nome">Articolo 2</p>
									</div>
									<div>
										<p class="descrizione">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="hidden-md  hidden-xs hidden-sm  col-lg-4">
						<a href="#">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/jumbo3.jpg"
									class="img-responsive ">
								<div class="contenuto">
									<div>
										<p class="nome">Articolo 3</p>
									</div>
									<div>
										<p class="descrizione">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--fine sezione annunci con numero di card fisse -->


	<%@include file="/layout/footer.jsp"%>

	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/home.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
</body>
</html>
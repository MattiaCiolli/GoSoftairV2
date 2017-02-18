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
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/bachecaAnnunci.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/home.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/profilo.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700'
	rel='stylesheet' type='text/css'>

<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
</head>

<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp"%>

	<!-- edit-modal 1 -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">

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
								<p class="list-group-item-text fontMaiuscola">Arma 1</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Descrizione:</h4>
								<p class="list-group-item-text fontMaiuscola">Lorem ipsum
									dolor sit amet, consectetur adipiscing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Prezzo:</h4>
								<p class="list-group-item-text fontMaiuscola">50$</p>
							</a>
						</div>

					</div>

					<div class="col-md-6 col-lg-6">
						<img id="imgAnnuncio"
							src="${pageContext.request.contextPath}/resources/img/arma1.gif" />
					</div>

					<div class="col-md-12 col-lg-12">
						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Contatti:</h4>
								<p class="list-group-item-text fontMaiuscola">3333333333</p>
							</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>
	<!-- fine modal 1-->

	<!-- edit-modal 2 -->
	<div class="modal fade" id="modal2" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">

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
								<p class="list-group-item-text fontMaiuscola">Arma 2</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Descrizione:</h4>
								<p class="list-group-item-text fontMaiuscola">Lorem ipsum
									dolor sit amet, consectetur adipiscing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Prezzo:</h4>
								<p class="list-group-item-text fontMaiuscola">100$</p>
							</a>
						</div>

					</div>

					<div class="col-md-6 col-lg-6">
						<img id="imgAnnuncio"
							src="${pageContext.request.contextPath}/resources/img/arma2.jpg" />
					</div>

					<div class="col-md-12 col-lg-12">
						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Contatti:</h4>
								<p class="list-group-item-text fontMaiuscola">3333333333</p>
							</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>
	<!-- fine modal 2-->

	<!-- edit-modal 3 -->
	<div class="modal fade" id="modal3" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">

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
								<p class="list-group-item-text fontMaiuscola">G36K</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Descrizione:</h4>
								<p class="list-group-item-text fontMaiuscola">Lorem ipsum
									dolor sit amet, consectetur adipiscing elit, sed do eiusmod
									tempor incididunt ut labore et dolore magna aliqua.</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Prezzo:</h4>
								<p class="list-group-item-text fontMaiuscola">50$</p>
							</a>
						</div>

					</div>

					<div class="col-md-6 col-lg-6">
						<img id="imgAnnuncio"
							src="${pageContext.request.contextPath}/resources/img/arma3.jpg" />
					</div>

					<div class="col-md-12 col-lg-12">
						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Contatti:</h4>
								<p class="list-group-item-text fontMaiuscola">3333333333</p>
							</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>
	<!-- fine modal3-->

	<!-- inizio -->
	<div class="bachecaAnnunci ">
		<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="text-center">Mercatino</h1>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<a data-toggle="modal" data-target="#modal">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/arma1.gif"
									class="img-carta" alt="...">
								<div class="caption">
									<h3 style="text-align: center">Arma 1</h3>
									<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit
										amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<a data-toggle="modal" data-target="#modal2">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/arma2.jpg"
									class="img-carta" alt="...">
								<div class="caption">
									<h3 style="text-align: center">Arma 2</h3>
									<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit
										amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<a data-toggle="modal" data-target="#modal3">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/arma3.jpg"
									class="img-carta" alt="...">
								<div class="caption">
									<h3 style="text-align: center">Arma 3</h3>
									<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit
										amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		</section>

		<section>
		<div class="container-fluid">
			<div class="row spazioSopra">
				<div class="col-lg-12">
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<a data-toggle="modal" data-target="#modal">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/arma1.gif"
									class="img-carta" alt="...">
								<div class="caption">
									<h3 style="text-align: center">Arma 4</h3>
									<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit
										amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<a data-toggle="modal" data-target="#modal2">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/arma2.jpg"
									class="img-carta" alt="...">
								<div class="caption">
									<h3 style="text-align: center">Arma 5</h3>
									<p class="descrizione fontMaiuscola">DLorem ipsum dolor sit
										amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<a data-toggle="modal" data-target="#modal3">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/arma3.jpg"
									class="img-carta" alt="...">
								<div class="caption">
									<h3 style="text-align: center">Arma 6</h3>
									<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit
										amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		</section>

		<section>
		<div class="container-fluid">
			<div class="row spazioSopra">
				<div class="col-lg-12">
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<a data-toggle="modal" data-target="#modal">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/arma1.gif"
									class="img-carta" alt="...">
								<div class="caption">
									<h3 style="text-align: center">Arma 7</h3>
									<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit
										amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4"
						style="margin-bottom: 3%">
						<a data-toggle="modal" data-target="#modal2">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/arma2.jpg"
									class="img-carta" alt="...">
								<div class="caption">
									<h3 style="text-align: center">Arma 8</h3>
									<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit
										amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
						<a data-toggle="modal" data-target="#modal3">
							<div class="cartaScura">
								<img
									src="${pageContext.request.contextPath}/resources/img/arma3.jpg"
									class="img-carta" alt="...">
								<div class="caption">
									<h3 style="text-align: center">Arma 9</h3>
									<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit
										amet, consectetur adipiscing elit, sed do eiusmod tempor
										incididunt ut labore et dolore magna aliqua.</p>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		</section>

		<div class="centra">
			<ul class="pagination">
				<li class="active"><a href="#">1</a></li>
				<li><a
					href="${pageContext.request.contextPath}/titles/bachecaAnnunci2.jsp">2</a></li>
			</ul>
		</div>
	</div>

	<%@include file="/layout/footer.jsp"%>

</body>
</html>
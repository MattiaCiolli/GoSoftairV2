<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<link href="${pageContext.request.contextPath}/resources/customCSS/profilo.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>

<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
</head>

<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>
	
	<!-- inizio -->
	<div class="bachecaPartite">
		<section>
			<div class="container-fluid">
				<div class="row">
					<h1 class="text-center"> Partite </h1>
					<div class="col-lg-12">
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
							<a href="${pageContext.request.contextPath}/views/evento/dettagli">
								<div class="carta">
									<img src="${pageContext.request.contextPath}/resources/img/evento1.jpg" class="img-carta"alt="...">
									<div class="caption">
										<h3 style="text-align:center">La Valle della Morte</h3>
										<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
							<a href="#">
								<div class="carta">
									<img src="${pageContext.request.contextPath}/resources/img/evento2.jpeg" class="img-carta"alt="...">
									<div class="caption">
										<h3 style="text-align:center">Partita 2</h3>
										<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
							<a href="#">
								<div class="carta">
									<img src="${pageContext.request.contextPath}/resources/img/evento3.jpg" class="img-carta"alt="...">
									<div class="caption">
										<h3 style="text-align:center">Partita 3</h3>
										<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
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
							<a href="#">
								<div class="carta">
									<img src="${pageContext.request.contextPath}/resources/img/evento1.jpg" class="img-carta"alt="...">
									<div class="caption">
										<h3 style="text-align:center">Partita 4</h3>
										<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
							<a href="#">
								<div class="carta">
									<img src="${pageContext.request.contextPath}/resources/img/evento2.jpeg" class="img-carta"alt="...">
									<div class="caption">
										<h3 style="text-align:center">Partita 5</h3>
										<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
							<a href="#">
								<div class="carta">
									<img src="${pageContext.request.contextPath}/resources/img/evento3.jpg" class="img-carta"alt="...">
									<div class="caption">
										<h3 style="text-align:center">Partite 6</h3>
										<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
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
				<div class="row spazioSopra spazioSotto">
					<div class="col-lg-12">
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
							<a href="#">
								<div class="carta">
									<img src="${pageContext.request.contextPath}/resources/img/evento1.jpg" class="img-carta"alt="...">
									<div class="caption">
										<h3 style="text-align:center">Partita 7</h3>
										<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
							<a href="#">
								<div class="carta">
									<img src="${pageContext.request.contextPath}/resources/img/evento2.jpeg" class="img-carta"alt="...">
									<div class="caption">
										<h3 style="text-align:center">Partita 8</h3>
										<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</a>
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
							<a href="#">
								<div class="carta">
									<img src="${pageContext.request.contextPath}/resources/img/evento3.jpg" class="img-carta"alt="...">
									<div class="caption">
										<h3 style="text-align:center">Partita 9</h3>
										<p class="descrizione fontMaiuscola">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
<div style="text-align:center">
<ul class="pagination">
  <li><a href="${pageContext.request.contextPath}/views/evento/bachecaPartite.jsp">1</a></li>
  <li class="active"><a href="#">2</a></li>
</ul>
</div>
	</div>
	
	<%@include file="/layout/footer.jsp" %>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
</body>
</html>

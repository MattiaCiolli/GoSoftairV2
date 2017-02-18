<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>GoSoftair</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/bachecaEventi.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/home.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/profilo.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>

<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
</head>

<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>
	
	<!-- inizio -->
	<div class="container-fluid bachecaEventi">
		<section>
			<div class="row">
				<h1 class="text-center"> Eventi </h1>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    					<div class="carta">
      						<img src="${pageContext.request.contextPath}/resources/img/evento1.jpg" class="img-carta"alt="...">
      							<div class="caption">
        							<h3 style="text-align:center">La Valle della Morte</h3>
	        							<p style="text-align:center">Descrizione dell'evento</p>
	        								<h4 style="text-align:center"><a href="evento.jsp" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      							</div>
    					</div>
  					</div>
  					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    					<div class="carta">
      						<img src="${pageContext.request.contextPath}/resources/img/evento2.jpeg" class="img-carta"alt="...">
      							<div class="caption">
        							<h3 style="text-align:center">Evento 2</h3>
	        							<p style="text-align:center">Descrizione dell'evento</p>
	        								<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      							</div>
    					</div>
  					</div>
  					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    					<div class="carta">
      						<img src="${pageContext.request.contextPath}/resources/img/evento3.jpg" class="img-carta"alt="...">
      							<div class="caption">
        							<h3 style="text-align:center">Evento 3</h3>
	        							<p style="text-align:center">Descrizione dell'evento</p>
	        								<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      							</div>
    					</div>
  					</div>
			</div>
		</section>
				<section>
			<div class="row" style="margin-top:15px;">
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    					<div class="carta">
      						<img src="${pageContext.request.contextPath}/resources/img/evento1.jpg" class="img-carta"alt="...">
      							<div class="caption">
        							<h3 style="text-align:center">Evento 4</h3>
	        							<p style="text-align:center">Descrizione dell'evento</p>
	        								<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      							</div>
    					</div>
  					</div>
  					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    					<div class="carta">
      						<img src="${pageContext.request.contextPath}/resources/img/evento2.jpeg" class="img-carta"alt="...">
      							<div class="caption">
        							<h3 style="text-align:center">Evento 5</h3>
	        							<p style="text-align:center">Descrizione dell'evento</p>
	        								<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      							</div>
    					</div>
  					</div>
  					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    					<div class="carta">
      						<img src="${pageContext.request.contextPath}/resources/img/evento3.jpg" class="img-carta"alt="...">
      							<div class="caption">
        							<h3 style="text-align:center">Evento 6</h3>
	        							<p style="text-align:center">Descrizione dell'evento</p>
	        								<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      							</div>
    					</div>
  					</div>
			</div>
		</section>
				<section>
			<div class="row" style="margin-top:15px";>
					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    					<div class="carta">
      						<img src="${pageContext.request.contextPath}/resources/img/evento1.jpg" class="img-carta"alt="...">
      							<div class="caption">
        							<h3 style="text-align:center">Evento 7</h3>
	        							<p style="text-align:center">Descrizione dell'evento</p>
	        								<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      							</div>
    					</div>
  					</div>
  					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    					<div class="carta">
      						<img src="${pageContext.request.contextPath}/resources/img/evento2.jpeg" class="img-carta"alt="...">
      							<div class="caption">
        							<h3 style="text-align:center">Evento 8</h3>
	        							<p style="text-align:center">Descrizione dell'evento</p>
	        								<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      							</div>
    					</div>
  					</div>
  					<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    					<div class="carta">
      						<img src="${pageContext.request.contextPath}/resources/img/evento3.jpg" class="img-carta"alt="...">
      							<div class="caption">
        							<h3 style="text-align:center">Evento 9</h3>
	        							<p style="text-align:center">Descrizione dell'evento</p>
	        								<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      							</div>
    					</div>
  					</div>
			</div>
		</section>
	</div>

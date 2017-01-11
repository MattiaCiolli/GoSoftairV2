<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>GoSoftair</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/home.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
	

</head>
<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>

	<!--Immagine di compertina, jumbotron -->
	<div class="col-lg-12  jumbotron">
		<div class=" text-center">
		  <h1 class="titolo">Frase ad effetto</h1>
		  <p class="sottotitolo">un'altra frase ad effetto, o forse no</p>
		  <p></p>
		</div>
	</div>

	<!--sezione eventi con carousel slide -->
	<div class="col-md-12 SezEventi">
		<div class="carousel slide" id="myCarousel">
		  <div class="carousel-inner">
				<div class="item active">
				  <div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
					  <a href="#">
						  <div class="carta">
							<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo1.jpg" class="img-responsive ">
							<div class="scemo"><p>1</p></div>
						  </div>
					  </a>
				  </div>
				</div>
				<div class="item">
					<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a href="#">
							<div class="carta">
								<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo2.jpg" class="img-responsive ">
								<div class="scemo"><p>2</p></div>
							</div>
						</a>
					</div>
				</div>
				<div class="item">
					<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a href="#">
							<div class="carta">
								<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo3.jpg" class="img-responsive ">
								<div class="scemo"><p>3</p></div>
							</div>
						</a>
					</div>
				</div>
				<div class="item">
					<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a href="#">
							<div class="carta">
								<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo4.jpg" class="img-responsive ">
								<div class="scemo"><p>4</p></div>
							</div>
						</a>
					</div>
				</div>
				<div class="item">
					<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a href="#">
							<div class="carta">
								<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo5.jpg" class="img-responsive ">
								<div class="scemo"><p>5</p></div>
							</div>
						</a>
					</div>
				</div>
				<div class="item">
					<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a href="#">
							<div class="carta">
								<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo3.jpg" class="img-responsive ">
								<div class="scemo"><p>6</p></div>
							</div>
						</a>
					</div>
				</div>
				<div class="item">
					<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a href="#">
							<div class="carta">
								<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo4.jpg" class="img-responsive ">
								<div class="scemo"><p>7</p></div>
							</div>
						</a>
					</div>
				</div>
				<div class="item">
					<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
						<a href="#">
							<div class="carta">
								<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo5.jpg" class="img-responsive ">
								<div class="scemo"><p>8</p></div>
							</div>
						</a>
					</div>
				</div>
		  </div>
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
		</div>
	</div>
	<!--fine sezione eventi con carousel slide -->


	<!--sezione annunci con numero di card fisse -->
	<div class="col-lg-12 col-xs-12 col-md-12 col-sm-12 SezAnnunci">
		<div class="col-lg-4 col-xs-12 col-md-6 col-sm-6">
			<a href="#">
				<div class="cartaScura">
					<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo5.jpg" class="img-responsive ">
					<div class="scemo"><p>8</p></div>
				</div>
			</a>
		</div>
		<div class="hidden-xs col-lg-4 col-md-6 col-sm-6">
			<a href="#">
				<div class="cartaScura">
					<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo4.jpg" class="img-responsive ">
					<div class="scemo"><p>8</p></div>
				</div>
			</a>
		</div>
		<div class="hidden-md  hidden-xs hidden-sm  col-lg-4">
			<a href="#">
				<div class="cartaScura">
					<img src="${pageContext.request.contextPath}/resources/customCSS/images/jumbo3.jpg" class="img-responsive ">
					<div class="scemo"><p>8</p></div>
				</div>
			</a>
		</div>
	</div>
	<!--fine sezione annunci con numero di card fisse -->

	<div class="col-lg-12 footer">
		<p>ciaoooooooooooooooooooooooooooooooooooooooooooooooooooo</p>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/home.js"></script>
</body>
</html>
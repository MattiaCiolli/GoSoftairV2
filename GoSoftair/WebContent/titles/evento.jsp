<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Pagina Del Match</title>
		
		<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.min.css"	rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.structure.min.css"	rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.theme.min.css"	rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/customCSS/weather-icons.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/customCSS/weather-icons-wind.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/customCSS/event.css" rel="stylesheet">
		
		<style type="text/css">
    		#map {
      			width: 100%;
      			height: 400px;
    		}
		</style>
		<!-- <script src="${pageContext.request.contextPath}/resources/js/gmaps.min.js"></script> -->
	</head>
	<body>
		<%@include file="/layout/navbar.jsp"%>
		<section style="margin-top:60px;">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h1 class="title-event">La valle della morte</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						 <img src="${pageContext.request.contextPath}/resources/img/immagine_evento.jpg" class="img-responsive" alt="Cinque Terre"> 
					</div>
					<div class="col-md-6">
						<div class="row event-description">
							<div class="span-master col-md-6">
								<span>Data:</span>
							</div>
							<div class="span-master-2 col-md-6">
								<span>04/01/2017</span> 
							</div>
						</div>
						<div class="row event-description">
							<div class="span-master col-md-6">
								<span>Ora:</span>
							</div>
							<div class="span-master-2 col-md-6">
								<span>9:00-12:00</span>
							</div>
						</div>
						<div class="row event-description">
							<div class="span-master col-md-6">
								<span>Punto di incontro:</span>
							</div>
							<div class="span-master-2 col-md-6">
								<span>Università</span>
							</div>
						</div>
						<div class="row event-description">
							<div class="span-master col-md-7">
								<span>Numero Max partecipanti:</span> 
							</div>
							<div class="span-master-2 col-md-5">
								<span>10</span>
							</div>
						</div>
						<div class="row event-description">
							<div class="span-master col-md-6">
								<span class="">Tipo partita:</span> 
							</div>
							<div class="span-master-2 col-md-6">
								<span>Dead match</span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
									<div class="days">
										<div class="row row-no-gutter">
											<div class="col-md-4">
												<div class="card-weather">
													<div class="info">
														<div class="night">9:00-10:00</div>
														<div class="temp">3°</div>
														<div class="wind">
															<i class="wi wi-strong-wind"></i>
															<span>25 km/h</span>
															<i class="wi wi-wind wi-towards-ne"></i>
														</div>
													</div>
													<div class="icon">
														<i class="wi wi-day-sunny"></i>
													</div>
												</div>
											</div>
											<div class="col-md-4 divisor">
												<div class="card-weather">
													<div class="info">
														<div class="night">10:00-11:00</div>
														<div class="temp">2°</div>
														<div class="wind">
															<i class="wi wi-strong-wind"></i>
															<span>25 km/h</span>
														</div>
													</div>
													<div class="icon">
														<i class="wi wi-day-cloudy"></i>
													</div>
												</div>
											</div>
				
											<div class="col-md-4">
												<div class="card-weather">
													<div class="info">
														<div class="night">11:00-12:00</div>
														<div class="temp">2°</div>
														<div class="wind">
															<i class="wi wi-strong-wind"></i>
															<span>25 km/h</span>
														</div>
													</div>
													<div class="icon">
														<i class="wi wi-day-cloudy"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-center">
							<h3>Descrizione</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-justify">
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae dui velit. 
							Sed ac pharetra quam, in feugiat leo. Vestibulum ultrices elit sed odio lacinia, 
							pulvinar pellentesque quam vulputate. Pellentesque habitant morbi tristique 
							senectus et netus et malesuada fames ac turpis egestas. Donec ut feugiat ipsum. 
							Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse ullamcorper, 
							ligula a viverra laoreet, lectus nisl condimentum mauris, et condimentum leo libero 
							hendrerit mauris. Etiam mollis, risus vel ultrices pellentesque, turpis arcu pulvinar 
							libero, ut porttitor nunc sem nec ex. Integer sed arcu tincidunt, tincidunt lectus 
							vitae, sagittis velit. Ut massa diam, porta quis tincidunt vitae, volutpat vel magna. 
							Fusce sagittis, dui luctus ultricies tristique, augue odio blandit sapien, vitae dapibus 
							odio libero eget erat. Phasellus maximus neque at convallis lacinia. Sed suscipit, 
							lectus sed ullamcorper iaculis, massa metus luctus erat, at molestie ante purus ac nibh. 
							Phasellus at ex odio. 
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="team_select" style="margin-top:60px;">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="team_select_card">
							<h1 class="squadra text-center">Squadra 1</h1>
							<ul>
								<li class="team-member">Davide</li>
								<li class="team-member">Mattia</li>
							</ul>
						</div>
					</div>
					<div class="col-md-6">
						<div class="team_select_card">
							<h1 class="squadra text-center">Squadra 2</h1>
							<ul>
								<li class="team-member">Matteo</li>
								<li class="team-member">Niccolo</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section style="margin-top:60px;">
			<div class="container">
				<div class="row">
					<div id="map"></div>
				</div>
			</div>
		</section>
	</body>
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-ui/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
  	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAq8UAokX0-7blk-4iL6RVXrgzPlcS606I&callback=initMap" async defer></script>
	<script>
		function initMap() {
		    var uluru = {lat: 42.368943, lng: 13.349799};
		    var map = new google.maps.Map(document.getElementById('map'), {
		   		zoom: 16,
		        center: uluru
		    });

	        //var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
	        
		    var marker = new google.maps.Marker({
		    	position: uluru,
		        map: map
	            //icon: '${pageContext.request.contextPath}/resources/img/profile.jpg'
		    });
	   	}
	</script>
</html>
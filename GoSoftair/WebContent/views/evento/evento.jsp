<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

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
		<section style="margin-top:10px;">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<h1 class="title-event">${evento.titolo}</h1>
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
								<span>${evento.data}</span> 
							</div>
						</div>
						<div class="row event-description">
							<div class="span-master col-md-6">
								<span>Punto di incontro:</span>
							</div>
							<div class="span-master-2 col-md-6">
								<span>${evento.puntoIncontro}</span>
							</div>
						</div>
						<div class="row event-description">
							<div class="span-master col-md-7">
								<span>Numero Max partecipanti:</span> 
							</div>
							<div class="span-master-2 col-md-5">
								<span>${evento.numMaxPartecipanti}</span>
							</div>
						</div>
						<div class="row event-description">
							<div class="span-master col-md-6">
								<span class="">Tipo partita:</span> 
							</div>
							<div class="span-master-2 col-md-6">
								<span>${evento.tipologia}</span>
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
							${evento.descrizione}
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="team_select" style="margin-top:60px;">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="team_select_card" id="squadra1">
							<h1 class="squadra text-center">Squadra 1</h1>
							<ul id="squadra1List">
								<c:forEach items="${evento.squadre.squadra1}" var="utente">
									<li class="team-member">${utente.nickname}</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="col-md-6">
						<div class="team_select_card" id="squadra2">
							<h1 class="squadra text-center">Squadra 2</h1>
							<ul id="squadra2List">
								<c:forEach items="${evento.squadre.squadra2}" var="utente">
									<li class="team-member">${utente.nickname}</li>
								</c:forEach>
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
		<section style="margin-top:60px">
			<div class="container">
				<div class="row text-center">
					<h3>Leave a comment</h3>
				</div>
				<div class="row">
					<div class="col-md-1">
						<img src="${pageContext.request.contextPath}/resources/img/profile_images/profile.jpg" class="img-responsive">
					</div>
					<div class="col-md-7">
						<form action="" method="post">
							<input type="text" name="postText" placeholder="Insersci un commento">
  							<input type="text" name="idUtente" value="<%= session.getAttribute("idUtente") %>" hidden>
  							<input type="text" name="idEvento" value="${evento.id}" hidden>
  							<input type="submit" value="Inserisci">
						</form>
					</div>
				</div>
				<c:forEach items="${evento.posts}" var="post">
					<div class="row">
						<div class="col-md-1">
							<img src="${pageContext.request.contextPath}/resources/img/profile_images/profile.jpg" class="img-responsive">
						</div>
						<div class="col-md-9">
							<p>${post.utente.nickname}</p><span>${post.data}</span>
							<p>${post.messaggio}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
		
		<%@include file="/layout/footer.jsp"%>
	</body>
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-ui/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
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
		
		var squadra1 = document.getElementById('squadra1');
		squadra1.onclick = function() {
			var name = "<%= session.getAttribute("nickname") %>";
			var matches = $( 'ul#squadra1List' ).find( 'li:contains(' + name + ')' );
			if(matches.length == 0) {
				var data = "<%= session.getAttribute("idUtente") %>" + " 1";
				$.post("${pageContext.request.contextPath}" + "/post/scegli-squadra", {data: data}, function(result){
					if(result == 1) {
						$('ul#squadra1List').append('<li class="team-member">' + name + '</li>');
						var elementToRemove = $( 'ul#squadra2List' ).find( 'li:contains(' + name + ')');
						if(elementToRemove.length == 1) {
							elementToRemove.remove();
						}
				    };
				});
			}
		}
		
		var squadra2 = document.getElementById('squadra2');
		squadra2.onclick = function() {
			var name = "<%= session.getAttribute("nickname") %>";
			var matches = $( 'ul#squadra2List' ).find( 'li:contains(' + name + ')' );
			if(matches.length == 0) {
				var data = "<%= session.getAttribute("idUtente") %>" + " 2";
				$.post("${pageContext.request.contextPath}" + "/post/scegli-squadra", {data: data}, function(result){
					if(result == 1) {
						$('ul#squadra2List').append('<li class="team-member">' + name + '</li>');
						var elementToRemove = $( 'ul#squadra1List' ).find( 'li:contains(' + name + ')');
						if(elementToRemove.length == 1) {
							elementToRemove.remove();
						}
				    };
				});
			}
		}
	</script>
</html>



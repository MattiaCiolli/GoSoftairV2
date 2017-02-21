<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Pagina Del Match</title>

<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.structure.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.theme.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/customCSS/event.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/customCSS/partitaInCorso.css" rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/jquery-ui/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Termina Evento</h4>
				</div>
				<div class="modal-body">
					<p>
						Clicca su "Cancella Evento" se vuoi eliminare l'evento
						oppure "Aggiorna Data" se vuoi riprorlo con una nuova data.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn bottonenav" data-dismiss="modal" id="delete-event">Cancella Evento</button>
					<a class="btn bottonenav" href="${pageContext.request.contextPath}/evento/update?idEvento=${evento.id}">Riproponi Evento</a>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/layout/navbar.jsp"%>
	<section class="event-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h1 class="title-event">${evento.titolo}</h1>
			</div>
			<c:choose>
				<c:when test="${termina_evento}">
					<div class="row">
						<div class="col-md-12 text-center">
							<button type="button" class="btn bottonenav" id="end-event"
								data-toggle="modal" data-target="#myModal">Termina
								l'evento</button>
						</div>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
	</section>
	<section class="event-section">
	<div class="container">

		<div class="row">
			<div class="map" id="map"></div>
		</div>
		<div id="out"></div>

		<div class="row" style="margin-top: 10px">
			<div class="col-xs-3 col-sm-3 col-md-3 text-center">
				<button type="button" class="btn button-console btn-red" id="attach">Attacchiamo</button>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 text-center">
				<button type="button" class="btn button-console btn-blue"
					id="defend">Copritemi</button>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 text-center">
				<button type="button" class="btn button-console btn-orange"
					id="retreat">Rtirata</button>
			</div>
			<div class="col-xs-3 col-sm-3 col-md-3 text-center">
				<button type="button" class="btn button-console" id="rest">Riposo</button>
			</div>
		</div>
	</div>
	</section>
	<%@include file="/layout/footer.jsp"%>
</body>
<script src="${pageContext.request.contextPath}/resources/datetimepicker/moment-with-locales.js"></script>
<script src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAq8UAokX0-7blk-4iL6RVXrgzPlcS606I&callback=initMap" async defer></script>
<script>
	var map;
	var bounds;
	var infoWindow;
	var markers = {};
	var immagine = "2";
	
    function initMap() {
    	
        bounds = new google.maps.LatLngBounds();
        var mapOptions = {
            mapTypeId: 'roadmap'
        };

        // Display a map on the page
        map = new google.maps.Map(document.getElementById("map"), mapOptions);
        map.setTilt(45);

        // Display multiple markers on a map
        //infoWindow = new google.maps.InfoWindow(), marker, i;
    }
    
    document.getElementById("attach").onclick = function() {attach()};
    document.getElementById("defend").onclick = function() {defend()};
    document.getElementById("rest").onclick = function() {rest()};


    function attach() {
    	immagine = "0";
    }
    
    function defend() {
    	immagine = "1";
    }
    
    function rest() {
    	immagine = "2";
    }
    
    var intervalID = setInterval( function() {
	    	var output = document.getElementById("out");
	
	  	  	if (!navigator.geolocation){
	  	    	output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
	  	    	return;
	  	  	}
	
	  	  	function success(position) {
	  	    	var latitude  = position.coords.latitude;
	  	    	var longitude = position.coords.longitude;
	  	    	var url = "${pageContext.request.contextPath}/views/evento/incorso";
	  	    	
	  	    	$.post(url, { lat: latitude, lon: longitude, idEvento: 0, img: immagine },function(results) {
	  	    			results = JSON.parse(results);	 
	  	    			jQuery.each(results.coordinates, function(i, val) {
	  	    				if(markers[val.idGiocatore] == undefined) 
	  	    				{
	  	    					var position = new google.maps.LatLng(val.lat, val.lon);
		  	    				bounds.extend(position);
		  	    				
		  	    			  	var marker = new google.maps.Marker({
		  	    	            	position: position,
		  	    	                map: map,
		  	    	                title: val.idGiocatore,
		  	    	                icon: '${pageContext.request.contextPath}/resources/img/profile_images/' + val.immagine
		  	    	            }, "<h1>Marker 0</h1><p>This is the home marker.</p>");
		  	    			  	
		  	    			  	// Allow each marker to have an info window
		  	    	            google.maps.event.addListener(marker, 'click', (function(marker, i) {
		  	    	                return function() {
		  	    	                    infoWindow.setContent(infoWindowContent[i][0]);
		  	    	                    infoWindow.open(map, marker);
		  	    	                }
		  	    	            })(marker, i));

		  	    	            // Automatically center the map fitting all markers on the screen
		  	    	            map.fitBounds(bounds);
		  	    	            
		  	    	            markers[val.idGiocatore] = marker;
	  	    				}else {
	  	    					var position = new google.maps.LatLng(val.lat, val.lon);
		  	    	            markers[val.idGiocatore].setPosition(position);
		  	    	            markers[val.idGiocatore].setIcon("${pageContext.request.contextPath}/resources/img/profile_images/" + val.immagine);
	  	    				}
	  	    			});
	  	    		}
	  	    	);
	  	  	}
	  	  	
	  	  	function error() {
	  	   		output.innerHTML = "Unable to retrieve your location";
	  	  	}
	
	  	  	output.innerHTML = "<p>Locating…</p>";
	  	  	navigator.geolocation.getCurrentPosition(success, error);
	  	  	
    }, 5000);
 
    
	var startdate = new Date();//today
	startdate.setDate(startdate.getDate() + 1);//tomorrow
	
	$(document).ready(function(){
		$('#datetimepicker1').datetimepicker({
			locale : "it",
			minDate : startdate,
		});
    });	
	
	$("#delete-event").click(function() {
		$.post("${pageContext.request.contextPath}/evento/cancella?idEvento=${evento.id}", function(results) {
			if(result == 1) {
				window.location.replace = "${pageContext.request.contextPath}/";
			}
		});

	});
</script>
</html>

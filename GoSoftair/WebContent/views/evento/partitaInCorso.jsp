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
            height: 500px;
        }
    </style>
    <!-- <script src="${pageContext.request.contextPath}/resources/js/gmaps.min.js"></script> -->
</head>
<body>
<%@include file="/layout/navbar.jsp"%>
<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <h1 class="title-event">La valle della morte</h1>
            </div>
        </div>
    </div>
</section>
<section style="margin-bottom:30px;">
    <div class="container">
        <div class="row">
            <div id="map"></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="button">
                    <button type="button" class="btn btn-default" id="attach" aria-label="Left Align">
                        <span class="glyphicon glyphicon-align-left" aria-hidden="true">Attacchiamo</span>
                    </button>
                </div>
            </div>
            <div class="col-md-4">
                <button type="button" class="btn btn-default" aria-label="Left Align">
                    <span class="glyphicon glyphicon-align-left" aria-hidden="true">Copritemi</span>
                </button>
            </div>
            <div class="col-md-4">
                <button type="button" class="btn btn-default" aria-label="Left Align">
                    <span class="glyphicon glyphicon-align-left" aria-hidden="true">Ritirata</span>
                </button>
            </div>
            <div class="col-md-4">
                <button type="button" class="btn btn-default" aria-label="Left Align">
                    <span class="glyphicon glyphicon-align-left" aria-hidden="true">Assistenza</span>
                </button>
            </div>
        </div>
		<div id="out"></div>
    </div>
</section>
<%@include file="/layout/footer.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/jquery-ui/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
<script>
	var map;
	var bounds;
	var infoWindow;
	var markers = {};
	
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
    
    document.getElementById("attach").onclick = function() {attach(map)};

    function attach(mappa) {
        var addAttach = new google.maps.Circle({
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#FF0000',
            fillOpacity: 0.35,
            map: mappa,
            center: {lat: 42.368943, lng: 13.349999},
            radius: 15,
        });
    }
    
    var intervalID = setInterval( function() 
    	{
	    	var output = document.getElementById("out");
	
	  	  	if (!navigator.geolocation){
	  	    	output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
	  	    	return;
	  	  	}
	
	  	  	function success(position) {
	  	    	var latitude  = position.coords.latitude;
	  	    	var longitude = position.coords.longitude;
	  	    	var url = "${pageContext.request.contextPath}/views/evento/incorso";
	  	    	
	  	    	$.post( 
	  	    		url, 
	  	    		{ lat: latitude, lon: longitude, idUtente: <%= session.getAttribute("idUtente") %>, idEvento: 0 }, 
	  	    		function(results) {
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
		  	    	                icon: '${pageContext.request.contextPath}/resources/img/profile.jpg'
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
		  	    	            markers[val.idGiocatore].location = position;

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

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAq8UAokX0-7blk-4iL6RVXrgzPlcS606I&callback=initMap" async defer></script>

</html>
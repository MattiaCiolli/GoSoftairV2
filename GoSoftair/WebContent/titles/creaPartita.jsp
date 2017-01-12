<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>GoSoftair</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.structure.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.theme.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/fileinput/css/fileinput.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/customCSS/mycss.css"
	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/bootstrap/img/favicon.ico">
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/jquery-ui/js/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/datetimepicker/moment-with-locales.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery.validate.min.js"></script>
	<script
	src="${pageContext.request.contextPath}/resources/fileinput/js/fileinput.min.js"></script>

<!-- js delle pagine crea partita e annuncio -->	
		
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAq8UAokX0-7blk-4iL6RVXrgzPlcS606I&callback=initMap" async defer></script>	
	<script
	src="${pageContext.request.contextPath}/resources/customJS/creaPartita.js"></script>
	<script
	src="${pageContext.request.contextPath}/resources/customJS/creaAnnuncio.js"></script>
	

</head>

<body class="cssBody">
	<%@include file="/layout/navbar.jsp" %>
	<form id="partitaform">
		<div class="container">
			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="NomeEvento">Nome evento:</label> <input type="text"
							class="form-control" name="NomeEvento" id="NomeEvento">
					</div>
				</div>
			</div>

			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="Tipologia">Tipologia:</label> <select
							class="form-control" name="Tipologia" id="Tipologia">
							<option>Deathmatch a squadre</option>
							<option>Tutti contro tutti</option>
							<option>Cattura la bandiera</option>
							<option>Dominio</option>
						</select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="DataOra">Data e ora:</label>
						<div class='input-group date' id='datetimepicker1'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="NumPartecipanti">Numero di partecipanti:</label> <input
							type="number" class="form-control" name="NumPartecipanti"
							id="NumPartecipanti">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class='col-sm-12 col-md-6 col-lg-6 bg-scr'>
					<label for="Posizione">Posizione:</label>
				<div id="mapcont"></div>
			</div>
			</div>

			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4 limit'>
					<label for="Immagine">Immagine:</label>
					<div id="kv-avatar-errors-2" class="center-block"></div>
					<div class="kv-avatar center-block">
						<input id="Immagine" name="Immagine" type="file"
							class="file-loading">
					</div>
				</div>
			</div>
		
			</br>
			<button type="submit" id="creapartita" class="btn btn-success">Crea
				evento</button>
		</div>
	</form>
	<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
</body>
</html>











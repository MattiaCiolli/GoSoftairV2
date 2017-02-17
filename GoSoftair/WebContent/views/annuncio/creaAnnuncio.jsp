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
<link
	href="${pageContext.request.contextPath}/resources/customCSS/mycss.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/navbar.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700'
	rel='stylesheet' type='text/css'>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/bootstrap/img/favicon.ico">
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/jquery-ui/js/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/fileinput/js/fileinput.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/fileinput/js//locales/it.js"></script>
<!-- js delle pagine crea partita e annuncio -->

<script
	src="${pageContext.request.contextPath}/resources/customJS/creaAnnuncio.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>


</head>

<body id="sfondochiaro">
	<%@include file="/layout/navbar.jsp"%>
	
				<div class="container-fluid immagineSfondo">
					<div class="card" id="bianco">
						<form id="annuncioform"
							action="${pageContext.request.contextPath}/annuncio/nuovo"
							method="post" enctype="multipart/form-data">
							<div class="row">
								<div class='col-sm-4 col-md-4 col-lg-4'>
									<div class="form-group">
										<label for="Titolo">Titolo:</label> <input type="text"
											class="form-control" id="Titolo" name="Titolo">
									</div>
								</div>
							</div>

							<div class="row">
								<div class='col-sm-4 col-md-4 col-lg-4'>
									<div class="form-group">
										<label for="Descrizione">Descrizione:</label>
										<textarea rows="5" class="form-control" id="Descrizione"
											name="Descrizione"></textarea>
									</div>
								</div>
							</div>


							<div class="row">
								<div class='col-sm-4 col-md-4 col-lg-4'>
									<div class="form-group">
										<label for="Prezzo">Prezzo:</label>
										<div class="input-group">
											<input type="number" class="form-control" id="Prezzo"
												name="Prezzo" /> <span class="input-group-addon">$</span>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class='col-sm-4 col-md-4 col-lg-4'>
									<div class="form-group">
										<label for="NumTelefono">Telefono:</label>									
											<input type="number" class="form-control" id="NumTelefono"
												name="NumTelefono" />
										</div>
									</div>
								</div>
							

							<div class="row">
								<div class='col-sm-4 col-md-4 col-lg-4'>
									<div class="form-group">
										<label for="Email">E-Mail:</label>
											<input type="email" class="form-control" id="Email"
												name="Email" />
										</div>
									</div>
								</div>
							
							<div class="row">
								<div class='col-sm-4 col-md-4 col-lg-4' id="rowimg">
									<label for="Immagine">Immagine:</label>
									<div class="kv-avatar center-block">
										<input id="Immagine" name="Immagine" type="file"
											class="file-loading">
									</div>
									<div id="kv-avatar-errors-2" class="center-block"></div>
								</div>
							</div>

							<br />
							<button type="submit" id="inserisciannuncio"
								class="btn bottonenav">Inserisci annuncio</button>
					</div>
					</form>
				</div>
			</div>

			<%@include file="/layout/footer.jsp"%>
			<script
				src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
</body>
</html>

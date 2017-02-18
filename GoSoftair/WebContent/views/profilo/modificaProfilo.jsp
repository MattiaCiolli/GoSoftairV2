<!DOCTYPE html>
<html lang="it">
<head>
<meta charset=UTF-8">
<title>GoSoftair</title>

<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/event.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/home.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/profilo.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/fileinput/css/fileinput.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/customCSS/registrazione.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery.validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/customJS/registrazione.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/fileinput/js/fileinput.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/fileinput/js//locales/it.js"></script>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700'
	rel='stylesheet' type='text/css'>
</head>


<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp"%>

	<!-- inizio -->

	<div class="container-fluid sfondo">
		</br>
		<form id="formRegistrazione" class="form-horizontal contenitoreForm"
			role="form"
			action="${pageContext.request.contextPath}/profilo/updateUtente"
			method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-2 col-md-offset-1 sezutente">
					<label class="col-md-12 personalLabel2">Immagine profilo:</label>
					<div class="kv-avatar center-block">
						<input id="immagine" name="immagine" type="file"
							class="file-loading">
					</div>
					<div id="kv-avatar-errors-2" class="center-block"></div>
				</div>
				<div class="col-sm-12 col-md-9 sezutente">
					<div class="row">
						<div
							class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-lg-3 control-label personalLabel">Nome:</label>
								<div class="col-lg-8">
									<input class="form-control" id="nome" name="nome" type="text"
										value="${utente.nome}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div
							class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-lg-3 control-label personalLabel">Cognome:</label>
								<div class="col-lg-8">
									<input class="form-control" id="cognome" name="cognome"
										type="text" value="${utente.cognome}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div
							class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-lg-3 control-label personalLabel">Username:</label>
								<div class="col-lg-8">
									<input class="form-control" id="username" name="username"
										type="text" value="${utente.nickname}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div
							class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-md-3 control-label personalLabel">Email:</label>
								<div class="col-md-8">
									<input class="form-control" id="email" name="email"
										type="email" value="${utente.email}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div
							class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-md-3 control-label personalLabel">Numero
									Carta D'Identita:</label>
								<div class="col-md-8">
									<input class="form-control" id="documentoValido"
										name="documentoValido" type="text"
										value="${utente.documentoValido}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div
							class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-md-3 control-label personalLabel">Password:</label>
								<div class="col-md-8">
									<input class="form-control" id="password" name="password"
										type="password" value="${utente.password}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div
							class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-md-3 control-label personalLabel">Conferma
									password:</label>
								<div class="col-md-8">
									<input class="form-control" id="confermaPassword"
										name="confermaPassword" type="password"
										value="${utente.password}">
								</div>
							</div>
						</div>
					</div>
				</div>
				</br>
				<div class="row">
					<div
						class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-4 col-md-offset-4">
						<div class="form-group">
							<label class="col-md-3 control-label"></label>
							<div class="col-md-8">
								<input class="btn bottone1" id="creaUtente" value="Registrati"
									type="submit"> <span></span> <input
									class="btn bottone1" value="Annulla" type="reset">
							</div>
						</div>
					</div>
				</div>

			</div>
		</form>
	</div>

	<!-- fine -->
	<%@include file="/layout/footer.jsp"%>

</body>
</html>

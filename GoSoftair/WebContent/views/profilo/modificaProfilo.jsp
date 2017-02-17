
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GoSoftair</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/event.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/home.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/profilo.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/modificaProfilo.css" rel="stylesheet">
  	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>


<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>

<!-- inizio -->

<div class="container-fluid sfondo">
  </br>
 		<form id="formRegistrazione" class="form-horizontal contenitoreForm" role="form" action="${pageContext.request.contextPath}/profilo/updateUtente" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-2 col-md-offset-1 sezutente">
					<label class="col-md-12 personalLabel">Immagine profilo:</label>
					<div class="kv-avatar center-block">
						<input id="immagine" name="immagine" type="file"class="file-loading">
					</div>
									<div id="kv-avatar-errors-2" class="center-block"></div>
				</div>
				<div class="col-sm-12 col-md-9 sezutente">
					<div class="row">
						<div class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-lg-3 control-label personalLabel">Nome:</label>
								<div class="col-lg-8">
									<input class="form-control" id="nome" name="nome" type="text" value="${utente.nome}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
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
						<div class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-lg-3 control-label personalLabel">Nickname:</label>
								<div class="col-lg-8">
									<input class="form-control" id="nickname" name="nickname"
										type="text" value="${utente.nickname}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-md-3 control-label personalLabel">Email:</label>
								<div class="col-md-8">
									<input class="form-control" id="email" name="email" type="email" value="${utente.email}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-md-3 control-label personalLabel">Numero
									Carta D'Identita:</label>
								<div class="col-md-8">
									<input class="form-control" id="documentoValido"
										name="documentoValido" type="text" value="${utente.documentoValido}">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
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
						<div class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-8 col-md-offset-3">
							<div class="form-group">
								<label class="col-md-3 control-label personalLabel">Conferma
									password:</label>
								<div class="col-md-8">
									<input class="form-control" id="confermaPassword" name="confermaPassword" type="password" value="${utente.password}">
								</div>
							</div>
						</div>
					</div>
					</div>
					</br>
					<div class="row">
						<div class="col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10 col-md-4 col-md-offset-4">
							<div class="form-group">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">
									<input class="btn bottone1" id="updateUtente" value="Conferma"
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


  <%@include file="/layout/footer.jsp" %>
  <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
  <script src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/customJS/registrazione.js"></script>
</body>
</html>
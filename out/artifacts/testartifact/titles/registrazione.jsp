<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GoSoftair</title>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>GoSoftair</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/event.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/customCSS/home.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/customCSS/profilo.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/modificaProfilo.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>


<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>

<!-- inizio -->

<div class="container-fluid ">
  <div class="row ModificaProfilo">
    <!-- immagine profilo -->
    <aside style="margin-top:60px";>
    <div class="col-md-4 col-xs-12">
      <div class="text-center">
      <br>
        <img src="http://placehold.it/140x140" class="img-thumbnail img-thumbnail" alt="fotoProfilo">
        <h6>Modifica la foto del tuo profilo</h6>
        <input type="file" class="text-center center-block well well-sm">
      </div>
    </div>
    </aside>
    <!-- fine immagine profilo -->
    <!-- edit form column -->
    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
      <h3>Informazioni personali</h3>
      <form class="form-horizontal" role="form">
        <div class="form-group">
          <label class="col-lg-3 control-label personalLabel">Nome:</label>
          <div class="col-lg-8">
            <input class="form-control" value="Niccolò" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label personalLabel">Cognome:</label>
          <div class="col-lg-8">
            <input class="form-control" value="asd" type="text">
          </div>
        </div>

        <div class="form-group">
          <label class="col-lg-3 control-label personalLabel">Data di Nascita:</label>
          <div class="col-lg-8">
            <input class="form-control" value="09/07/1934" type="text">
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-3 control-label personalLabel">Email:</label>
          <div class="col-md-8">
            <input class="form-control" value="asdasd@asd.it" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label personalLabel">Password:</label>
          <div class="col-md-8">
            <input class="form-control" value="11111122333" type="password">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label personalLabel">Conferma password:</label>
          <div class="col-md-8">
            <input class="form-control" value="11111122333" type="password">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label"></label>
          <div class="col-md-8">
            <input class="btn btn-primary bottone" value="Registrati" type="button">
            <span></span>
            <input class="btn btn-primary bottone" value="Annulla" type="reset">
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- fine -->

</body>
</html>
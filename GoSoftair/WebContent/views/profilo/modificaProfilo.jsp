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
  <script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>


<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>

<!-- inizio -->

<div class="container-fluid sfondo">
  <div class="row registrati">
    <!-- immagine profilo -->
    <aside>
    <div class="col-md-4 col-xs-12">
      <div class="text-center">
      <br>
        <img src="http://placehold.it/140x140" class="img-thumbnail img-thumbnail" alt="fotoProfilo">
        <h6>Modifica la foto del tuo profilo</h6>
        <input id="immagine" name="immagine" type="file"
               class="file-loading">>
      </div>
    </div>
    </aside>
    <!-- fine immagine profilo -->
    
    <!-- edit form column -->
    <section>
    <div class="col-md-7 col-xs-12">
      <h3>Informazioni personali</h3>
      <form id="formRegistrazione" class="form-horizontal contenitoreForm " role="form" action="${pageContext.request.contextPath}/views/profilo/modificaProfilo" method="post">
        <div class="form-group" style="margin-top:2%">
          <label class="col-lg-3 control-label personalLabel">Nome:</label>
          <div class="col-lg-8">
            <input class="form-control" id="nome" name="nome" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label personalLabel">Cognome:</label>
          <div class="col-lg-8">
            <input class="form-control" id="cognome" name="cognome" type="text">
          </div>
        </div>

        <div class="form-group">
          <label class="col-lg-3 control-label personalLabel">Nickname</label>
          <div class="col-lg-8">
            <input class="form-control" id="nickname" name="nickname" type="text">
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-3 control-label personalLabel">Email:</label>
          <div class="col-md-8">
            <input class="form-control" id="email" name="email" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label personalLabel">Password:</label>
          <div class="col-md-8">
            <input class="form-control" id="password" name="password" type="password">
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
            <input class="btn bottone1" value="Salva Modifiche" type="button">
            <span></span>
            <input class="btn bottone1" value="Annulla" type="reset">
          </div>
        </div>
      </form>
    </div>
    </section>
  </div>
</div>

<!-- fine -->


  <%@include file="/layout/footer.jsp" %>
  <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
  <script src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/customJS/registrazione.js"></script>
</body>
</html>
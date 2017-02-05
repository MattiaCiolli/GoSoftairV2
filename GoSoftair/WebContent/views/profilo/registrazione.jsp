<!DOCTYPE html>
<html>
<head>
    <meta charset=UTF-8">
    <title>GoSoftair</title>

	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/event.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/customCSS/home.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/customCSS/profilo.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/registrazione.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
    <script
            src="${pageContext.request.contextPath}/resources/jquery/jquery.validate.min.js"></script>
    <script
            src="${pageContext.request.contextPath}/resources/fileinput/js/fileinput.min.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>


<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>

<!-- inizio -->

<div class="container-fluid sfondo">
  <div class="row">

      <!-- immagine profilo -->
    <aside>
    <div class="col-md-4 col-xs-12">
      <div class="text-center">
      <br>
        <img src="http://placehold.it/140x140" class="img-thumbnail img-thumbnail" alt="fotoProfilo">
        <h6>Modifica la foto del tuo profilo</h6>
        <input id="immagine" name="immagineProfilo" type="file" class="file-loading">
      </div>
    </div>
    </aside>
    <!-- fine immagine profilo -->
    
    <!-- edit form column -->
    <section>
    <div class="col-md-7 col-xs-12">
      <h3>Informazioni personali</h3>
      <form id="formRegistrazione" class="form-horizontal contenitoreForm " role="form" action="${pageContext.request.contextPath}/views/profilo/nuovo" method="post">
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
              <label class="col-md-3 control-label personalLabel">Numero Carta D'Identita:</label>
              <div class="col-md-8">
                  <input class="form-control" id="documentoValido" name="documentoValido" type="documentoValido">
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
            <input class="btn bottone1" id="creaUtente" value="Registrati" type="submit">
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
    <script
            src="${pageContext.request.contextPath}/resources/customJS/registrazione.js"></script>
</body>
</html>


<!--
<html>
<head>
<title>Inserire e verificare la password</title>
<script language=javascript type="text/javascript">

//Hide script from older browsers

function validazioneModulo(pswdModulo) {
if (pswdModulo.pswd1.value == "") {
alert ("Attenzione!!! Hai dimenticato di inserire la password!")
pswdModulo.pswd1.focus()
return false
}
if (pswdModulo.pswd1.value != pswdModulo.pswd2.value) {
alert ("Inserisci le password è importante!")
pswdModulo.pswd1.focus()
pswdModulo.pswd1.select()
return false
}
return true
}
//End hiding script

</script>
</head>
<body>
<form onSubmit="return validazioneModulo(this)" action="azione.cgi">
Nome: <input type=text size=30>
<p>Password: <input type=password name="pswd1">
<p>Conferma password: <input type=password name="pswd2">
<input type=submit value="Invia">&nbsp;<input type=reset>
</form>
</body>
</html>
-->
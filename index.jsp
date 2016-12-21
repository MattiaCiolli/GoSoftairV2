<!DOCTYPE html>
  <head>
	<meta charset="utf-8">
	<title>GoSoftair</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/jumbotron.css"	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.min.css"	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.structure.min.css"	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.theme.min.css"	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/mycss.css"	rel="stylesheet">

	
	<link rel="shortcut icon"	href="${pageContext.request.contextPath}/resources/bootstrap/img/favicon.ico">
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery-ui/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	
</head>

<body>
	<%@include file="/layout/navbar.jsp" %>
	
	<!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>GoSoftair</h1>
        <p>Il sito per giocatori di Softair.</p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>Evento 1</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>Evento 2</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>Evento 3</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>
      
      <%@include file="/layout/footer.jsp" %>
	
</body>
</html>

    

  



	
	


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>GoSoftair</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/event.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/customCSS/home.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/customCSS/profilo.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>


<body>
<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>

<!-- inizio -->

<div class="container-fluid Profilo">
<div class="contenitoreMenuLaterale">
	<div class="row ">
		<div class="col-md-4">
			<div class="list-group">
  			<a href="#" class="list-group-item">Le mie Iscrizioni</a>
  			<a href="#" class="list-group-item">I miei Annunci</a>
  			<a href="leMiePartite.jsp" class="list-group-item">Le mie Partite</a>
  			<a href="modificaProfilo.jsp" class="list-group-item">Modifica Profilo</a>
			</div>
		</div>
		<div class="col-md-8">
			<div class="panel panel-default">
  				<div class="panel-body">
    				<div class="col-xs-12 col-sm-4">
                              <img class="img-thumbnail img-responsive" alt="Foto Profilo" src="http://placehold.it/140x140">
                     </div>
                     <div class="contenitoreProfilo">
                    <div class="col-xs-12 col-sm-8">
                    	<div class="row event-description">
                    		<div class="span-master col-md-6">
                    			<span>Nome: </span>
                    		</div>
                    		<div class="span-master-2 col-md-6">
                    			<span>Niccolò</span>
                    		</div>
                    	</div>
                           <div class="row event-description">
                    		<div class="span-master col-md-6">
                    			<span>Cognome: </span>
                    		</div>
                    		<div class="span-master-2 col-md-6">
                    			<span>ASD</span>
                    		</div>
                    	</div>
                    	<div class="row event-description">
                    		<div class="span-master col-md-6">
                    			<span>Data di Nascita: </span>
                    		</div>
                    		<div class="span-master-2 col-md-6">
                    			<span>09/07/1934 </span>
                    		</div>
                    	</div>
                    	<div class="row event-description">
                    		<div class="span-master col-md-6">
                    			<span>Email: </span>
                    		</div>
                    		<div class="span-master-2 col-md-6">
                    			<span>Asdasd@asd.it</span>
                    		</div>
                    	</div>
                        </div>
                        </div>
                   </div>
  				</div>
			</div>
		</div>
	</div>
</div>
<!-- Inizio Sezione ultimi eventi -->	
<section>	
<div class="container-fluid">
	<div class="row UltimiEventi">
		<h1 class="text-center"> Ultimi Eventi </h1>
  			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    			<div class="carta">
      				<img src="${pageContext.request.contextPath}/resources/img/jumbo33.jpg" class="img-carta"alt="...">
      				<div class="caption">
        				<h3 style="text-align:center">La Valle della Morte</h3>
	        				<p style="text-align:center">Descrizione Evento</p>
	        			<h4 style="text-align:center"><a href="evento.jsp" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      				</div>
    			</div>
  		</div>

  	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    	<div class="carta">
      		<img src="${pageContext.request.contextPath}/resources/img/jumbo11.jpg" class="img-carta"alt="...">
      		<div class="caption">
       	 		<h3 style="text-align:center">Roio Deathmatch</h3>
        		<p style="text-align:center">Descrizione Evento</p>
        		<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      		</div>
    	</div>
  	</div>
  	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    	<div class="carta">
      		<img src="${pageContext.request.contextPath}/resources/img/jumbo22.jpg" class="img-carta" alt="..." >
      		<div class="caption">
        		<h3 style="text-align:center">Mezzanotte di fuoco a Coppito</h3>
        		<p style="text-align:center">Descrizione Evento</p>
        		<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
     		 </div>
 		</div>
  	</div>
</div>
</div>
</section>
<!-- fine sezione ultimi eventi -->

<!-- Inizio Sezione ultimi annunci -->	
<section>	
<div class="container-fluid">
	<div class="row UltimiAnnunci">
		<h5 class="text-center"> Ultimi Annunci </h5>
  			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    			<div class="cartaScura">
      				<img src="${pageContext.request.contextPath}/resources/img/jumbo33.jpg" class="img-carta"alt="...">
      				<div class="caption">
        				<h3 style="text-align:center">Arma 1</h3>
	        				<p style="text-align:center">Descrizione Articolo</p>
	        			<h4 style="text-align:center"><a href="evento.jsp" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      				</div>
    			</div>
  		</div>

  	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    	<div class="cartaScura">
      		<img src="${pageContext.request.contextPath}/resources/img/jumbo11.jpg" class="img-carta"alt="...">
      		<div class="caption">
       	 		<h3 style="text-align:center">Arma 2</h3>
        		<p style="text-align:center">Descrizione Articolo</p>
        		<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
      		</div>
    	</div>
  	</div>
  	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    	<div class="cartaScura">
      		<img src="${pageContext.request.contextPath}/resources/img/jumbo22.jpg" class="img-carta" alt="..." >
      		<div class="caption">
        		<h3 style="text-align:center">Arma 3</h3>
        		<p style="text-align:center">Descrizione Articolo</p>
        		<h4 style="text-align:center"><a href="#" class="btn btn-primary bottone" role="button">Guarda</a></h4>
     		 </div>
 		</div>
  	</div>
</div>
</div>
</section>

<!-- fine sezione ultimi annunci -->


<!-- fine -->







<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
</body>
</html>
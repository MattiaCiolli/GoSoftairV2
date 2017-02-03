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
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>


<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>

<!-- edit-modal 1 -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">

		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>

					<h4 class="modal-title" id="myModalLabel">
						<b>Dettagli annuncio</b>
					</h4>

					<div id="loadingedit">
						<img src='${pageContext.request.contextPath}/resources/fileinput/img/loading.gif' alt='loading...' />
					</div>

				</div>

				<div class="modal-body row">

					<div class="col-md-6 col-lg-6">

						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Titolo:</h4>
								<p class="list-group-item-text fontStencil">Arma 1</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Descrizione:</h4>
								<p class="list-group-item-text fontStencil">molto bello sisi blabla bla
									blablablabla blablablabl blablablabl blablablabl blablablabl</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Prezzo:</h4>
								<p class="list-group-item-text fontStencil">50$</p>
							</a>
						</div>

					</div>

					<div class="col-md-6 col-lg-6">
						<img id="imgAnnuncio"
							src="${pageContext.request.contextPath}/resources/img/arma1.gif" />
					</div>

					<div class="col-md-12 col-lg-12">
						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Contatti:</h4>
								<p class="list-group-item-text fontStencil">3333333333</p>
							</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>
<!-- fine modal 1-->
	
<!-- edit-modal 2 -->
	<div class="modal fade" id="modal2" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">

		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>

					<h4 class="modal-title" id="myModalLabel">
						<b>Dettagli annuncio</b>
					</h4>

					<div id="loadingedit">
						<img src='${pageContext.request.contextPath}/resources/fileinput/img/loading.gif' alt='loading...' />
					</div>

				</div>

				<div class="modal-body row">

					<div class="col-md-6 col-lg-6">

						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Titolo:</h4>
								<p class="list-group-item-text fontStencil">Arma 2</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Descrizione:</h4>
								<p class="list-group-item-text fontStencil">troppo bello sisi blabla bla
									blablablabla blablablabl blablablabl blablablabl blablablabl</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Prezzo:</h4>
								<p class="list-group-item-text fontStencil">100$</p>
							</a>
						</div>

					</div>

					<div class="col-md-6 col-lg-6">
						<img id="imgAnnuncio"
							src="${pageContext.request.contextPath}/resources/img/arma2.jpg" />
					</div>

					<div class="col-md-12 col-lg-12">
						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Contatti:</h4>
								<p class="list-group-item-text fontStencil">3333333333</p>
							</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>
	<!-- fine modal 2-->
	
	<!-- edit-modal 3 -->
	<div class="modal fade" id="modal3" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">

		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>

					<h4 class="modal-title" id="myModalLabel">
						<b>Dettagli annuncio</b>
					</h4>

					<div id="loadingedit">
						<img src='${pageContext.request.contextPath}/resources/fileinput/img/loading.gif' alt='loading...' />
					</div>

				</div>

				<div class="modal-body row">

					<div class="col-md-6 col-lg-6">

						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Titolo:</h4>
								<p class="list-group-item-text fontStencil">G36K</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Descrizione:</h4>
								<p class="list-group-item-text fontStencil">molto bello sisi blabla bla
									blablablabla blablablabl blablablabl blablablabl blablablabl</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Prezzo:</h4>
								<p class="list-group-item-text fontStencil">50$</p>
							</a>
						</div>

					</div>

					<div class="col-md-6 col-lg-6">
						<img id="imgAnnuncio"
							src="${pageContext.request.contextPath}/resources/img/arma3.jpg" />
					</div>

					<div class="col-md-12 col-lg-12">
						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Contatti:</h4>
								<p class="list-group-item-text fontStencil">3333333333</p>
							</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>
	<!-- fine modal3-->

<!-- inizio -->

<div class="container-fluid Profilo">
<div class="contenitore">
	<div class="row ">
		<div class="col-md-4">
			<div class="list-group">
  			<a href="${pageContext.request.contextPath}/views/profilo/leMieIscrizioni.jsp" class="list-group-item">Le mie Iscrizioni</a>
  			<a href="${pageContext.request.contextPath}/views/profilo/iMieiAnnunci.jsp" class="list-group-item">I miei Annunci</a>
  			<a href="${pageContext.request.contextPath}/views/profilo/leMiePartite.jsp" class="list-group-item">Le mie Partite</a>
  			<a href="${pageContext.request.contextPath}/views/profilo/modificaProfilo.jsp" class="list-group-item">Modifica Profilo</a>
			</div>
		</div>
		<div class="col-md-8">
			<div class="panel panel-default">
  				<div class="panel-body">
    				<div class="col-xs-12 col-sm-4">
                              <img class="img-thumbnail img-responsive " alt="Foto Profilo" src="${pageContext.request.contextPath}/resources/img/niccolo.png">
                     </div>
                     <div class="contenitoreProfilo">
                    <div class="col-xs-12 col-sm-8">
                    	<div class="row event-description">
                    		<div class="span-master col-md-4">
                    			<span>Nome: </span>
                    		</div>
                    		<div class="span-master-2 col-md-8">
                    			<span>${utente.nome}</span>
                    		</div>
                    	</div>
                           <div class="row event-description">
                    		<div class="span-master col-md-4">
                    			<span>Cognome: </span>
                    		</div>
                    		<div class="span-master-2 col-md-8">
                    			<span>${utente.cognome}</span>
                    		</div>
                    	</div>
                    	<div class="row event-description">
                    		<div class="span-master col-md-6">
                    			<span>Nickname</span>
                    		</div>
                    		<div class="span-master-2 col-md-6">
                    			<span>${utente.nickname}</span>
                    		</div>
                    	</div>
                    	<div class="row event-description">
                    		<div class="span-master col-md-4">
                    			<span>Email: </span>
                    		</div>
                    		<div class="span-master-2 col-md-8">
                    			<span>${utente.email}</span>
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
		<h1 class="text-center titolo"> Ultime Partite </h1>
  			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:3%">
    			<a href="${pageContext.request.contextPath}/views/evento/dettagli">
    				<div class="carta">
      					<img src="${pageContext.request.contextPath}/resources/img/evento1.jpg" class="img-carta"alt="foto evento">
      						<div class="caption">
        						<h3 style="text-align:center">La Valle della Morte</h3>
									<p class="descrizione fontStencil">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      						</div>
    				</div>
    			</a>
  		</div>
  	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    	<a href="#">
    		<div class="carta">
      			<img src="${pageContext.request.contextPath}/resources/img/evento2.jpeg" class="img-carta"alt="foto evento">
      				<div class="caption">
       	 				<h3 style="text-align:center">Roio Deathmatch</h3>
							<p class="descrizione fontStencil">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      				</div>
    		</div>
    	</a>
  	</div>
  	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:3%">
    	<a href="#">
    		<div class="carta">
      			<img src="${pageContext.request.contextPath}/resources/img/evento3.jpg" class="img-carta" alt="foto evento" >
      				<div class="caption">
        				<h3 style="text-align:center">Mezzanotte di fuoco a Coppito</h3>
							<p class="descrizione fontStencil">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        			</div>
 			</div>
 		</a>
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
  			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4"style="margin-bottom:3%">
    			<a data-toggle="modal" data-target="#modal">
    				<div class="cartaScura">
      					<img src="${pageContext.request.contextPath}/resources/img/arma1.gif" class="img-carta"alt="foto articolo">
      						<div class="caption">
        						<h3 style="text-align:center">Arma 1</h3>
									<p class="descrizione fontStencil">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      						</div>
    				</div>
    			</a>
  			</div>

  	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" >
    	<a data-toggle="modal" data-target="#modal2">
    		<div class="cartaScura">
      			<img src="${pageContext.request.contextPath}/resources/img/arma2.jpg" class="img-carta"alt="foto articolo">
      				<div class="caption">
       	 				<h3 style="text-align:center">Arma 2</h3>
											<p class="descrizione fontStencil">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      				</div>
    		</div>
    	</a>
  	</div>
  	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="margin-bottom:3%">
    	<a data-toggle="modal" data-target="#modal3">
    		<div class="cartaScura">
      			<img src="${pageContext.request.contextPath}/resources/img/arma3.jpg" class="img-carta" alt="foto articolo" >
      				<div class="caption">
        				<h3 style="text-align:center">Arma 3</h3>
							<p class="descrizione fontStencil">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
		     		</div>
 			</div>
 		</a>
  	</div>
	</div>
</div>
</section>

<!-- fine sezione ultimi annunci -->

<!-- fine -->

	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
	<script src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
</body>
<%@include file="/layout/footer.jsp" %>
</html>
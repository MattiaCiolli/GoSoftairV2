<header>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="pull-right registrazione">
					<a class="linkBarraAlta" href="${pageContext.request.contextPath}/titles/registrazione.jsp">REGISTRATI</a>
					<span class="separatore"></span>
					<a href="#" class="linkBarraAlta dropdown-toggle"  data-toggle="dropdown">Login</a>
					<ul id="login-dp" class="dropdown-menu">
						<li>
							<div class="row">
								<div class="col-md-12 loginTradizionale">
									<form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											<label class="sr-only" for="exampleInputEmail2">Username</label>
											<input type="email" class="form-control" id="exampleInputEmail2" placeholder="Indirizzo e-mail" required>
										</div>
										<div class="form-group">
											<label class="sr-only" for="exampleInputPassword2">Password</label>
											<input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password" required>
											<div class="help-block text-right"><a class="linkSfondoBianco pwdimenticata" href="">PASSWORD DIMENTICATA?</a></div>
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-block bottonenav">Accedi</button> <!-- ----------------------------- -->
										</div>
										<div class="form-group">
											<div class="checkbox">
												<label><input type="checkbox" value="">RESTA CONNESSO</label>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="social-buttons ">
										<p class="AccedereUsando">Puoi accedere usando il tuo profilo:</p>
										<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
										<a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>

<nav>
	<div class="container" style="padding: 20px 0px 20px 0px">
		<div class="row">
			<div class="col-lg-12">
				<div class="navbar" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand " href="${pageContext.request.contextPath}/index.jsp"><b class="menuButton">GOSOFTAIR</b></a>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Partite <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="${pageContext.request.contextPath}/views/evento/bachecaPartite.jsp">Elenco partite</a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/views/profilo/leMieIscrizioni.jsp">Iscrizioni</a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/views/evento/creaPartita.jsp">Crea partita</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Mercatino <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="${pageContext.request.contextPath}/views/annuncio/bachecaAnnunci.jsp">Bacheca annunci</a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/views/annuncio/creaAnnuncio.jsp">Crea annuncio</a></li>
								</ul>
							</li>
							<li ><a class="ultimoNavbarStretta" href="${pageContext.request.contextPath}/views/profilo/profilo.jsp">Profilo</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>


<!--sottonavbar -->
<section class="colorata">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 navigazione">
				<p>
					Home > Percorso pagina
				</p>
			</div>
		</div>
	</div>
</section>
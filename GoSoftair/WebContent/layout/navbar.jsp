<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GoSoftair</title>
<link
	href="${pageContext.request.contextPath}/resources/customCSS/navbar.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
</head>
<%
	String username = (String) session.getAttribute("username");
	if (username == null) {
%>
<%@page import="it.univaq.disim.gosoftair.utility.Social.FBConnection"%>
<%
	FBConnection fbConnection = new FBConnection();
%>

<header>
	<div class="container-fluid">
	<div class="row" id="msg">
			<div class="col-lg-12">${errorMessageUser}${errorMessagePwd}
				</div>
			</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="pull-right registrazione">
					<a class="linkBarraAlta"
						href="${pageContext.request.contextPath}/registrazione">REGISTRATI</a>
					<span class="separatore"></span> <a href="#"
						class="linkBarraAlta dropdown-toggle" data-toggle="dropdown">Login</a>
					<ul id="login-dp" class="dropdown-menu">
						<li>
							<div class="row">
								<div class="col-md-12 loginTradizionale">
									<form class="form" role="form"
										action="${pageContext.request.contextPath}/tryLogin/home"
										method="post" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											<label class="sr-only" for="username">Username</label> <input
												type="text" class="form-control" id="email" name="username"
												placeholder="Username" required> <div style="color: #FF0000;">${errorMessageUser}</div>
												
										</div>
										<div class="form-group">
											<label class="sr-only" for="pwd">Password</label> <input
												type="password" class="form-control" id="password"
												name="password" placeholder="Password" required><div style="color: #FF0000;">${errorMessagePwd}</div>
												
											<div class="help-block text-right">
												<a class="linkSfondoBianco pwdimenticata" href="">PASSWORD
													DIMENTICATA?</a>
											</div>
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-block bottonenav">Accedi</button>
											<!-- ----------------------------- -->
										</div>
										<div class="form-group">
											<div class="checkbox">
												<label><input type="checkbox" value="">RESTA
													CONNESSO</label>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="social-buttons ">
										<p class="AccedereUsando">Puoi accedere usando il tuo
											profilo:</p>
										<a href="<%=fbConnection.getFBAuthUrl()%>" class="btn btn-fb"><i
											class="fa fa-facebook"></i> Facebook</a> <a href="#"
											class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
								
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
<%
	} else {
%>
<header>
<div id="user" hidden><%=username%></div>

	<div class="container-fluid">
	<div class="row" id="msg">
			<div class="col-lg-12">${welcomeMessage}
				</div>
			</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="pull-right registrazione">

					<div>
						Ciao,
						<%=username%>
						<span class="separatore"></span><a class="linkBarraAlta"
							href="${pageContext.request.contextPath}/loggedOut/home">Logout</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<%
	}
%>


<nav>
	<div class="container" style="padding: 20px 0px 20px 0px">
		<div class="row">
			<div class="col-lg-12">
				<div class="navbar" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand "
							href="${pageContext.request.contextPath}/home"><b
							class="menuButton">GOSOFTAIR</b></a>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Partite <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a
										href="${pageContext.request.contextPath}/evento/bachecaEventi">Elenco
											partite</a></li>
									<li class="divider"></li>
									<li><a
										href="${pageContext.request.contextPath}/profilo/leMieIscrizioni">Iscrizioni</a></li>
									<li class="divider"></li>
									<li><a
										href="${pageContext.request.contextPath}/evento/nuovo">Crea
											partita</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Mercatino <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a
										href="${pageContext.request.contextPath}/annuncio/bachecaAnnunci">Bacheca
											annunci</a></li>
									<li class="divider"></li>
									<li><a
										href="${pageContext.request.contextPath}/annuncio/nuovo">Crea
											annuncio</a></li>
								</ul></li>
							<li><a class="ultimoNavbarStretta"
								href="${pageContext.request.contextPath}/profilo">Profilo</a></li>
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
				<p>Home > ${percorso}</p>
			</div>
		</div>
	</div>
</section>
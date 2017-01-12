<%--
  Created by IntelliJ IDEA.
  User: matteopolsinelli
  Date: 1/12/17
  Time: 7:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
        <style>

            header {
                background-color: #34362d;
                color: #ffffff;
                font-size: 1em;
                font-family: inherit;
                font-style: inherit;
                font-weight: inherit;
                line-height: inherit;
                word-wrap: break-word;
                text-rendering: optimizeLegibility;
                height: 30px;
                width: 100%;
            }

            nav {
                background-color: #515547;
                font-family: inherit;
                font-style: inherit;
                font-weight: inherit;
                line-height: inherit;
                word-wrap: break-word;
                color: #767a70;
                text-rendering: optimizeLegibility;
                border: none;
                box-shadow: -4px 3px 0px 0px rgba(0,0,0,0.2);
                height: 100px;
                position:static;
                top:0;
                right: 0;
                left: 0;
            }

            /* css barra superiore*/
            @font-face {
                font-family: 'oswald_stencilbold';
                src: url('../fonts/oswald-stencil-bold-586ea9ec262c2-webfont.woff2') format('woff2'),
                url('../fonts/oswald-stencil-bold-586ea9ec262c2-webfont.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }


            /*************************/
            .bottone:hover {
                background-color: #94A31A;
                border-color: #94A31A;
                border-radius: 0px;
            }

            .bottone {
                background-color: #A6B71B;
                border-color: #A6B71B;
                border-radius: 0px;
            }

            #exampleInputEmail2, #exampleInputPassword2{
                border-radius: 0px;
                border-width: 2px;
                border-style: solid;
            }

            .linkSfondoBianco{
                color:#3c3c37;
                font-weight: bold;
            }

            #login-dp .social-buttons{
                margin: 12px 0;
                clear: both;
            }

            .loginTradizionale{
                border-bottom: 1px solid #ddd;
            }
            /*************************************/


            .linkBarraAlta{
                color: #ffffff !important;
                padding: 0.8em 0 0.8em;
                font-family: "Oswald",sans-serif;
                line-height: 1.3em;
                text-transform: uppercase;
                text-decoration: none !important;
                background-color: initial;
                background-color: initial !important
            }

            .separatore{
                background-color: #767a70;
                padding: 0px 2px 0px 1px;
                margin-right: 6px;
                margin-left: 2px;
                height: 15px;
            }
            .registrazione{
                margin-right: 15px;
                height: 100%;
                padding-top: 5px;
            }

            .linkBarraAlta:hover, .linkBarraAlta:focus{
                color: #a6b71b !important;
                text-decoration: none;
            }

            /********************************/
            #login-dp{
                background-color: white;
                border-radius: 0px;
                padding: 0px 40px;
                margin-right: inherit;
                color: initial;
                padding-top: 20px;
            }

            /***********************************/

            .btn-fb{
                color: #fff;
                background-color:#3b5998;
            }
            .btn-fb:hover{
                color: #fff;
                background-color:#496ebc
            }
            .btn-tw{
                color: #fff;
                background-color:#55acee;
            }
            .btn-tw:hover{
                color: #fff;
                background-color:#59b5fa;
            }

            #login-dp .social-buttons a{
                width: 48%;
            }

            #login-dp .bottom{
                background-color:rgba(255,255,255,.8);
                border-top:1px solid #ddd;
                clear:both;
                padding:14px;
            }

            #login-dp .social-buttons{
                margin:12px 0
            }

            /* css barra intermedia*/

            .navbar-header>a{
                color: #ffffff;
            }

            li>a{
                color: #ffffff;
                padding: 0.45em 1.1em 0.35em;
                font-family: "Oswald",sans-serif;
                line-height: 1.3em;
                text-transform: uppercase;
                letter-spacing: 2px;
            }

            .dropdown-menu{
                border: none;
                margin-top: 2px !important;
            }

            .dropdown-menu .divider{
                height: 0px;
            }

            .menuButton{
                font-size: 2em;
                font-family: "oswald_stencilbold",sans-serif;
            }

            @media (min-width: 768px) {
                .nav .open>a:hover,.dropdown-menu, .nav .open>a,.nav>li>a:hover, .dropdown-menu>li>a .open>a:hover, .open>a, .nav .open>a:hover, .nav .open>a:focus, .dropdown-menu>li>a, .nav>li>a:hover, .nav>li>a:focus,.nav>li>a:hover {
                    background-color: #a6b71b;
                    color: #ffffff;
                }
                .dropdown-menu>li>a:hover{
                    background-color: #94a31a;
                    color: #ffffff;
                }
            }

            @media (max-width: 768px) {
                .nav .open>a:hover,.dropdown-menu, .nav .open>a,.nav>li>a:hover, .dropdown-menu>li>a .open>a:hover, .open>a, .nav .open>a:hover, .dropdown-menu>li>a, .nav>li>a:hover, .nav>li>a:focus, .dropdown-menu>li>a:hover {
                    background-color: #515547;
                    color: #ffffff;
                }
                .dropdown-menu>li>a:hover, .nav>li>a:hover, .nav .open>a:focus{
                    background-color: #34362d;
                    color: #ffffff;
                }

            }

            .icon-bar{
                border-radius: 10px !important;
                background-color: white;
                border: white solid 2.5px;
            }

            .navbar-toggle{
                padding: 6px 10px 0px 0px ;
            }

            .navbar{
                margin-bottom: 0px;
            }

            /*fine css barra intermedia*/
        </style>
    </head>
    <body>
        <header>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="pull-right registrazione">
                            <a class="linkBarraAlta" href="#">Registrati</a>
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
                                                    <div class="help-block text-right"><a class="linkSfondoBianco" href="">Password dimenticata?</a></div>
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-success btn-block bottone">Sign in</button> <!-- ----------------------------- -->
                                                </div>
                                                <div class="form-group">
                                                    <div class="checkbox">
                                                        <label><input type="checkbox" value="">Resta connesso</label>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="social-buttons ">
                                                <p>Puoi accedere usando il tuo profilo:</p>
                                                <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                                                <a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
                                            </div>
                                        </div>
                                        <div class="bottom text-center">
                                            New here ? <a class="linkSfondoBianco" href="#"><b>Join Us</b></a>
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
                                <a class="navbar-brand " href="${pageContext.request.contextPath}/index.jsp"><b class="menuButton">GoSoftair</b></a>
                            </div>
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Partite <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Elenco partite</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Iscrizioni</a></li>
                                            <li class="divider"></li>
                                            <li><a href="${pageContext.request.contextPath}/titles/creaPartita.jsp">Crea partita</a></li>
                                            <li><a href="${pageContext.request.contextPath}/titles/leMiePartite.jsp">Le mie partite</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mercatino <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Bacheca annuci</a></li>
                                            <li class="divider"></li>
                                            <li><a href="${pageContext.request.contextPath}/titles/creaAnnuncio.jsp">Crea annuncio</a></li>
                                            <li><a href="#">I miei annunci</a></li>
                                        </ul>
                                    </li>
                                    <li ><a href="#">Profilo</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <section>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>
            <h1>section</h1>

        </section>

        <footer>
            <span>footer</span>
        </footer>

    </body>
    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
    <script>
        var pro=1;
        $(document).ready(function(){
            $(window).scroll(function() {
                if ($(document).scrollTop() > ($("nav").height()+ $("header").height())  && pro==1) {
                    $("nav").css({top: -$("nav").height()});
                    $("nav").animate({'top' : '0px'}, {duration: 400, easing: "swing"}).css({'position' : 'fixed'});
                    pro=0;
                }
                if ($(document).scrollTop() < ($(".nav").height()+ $("header").height())){
                    $("nav").css({"position":"static","top":"0"});
                    pro=1;
                }
            });
        });
    </script>
</html>

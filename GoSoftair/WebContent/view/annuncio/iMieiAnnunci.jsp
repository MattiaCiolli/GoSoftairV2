<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>GoSoftair</title>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/customCSS/iMieiAnnunci.css" rel="stylesheet">
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
                                <p class="list-group-item-text">Titolo annuncio 1</p>
                            </a> <a href="#" class="list-group-item">
                            <h4 class="list-group-item-heading">Descrizione:</h4>
                            <p class="list-group-item-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </a> <a href="#" class="list-group-item">
                            <h4 class="list-group-item-heading">Prezzo:</h4>
                            <p class="list-group-item-text">Mille !!</p>
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
                                <p class="list-group-item-text">333/3984651</p>
                            </a>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </div>
    <!-- fine modal 1-->

    <section>
        <div class="container-fluid">
            <div class="row lateralPadding">
                <a href="#" data-toggle="modal" data-target="#modal">
                    <div class="cartaScura elemento col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div></div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <img src="${pageContext.request.contextPath}/resources/img/jumbo4.jpg" class="img-responsive immagineElemento">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p class="titolo">Titolo annuncio 1</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 centra">
                                    <p class="tag">Descrione</p>
                                    <p class="valore descrive">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 centra">
                                    <p class="tag">Prezzo</p>
                                    <p class="valore">Mille !!</p>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 centra">
                                    <p class="tag">Contatti</p>
                                    <p class="valore">333/3984651</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </section>

    <section>
        <div class="container-fluid">
            <div class="row lateralPadding">
                <a href="#" data-toggle="modal" data-target="#modal">
                    <div class="cartaScura elemento col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div></div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <img src="${pageContext.request.contextPath}/resources/img/jumbo5.jpg" class="img-responsive immagineElemento">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p class="titolo">Titolo annuncio 2</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 centra">
                                    <p class="tag">Descrione</p>
                                    <p class="valore descrive">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 centra">
                                    <p class="tag">Prezzo</p>
                                    <p class="valore">300 $</p>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 centra">
                                    <p class="tag">Contatti</p>
                                    <p class="valore">333/3984651</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </section>
    <section>
        <div class="container-fluid">
            <div class="row lateralPadding">
                <a href="#" data-toggle="modal" data-target="#modal">
                    <div class="cartaScura elemento col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div></div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <img src="${pageContext.request.contextPath}/resources/img/jumbo1.jpg" class="img-responsive immagineElemento">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p class="titolo">Titolo annuncio 3</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 centra">
                                    <p class="tag">Descrione</p>
                                    <p class="valore descrive">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 centra">
                                    <p class="tag">Prezzo</p>
                                    <p class="valore">150 $</p>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6 centra">
                                    <p class="tag">Contatti</p>
                                    <p class="valore">333/3984651</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </section>

    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="spazietto">

                </div>
            </div>
        </div>
    </section>

    <%@include file="/layout/footer.jsp" %>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/customJS/navbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/customJS/footer.js"></script>
</body>
</html>
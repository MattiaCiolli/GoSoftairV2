<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>GoSoftair</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/navbar.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/customCSS/leMiePartite.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
	

</head>
<body class="cssBody BodyWidth">
	<%@include file="/layout/navbar.jsp" %>


    <c:forEach items="${eventi}" var="evento" varStatus="loop">
        <section>
            <div class="container-fluid">
                <div class="row lateralPadding">
                    <a  href="${pageContext.request.contextPath}/views/evento/dettagli?idEvento=${evento.id}">
                    <div class="carta elemento col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div></div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <img src="${pageContext.request.contextPath}/resources/img/jumbo4.jpg" class="img-responsive immagineElemento">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p class="titolo">${evento.titolo}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 centra">
                                    <p class="tag">Data</p>
                                    <p class="valore">${date[loop.index]}</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 centra">
                                    <p class="tag">Ora</p>
                                    <p class="valore">${ore[loop.index]}</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 centra">
                                    <p class="tag">Punto di incontro</p>
                                    <p class="valore">${evento.puntoIncontro}</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 centra">
                                    <p class="tag">Tipo partita</p>
                                    <p class="valore">${evento.tipologia}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    </a>
                </div>
            </div>
        </section>
    </c:forEach>

    <section>
        <div class="container-fluid">
            <div class="row lateralPadding">
                <a href="#">
                    <div class="carta elemento col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div></div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <img src="${pageContext.request.contextPath}/resources/img/evento2.jpeg" class="img-responsive immagineElemento">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p class="titolo">Roio deathmatch</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                    <p class="tag">Data</p>
                                    <p class="valore">05/02/2017</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                    <p class="tag">Ora</p>
                                    <p class="valore">9:00-12:00</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                    <p class="tag">Punto di incontro</p>
                                    <p class="valore">UniversitÓ</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                    <p class="tag">Tipo partita</p>
                                    <p class="valore">Dead Match</p>
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
                <a href="#">
                    <div class="carta elemento col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div></div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <img src="${pageContext.request.contextPath}/resources/img/jumbo5.jpg" class="img-responsive immagineElemento">
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <p class="titolo">Mezzanotte di fuoco a coppito</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                    <p class="tag">Data</p>
                                    <p class="valore">06/03/2017</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                    <p class="tag">Ora</p>
                                    <p class="valore">9:00-12:00</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                    <p class="tag">Punto di incontro</p>
                                    <p class="valore">UniversitÓ</p>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                    <p class="tag">Tipo partita</p>
                                    <p class="valore">Dead Match</p>
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
                <div class="col-lg-12 spazio"></div>
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
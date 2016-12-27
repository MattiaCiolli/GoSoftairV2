<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>GoSoftair</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-theme.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/jumbotron.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.structure.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/jquery-ui/css/overcast/jquery-ui.theme.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/mycss.css"
	rel="stylesheet">


<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/bootstrap/img/favicon.ico">
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-2.1.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/jquery-ui/js/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/datetimepicker/moment-with-locales.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/datetimepicker/bootstrap-datetimepicker.js"></script>

</head>

<body>
	<%@include file="/layout/navbar.jsp"%>

	<form>
		 <div class="container">
			<div class="row">
				<div class='col-sm-4'>
					<div class="form-group">
						<label for="NomeEvento">Nome evento:</label> <input type="text" class="form-control"
							id="NomeEvento">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class='col-sm-4'>
					<div class="form-group">
						<label for="Tipologia">Tipologia:</label> 
						<select	class="form-control" id="Tipologia">
							<option>Deathmatch a squadre</option>    
							<option>Tutti contro tutti</option>    
							<option>Cattura la bandiera</option>    
							<option>Dominio</option>  
						</select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class='col-sm-4'>
					<div class="form-group">
						<label for="DataOra">Data e ora:</label>
						<div class='input-group date' id='datetimepicker1'>
							<input type='text' class="form-control" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					$(function() {
						$('#datetimepicker1').datetimepicker();
					});
				</script>
			</div>

			<div class="row">
				<div class='col-sm-4'>
					<div class="form-group">
						<label for="MaxPartecipanti">Numero massimo di
							partecipanti:</label> <input type="number" class="form-control"
							id="NumPartecipanti">
					</div>
				</div>
			</div>

			<div class="row">
				<div class='col-sm-4'>
					<input type="image"
						src="${pageContext.request.contextPath}/resources/img/uploadicon.png"
						alt="upload image"> <input class="file" type="file"
						id="image" style="display: none;">
				</div>
				<script>
					$("input[type='image']").click(function() {
						$("input[id='image']").click();
					});
				</script>
			</div>
			
			<img class="bg-img" src="${pageContext.request.contextPath}/resources/img/map.jpg"/>
						


			 </br>
			<button type="submit" class="btn btn-default">Submit</button>
	</div>
	</form>

	<%@include file="/layout/footer.jsp"%>

</body>
</html>











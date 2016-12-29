<!DOCTYPE html>

<body>

	<form id="partitaform">
		 <div class="container">
			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="NomeEvento">Nome evento:</label> <input type="text" class="form-control"
							name="NomeEvento" id="NomeEvento">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="Tipologia">Tipologia:</label> 
						<select	class="form-control" name="Tipologia" id="Tipologia">
							<option>Deathmatch a squadre</option>    
							<option>Tutti contro tutti</option>    
							<option>Cattura la bandiera</option>    
							<option>Dominio</option>  
						</select>
					</div>
				</div>
			</div>

			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
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
			</div>

			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="NumPartecipanti">Numero di
							partecipanti:</label> <input type="number" class="form-control"
							name="NumPartecipanti" id="NumPartecipanti">
					</div>
				</div>
			</div>

			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4' id="rowimg">
					<label for="Immagine">Immagine:</label>
					<div id="kv-avatar-errors-2" class="center-block"></div>
					<div class="kv-avatar center-block">
						<input id="Immagine" name="Immagine" type="file"
							class="file-loading">
					</div>
				</div>
			</div>
			
			
			<div class="bg-img col-sm-12 col-md-12 col-lg-12"><label for="Posizione">Posizione:</label><img src="${pageContext.request.contextPath}/resources/img/map.jpg"/>
			</div>
			
						


			 </br>
			<button type="submit" id="creapartita" class="btn btn-success">Crea evento</button>
	</div>
	</form>

</body>
</html>











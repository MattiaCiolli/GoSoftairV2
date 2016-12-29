<!DOCTYPE html>

<body>

	<form id="annuncioform">
		 
		<div class="container">
			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="Titolo">Titolo:</label> <input type="text"
							class="form-control" id="Titolo" name="Titolo">
					</div>
				</div>
			</div>

			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="Decrizione">Descrizione:</label>
						<textarea rows="5" class="form-control" id="Descrizione"
							name="Descrizione"></textarea>
					</div>
				</div>
			</div>


			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="Prezzo">Prezzo:</label>
						<div class="input-group">
							<input type="number" class="form-control" id="Prezzo"
								name="Prezzo" /> <span class="input-group-addon">$</span>
						</div>
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
			 </br>
			<button type="submit" id="inserisciannuncio" class="btn btn-success">Inserisci
				annuncio</button>
		</div>
	</form>

</body>
</html>











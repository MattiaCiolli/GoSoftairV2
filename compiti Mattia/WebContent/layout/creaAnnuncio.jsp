<!DOCTYPE html>

<body>

	<!-- edit modal -->

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
						<img src='resources/fileinput/img/loading.gif' alt='loading...' />
					</div>

				</div>

				<div class="modal-body row">

					<div class="col-md-6 col-lg-6">

						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Titolo:</h4>
								<p class="list-group-item-text">G36K</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Descrizione:</h4>
								<p class="list-group-item-text">molto bello sisi blabla bla
									blablablabla blablablabl blablablabl blablablabl blablablabl</p>
							</a> <a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Prezzo:</h4>
								<p class="list-group-item-text">50$</p>
							</a>
						</div>

					</div>

					<div class="col-md-6 col-lg-6">
						<img id="imgannuncio"
							src="${pageContext.request.contextPath}/resources/img/g36k.jpg" />
					</div>

					<div class="col-md-12 col-lg-12">
						<div class="list-group">
							<a href="#" class="list-group-item">
								<h4 class="list-group-item-heading">Contatti:</h4>
								<p class="list-group-item-text">3333333333</p>
							</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>
	<!-- fine modal-->
	
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
			
			<br/>
			<button type="submit" id="inserisciannuncio" class="btn btn-success">Inserisci
				annuncio</button>

		</div>
	</form>

	<button data-toggle="modal" data-target="#modal" class="btn btn-danger">Apri
		modal</button>

</body>
<html></html>











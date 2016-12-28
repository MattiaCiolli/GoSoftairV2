<!DOCTYPE html>
<meta charset="utf-8">
<body>

	<form>
		 <div class="container">
			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="Titolo">Titolo:</label> <input type="text" class="form-control"
							id="Titolo">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="Decrizione">Descrizione:</label> <textarea rows="5" class="form-control"
							id="Descrizione"></textarea>
					</div>
				</div>
			</div>


			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4'>
					<div class="form-group">
						<label for="Prezzo">Prezzo:</label> 
						<div class="input-group">
						<input type="number" class="form-control" id="Prezzo"/>
							<span class="input-group-addon">$</span>
						</div>	
					</div>
				</div>
			</div>

			<div class="row">
				<div class='col-sm-4 col-md-4 col-lg-4' id="rowimg">
				<label for="Immagine">Immagine:</label>
					<input type="image"
						src="${pageContext.request.contextPath}/resources/img/uploadicon.png"
						alt="upload image"> <input class="file" type="file"
						id="image">
				</div>
				
				<script>
					$("input[type='image']").click(function() {
						$("input[id='image']").click();
					});
				</script>
			</div>				


			 </br>
			<button type="submit" class="btn btn-success">Inserisci annuncio</button>
	</div>
	</form>

</body>
</html>











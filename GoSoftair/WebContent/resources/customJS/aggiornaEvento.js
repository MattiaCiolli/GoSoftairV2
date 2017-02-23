var markers = [];
function initAutocomplete() {
	
	var uluru={lat:parseFloat($("#Lat").val()),lng:parseFloat($("#Lon").val())};
	var map = new google.maps.Map(document.getElementById('mapcont'), {
   		zoom: 8,
        center: uluru,
        mapTypeId : 'roadmap'
    });
    
    var marker = new google.maps.Marker({
    	position: uluru,
        map: map
    });
	
	// Create the search box and link it to the UI element.
	var input = document.getElementById('pac-input');
	var searchBox = new google.maps.places.SearchBox(input);
	map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	// Bias the SearchBox results towards current map's viewport.
	map.addListener('bounds_changed', function() {
		searchBox.setBounds(map.getBounds());
	});

	// Listen for the event fired when the user selects a prediction and
	// retrieve
	// more details for that place.
	searchBox.addListener('places_changed', function() {
		var places = searchBox.getPlaces();
		if (places.length == 0) {
			return;
		}
		// Clear out the old markers.
		marker.setMap(null);
		markers.forEach(function(marker) {
			marker.setMap(null);
		});
		markers = [];
		// For each place, get the icon, name and location.
		var bounds = new google.maps.LatLngBounds();
		places.forEach(function(place) {
			if (!place.geometry) {
				console.log("Returned place contains no geometry");
				return;
			}
			var icon = {
				url : place.icon,
				size : new google.maps.Size(71, 71),
				origin : new google.maps.Point(0, 0),
				anchor : new google.maps.Point(17, 34),
				scaledSize : new google.maps.Size(25, 25)
			};
			// Create a marker for each place.
			markers.push(new google.maps.Marker({
				map : map,
				icon : icon,
				title : place.name,
				draggable : true,
				position : place.geometry.location
			}));

			google.maps.event.addListener(markers[0], 'dragend',
					function(event) {
						var lat = markers[0].getPosition().lat();
						var lng = markers[0].getPosition().lng();
						$("#Lat").val(lat);
						$("#Lon").val(lng);
						$("#Posizione").val("Lat: " + lat + "  Long: " + lng);
					});

			// Shows instantly the coordinates of the selected place
			var lat = markers[0].getPosition().lat();
			var lng = markers[0].getPosition().lng();
			$("#Lat").val(lat);
			$("#Lon").val(lng);
			$("#Posizione").val("Lat: " + lat + "  Long: " + lng);

			if (place.geometry.viewport) {
				// Only geocodes have viewport.
				bounds.union(place.geometry.viewport);
			} else {
				bounds.extend(place.geometry.location);
			}
		});
		map.fitBounds(bounds);
	});
}

$(document)
		.ready(
				function()

				{

					// attiva datepicker

					$(function() {
						var startdate = new Date();//today
						startdate.setDate(startdate.getDate() + 1);//tomorrow
						$('#datetimepicker1').datetimepicker({
							locale : "it",
							minDate : startdate,
						});
					});

					// permette upload immagine
					$("#Immagine")
							.fileinput(
									{
										language:'it',
										overwriteInitial : true,
										minFileCount: 1,
										maxFileSize : 1000,
										showClose : false,
										showCaption : false,
										showBrowse : true,
										browseOnZoneClick : true,
										browseLabel : '',
										removeLabel : '',
										browseIcon : '<i class="glyphicon glyphicon-folder-open"></i>',
										removeIcon : '<i class="glyphicon glyphicon-remove"></i>',
										removeTitle : 'Cancel or reset changes',
										elErrorContainer : '#kv-avatar-errors-2',
										msgErrorClass : 'alert alert-block alert-danger',
										defaultPreviewContent : '<img src="'+$("div#img").text()+'" id="imginput" alt="Immagine partita">',
										layoutTemplates : {
											main2 : '{preview}{browse} {remove}'
										},
										allowedFileExtensions : [ "jpg", "png",
												"gif" ]
									});

					// evita valori negativi

					jQuery.validator.addMethod("greaterthan", function(value,
							element, param) {

						return this.optional(element) || value > param;

					}, "Inserire un numero realistico");

					// valida l'input, se corretto lo invia

					$("#partitaform")
							.validate(
									{

										rules : {

											NomeEvento : {

												required : true,

												minlength : 3,

												maxlength : 20

											},

											Tipologia : {

												required : true,

											},
											
											Descrizione : {

												required : true,

												minlength : 3,

												maxlength : 100

											},

											DataOra : {

												required : true,

											},
											
											PuntoIncontro : {

												required : true,
												
												maxlength : 30

											},

											Posizione : {

												minlength : 12,

											},

											NumPartecipanti : {

												required : true,

												maxlength : 3,

												number : true,

												greaterthan : 0

											},

										},

										messages : {

											NomeEvento : {

												required : "Inserisci un nome evento",

												minlength : "Almeno 3 caratteri",

												maxlength : "Massimo 20 caratteri"

											},

											Tipologia : {

												required : "Seleziona una tipologia",

											},
											
											Descrizione : {

												required : "Inserisci una descrizione",

												minlength : "Almeno 3 caratteri",

												maxlength : "Massimo 100 caratteri"

											},
											
											PuntoIncontro : {

												required : "Descrivi dove incontrarsi",
												
												maxlength : "Max 30 caratteri"

											},

											Posizione : {

												minlength : "Inserisci una posizione",

											},

											DataOra : {

												required : "Inserisci una data ed un orario",

											},

											NumPartecipanti : {

												required : "Inserisci quanti partecipanti",

												maxlength : "Inserisci un numero realistico",

												number : "Solo numeri"

											},

										},

										highlight : function(element) {

											$(element).closest('.form-group')
													.addClass('has-error');

										},

										unhighlight : function(element) {

											$(element).closest('.form-group')
													.removeClass('has-error');

										},

										errorElement : 'span',

										errorClass : 'help-block',

										errorPlacement : function(error,
												element) {

											if (element.parent('.input-group').length) {

												error.insertAfter(element
														.parent());

											} else {

												error.insertAfter(element);

											}

										}

									});

					
					$("#updatepartita").click(function() {
						if ($("#partitaform").valid()) {
							document.getElementById("partitaform").submit();
						}
					});
				});

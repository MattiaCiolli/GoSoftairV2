 function initMap() {
	      var uluru = {lat: 42.368943, lng: 13.349799};
	      var map = new google.maps.Map(document.getElementById('mapcont'), {
	       zoom: 16,
	          center: uluru
	      });

	         //var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
	         
	      var marker = new google.maps.Marker({
	       position: uluru,
	          map: map
	             //icon: '${pageContext.request.contextPath}/resources/img/profile.jpg'
	      });
	     }
 
$(document).ready(function()

{
	//initMap();
	 
	
//attiva datepicker

$(function() {
	$('#datetimepicker1').datetimepicker();
});

//permette upload immagine
$("#Immagine")
.fileinput(
		{
			overwriteInitial : true,
			minFileSize : 1,
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
			defaultPreviewContent : '<img src="resources/img/uploadicon.png" id="imginput" alt="Immagine partita">',
			layoutTemplates : {
				main2 : '{preview}{browse} {remove}'
			},
			allowedFileExtensions : [ "jpg", "png",
					"gif" ]
		});

	
	//evita valori negativi

	jQuery.validator.addMethod("greaterthan", function(value, element, param) {

	  return this.optional(element) || value > param;

	}, "Inserire un numero realistico");



	// valida l'input, se corretto lo invia

		$("#partitaform").validate({

			rules: {

				NomeEvento: {

					required: true,

					minlength: 3,

					maxlength: 20

				},



				Tipologia: {

					required: true,

				},



				NumPartecipanti: {

					required: true,

					maxlength: 3,

					number: true,
					
					greaterthan: 0

				},


			},

			messages: {

				NomeEvento: {

					required: "Inserisci un nome evento",

					minlength: "Almeno 3 caratteri",

					maxlength: "Massimo 20 caratteri"

				},



				Tipologia: {

					required: "Seleziona una tipologia",

				},



				NumPartecipanti: {

					required: "Inserisci quanti partecipanti",

					maxlength: "Inserisci un numero realistico",

					number: "Solo numeri"

				},


			},
			
			highlight: function(element) {

	            $(element).closest('.form-group').addClass('has-error');

	        },

	        unhighlight: function(element) {

	            $(element).closest('.form-group').removeClass('has-error');

	        },

	        errorElement: 'span',

	        errorClass: 'help-block',

	        errorPlacement: function(error, element) {

	            if(element.parent('.input-group').length) {

	                error.insertAfter(element.parent());

	            } else {

	                error.insertAfter(element);

	            }

	        }

		});

		$("#creapartita").click(function()

		{

			if($("#partitaform").valid())

			{

				document.getElementById("partitaform").submit();

		    }

		});
		
});


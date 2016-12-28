$(document).ready(function()

{
	//attiva datepicker

$(function() {
	$('#datetimepicker1').datetimepicker();
});

//permette upload immagine
$("input[type='image']").click(function() {
	$("input[id='image']").click();
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


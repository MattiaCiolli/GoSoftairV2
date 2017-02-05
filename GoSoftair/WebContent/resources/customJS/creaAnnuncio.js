$(document)
		.ready(
				function()

				{

					// permette upload immagine
					$("#immagine")
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
										defaultPreviewContent : '<img src="../../resources/img/uploadicon.png" id="imginput" alt="Immagine annuncio">',
										layoutTemplates : {
											main2 : '{preview}{browse} {remove}'
										},
										allowedFileExtensions : [ "jpg", "png",
												"gif" ]
									});

					// evita valori negativi

					jQuery.validator.addMethod("greaterthan", function(value,
							element, param) {

						return this.optional(element) || value >= param;

					}, "Inserire un numero realistico");

					// valida l'input, se corretto lo invia

					$("#annuncioform").validate(
							{

								rules : {

									titolo : {

										required : true,

										minlength : 3,

										maxlength : 20

									},

									descrizione : {

										required : true,

										minlength : 3,

										maxlength : 100

									},

									prezzo : {

										required : true,

										number : true,

										greaterthan : 0

									},
									
									email : {

										required : true

									},
									
									numTelefono : {

										required : true,
										
										number : true

									},

								},

								messages : {

									titolo : {

										required : "Inserisci un titolo",

										minlength : "Almeno 3 caratteri",

										maxlength : "Massimo 20 caratteri"

									},

									descrizione : {

										required : "Inserisci una descrizione",

										minlength : "Almeno 3 caratteri",

										maxlength : "Massimo 100 caratteri"

									},

									prezzo : {

										required : "Inserisci un prezzo",

										number : "Solo numeri"

									},
									
									email : {

										required : "Inserisci una mail"

									},
									
									numTelefono : {

										required : "Inserisci un numero di telefono",

										number : "Solo numeri"

									},

								},

								highlight : function(element) {

									$(element).closest('.form-group').addClass(
											'has-error');

								},

								unhighlight : function(element) {

									$(element).closest('.form-group')
											.removeClass('has-error');

								},

								errorElement : 'span',

								errorClass : 'help-block',

								errorPlacement : function(error, element) {

									if (element.parent('.input-group').length) {

										error.insertAfter(element.parent());

									} else {

										error.insertAfter(element);

									}

								}

							});

					$("#inserisciannuncio").click(function()

					{

						if ($("#annuncioform").valid())

						{

							document.getElementById("annuncioform").submit();

						}

					});

				});

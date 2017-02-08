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
								browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
								removeIcon : '<i class="glyphicon glyphicon-remove"></i>',
								removeTitle : 'Cancel or reset changes',
								elErrorContainer : '#kv-avatar-errors-2',
								msgErrorClass : 'alert alert-block alert-danger',
								defaultPreviewContent : '<img src="../../resources/img/uploadicon.png" id="imginput" alt="Immagine partita">',
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


					//valida il formato della email inserita
					jQuery.validator.addMethod("emailValida", function validaEmail(email) {
						var regexp = /^(([^<>;()[].,;:s@"]+(.[^<>()[].,;:s@"]+)*)|(".+"))@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z-0-9]+.)+[a-zA-Z]{2,}))$/;
						return regexp.test(email);
					}, "Email non valida");

                    //valida il formato del numero di documento inserito (2 lettere e 7 numeri)
                    jQuery.validator.addMethod("documentoValido", function documentoValido(documentoValido) {
                        var regexp = /[A-Z]{2}[0-9]{7}/ ;
                        return regexp.test(documentoValido);
                    }, "Numero di documento non valido");

					// valida l'input, se corretto lo invia
					$("#formRegistrazione").validate(
                        {

                            rules: {

                                nome: {

                                    required: true,

                                    minlength: 3,

                                    maxlength: 20

                                },

                                cognome: {

                                    required: true,

                                    minlength: 3,

                                    maxlength: 20

                                },

                                username: {

                                    required: true,

                                    minlength: 3,

                                    maxlength: 20

                                },

                                email: {

                                    required: true

                                },


                                password: {

                                    required: true,

                                    minlenght: 8,

                                    maxlenght: 20


                                },

                                documentoValido: {

                                    required: true,

                                    minlenght: 9,

                                    maxlenght: 9
                                },
                            },

                            messages: {

                                nome: {

                                    required: "Inserisci il tuo nome",

                                    minlength: "Almeno 3 caratteri",

                                    maxlength: "Massimo 20 caratteri"

                                },

                                cognome: {

                                    required: "Inserisci il tuo cognome",

                                    minlength: "Almeno 3 caratteri",

                                    maxlength: "Massimo 20 caratteri"

                                },

                                username: {

                                    required: "Inserisci il tuo username",

                                    minlength: "Almeno 3 caratteri",

                                    maxlength: "Massimo 20 caratteri"

                                },

                                email: {

                                    required: "Inserisci la tua mail"

                                },

                                documentoValido: {

                                    required: "Inserisci il numero di carta d'identità"


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

					$("#creaUtente").click(function()

					{

						if ($("#formRegistrazione").valid())

						{

							document.getElementById("formRegistrazione").submit();

						}

					});

				});

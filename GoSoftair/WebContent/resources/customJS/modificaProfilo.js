$(document)
		.ready(
				function()

				{


					jQuery.validator.addMethod("validazione_documento", function(value, element) { 
						return this.optional(element) || /[A-Z]{2}[0-9]{7}/i.test(value); 
						}, "Formato non valido!");
					

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

                                    minlength: 8,

                                    maxlength: 20

                                },

                                confermaPassword: {

                                    required: true,

                                    equalTo: "#password"

                                },

                                documentoValido: {

                                    required: true,

                                    minlenght: 9,

                                    maxlenght: 9,

									validazione_documento: true
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

								password: {

									required: "Inserisci la password",
									 
									minlength: "Almeno 8 caratteri",

	                                maxlength: "Massimo 20 caratteri"

								},

								confermaPassword: {

									required: "Conferma la tua password",
									
									equalTo: "Attenzione, hai inserito due password differenti"
										
								},

                                documentoValido: {

                                    required: "Inserisci il numero di carta d'identità",
                                    	
                                	validazione_documento: "Hai inserito un numero di documento non valido"
                                    	


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

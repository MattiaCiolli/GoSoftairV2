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

					function validazione_email(email) {

						var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
						val=reg.test(email);
						if (!val) Window.Alert="Attenzione, hai inserito una email non valida";
						return val;
					};

                    //valida il formato del numero di documento inserito (2 lettere e 7 numeri)
					function validazione_documento(documentoValido) {
                        var reg = /[A-Z]{2}[0-9]{7}/ ;
						val1=reg.test(documentoValido);
                        if(!val1) Window.Alert="Attenzione, hai inserito un documento non valido";
						return val1;
                    };



                    //conferma psw

                    function confermapsw(password,confermaPassword) {
                    if(password==confermaPassword)
                    	val2=true;
					else {
						val2=false;
						Window.Alert="Attenzione, hai inserito due password diverse"
					}
					return val2;
                    };




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

                                    required: true,

									val: true


                                },


                                password: {

                                    required: true,

                                    minlenght: 8,

                                    maxlenght: 20


                                },


								confermaPassword: {

									required: true,

									minlenght: 8,

									maxlenght: 20,

									val2: true


								},

                                documentoValido: {

                                    required: true,

                                    minlenght: 9,

                                    maxlenght: 9,

									val1: true
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

									required: "Inserisci la password"

								},

								confermaPassword: {

									required: "Conferma la tua password"

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

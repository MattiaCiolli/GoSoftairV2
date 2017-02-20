$(document)
		.ready(
				function()

				{
					var btnCust = '<input id="imgsubmit" type="submit" class="btn btn-default" value="Upload" ></input>'; 
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
								defaultPreviewContent : '<img src="'+$("div#img").text()+'" id="imginput" alt="Immagine profilo">',
								layoutTemplates : {
									main2 : '{preview}{browse}{remove}'+  btnCust
								},
								allowedFileExtensions : [ "jpg", "png",
										"gif" ]
							});

				});

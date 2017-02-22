/**
 * Created by Davide on 14/02/2017.
 */
$(".clicca").click(function() {
    var link =$(this).attr("href");

    $.ajax({
        type: "POST",
        url: link,
        cache: false,
        success: function(response){
            //console.log(response);
            $('#imgAnnuncio').attr("src","../resources/img/annunci/big/"+response.immagine);
            $('#titolo').text(response.titolo);
            $('#descrizione').text(response.descrizione);
            $('#prezzo').text(response.prezzo);
            $('#titolo').text(response.titolo);
            $('#telefono').text(response.numeroTelefono);
            $('#emailContatti').text(response.email);
            $('#data').text(response.datainserzione);
        }
    });
})
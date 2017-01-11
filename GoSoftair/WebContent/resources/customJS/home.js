/*carousel slide*/
$('#myCarousel').carousel({
  interval: 40000
});



/*carousel e responsive */
$('.carousel .item').each(function(){
    var next = $(this).next();
    $(".carousel-inner .active.left").css("left", "-100%") ;
    $(".carousel-inner .next").css("left", "100%") ;
    $(".carousel-inner .prev").css("left", "-100%") ;

    if ($(window).width() > 768){
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));
        $(".carousel-inner .active.left").css("left", "-50%") ;
        $(".carousel-inner .next").css("left", "50%") ;
        $(".carousel-inner .prev").css("left", "-50%") ;
    }

    if ($(window).width() > 1200){
        if (next.next().length > 0) {
            next.next().children(':first-child').clone().appendTo($(this)).addClass('rightest');
        }
        else {
            $(this).siblings(':first').children(':first-child').clone().appendTo($(this));
        }
        $(".carousel-inner .active.left").css("left", "-33%") ;
        $(".carousel-inner .next").css("left", "33%") ;
        $(".carousel-inner .prev").css("left", "-33%") ;
    }
});






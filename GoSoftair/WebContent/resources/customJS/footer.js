$(document).ready(function(){
    var docHeight = $(document.body).height() - $("footer").height();
    if(docHeight < $(window).height()){
        $("footer").css({"position":"fixed"});
    }
    
    $(".esteso").css({"min-height": $(window).height()});

});

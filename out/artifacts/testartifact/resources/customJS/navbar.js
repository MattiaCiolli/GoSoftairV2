var pro=1;
$(document).ready(function(){
    $(window).scroll(function() {
        if ($(document).scrollTop() > ($("nav").height()+ $("header").height())  && pro==1) {
            $("nav").css({top: -$("nav").height()});
            $("nav").animate({'top' : '0px'}, {duration: 400, easing: "swing"}).css({'position' : 'fixed'});
            pro=0;
        }
        if ($(document).scrollTop() < ($(".nav").height()+ $("header").height())){
            $("nav").css({"position":"static","top":"0"});
            pro=1;
        }
    });
});

/*
$(document).ready(function(){
    $(window).scroll(function() {
        if ($(document).scrollTop() > ($("nav").height()+ $("header").height())  && pro==1) {
            $("nav").css({top: -$("nav").height()});
            $("nav").animate({'top' : '0px'}, {duration: 400, easing: "swing"}).css({"position" : "fixed", "margin-top":"0px"});
            pro=0;
        }
        if ($(document).scrollTop() < ($(".nav").height()+ $("header").height())){
            //$("nav").css({"position":"static","top":"0"});
            $("nav").css({"position":"absolute","margin-top":"30px"});
            pro=1;
        }
    });
});
    */
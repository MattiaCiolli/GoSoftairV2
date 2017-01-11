/*effetto navbar*/
var pro=1;
$(document).ready(function(){
    $(window).scroll(function() {
        if ($(document).scrollTop() > ($(".top_panel_middle").height()+ $(".top_panel").height())  && pro==1) {
            $(".top_panel_middle").css({top: -$(".top_panel_middle").height()});
            $(".top_panel_middle").animate({'top' : '0px'}, {duration: 400, easing: "swing"}).css({'position' : 'fixed'});
            pro=0;
        }
        if ($(document).scrollTop() < ($(".top_panel_middle").height()+ $(".top_panel").height())){
          $(".top_panel_middle").css({"position":"static","top":"0"});
          pro=1;
        }

      });


});
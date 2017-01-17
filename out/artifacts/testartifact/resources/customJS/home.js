$(document).ready(function()

{//sistema le slide di slick in base alla risoluzione
	$('.autoplay').slick({
		slidesToShow : 3,
		slidesToScroll : 1,
		autoplay : true,
		autoplaySpeed : 5000,
		responsive : [ {
			breakpoint : 1199,
			settings : {
				slidesToShow : 2,
			}
		}, {
			breakpoint : 767,
			settings : {
				slidesToShow : 1,
			}
		}

		]

	});
});

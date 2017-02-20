var pro = 1;

$(document).ready(
		function() {
			$(window).scroll(
					function() {
						if ($(document).scrollTop() > ($("nav").height() + $(
								"header").height())
								&& pro == 1) {
							$("nav").css({
								top : -$("nav").height()
							});
							$("nav").animate({
								'top' : '0px'
							}, {
								duration : 400,
								easing : "swing"
							}).css({
								'position' : 'fixed'
							});
							pro = 0;
						}
						if ($(document).scrollTop() < ($(".nav").height() + $(
								"header").height())) {
							$("nav").css({
								"position" : "relative",
								"top" : "0"
							});
							pro = 1;
						}
					});

			$(document).on('click', '.dropdown-menu', function(e) {
				e.stopPropagation();
			});

			if ($("div#msg").text().length > 1) {
				if ($("div#msg").text() == "Login effettuato") {
					$("div#msg").css('background-color', '#94a31a');
				}
				$("#msg").fadeIn(1000, function() {
					setTimeout(function() {
						$("#msg").fadeOut(1500)
					}, 2000)
				});
			}
		});

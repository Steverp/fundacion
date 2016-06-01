

new WOW().init();
 $(document).ready(function () {
	 
	 
$(function() {
  $('#consultant').change(function(){
    $('.colors').hide();
				$('.consultant').removeClass('consultant-active')
    $('#' + $(this).val()).addClass('consultant-active')

  });
});

 	var url_completa = location.href;
 	$("nav li a[href='" + url_completa + "']").addClass("activo");

// 	$(function () {
//
// 		$(' #da-thumbs .myBox ').each(function () {
// 			$(this).hoverdir();
//
// 		});
//
// 	});

// 	$('.da-thumbs .theBox').hover(function () {
// 		$(this).children('.myBox').next('.myText').toggleClass('myText-active')
// 		return false;
// 	})

 	$('section.outstanding article').hover(function () {
 		$(this).children('.caption').toggleClass('caption-active')
 		return false;
 	})
	
	 	$('.next-form').click(function () {
 		$('.form.step-1').removeClass('form-active')
		$('.form.step-2').addClass('form-active')
 		return false;
 	})
		
//		


 	//@Tabs

 	$('#video').click(function () {
 		$(this).get(0).paused ? $(this).get(0).play() : $(this).get(0).pause();
 	});


 	$('#news').bxSlider({
 		minSlides: 1,
 		maxSlides: 1,
 		slideMargin: 0
 	});

 	$('.myTabs').easyResponsiveTabs({
 		type: 'vertical',
 		width: 'auto',
 		fit: true,
 		tabidentify: 'tab',

 	});


 	$(".button-collapse").sideNav();
 	$('.slider').slider({
 		interval: 5000,
 		indicators: true,
 		full_width: true

 	});
 	//	$('.highlight article').hover(function () {
 	//		$(this).toggleClass('z-depth-4')
 	//		return false;
 	//	})
 	//	
 	//		$('.card').on('mouseenter', function () {
 	//		$(this).toggleClass('z-depth-3')
 	//		return false;
 	//	})
 	$('.modal-trigger').leanModal();
// 	$('.dropdown-button').dropdown({
// 		inDuration: 300,
// 		outDuration: 225,
// 		constrain_width: false, // Does not change width of dropdown to that of the activator
// 		hover: true, // Activate on hover
// 		gutter: 0, // Spacing from edge
// 		belowOrigin: true // Displays dropdown below the button
// 	});
	 
	 
 	$('.submenu-open').hover(function () {
		$(this).nextAll('.submenu-open').children('.submenu').removeClass('submenu-active')
		$(this).prevAll('.submenu-open').children('.submenu').removeClass('submenu-active')
 		$(this).children('.submenu').addClass('submenu-active')
 		return false;
 	})
	
	$(".banner, main h1").hover(function () {
		$('.submenu').removeClass('submenu-active')
		return false;
	});

	 

 	//	$(".fancybox").fancybox({
 	//		openEffect: 'none',
 	//		closeEffect: 'none'
 	//	});
 	$(".fancybox-thumb").fancybox({
 		prevEffect: 'none',
 		nextEffect: 'none',
 		helpers: {
 			title: {
 				type: 'outside'
 			},
 			thumbs: {
 				width: 50,
 				height: 50
 			}
 		}
 	});


 	$('.bxslider').bxSlider({
 		mode: 'vertical',
 		nextSelector: '.banner .next',
 		prevSelector: '.banner .prev',
 		nextText: '',
 		prevText: '',
		useCSS: false,
		infiniteLoop: true,
		hideControlOnEnd: true,
		easing: 'easeInBack',
		speed: 1000

 	});

 	$('.bxslider2').bxSlider({
 		mode: 'fade',
 		auto: true,
 		pause: 4500,
		pager: false


 	});



 	$('#carousel').bxSlider({
 		slideWidth: 170,
 		minSlides: 3,
 		maxSlides: 5,
 		slideMargin: 10
 	});

 	var wd = $(window).width();
 	if (wd < 600) {



 	} else if (wd > 599) {
 		$('.highlight.myAccordeon article').click(function () {
 			$(this).addClass('myAccordeon-active')
 			$(this).prevAll('article').removeClass('myAccordeon-active')
 			$(this).nextAll('article').removeClass('myAccordeon-active')
 		});

 	}


 });
 $(window).load(function () {
 	$('.parallax').parallax();
 	//	$('.preload').fadeOut(300);
 	// var nav = $('header');
 	//
 	//    $(window).scroll(function () {
 	//        if ($(this).scrollTop() > 200) {
 	//            nav.addClass("fixed-menu");
 	//        } else {
 	//            nav.removeClass("fixed-menu");
 	//        }
 	//    });
 });
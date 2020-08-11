/* =====================================
Template Name: Eshop
Author Name: Naimur Rahman
Author URI: http://www.wpthemesgrid.com/
Description: Eshop - eCommerce HTML5 Template.
Version:1.0
========================================*/
/*=======================================
[Start Activation Code]
=========================================
	01. Mobile Menu JS
	02. Sticky Header JS
	03. Search JS
	04. Slider Range JS
	05. Home Slider JS
	06. Popular Slider JS
	07. Quick View Slider JS
	08. Home Slider 4 JS
	09. CountDown
	10. Flex Slider JS
	11. Cart Plus Minus Button
	12. Checkbox JS
	13. Extra Scroll JS
	14. Product page Quantity Counter
	15. Video Popup JS
	16. Scroll UP JS
	17. Nice Select JS
	18. Others JS
	19. Preloader JS
=========================================
[End Activation Code]
=========================================*/

let _TURBOLINKS_NO_SCROLL = false;
const turbolinksPersistScroll = () => {
	let scrollPosition = null;


	document.addEventListener('turbolinks:before-visit', (event) => {
		console.log('before!');
		if (enabled)
			scrollPosition = window.scrollY;
		else
			scrollPosition = null;
		enabled = false
	});

	document.addEventListener('turbolinks:load', (event) => {
		const elements = document.querySelectorAll(`[data-turbolinks-no-scroll="true"]`);
		console.log(elements);
		for (let i = 0; i < elements.length; i++) {
			elements[i].addEventListener('click', () => {
				enabled = true
			})
		}

		if (scrollPosition) {
		//	let inner = document.querySelector('.header-inner');
			//inner.style.position = 'fixed';
			let fix_bug = document.querySelector('.fix-bug');
			let header = document.querySelector('.header');

			header.style.animation = ""
			if (scrollPosition > 200) {
				header.classList.add("sticky");

				fix_bug.classList.add('fix-bug-active');
			} else {
				header.classList.remove("sticky");
				fix_bug.classList.remove('fix-bug-active');
			}
			window.scrollTo(0, scrollPosition)

		}
	})
};

turbolinksPersistScroll();

$(document).on('turbolinks:load', function () {
	(function ($) {

		"use strict";



			/*====================================
                Mobile Menu
            ======================================*/
			$('.menu').slicknav({
				prependTo: ".mobile-nav",
				duration: 300,
				animateIn: 'fadeIn',
				animateOut: 'fadeOut',
				closeOnClick: true,
			});

			/*====================================
            03. Sticky Header JS
            ======================================*/

			let fix_bug = document.querySelector('.fix-bug');

			jQuery(window).on('scroll', function () {

				let header = document.querySelector('.header');

				if ($(this).scrollTop() > 200) {
					header.classList.add("sticky");
					fix_bug.classList.add('fix-bug-active');
				} else {
					header.classList.remove("sticky");
					fix_bug.classList.remove('fix-bug-active');
				}

			});

			/*=======================
              Search JS JS
            =========================*/
			$('.top-search a').on("click", function () {
				$('.search-top').toggleClass('active');
			});

			/*=======================
              Slider Range JS
            =========================*/
			$(function () {

				$("#slider-range").slider({
					range: true,
				});

			});

			/*=======================
              Home Slider JS
            =========================*/
			$('.home-slider').owlCarousel({
				items: 1,
				autoplay: true,
				autoplayTimeout: 5000,
				smartSpeed: 400,
				animateIn: 'fadeIn',
				animateOut: 'fadeOut',
				autoplayHoverPause: true,
				loop: true,
				nav: true,
				merge: true,
				dots: false,
				navText: ['<i class="ti-angle-left"></i>', '<i class="ti-angle-right"></i>'],
				responsive: {
					0: {
						items: 1,
					},
					300: {
						items: 1,
					},
					480: {
						items: 2,
					},
					768: {
						items: 3,
					},
					1170: {
						items: 4,
					},
				}
			});

			/*=======================
              Popular Slider JS
            =========================*/
			$('.popular-slider').owlCarousel({
				items: 1,
				autoplay: true,
				autoplayTimeout: 5000,
				smartSpeed: 400,
				animateIn: 'fadeIn',
				animateOut: 'fadeOut',
				autoplayHoverPause: true,
				loop: true,
				nav: true,
				merge: true,
				dots: false,
				navText: ['<i class="ti-angle-left"></i>', '<i class="ti-angle-right"></i>'],
				responsive: {
					0: {
						items: 1,
					},
					300: {
						items: 1,
					},
					480: {
						items: 2,
					},
					768: {
						items: 3,
					},
					1170: {
						items: 4,
					},
				}
			});
			$('.product-images-slider').owlCarousel({
				autoplay: true,
				animateIn: 'fadeIn',
				autoplayTimeout: 5000,
				smartSpeed: 400,
				animateOut: 'fadeOut',
				autoplayHoverPause: true,
				loop: true,
				nav: true,
				merge: true,
				dots: false,
				navText: ['<i class="ti-angle-left"></i>', '<i class="ti-angle-right"></i>'],
				responsive: {
					0: {
						items: 1,
					},
					500: {
						items: 2,
					},
					768: {
						items: 3,
					},
					1170: {
						items: 4,
					},
				}

			});


			/*===========================
              Quick View Slider JS
            =============================*/
			$('.quickview-slider-active').owlCarousel({
				items: 1,
				autoplay: true,
				autoplayTimeout: 5000,
				smartSpeed: 400,
				autoplayHoverPause: true,
				nav: true,
				loop: true,
				merge: true,
				dots: false,
				navText: ['<i class=" ti-arrow-left"></i>', '<i class=" ti-arrow-right"></i>'],
			});

			/*===========================
              Home Slider 4 JS
            =============================*/
			$('.home-slider-4').owlCarousel({
				items: 1,
				autoplay: true,
				autoplayTimeout: 5000,
				smartSpeed: 400,
				autoplayHoverPause: true,
				nav: true,
				loop: true,
				merge: true,
				dots: false,
				navText: ['<i class=" ti-arrow-left"></i>', '<i class=" ti-arrow-right"></i>'],
			});

			/*====================================
            14. CountDown
            ======================================*/
			$('[data-countdown]').each(function () {
				var $this = $(this),
					finalDate = $(this).data('countdown');
				$this.countdown(finalDate, function (event) {
					$this.html(event.strftime(
						'<div class="cdown"><span class="days"><strong>%-D</strong><p>Days.</p></span></div><div class="cdown"><span class="hour"><strong> %-H</strong><p>Hours.</p></span></div> <div class="cdown"><span class="minutes"><strong>%M</strong> <p>MINUTES.</p></span></div><div class="cdown"><span class="second"><strong> %S</strong><p>SECONDS.</p></span></div>'
					));
				});
			});

			/*====================================
            16. Flex Slider JS
            ======================================*/
			(function ($) {
				'use strict';
				$('.flexslider-thumbnails').flexslider({
					animation: "slide",
					controlNav: "thumbnails",
				});
			})(jQuery);

			/*====================================
              Cart Plus Minus Button
            ======================================*/
			var CartPlusMinus = $('.cart-plus-minus');
			CartPlusMinus.prepend('<div class="dec qtybutton">-</div>');
			CartPlusMinus.append('<div class="inc qtybutton">+</div>');
			$(".qtybutton").on("click", function () {
				var $button = $(this);
				var oldValue = $button.parent().find("input").val();
				if ($button.text() === "+") {
					var newVal = parseFloat(oldValue) + 1;
				} else {
					// Don't allow decrementing below zero
					if (oldValue > 0) {
						var newVal = parseFloat(oldValue) - 1;
					} else {
						newVal = 1;
					}
				}
				$button.parent().find("input").val(newVal);
			});

			/*=======================
              Extra Scroll JS
            =========================*/
			$('.scroll').on("click", function (e) {
				var anchor = $(this);
				$('html, body').stop().animate({
					scrollTop: $(anchor.attr('href')).offset().top - 0
				}, 900);
				e.preventDefault();
			});

			/*===============================
            10. Checkbox JS
            =================================*/
			$('input[type="checkbox"]').change(function () {
				if ($(this).is(':checked')) {
					$(this).parent("label").addClass("checked");
				} else {
					$(this).parent("label").removeClass("checked");
				}
			});

			/*==================================
             12. Product page Quantity Counter
             ===================================*/
			$('.qty-box .quantity-right-plus').on('click', function () {
				var $qty = $('.qty-box .input-number');
				var currentVal = parseInt($qty.val(), 10);
				if (!isNaN(currentVal)) {
					$qty.val(currentVal + 1);
				}
			});
			$('.qty-box .quantity-left-minus').on('click', function () {
				var $qty = $('.qty-box .input-number');
				var currentVal = parseInt($qty.val(), 10);
				if (!isNaN(currentVal) && currentVal > 1) {
					$qty.val(currentVal - 1);
				}
			});

			/*=====================================
            15.  Video Popup JS
            ======================================*/
			$('.video-popup').magnificPopup({
				type: 'iframe',
				removalDelay: 300,
				mainClass: 'mfp-fade'
			});

			/*====================================
                Scroll Up JS
            ======================================*/
			$.scrollUp({
				scrollText: '<span><i class="fa fa-angle-up"></i></span>',
				easingType: 'easeInOutExpo',
				scrollSpeed: 900,
				animation: 'fade'
			});

			;

			/*====================================
            18. Nice Select JS
            ======================================*/

			$('select').niceSelect();

			/*=====================================
             Others JS
            ======================================*/
			$(function () {
				$("#slider-range").slider({
					range: true,
					min: 0,
					max: 500,
					values: [0, 500],
					slide: function (event, ui) {
						$("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);

					}
				});
				$("#amount").val("$" + $("#slider-range").slider("values", 0) +
					" - $" + $("#slider-range").slider("values", 1));


			});


	})(jQuery);

})


//= require jquery.min.js
//= require jquery-migrate-3.0.0.js
//= require jquery-ui.min.js
//= require popper.min.js
//= require bootstrap.min.js
//= require color.js
//= require slicknav.min.js
//= require owl-carousel.js
//= require magnific-popup.js
//= require facnybox.min.js
//= require waypoints.min.js
//= require finalcountdown.min.js
//= require nicesellect.js
//= require ytplayer.min.js
//= require flex-slider.js
//= require scrollup.js
//= require onepage-nav.min.js
//= require easing.js
//= require active.js
//= require page_specific/products_new.js
//= require page_specific/users_register.js
//= require page_specific/show_product.js
//= require page_specific/restore.js
//= require page_specific/cart.js
//= require turbolinks






$(document).on('turbolinks:load', function() {
    let links = document.querySelectorAll('.main-category > li');
    let menu = document.querySelector('.main-category');

    links.forEach((el) => {

        el.addEventListener('mouseover', (e) => {
            menu.style.overflow = 'visible';
        });

        el.addEventListener('mouseout', (e) => {
            menu.style.overflow = 'hidden';
        });

    });
})



$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('products')&&get_body().classList.contains('index')){
        let slider_elem = document.querySelector('.range-slider');
        let min_val = slider_elem.getAttribute('data-min');
        let max_val = slider_elem.getAttribute('data-max');
        let slider_inputs = document.querySelectorAll('.price-filter .label-input input');
        $(".js-range-slider").ionRangeSlider({
            skin: "sharp",
            type: "double",
            grid: true,
            min: min_val,
            max: max_val,
            onChange: function (data) {
                slider_inputs[0].value = data.from_pretty;
                slider_inputs[1].value = data.to_pretty;
            }
        });
        
    }
})
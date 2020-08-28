$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('products')&&get_body().classList.contains('index')){
        let slider_block = document.querySelector('.range-slider');
        let min_val = parseFloat(slider_block.getAttribute('data-min'));
        let max_val = parseFloat(slider_block.getAttribute('data-max'));
        let slider_inputs = document.querySelectorAll('.price-filter .label-input input');
        slider_inputs[0].value = min_val;
        slider_inputs[1].value = max_val;
        $(".js-range-slider").ionRangeSlider({
            skin: "sharp",
            type: "double",
            min: Math.round(min_val),
            max: Math.round(max_val),
            grid: true,
            grid_num: 3,
            step: 1,
            postfix: " ₽",
            onChange: function (data) {
                slider_inputs[0].value = data.from;
                slider_inputs[1].value = data.to;
            }
        });
        let slider = $(".js-range-slider").data("ionRangeSlider"); 
        slider_inputs[0].addEventListener('change', ()=>{
            if(!/^\d*\.?\d*$/.test(slider_inputs[0].value)||(slider_inputs[0].value == ".")){
                slider_inputs[0].value = min_val;
            } else{
                let value = parseFloat(slider_inputs[0].value).toFixed(2);
                if(value < min_val){
                    slider_inputs[0].value = min_val;
                } else if (value > parseFloat(slider_inputs[1].value)){
                    slider_inputs[0].value = slider_inputs[1].value;
                } else {
                    slider_inputs[0].value = value;
                }
            }
            slider.update({
                from: slider_inputs[0].value
            })
        });
        slider_inputs[1].addEventListener('change', ()=>{
            if(!/^\d*\.?\d*$/.test(slider_inputs[1].value)||(slider_inputs[1].value == ".")){
                slider_inputs[1].value = max_val;
            } else{
                let value = parseFloat(slider_inputs[1].value).toFixed(2);
                if(value > max_val){
                    slider_inputs[1].value = max_val;
                } else if (value < parseFloat(slider_inputs[0].value)){
                    slider_inputs[1].value = slider_inputs[0].value;
                } else {
                    slider_inputs[1].value = value;
                }
            }
            slider.update({
                to: slider_inputs[1].value
            })
        });
        
        sort_handler = function(el){
            turbolinks_control.setEnabled();
            if(document.location.search){
                Turbolinks.visit(document.location.href+'&order='+el.value);
            } else{
                Turbolinks.visit(document.location.href+'?order='+el.value);
            }
        }
    }
})
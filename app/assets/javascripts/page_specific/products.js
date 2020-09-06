$(document).on('turbolinks:load', function () {
    let slider_block = document.querySelector('.range-slider');
    if (slider_block){
        let slider_inputs = document.querySelectorAll('.price-filter .label-input input');
        let min_val = parseFloat(slider_block.getAttribute('data-min'));
        let max_val = parseFloat(slider_block.getAttribute('data-max'));
        let from_val = parseFloat(slider_inputs[0].value);
        let to_val = parseFloat(slider_inputs[1].value);
        //slider_inputs[0].value = document.querySelector('#amount_min').value;
        //slider_inputs[1].value = document.querySelector('#amount_max').value;
        $(".js-range-slider").ionRangeSlider({
            skin: "sharp",
            type: "double",
            min: Math.round(min_val),
            max: Math.round(max_val),
            from: from_val,
            to: to_val,
            grid: true,
            grid_num: 3,
            step: 1,
            postfix: " ₽",
            onChange: function (data) {
                if(data.from !=  Math.round(from_val)){
                    slider_inputs[0].value = data.from;
                    from_val = data.from;
                }
                if(data.to !=  Math.round(to_val)){
                    slider_inputs[1].value = data.to;
                    to_val = data.to;
                }
            }
        });
        let slider = $(".js-range-slider").data("ionRangeSlider"); 
        slider_inputs[0].addEventListener('change', ()=>{
            if(!/^\d*[\.\,]?\d*$/.test(slider_inputs[0].value)||(slider_inputs[0].value == ".")){
                slider_inputs[0].value = min_val;
            } else{
                slider_inputs[0].value = slider_inputs[0].value.replace(",", ".");
                let value = parseFloat(slider_inputs[0].value).toFixed(2);
                if(value < min_val){
                    slider_inputs[0].value = min_val;
                } else if (value > parseFloat(slider_inputs[1].value)){
                    slider_inputs[0].value = slider_inputs[1].value;
                } else {
                    slider_inputs[0].value = value;
                }
            }
            from_val = slider_inputs[0].value;
            slider.update({
                from: slider_inputs[0].value
            })
        });
        slider_inputs[1].addEventListener('change', ()=>{
            if(!/^\d*[\.\,]?\d*$/.test(slider_inputs[1].value)||(slider_inputs[1].value == ".")){
                slider_inputs[1].value = max_val;
            } else{
                slider_inputs[0].value = slider_inputs[0].value.replace(",", ".");
                let value = parseFloat(slider_inputs[1].value).toFixed(2);
                if(value > max_val){
                    slider_inputs[1].value = max_val;
                } else if (value < parseFloat(slider_inputs[0].value)){
                    slider_inputs[1].value = slider_inputs[0].value;
                } else {
                    slider_inputs[1].value = value;
                }
            }
            to_val = slider_inputs[1].value;
            slider.update({
                to: slider_inputs[1].value
            })
        });
        

    }
})
sort_handler = function(el){
    turbolinks_control.setEnabled();
    if(document.location.search){
        Turbolinks.visit(document.location.href+'&order='+el.value);
    } else{
        Turbolinks.visit(document.location.href+'?order='+el.value);
    }
}

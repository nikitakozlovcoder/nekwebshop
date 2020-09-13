$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('shops')&&get_body().classList.contains('profile')){
        //choice-container functionality
        document.querySelectorAll('.choice-container').forEach((container) =>{
            let option_arr = container.querySelectorAll('.container-header > .option');
            let body_arr = container.querySelectorAll('.container-body > .option');
            let state_elem = container.querySelector('.container-header .hidden');
            option_arr.forEach((el, i)=>{
                el.setAttribute('data-id', i);
                el.addEventListener('click', ()=>{       
                    let last_value = state_elem.getAttribute('data-last');
                    let cur_value = el.getAttribute('data-id');

                    option_arr[last_value].classList.toggle('active');
                    option_arr[cur_value].classList.toggle('active');

                    body_arr[last_value].classList.toggle('show');
                    body_arr[cur_value].classList.toggle('show');

                    state_elem.setAttribute('data-last', cur_value);
                });
            });
        });

        //order menu functionality
        ShowOrder = function(el){
            let container = el.parentNode; 
            container.classList.toggle('active');
            let arrow_list = el.querySelector('.inf_btn i').classList;
            if(arrow_list.contains('ti-angle-down')){
                arrow_list.remove('ti-angle-down');
                arrow_list.add('ti-angle-up');
                container.querySelector('.inner_info').style.maxHeight = container.querySelector('.wrapper').clientHeight + "px";
            } else{
                arrow_list.remove('ti-angle-up');
                arrow_list.add('ti-angle-down');
                container.querySelector('.inner_info').style.maxHeight = "0px";
            }
        }

        window.addEventListener('resize', function() {
            document.querySelectorAll('.order.active').forEach((el)=>{
                el.querySelector('.inner_info').style.maxHeight = el.querySelector('.wrapper').clientHeight + "px";
            });
        });

        
    }
})
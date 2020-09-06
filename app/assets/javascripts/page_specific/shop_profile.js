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
    }
})
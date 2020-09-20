$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('users')&&get_body().classList.contains('orders')){
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
$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('shops')&&get_body().classList.contains('profile')){


        function AppendPhoto(container, src) {
        var img = document.createElement('div');
        img.className = 'img-wrapper';
        img.innerHTML = `<img src="${src}"/>`;
        container.appendChild(img);
    }

    preview_image = function (input) {

        if (input.files) {
          //get images count
          var filesCount = input.files.length;
          //get outter_container
          var container = input.parentNode.parentNode;
          //mark that images changed
          container.querySelector('input[type="text"]').value = "Yes";
          //delete old elements
          var elements = container.getElementsByClassName("img-wrapper");
          while (elements[0]) {
             elements[0].parentNode.removeChild(elements[0]);
          }
          //add images
          for(var i = 0; i<filesCount; i++){
              var reader = new FileReader();
              reader.onload = function(e) {
                AppendPhoto(container, e.target.result);
              }
              reader.readAsDataURL(input.files[i]);
          }
        }
    }

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
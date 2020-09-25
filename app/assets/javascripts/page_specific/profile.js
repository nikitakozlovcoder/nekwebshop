$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('users') && (get_body().classList.contains('profile') || get_body().classList.contains('profile_change') || get_body().classList.contains('password_change'))){

        //choice-container functionality

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

        /*document.querySelector('.change_user_data').addEventListener("click", function() {
            console.log('hi');
            document.querySelector('.change').style.display = "block";
        })*/
        function show_user_edit() {
            let change_value = document.querySelectorAll('.change');
            let change_data = document.querySelectorAll('.data');
            document.querySelector('.current_photo').style.display = "none";
            document.querySelector('.change_confirmation_btn').style.display = "flex";

            for (var i = 0; i<change_value.length; i++) {
                change_value[i].style.display = "flex";

            }
            change_data.forEach((el)=>{
                el.style.display = "none";
            });
            
            document.querySelector('.change_user_data').style.display = "none";

        }

        if (document.querySelector('.section-profile').dataset.showMain == 'true')
        {
           show_user_edit();
        }
        let password_visible = false;
        if (document.querySelector('.section-profile').dataset. showPassword == 'true')
        {
            toggle_password();
        }

        //document.querySelector('.change_user_data').addEventListener("click", function() {
            //show_user_edit();
       // });


        function toggle_password()
        {
            if(!password_visible)
            {
                document.querySelector('.password_change').style.display = "block";
            }
            else
            {
                document.querySelector('.password_change').style.display = "none";
            }
            password_visible = !password_visible;
        }
        let user_data_visible = false;
        function toggle_change_data() {
            if(!user_data_visible)
            {
                let change_value = document.querySelectorAll('.change');
                let change_data = document.querySelectorAll('.data');
                document.querySelector('.change_confirmation_btn').style.display = "flex";

                for (var i = 0; i<change_value.length; i++) {
                    change_value[i].style.display = "flex";
                    change_data[i].style.display = "none";
                }
                //document.querySelector('.password_change').style.display = "block";
            }
            else
            {
                let change_value = document.querySelectorAll('.change');
                let change_data = document.querySelectorAll('.data');
                document.querySelector('.change_confirmation_btn').style.display = "none";

                for (var i = 0; i<change_value.length; i++) {
                    change_value[i].style.display = "none";
                    change_data[i].style.display = "flex";
                }
                //document.querySelector('.password_change').style.display = "none";
            }
            user_data_visible = !user_data_visible;
        }
        document.querySelector('.change_user_data').addEventListener("click", function() {
            toggle_change_data();
        });
        document.querySelector('.change_user_password').addEventListener("click", function() {

            toggle_password();
           /* document.querySelector('.new_passwd').style.display = "block";
            document.querySelector('.new_passwd_confirm').style.display = "block";
            document.querySelector('.change_user_password').style.display = "none";*/
        });        
    }
})

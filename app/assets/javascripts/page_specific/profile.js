$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('users') && (get_body().classList.contains('profile') || get_body().classList.contains('profile_change') || get_body().classList.contains('password_change'))){

        //choice-container functionality

        /*document.querySelector('.change_user_data').addEventListener("click", function() {
            console.log('hi');
            document.querySelector('.change').style.display = "block";
        })*/
        function show_user_edit() {
            let change_value = document.querySelectorAll('.change');
            let change_data = document.querySelectorAll('.data');

            for (var i = 0; i<change_value.length; i++) {
                change_value[i].style.display = "flex";
                change_data[i].style.display = "none";
            }
            document.querySelector('.change_confirmation_btn').style.display = "flex";
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

        document.querySelector('.change_user_data').addEventListener("click", function() {
            show_user_edit();
        });


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
        document.querySelector('.change_user_password').addEventListener("click", function() {

            toggle_password();
           /* document.querySelector('.new_passwd').style.display = "block";
            document.querySelector('.new_passwd_confirm').style.display = "block";
            document.querySelector('.change_user_password').style.display = "none";*/
        });        
    }
})

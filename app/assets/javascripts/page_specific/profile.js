$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('users') && get_body().classList.contains('profile')){

        //choice-container functionality

        /*document.querySelector('.change_user_data').addEventListener("click", function() {
            console.log('hi');
            document.querySelector('.change').style.display = "block";
        })*/
        document.querySelector('.change_user_data').addEventListener("click", function() {
            let change_value = document.querySelectorAll('.change');
            let change_data = document.querySelectorAll('.data');

            for (var i = 0; i<change_value.length; i++) {
                change_value[i].style.display = "flex";
                change_data[i].style.display = "none";
            }
            document.querySelector('.change_confirmation_btn').style.display = "flex";
            document.querySelector('.change_user_data').style.display = "none";
        });
        let password_visible = false
        document.querySelector('.change_user_password').addEventListener("click", function() {
            if(!password_visible)
            {
                document.querySelector('.password_change').style.display = "block";
            }
            else
            {
                document.querySelector('.password_change').style.display = "none";
            }
            password_visible = !password_visible;

           /* document.querySelector('.new_passwd').style.display = "block";
            document.querySelector('.new_passwd_confirm').style.display = "block";
            document.querySelector('.change_user_password').style.display = "none";*/
        });
    }
})

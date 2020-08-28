$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('users')){
        //choice-container functionality
        console.log('hi');
        document.querySelector(".email_data").style.display = "none";
    }
})
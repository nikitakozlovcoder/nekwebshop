$(document).on('turbolinks:load', function () {
        if (get_body().classList.contains('users') && (get_body().classList.contains('registration') || get_body().classList.contains('create'))) {
                let form = document.querySelector('.form');
                form.addEventListener('submit', (e) => {
                        e.preventDefault();
                        //Remove old errors
                        let errors = document.querySelectorAll('.error-list');
                        errors.forEach(el => {
                                el.innerHTML = "";
                        });

                        //Validate flag
                        let valid = true;

                        //Validate Email element
                        {
                                let email = document.querySelector('.Email');
                                let email_val = email.querySelector('input').value.trim();
                                let error_list = email.querySelector('.error-list');
                                let min = email.getAttribute("data-min");
                                let max = email.getAttribute("data-max");
                                if (email_val == "") {
                                        valid = false;
                                        error_list.innerHTML += `<li>Введите адрес своей эл. почты</li>`;
                                        //  } else if(min&&(email_val.length < min)){
                                        //    valid = false;
                                        //   error_list.innerHTML+=`<li>Адрес слишком короткий, минимальная длина - ${min} cимволов</li>`;
                                        // } else if(max&&(email_val.length > max)){
                                        //   valid = false;
                                        //    error_list.innerHTML+=`<li>Адрес слишком длинный, максимальная длина - ${max} cимволов</li>`;
                                        // /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
                                        // /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
                                } else if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email_val))) {
                                        valid = false;
                                        console.log(email_val);
                                        error_list.innerHTML += `<li>Адрес эл. почты не соотвесвует стандартному формату.<br>Пример: my.example12@test.ru</li>`;
                                }
                        }
                        //Validate Password element
                        {
                                let password = document.querySelector('.Password');
                                let password_val_1 = password.querySelector('input').value;
                                let error_list_1 = password.querySelector('.error-list');
                                let min = password.getAttribute("data-min");
                                let max = password.getAttribute("data-max");
                                if (password_val_1 == "") {
                                        valid = false;
                                        error_list_1.innerHTML += `<li>Придумайте пароль</li>`;
                                } else if (min && (password_val_1.length < min)) {
                                        valid = false;
                                        error_list_1.innerHTML += `<li>Пароль слишком короткий, минимальная длина - ${min} cимволов</li>`;
                                } else if (max && (password_val_1.length > max)) {
                                        valid = false;
                                        error_list_1.innerHTML += `<li>Пароль слишком длинный, максимальная длина - ${max} cимволов</li>`;
                                } else {
                                        let double_password = document.querySelector('.Double_Password');
                                        let password_val_2 = double_password.querySelector('input').value;
                                        let error_list_2 = double_password.querySelector('.error-list');
                                        if (password_val_1 != password_val_2) {
                                                valid = false;
                                                error_list_2.innerHTML += `<li>Пароли не совпадают</li>`;
                                        }
                                }
                        }
                        // Validate Name element
                        {
                                let names = document.querySelectorAll('.Name');
                                let t = ['имя', 'фамилию'];
                                names.forEach((el, i) => {

                                        let name_inp = el.querySelector('input');

                                        let error_list = el.querySelector('.error-list');
                                        error_list.innerHTML = "";

                                        if (name_inp.value.trim() == "") {
                                                valid = false;

                                                error_list.innerHTML += `<li>Укажите ${t[i]}</li>`
                                        }

                                })
                        }

                        //Validate Tel_Number element
                        // {
                        //        let tel_number = document.querySelector('.Tel_Number');
                        //        let tel_number_val = tel_number.querySelector('input').value;
                        //        let error_list = tel_number.querySelector('.error-list');
                        //       let min = tel_number.getAttribute("data-min");
                        //       let max = tel_number.getAttribute("data-max");
                        //         if(tel_number_val == ""){
                        //                 valid = false;
                        //                 error_list.innerHTML+=`<li>Введите номер телефона</li>`;
                        //          } else if(min&&(tel_number_val.length < min)){
                        //                  valid = false;
                        //                  error_list.innerHTML+=`<li>Номер телефона слишком короткий, минимальная длина - ${min} cимволов</li>`;
                        //        } else if(max&&(tel_number_val.length > max)){
                        //                  valid = false;
                        //                  error_list.innerHTML+=`<li>Номер телефона слишком длинный, максимальная длина - ${max} cимволов</li>`;
                        //          } else if(!(/(8|\+?7)-?([0-9]{3}|\([0-9]{3}\))-?[0-9]{3}-?[0-9]{2}-?[0-9]{2}/.test(tel_number_val))){
                        //                 valid = false;
                        //                  error_list.innerHTML+=`<li>Номер телефона не соотвесвует стандартному формату</li>`;
                        //          }
                        //   }

                        if (valid) {
                                $("#registration_form").submit();
                        }
                });

                function UserCheck(e) {

                }


        }
})


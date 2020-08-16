$(document).on('turbolinks:load', function () {

    if (get_body().classList.contains('restore') || get_body().classList.contains('restore_mail')) {

        let form = document.querySelectorAll('.form');




        let step = 1;
        form[1].addEventListener('submit', (e) => {
            e.preventDefault();
            //Remove old errors
            let errors = document.querySelectorAll('.error-list');
            errors.forEach(el => {
                el.innerHTML = "";
            });

            //Validate flag
            let valid = true;

            //Validate Tel_Number element
            let tel_number = document.querySelector('.Tel_Number');
            let tel_number_val = tel_number.querySelector('input').value;
            let error_list_tel = tel_number.querySelector('.error-list');
            {
                let min = tel_number.getAttribute("data-min");
                let max = tel_number.getAttribute("data-max");
                if (tel_number_val == "") {
                    valid = false;
                    error_list_tel.innerHTML += `<li>Введите номер телефона</li>`;
                } else if (min && (tel_number_val.length < min)) {
                    valid = false;
                    error_list_tel.innerHTML += `<li>Номер телефона слишком короткий, минимальная длина - ${min} cимволов</li>`;
                } else if (max && (tel_number_val.length > max)) {
                    valid = false;
                    error_list_tel.innerHTML += `<li>Номер телефона слишком длинный, максимальная длина - ${max} cимволов</li>`;
                } else if (!(/(8|\+?7)-?([0-9]{3}|\([0-9]{3}\))-?[0-9]{3}-?[0-9]{2}-?[0-9]{2}/.test(tel_number_val))) {
                    valid = false;
                    error_list_tel.innerHTML += `<li>Номер телефона не соотвесвует стандартному формату</li>`;
                }
            }

            if (valid) {
                let form_data = new FormData();
                let phone_num = document.querySelector('.Tel_Number input').value;
                form_data.append('step', step);
                form_data.append('phone', phone_num);
                if (step == 1) {
                    fetch('restore/mobile', {
                        method: 'POST',
                        body: form_data
                    })
                        .then((response) => {
                            return response.json();
                        })
                        .then((data) => {
                            if (data.success) {

                                step++;
                                document.querySelector('.step').classList.toggle('active');
                            } else {
                                valid = false;
                                data.errors.forEach((msg) => {
                                    error_list_tel.innerHTML += `<li>${msg}</li>`
                                });
                            }
                        });
                } else {

                    //Validate Code element
                    let code = document.querySelector('.Code');
                    let code_val = code.querySelector('input').value;
        /*

                    let error_list_code = code.querySelector('.error-list');
                    if (code_val == "") {
                        valid = false;
                        error_list_code.innerHTML += `<li>Придумайте пароль</li>`;
                    } else if (!/\d{6}/.test(code_val)) {
                        valid = false;
                        error_list_code.innerHTML += `<li>Код подтверждения не соотвествует стандартному формату. Он должен состоять ровно из 6 цифр.</li>`;
                    }*/

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

                    if (valid) {
                        let password = document.querySelector('.Password input').value;
                        let password_confirmation = document.querySelector('.Double_Password input').value;
                        form_data.append('code', code_val);
                        form_data.append('password', password);
                        form_data.append('password_confirmation', password_confirmation);
                        fetch('restore/mobile', {
                            method: 'POST',
                            body: form_data
                        })
                            .then((response) => {
                                return response.json();
                            })
                            .then((data) => {
                                if (data.success) {

                                        Turbolinks.visit('../sign_in')

                                } else {
                                    valid = false;
                                    data.errors.forEach((msg) => {
                                        error_list_code.innerHTML += `<li>${msg}</li>`
                                    });
                                }
                            });
                    }

                }
            }

        });

        //choice-container functionality
         choice_container = function(el) {
            let radios = el.parentNode;
            let header = radios.parentNode;
            let option_array = header.querySelectorAll('.options label');
            let option_body_array = header.parentNode.querySelectorAll('.container-body > .option');

            let option_num = el.id;
            let state_option = radios.querySelector('input[type="hidden"]');

            option_array[state_option.value].classList.toggle('active');
            option_array[option_num].classList.toggle('active');

            option_body_array[state_option.value].classList.toggle('show');
            option_body_array[option_num].classList.toggle('show');

            state_option.value = option_num;
        }
    }
})

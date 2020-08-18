

$(document).on('turbolinks:load', function () {
	if (get_body().classList.contains('products') && (get_body().classList.contains('new') || get_body().classList.contains('create') || get_body().classList.contains('update'))) {
		 CategoryCheck = function(e) {
			return new Promise(resolve => {

				if (e.value == "") {

					resolve();
					return;
				}


				let dev = document.querySelector('#developer_input');
				let dev_inp = document.querySelector('#developer_input_inp');
				dev.style.display = "none";
				dev_inp.value = "";
				fetch('/category/load/' + e.value)
					.then((response) => {
						return response.json();


					})
					.then((data) => {
						generateForm(data);
					})
					.then(() => {
						resolve();
					});

			});
		}

		function refill_fields(product) {
			console.log(product);

			//Fill Text elements
			let texts = document.querySelectorAll('.generated_fields .Text');
			texts.forEach((el) => {
				el.querySelector('input').value = product[el.getAttribute("data-code")][0].text;
			});

			//Fill LongText elements
			let long_texts = document.querySelectorAll('.generated_fields .LongText');
			long_texts.forEach((el) => {
				el.querySelector('textarea').value = product[el.getAttribute("data-code")][0].text;
			});

			//Fill Number elements
			let numbers = document.querySelectorAll('.generated_fields .Number');
			numbers.forEach((el) => {
				el.querySelector('input').value = product[el.getAttribute("data-code")][0].num;
			});

			//Fill Bool elements
			let checks = document.querySelectorAll('.generated_fields .Bool');
			checks.forEach((el) => {
				el.querySelector('input').checked = product[el.getAttribute("data-code")][0].check;
			});

			//Fill Main Image element
			AppendPhoto(document.querySelector('.Image'), product.main_photo);

			//Fill Images elements
			let images = document.querySelectorAll('.generated_fields .Images');
			images.forEach((el) => {
				if (product[el.getAttribute("data-code")] != undefined)
					product[el.getAttribute("data-code")][1].forEach((src) => {
						AppendPhoto(el, src);
					});
			});

			//Fill Maker element
			document.querySelector('.Maker select').value = product.maker_id;
			if (product.custom_maker_name) {
				let custom_dev = document.getElementById("developer_input");
				custom_dev.style.display = "block";
				custom_dev.querySelector("input").value = product.custom_maker_name;
			}
		}

		function fill_fields_update() {
			if (!get_body().classList.contains('update')) {
				return;
			}
			let id = window.location.toString().split('/').splice(-1, 1);

			fetch(`/product/${id}/load_fields`)
				.then((response) => {
					return response.json();
				})
				.then((data) => {
					//call function
					refill_fields(data);
					//after select update
					$('select').niceSelect('update');
				})

		}

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

			//Validate Text elements
			let texts = document.querySelectorAll('.Text');
			texts.forEach((el) => {
				let input_string = el.querySelector('input').value.trim();
				let error_list = el.querySelector('.error-list');
				let min = el.getAttribute("data-min");
				let max = el.getAttribute("data-max");
				if (input_string == "") {
					valid = false;
					error_list.innerHTML += `<li>Введите наименование</li>`;
				} else if (min && (input_string.length < min)) {
					valid = false;
					error_list.innerHTML += `<li>Наименование слишком короткое, минимальная длина - ${min} cимволов</li>`;
				} else if (max && (input_string.length > max)) {
					valid = false;
					error_list.innerHTML += `<li>Наименование слишком длинное, максимальная длина - ${max} cимволов</li>`;
				}
			});

			//Validate Long_Text elements
			let long_texts = document.querySelectorAll('.LongText');
			long_texts.forEach((el) => {
				let input_string = el.querySelector('textarea').value.trim();
				let error_list = el.querySelector('.error-list');
				let min = el.getAttribute("data-min");
				let max = el.getAttribute("data-max");
				if (input_string == "") {
					valid = false;
					error_list.innerHTML += `<li>Запоните описание товара</li>`;
				} else if (min && (input_string.length < min)) {
					valid = false;
					error_list.innerHTML += `<li>Описание слишком короткое, минимальная длина - ${min} cимволов</li>`;
				} else if (max && (input_string.length > max)) {
					valid = false;
					error_list.innerHTML += `<li>Описание слишком длинное, максимальная длина - ${max} cимволов</li>`;
				}
			});

			//Validate Number elements
			let numbers = document.querySelectorAll('.Number');
			numbers.forEach((el) => {
				if (el.classList.contains('form-group-quantity') && inf_quantity.checked) {
					return;
				}

				let input_number = el.querySelector('input').value;
				let error_list = el.querySelector('.error-list');
				let min = el.getAttribute("data-min");
				let max = el.getAttribute("data-max");
				if (input_number == "") {
					valid = false;
					error_list.innerHTML += `<li>Введите значение</li>`;
				} else if (min && (input_number < min)) {
					valid = false;
					error_list.innerHTML += `<li>Слишком малое значение, минимальное допустимое значение - ${min}</li>`;
				} else if (max && (input_number > max)) {
					valid = false;
					error_list.innerHTML += `<li>Слишком большое значение, максимальное допустимое значение - ${max}</li>`;
				}
			});

			//Validate Maker element
			let maker = document.querySelector('.Maker');
			let maker_selector = maker.querySelector('select');
			let dev_inp = document.querySelector("#developer_input_inp");
			if (maker_selector.value == "") {
				valid = false;
				let error_list = maker.querySelector('.error-list');
				error_list.innerHTML += `<li>Выберите производителя</li>`;
			}
			if (maker_selector.value == another && dev_inp.value.trim() == "") {
				valid = false;
				let error_list = maker.querySelector('.error-list');
				error_list.innerHTML += `<li>Внесите название производителя</li>`;
			}
			//Validate Category element
			let category = document.querySelector('.Category');
			let category_selector = category.querySelector('select');
			if (category_selector.value == "") {
				valid = false;
				let error_list = category.querySelector('.error-list');
				error_list.innerHTML += `<li>Выберите категорию</li>`;
			}


			//Validate Main Image element
			if (!get_body().classList.contains('update')) {
				let image = document.querySelector('.Image');
				let image_input = image.querySelector('input');
				if (image_input.value == "") {
					valid = false;
					let error_list = image.querySelector('.error-list');
					error_list.innerHTML += `<li>Загрузите главное изображение товара</li>`;
				}
			}

			if (valid) {
				form.submit();
			}


		});


		let category_select = document.querySelector('.category_select');

		CategoryCheck(category_select).then(() => {

			fill_fields_update();
		});


		let another = -1;
		let inf_quantity = document.querySelector('.inf_quantity');

		function manipulate_quantity() {
			let quantity = document.querySelector('.inp_quantity');
			if (inf_quantity.checked) {
				quantity.placeholder = quantity.value;
				quantity.value = "";
				quantity.setAttribute('readonly', 'readonly');
			} else {
				quantity.removeAttribute('readonly');
				quantity.value = quantity.placeholder;
				quantity.placeholder = "";
			}

		}

		manipulate_quantity();
		inf_quantity.addEventListener('change', (e) => {

			manipulate_quantity();


		});

		function generateForm(data) {
			let dev = document.querySelector('.form-group_dev');
			let dev_select = document.querySelector('.form-group_dev_select');
			dev.style.display = "block";
			dev_select.innerHTML = "";


			data.makers.forEach((el) => {
				dev_select.innerHTML += `<option value='${el.id}'>${el.name}</option>`

				if (el.name == "Другое") {
					another = el.id;
				}

			});

			$('select').niceSelect('update');

			let generated_fields = document.querySelector(".generated_fields");
			generated_fields.innerHTML = "";


			let fields = JSON.parse(data.category.data);
			fields.forEach((el) => {
				let hint = "";
				if (el.hint != null) {
					hint = " (" + el.hint + ")";
				}
				let type = "";
				let text_to_add = "";
				if (el.min === null) {
					el.min = "";
				}
				if (el.max === null) {
					el.max = "";
				}
				if (el.type == "Number") {
					type = "number";
					let step = 0.01;
					if (el.is_int) {
						step = 1;
					}
					text_to_add = `<div data-code="${el.id}" class="form-group ${el.type}" data-min="${el.min}" data-max="${el.max}"><label>${el.name}${hint}<span>*</span></label><input name="${el.id}" type="${type}" step="${step}" placeholder=""><div class="error-list"></div></div>`;
				} else if (el.type == "Text") {
					type = "text";
					text_to_add = `<div data-code="${el.id}" class="form-group ${el.type}" data-min="${el.min}" data-max="${el.max}"><label>${el.name}${hint}<span>*</span></label><input name="${el.id}" type="${type}" placeholder=""><div class="error-list"></div></div>`;
				} else if (el.type == "LongText") {
					text_to_add = `<div data-code="${el.id}" class="form-group ${el.type}" data-min="${el.min}" data-max="${el.max}"><label>${el.name}${hint}<span>*</span></label><textarea name="${el.id}" type="${type}" placeholder=""></textarea><div class="error-list"></div></div>`;
				} else if (el.type == "Bool") {
					type = "checkbox";
					style = `width: 25px; height: 25px; display: block`;
					text_to_add = `<div data-code="${el.id}" class="form-group ${el.type}" data-min="${el.min}" data-max="${el.max}"><label>${el.name}${hint}<span>*</span></label><input name="${el.id}" type="${type}" placeholder="" style="${style}"><div class="error-list"></div></div>`;
				} else if (el.type == "Images") {
					style = "";
					type = "file";

					text_to_add = `<div class="form-group img-preloader ${el.type}" data-min="${el.min}" data-max="${el.max}" data-code="${el.id}"><div class="label-container"><label for = "${el.id}[]" class = "btn">Load images...</label><input id = "${el.id}[]" type="file" accept="image/*" onchange="preview_image(this)" name="${el.id}[]" multiple><input name="${el.id}_changed" type="text" value = "No"><div class="error-list"></div></div></div>`;

				}
				generated_fields.innerHTML += text_to_add;
			})
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
	//preview image functionality end

		 ListCheck = function(that) {


			if (that.value == another) {
				document.getElementById("developer_input").style.display = "block";
				document.getElementById("developer_input_inp").value = "";
			} else {
				document.getElementById("developer_input").style.display = "none";
			}
		}


		function AppendPhoto(container, src) {
			var img = document.createElement('div');
			img.className = 'img-wrapper';
			img.innerHTML = `<img src="${src}"/>`;
			container.appendChild(img);
		}


		 preview_image = function(input) {
			if (input.files) {
				//get images count
				var filesCount = input.files.length;
				//get outter_container
				var container = input.parentNode.parentNode;
				//mark that images changed
				input.nextSibling.value = "Yes";
				//delete old elements
				var elements = container.getElementsByClassName("img-wrapper");
				while (elements[0]) {
					elements[0].parentNode.removeChild(elements[0]);
				}
				//add images
				for (var i = 0; i < filesCount; i++) {
					var reader = new FileReader();
					reader.onload = function (e) {
						AppendPhoto(container, e.target.result);
					}
					reader.readAsDataURL(input.files[i]);
				}
			}
		}


	}
})


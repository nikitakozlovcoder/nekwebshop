
let body = document.querySelector('body');
if (body.classList.contains('products') &&( body.classList.contains('new') ||body.classList.contains('create') ))
{

	let form = document.querySelector('.form');
	/*form.addEventListener('submit', (e)=>{
		e.preventDefault();
		//Remove old errors
		let errors = document.querySelectorAll('.error-list');
		errors.forEach(el=>{
			el.innerHTML = "";
		});

		//Validate flag

		let valid = true;

		//Validate Text elements
		let texts = document.querySelectorAll('.Text');
		texts.forEach((el)=>{
			let input_string = el.querySelector('input').value;
			let error_list = el.querySelector('.error-list');
			let min = el.getAttribute("data-min");
			let max = el.getAttribute("data-max");
			if(input_string == ""){
				valid = false;
				error_list.innerHTML+=`<li>Введите наименование</li>`;
			} else if(min&&(input_string.length < min)){
				valid = false;
				error_list.innerHTML+=`<li>Наименование слишком короткое, минимальная длина - ${min} cимволов</li>`;
			} else if(max&&(input_string.length > max)){
				valid = false;
				error_list.innerHTML+=`<li>Наименование слишком большого размера</li>`;
			}
		});

		//Validate Long_Text elements
		let long_texts = document.querySelectorAll('.LongText');
		long_texts.forEach((el)=>{
			let input_string = el.querySelector('textarea').value;
			let error_list = el.querySelector('.error-list');
			let min = el.getAttribute("data-min");
			let max = el.getAttribute("data-max");
			if(input_string == ""){
				valid = false;
				error_list.innerHTML+=`<li>Запоните описание товара</li>`;
			}else if(min&&(input_string.length < min)){
				valid = false;
				error_list.innerHTML+=`<li>Описание слишком короткое, минимальная длина - ${min} cимволов</li>`;
			} else if(max&&(input_string.length > max)){
				valid = false;
				error_list.innerHTML+=`<li>Описание слишком длинное, максимальная длина - ${max} cимволов</li>`;
			}
		});

		//Validate Number elements
		let numbers = document.querySelectorAll('.Number');
		numbers.forEach((el) => {
			let input_number = el.querySelector('input').value;
			let error_list = el.querySelector('.error-list');
			let min = el.getAttribute("data-min");
			let max = el.getAttribute("data-max");
			if(input_number == ""){
				valid = false;
				error_list.innerHTML+=`<li>Введите значение</li>`;
			} else if(min&&(input_number < min)){
				valid = false;
				error_list.innerHTML+=`<li>Слишком малое значение</li>`;
			} else if(max&&(input_number > max)){
				valid = false;
				error_list.innerHTML+=`<li>Слишком большое значение</li>`;
			}
		});

		//Validate Maker element
		let maker = document.querySelector('.Maker');
		let maker_selector = maker.querySelector('select');
		if(maker_selector.value == "")
		{
			valid = false;
			let error_list = maker.querySelector('.error-list');
			error_list.innerHTML+=`<li>Выберите производителя</li>`;
		}

		//Validate Category element
		let category = document.querySelector('.Category');
		let category_selector = category.querySelector('select');
		if (category_selector.value == "")
		{
			valid = false;
			let error_list = category.querySelector('.error-list');
			error_list.innerHTML+=`<li>Выберите категорию</li>`;
		}

		//Validate Main Image element
		let image = document.querySelector('.Image');
		let image_input = image.querySelector('input');
		if(image_input.value == ""){
			valid = false;
			let error_list = image.querySelector('.error-list');
			error_list.innerHTML+=`<li>Загрузите главное изображение товара</li>`;
		}

		if (valid)
		{
			form.submit();
		}

	});


	let category_select = document.querySelector('.category_select');
	CategoryCheck(category_select);

	let another = -1;
	function generateForm(data) {
		let dev = document.querySelector('.form-group_dev');
		let dev_select = document.querySelector('.form-group_dev_select');
		dev.style.display = "block";
		dev_select.innerHTML = "";



		data.makers.forEach((el)=>{
			dev_select.innerHTML += `<option value='${el.id}'>${el.name}</option>`

			if (el.name=="Другое")
			{
				another = el.id;
			}

		});

		$('select').niceSelect('update');

		let generated_fields = document.querySelector(".generated_fields");
		generated_fields.innerHTML="";


		let fields = JSON.parse(data.category.data);
		fields.forEach((el)=>{
			let type="";
			let text_to_add="";
			if (el.min===null)
			{
				el.min = "";
			}
			if(el.max===null)
			{
				el.max = "";
			}
			if (el.type == "Number")
			{
				type = "number";
				text_to_add=`<div class="form-group ${el.type}" data-min="${el.min}" data-max="${el.max}"><label>${el.name}<span>*</span></label><input name="${el.id}" type="${type}" step="0.01" placeholder=""><div class="error-list"></div></div>`;
			}
			else if(el.type == "Text")
			{
				type = "text";
				text_to_add=`<div class="form-group ${el.type}" data-min="${el.min}" data-max="${el.max}"><label>${el.name}<span>*</span></label><input name="${el.id}" type="${type}" placeholder=""><div class="error-list"></div></div>`;
			}
			else if(el.type == "LongText")
			{
				text_to_add=`<div class="form-group ${el.type}" data-min="${el.min}" data-max="${el.max}"><label>${el.name}<span>*</span></label><textarea name="${el.id}" type="${type}" placeholder=""></textarea><div class="error-list"></div></div>`;
			}
			else if(el.type == "Bool")
			{
				type = "checkbox";
				style = `width: 25px; height: 25px; display: block`;
				text_to_add=`<div class="form-group ${el.type}" data-min="${el.min}" data-max="${el.max}"><label>${el.name}<span>*</span></label><input name="${el.id}" type="${type}" placeholder="" style="${style}"><div class="error-list"></div></div>`;
			}
			else if(el.type == "Images")
			{
				style ="";
				type="file";

				text_to_add=`<div class="form-group img-preloader ${el.type}" data-min="${el.min}" data-max="${el.max}"><div class="label-container"><label for = "${el.id}[]" class = "btn">Load images...</label><input id = "${el.id}[]" type="file" accept="image/*" onchange="preview_image(this)" name="photos" multiple><div class="error-list"></div></div></div>`;

			}
			generated_fields.innerHTML+=text_to_add;
		})
	}
	function ListCheck(that) {

		if (that.value == another) {
			document.getElementById("developer_input").style.display = "block";
			document.getElementById("developer_input_inp").value = "";
		}
		else {
			document.getElementById("developer_input").style.display = "none";
		}
	}

	function preview_image(input) {
		if (input.files) {
		  //get images count
		  var filesCount = input.files.length;
		  //get outter_container
		  var container = input.parentNode.parentNode;
		  //delete old elements
		  var elements = container.getElementsByClassName("img-wrapper");
		  while (elements[0]) {
			 elements[0].parentNode.removeChild(elements[0]);
		  }
		  //add images
		  for(var i = 0; i<filesCount; i++){
			  var reader = new FileReader();
			  reader.onload = function(e) {
				var img = document.createElement('div');
			  	img.className = 'img-wrapper';
			  	img.innerHTML = `<img src="${e.target.result}"/>`;
				container.appendChild(img);
			  }
			  reader.readAsDataURL(input.files[i]);
		  }
		}
	}

	function CategoryCheck(e) {
		if (e.value == "")
			return;
		let dev = document.querySelector('#developer_input');
		let dev_inp = document.querySelector('#developer_input_inp');
		dev.style.display = "none";
		dev_inp.value = "";
		fetch('/category/load/'+e.value)
			.then((response) => {
				return response.json();
			})
			.then((data) => {
				generateForm(data);
			});
	}

}


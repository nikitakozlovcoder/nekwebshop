
let body = document.querySelector('body');
if (body.classList.contains('products') &&( body.classList.contains('new') ||body.classList.contains('create') ))
{

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
		console.log("fields");
		console.log(fields);
		fields.forEach((el)=>{
			let type="";
			let text_to_add="";
			if (el.type == "Number")
			{
				type = "number";
				text_to_add=`<div class="form-group ${el.type}"><label>${el.name}<span>*</span></label><input name="${el.id}" type="${type}" step="0.01" placeholder=""> </div>  <div class="error-list"></div>`;
			}
			else if(el.type == "Text")
			{
				type = "text";
				text_to_add=`<div class="form-group ${el.type}"><label>${el.name}<span>*</span></label><input name="${el.id}" type="${type}" placeholder=""></div><div class="error-list"></div>`;
			}
			else if(el.type == "LongText")
			{
				text_to_add=`<div class="form-group ${el.type}"><label>${el.name}<span>*</span></label><textarea name="${el.id}" type="${type}" placeholder=""></textarea></div><div class="error-list"></div>`;
			}
			else if(el.type == "Bool")
			{
				type = "checkbox";
				style = `width: 25px; height: 25px; display: block`;
				text_to_add=`<div class="form-group ${el.type}"><label>${el.name}<span>*</span></label><input name="${el.id}" type="${type}" placeholder="" style="${style}"></div><div class="error-list"></div>`;
			}
			else if(el.type == "Images")
			{
				style ="";
				type="file";
				text_to_add=`<div class="form-group ${el.type}"><label>${el.name}<span>*</span></label><input name="${el.id}" type="${type}" placeholder="" style="${style}" multiple></div><div class="error-list"></div>`;
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


	function preview_image(event)
	{
		var reader = new FileReader();
		reader.onload = function()
		{
		var output = document.getElementById('output_image');
		output.src = reader.result;
		output.style.display = "block";
		}
		reader.readAsDataURL(event.target.files[0]);
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
				console.log(data);
				generateForm(data);

			});



	}







}


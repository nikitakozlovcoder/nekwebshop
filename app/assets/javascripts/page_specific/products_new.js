let body = document.querySelector('body');
if (body.classList.contains('products') && body.classList.contains('new'))
{
	function ListCheck(that) {
		if (that.value == "Another") {
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
		}
		reader.readAsDataURL(event.target.files[0]);
	}
    //TODO generate form filed from json





}

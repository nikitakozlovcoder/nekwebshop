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
    //TODO preview image
    //TODO generate form filed from json







}

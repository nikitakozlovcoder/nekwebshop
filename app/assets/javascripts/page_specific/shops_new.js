

$(document).on('turbolinks:load', function () {
	if (get_body().classList.contains('shops') && (get_body().classList.contains('new') || get_body().classList.contains('create'))) {
		 

		
		
		

		


		


	function AppendPhoto(container, src) {
		var img = document.createElement('div');
		img.className = 'img-wrapper';
		img.innerHTML = `<img src="${src}"/>`;
		container.appendChild(img);
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

		 


	}
})


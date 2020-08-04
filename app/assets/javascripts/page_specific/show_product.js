if (get_body().classList.contains('products') && get_body().classList.contains('show'))
{
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
    let post_review_ratting = document.querySelectorAll('.post_review_ratting_el');
    post_review_ratting = Array.prototype.slice.call(post_review_ratting).reverse();

    function set_stars(stop)
    {


        for (let i=0; i <= 4; i++)
        {
            if (i<= stop)
            {
                post_review_ratting[i].classList.add('ratting_star')
            }
            else
            {
                post_review_ratting[i].classList.remove('ratting_star');
            }

        }


    }

    let post_review_ratting_wrap = document.querySelector('.post_review_ratting');

    let ratting_inp = document.querySelector('.ratting_inp');
    let head = -1;

    let post_review_form = document.querySelector('.post_review_form');

    post_review_ratting.forEach((el, i)=>{

        el.addEventListener('click', ()=>{
            if (head==i)
            {
                ratting_inp.value = i;
                set_stars(i-1);
                head = i-1;
            }
            else
            {
                ratting_inp.value = i+1;
                set_stars(i);
                head = i;

            }



        });



    });
    function post_review()
    {
        let review_errors = document.querySelector('.review_errors');
        review_errors.innerHTML = '';
        let form_data = new FormData();
        let textarea = document.querySelector('.post_body');
        let ratting_inp = document.querySelector('.ratting_inp');
        let images = document.querySelector('.review_images').files;
        form_data.append('body', textarea.value);
        form_data.append('mark', ratting_inp.value);

        for(let i=0; i<images.length; i++)
            form_data.append('images[]', images[i]);

        fetch('', {
            method: 'POST',
            body: form_data})
            .then((response)=>{
                return response.json();
            })
            .then((data) => {
                console.log(data);
                if (data.success)
                {
                    post_review_form.reset();
                    set_stars(-1);

                }
                else
                {
                    if(data.errors.body)
                     data.errors.body.forEach((err)=>{
                            review_errors.innerHTML+=`<li>${err}</li>`
                     });
                    if(data.errors.mark)
                        data.errors.mark.forEach((err)=>{
                            review_errors.innerHTML+=`<li>${err}</li>`
                        });
                    if(data.errors.images)
                        data.errors.images.forEach((err)=>{
                            review_errors.innerHTML+=`<li>${err}</li>`
                            });
                }


            })
    }
    if (post_review_form != undefined)
        post_review_form.addEventListener('submit', (e)=> {
        e.preventDefault();

        post_review()
    })
}

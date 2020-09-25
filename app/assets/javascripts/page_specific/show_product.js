

$(document).on('turbolinks:load', function () {


    

    if (get_body().classList.contains('products') && get_body().classList.contains('show')) {

            document.querySelector('.return_prev').addEventListener('click', function() {
                window.history.back();
            });

            let carousel_images = document.querySelectorAll('.single-product');
            let nav_arrows = document.querySelector('.owl-nav');
            if (!nav_arrows) {
                if (carousel_images.length == 0) {
                    document.querySelector('.images_title').style.display = "none";
                }
            }
            if(nav_arrows){
                
            if ((carousel_images.length == 1 && window.screen.width > 500) || (carousel_images.length == 2 && window.screen.width > 768) || (carousel_images.length == 3 && window.screen.width > 1170)) {
                 
                 nav_arrows.style.display = "none";
            }
                  
            
            else {
                nav_arrows.style.display = "block";
            }
            window.addEventListener("resize", function() {
                //let carousel_images = document.querySelectorAll('.single-product');
                //let nav_arrows = document.querySelector('.owl-nav');
            
                
                if ((carousel_images.length == 1 && window.screen.width > 500) || (carousel_images.length == 2 && window.screen.width > 768) || (carousel_images.length == 3 && window.screen.width > 1170)) {
                   
                    nav_arrows.style.display = "none";
                  
                }
                else {
                    nav_arrows.style.display = "block";
                }
            });
            }
         preview_image = function(input) {
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
                for (var i = 0; i < filesCount; i++) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
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

        function set_stars(stop) {


            for (let i = 0; i <= 4; i++) {
                if (i <= stop) {
                    post_review_ratting[i].classList.add('ratting_star')
                } else {
                    post_review_ratting[i].classList.remove('ratting_star');
                }

            }


        }

        let post_review_ratting_wrap = document.querySelector('.post_review_ratting');

        let ratting_inp = document.querySelector('.ratting_inp');
        let head = -1;

        let post_review_form = document.querySelector('.post_review_form');

         delete_review = function(id) {
            let post = document.getElementById(id);
            if (post)
                post.remove();
            fetch(`../post/${id}/delete`, {
                method: 'POST'
            });
        }

        post_review_ratting.forEach((el, i) => {

            el.addEventListener('click', () => {
                if (head == i) {
                    ratting_inp.value = i;
                    set_stars(i - 1);
                    head = i - 1;
                } else {
                    ratting_inp.value = i + 1;
                    set_stars(i);
                    head = i;

                }


            });


        });

        function set_ratting(mark) {
            let out = ``;
            for (let i = 0; i < mark; i++) {
                out += `<span>&#9733;</span>`
            }
            for (let i = mark; i < 5; i++) {
                out += `<span>☆</span>`
            }

            return out;
        }

        function set_imgs(images) {
            let out = ``;
            images.forEach((el) => {
                out += `<a href = "${el}" target = "_blank"><img src="${el}" style="padding: 2px;"></a>`
            });
            return out;
        }

        function set_delete_btn(user, owner, id) {

            if (user != owner)
                return "";
            return `<div onclick="delete_review(${id})">Удалить</div>`;
        }

        function post_review() {
            let review_errors = document.querySelector('.review_errors');
            review_errors.innerHTML = '';
            let form_data = new FormData();
            let textarea = document.querySelector('.post_body');
            let ratting_inp = document.querySelector('.ratting_inp');
            let images = document.querySelector('.review_images').files;
            form_data.append('body', textarea.value);
            form_data.append('mark', ratting_inp.value);

            for (let i = 0; i < images.length; i++)
                form_data.append('images[]', images[i]);

            fetch('', {
                method: 'POST',
                body: form_data
            })
                .then((response) => {
                    return response.json();
                })
                .then((data) => {
                    console.log(data);
                    if (data.success) {
                        post_review_form.reset();
                        set_stars(-1);
                        let wrap = document.querySelector('.posts_wrap');
                        let pre = document.querySelectorAll('.img-wrapper');
                        if (pre)
                            pre.forEach((el) => {
                                el.remove();
                            });
                        let content = document.createElement("div");
                        content.innerHTML += `
                    <div class = "single_review" id="${data.post.id}">
												<div class = "user_attributes">
													<div class = "reviewer_name">
														${data.user_name}
													</div>
                                                    
                                                        <img class = "reviewer_photo" src="${data.avatar}">
                                                   
													


													<div class = "view_review_rating">
														
                                                    ${set_ratting(data.post.mark)}
                    
                 
													</div>
												</div>
												<div style="width: 100%; display: flex; flex-direction: column">
													<div class = "review_text">
														
                                                    ${data.post.body}

													</div>
													<div class="review_imgs" style="margin-top: auto;">             
													${set_imgs(data.images)}
														
													</div>
													<div style=" padding-top: 10px">
													<div>${data.date}</div>
													${set_delete_btn(data.current_user, data.post.user_id, data.post.id)}
													</div>
												</div>

											</div>
                 
                    `

                        wrap.prepend(content);

                    } else {
                        if (data.errors.body)
                            data.errors.body.forEach((err) => {
                                review_errors.innerHTML += `<li>${err}</li>`
                            });
                        if (data.errors.mark)
                            data.errors.mark.forEach((err) => {
                                review_errors.innerHTML += `<li>${err}</li>`
                            });
                        if (data.errors.images)
                            data.errors.images.forEach((err) => {
                                review_errors.innerHTML += `<li>${err}</li>`
                            });
                    }


                })
        }

        if (post_review_form != undefined)
            post_review_form.addEventListener('submit', (e) => {
                e.preventDefault();

                post_review()
            });

    }

})

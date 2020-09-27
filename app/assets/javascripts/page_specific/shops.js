$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('shops')&&get_body().classList.contains('all')){
        //choice-container functionality
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
    }
})
if (get_body().classList.contains('products') && get_body().classList.contains('show'))
{
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

    post_review_form.addEventListener('submit', (e)=> {
        e.preventDefault();

    })
}

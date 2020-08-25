let CategoryCheck;
let preview_image;
let ListCheck;
let delete_review;
let choice_container;
let addtoCart;

function get_body()
{
    return document.querySelector('body');
}

class TurbolinksControl  {
    constructor(x, y) {
        this.enabled = false;
        this.scrollToTop = false
    }
    setEnabled()
    {
        this.enabled = true;
    }
    setScrollToTop()
    {
        this.scrollToTop = true;
    }
    run (){
        let scrollPosition = null;
        document.addEventListener('turbolinks:before-visit', (event) => {
            console.log(this.enabled);
            if (this.enabled)
                scrollPosition = window.scrollY;
            else
                scrollPosition = null;
            this.enabled = false
        });

        document.addEventListener('turbolinks:load', (event) => {
            const elements = document.querySelectorAll(`[data-turbolinks-no-scroll="true"]`);
            console.log(elements);
            for (let i = 0; i < elements.length; i++) {
                elements[i].addEventListener('click', () => {
                    this.enabled = true
                })
            }

            if (scrollPosition) {
                //	let inner = document.querySelector('.header-inner');
                //inner.style.position = 'fixed';
                let fix_bug = document.querySelector('.fix-bug');
                let header = document.querySelector('.header');

                header.style.animation = ""
                if (scrollPosition > 200) {
                    header.classList.add("sticky");

                   fix_bug.classList.add('fix-bug-active');
                } else {
                    header.classList.remove("sticky");
                    fix_bug.classList.remove('fix-bug-active');
                }

                if(scrollPosition>640)
                {
                    scrollPosition-=0;
                }
                console.log(scrollPosition)
                let anchor;
                if (this.scrollToTop && document.body.clientWidth>=768)
                {
                     anchor = document.querySelector('#turbolinks_top').getBoundingClientRect().top-55;
                }
                if (this.scrollToTop && document.body.clientWidth<768)
                {
                    anchor = document.querySelector('#turbolinks_bot').getBoundingClientRect().top-55;
                }

                window.scrollTo(0, scrollPosition)
                if (this.scrollToTop)
                {


                    window.scrollTo({
                        top: anchor,
                        behavior: "smooth"
                    });
                    this.scrollToTop = false
                }

            }
        })


    }

};

turbolinks_control = new TurbolinksControl();
turbolinks_control.run();
$(document).on('turbolinks:load', function () {
    for (let i = 0; i < document.forms.length; i++) {
        const form = document.forms[i]
        if (form.method == "get" && form.dataset['remote'] == "true") {
            form.addEventListener("submit", (e) => {
                e.preventDefault();
                const entries = [...new FormData(e.target).entries()]
                const params = "?" + entries.map(e => e.map(encodeURIComponent).join('=')).join('&')
                turbolinks_control.setEnabled();
                if (form.dataset['scrolltotop'] == 'true')
                {
                    turbolinks_control.setScrollToTop();
                }

                Turbolinks.visit(form.action + params);
            });
        }
        ;
    };
});

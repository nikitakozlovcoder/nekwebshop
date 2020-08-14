let CategoryCheck;
let preview_image;
let ListCheck;
let delete_review;
let choice_container;

function get_body()
{
    return document.querySelector('body');
}

class TurbolinksControl  {
    constructor(x, y) {
        this.enabled = false;
    }
    setEnabled()
    {
        this.enabled = true;
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
                window.scrollTo(0, scrollPosition)

            }
        })


    }

};

turbolinks_control = new TurbolinksControl();
turbolinks_control.run();

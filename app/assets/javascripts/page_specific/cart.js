if (get_body().classList.contains('cart')){
    function deleteItem(id){
        fetch(`cart/delete/${id}`, {
            method: 'POST'
        })
        .then((response) => {
            return response.json();
        })
        .then((data)=>{
            console.log(data);
        });
    }
    function updateField(el){
        sign = (el.getAttribute("data-type") == "plus") ? 1 : -1;
        quantity = el.parentNode.parentNode;  
        num = parseInt(quantity.querySelector('input').value) + sign;
        field = quantity.parentNode.parentNode;
        price = field.querySelector('.price span').innerHTML;
        price = parseFloat(price.slice(1));
        console.log(price);
        field.querySelector('.total-amount span').innerHTML = `₽${Math.round(price*num*10)/10}`;
        updateTotal();
    }
    function updateTotal(){
        elem = document.querySelector('div .row .total-amount .right ul .last span');
        total = 0.0;
        document.querySelectorAll('table .total-amount span').forEach((el)=>{
            total += parseFloat(el.innerHTML.slice(1));
        });
        elem.innerHTML = `₽${Math.round(total*10)/10}`
    }
    updateTotal();

    document.querySelectorAll('.cart-item-wrap').forEach((el)=>{
        let id = el.getAttribute('data-code');
        console.log(id);
        el.querySelector('.action span').addEventListener('click', ()=>{
            deleteItem(id);
            el.remove();
        });
    });
}
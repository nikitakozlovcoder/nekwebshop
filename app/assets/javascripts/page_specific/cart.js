$(document).on('turbolinks:load', function () {
    if (get_body().classList.contains('cart') && get_body().classList.contains('index')) {
        function deleteItem(id) {
            fetch(`cart/delete/${id}`, {
                method: 'POST'
            })
                .then((response) => {
                    return response.json();
                })
                .then((data) => {
                    console.log(data);
                });
        }

        function updateQuantity(id, qty) {
            fetch(`cart/quantity/${id}/${qty}`, {
                method: 'POST'
            })
                .then((response) => {
                    return response.json();
                })
                .then((data) => {
                    console.log(data);
                });
        }

        updateField = function(quantity) {
            let num = parseInt(quantity.querySelector('input').value);
            let field = quantity.parentNode;
            let price = field.querySelector('.price span').innerHTML;
            price = parseFloat(price.slice(1));
            field.querySelector('.total-amount span').innerHTML = `₽${parseFloat(num*price).toFixed(2)}`;
            updateTotal();
        }

        function updateTotal() {
            let elem = document.querySelector('div .row .total-amount .right ul .last span');
            let total = 0.0;
            document.querySelectorAll('table .total-amount span').forEach((el) => {
                total += parseFloat(el.innerHTML.slice(1));
            });
            elem.innerHTML = `₽${parseFloat(total).toFixed(2)}`
        }

        function ToggleMinusButton(val, qty_elem, option){
            if(val == 1){
                qty_elem.querySelector('.minus button').disabled = option;
            }
        }

        updateTotal();

        document.querySelectorAll('.cart-item-wrap').forEach((el) => {
            let id = el.getAttribute('data-code');
            el.querySelector('.action span').addEventListener('click', () => {
                deleteItem(id);
                el.remove();
            });
            let qty_elem = el.querySelector('.qty');
            let value_elem = qty_elem.querySelector('input');

            //disable minus button if necessary
            ToggleMinusButton(value_elem.value, qty_elem, true);

            qty_elem.querySelector('.plus button').addEventListener('click', () => {
                //enable minus button 
                ToggleMinusButton(value_elem.value, qty_elem, false);
                value_elem.value++;
                updateField(qty_elem); 
                updateQuantity(id, value_elem.value);
            });
            qty_elem.querySelector('.minus button').addEventListener('click', () => {
                value_elem.value--;
                //disable minus button
                ToggleMinusButton(value_elem.value, qty_elem, true);
                updateField(qty_elem); 
                updateQuantity(id, value_elem.value);
            });
            value_elem.addEventListener('change', () => {
                if(!/^[1-9]\d*$/.test(value_elem.value)){
                    value_elem.value = 1;
                }
                //disable/enable minus button
                qty_elem.querySelector('.minus button').disabled = (value_elem.value <= 1);
                updateField(qty_elem);
                updateQuantity(id, value_elem.value);
            });
        });
    }
})

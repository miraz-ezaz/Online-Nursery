

function add_to_cart(pid, pname, price)
{
    let cart = localStorage.getItem("cart");

    if (cart == null)
    {
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
    } else
    {
        let pcart = JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId == pid)
        if (oldProduct)
        {
            // we have to increase the quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1
            pcart.map((item) => {
                if (item.productId == oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })

            localStorage.setItem("cart", JSON.stringify(pcart));

        } else
        {
            //add product
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
        }

    }
    updateCart();

}

function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0)
    {
        console.log("Cart is empty");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart doest not have any items</h3>");
        $(".checkout-btn").attr('disabled', true)
        $(".con-item-btn").attr('disabled', true)
    } else

    {
        //show cart
        console.log(cartString);
        $(".cart-items").html(`( ${cart.length}) `);
        let table = `
            <table class='table'>
               <thead class='thead-light'> 
                    <tr>
                    <th>Item Name </th>
                    <th>Price </th>
                    <th>Quantity </th>
                    <th>Total Price </th>
                    <th>Action</th> 

                    </tr>
            
                </thead>
                
                `;
        let totalPrice = 0;
        cart.map((item) => {

            table += `
                        <tr>
                        <td>${item.productName}</td>
                        <td>${item.productPrice}</td>
                        <td>${item.productQuantity}</td>
                        <td>${item.productQuantity * item.productPrice}</td>
                        <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
            
            
                        </tr>
                    `
            totalPrice += item.productQuantity * item.productPrice;
        })

        table = table + `
                    <tr><td colspan='5' class='text-right font-weight-bold m-5'><span class='m-10'>Total Price : ${totalPrice}</span></td></tr>
                    </table>`
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false)
        $(".con-item-btn").attr('disabled', false)
        localStorage.setItem("totalPrice", JSON.stringify(totalPrice));
    }

}

//deleteItem

function deleteItemFromCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId != pid)
    localStorage.setItem('cart', JSON.stringify(newcart))
    updateCart();
}


$(document).ready(function () {
    updateCart();

    $(".order-btn").attr('disabled', true)
})

function goToCheckout()
{
    window.location = "checkout.jsp";
}
function goToIndex()
{
    window.location = "index.jsp";
}
function setItem()
{
    let Cart = JSON.parse(localStorage.getItem("cart"));
    let totalPrice = localStorage.getItem("totalPrice");


    let orderArray = []
    Cart.map((item) => {
        let obj_cart = {productId: item.productId, productQuantity: item.productQuantity}
        orderArray.push(obj_cart)
    })

    let orderCart = JSON.stringify(orderArray);
    $(".order-btn").attr('disabled', false)

    document.getElementsByClassName('order-cart')[0].setAttribute("value", orderCart);
    document.getElementsByClassName('total-price')[0].setAttribute("value", totalPrice);

}

function setItem2()
{
    let orderCart = JSON.stringify(localStorage.getItem("cart"));
    let totalPrice = localStorage.getItem("totalPrice");
    $(".order-btn").attr('disabled', false)

    document.getElementsByClassName('order-cart')[0].setAttribute("value", orderCart);
    document.getElementsByClassName('total-price')[0].setAttribute("value", totalPrice);
}


function viewDetails(c){
   
    var x = document.getElementById(c).getAttribute("value");
    
    let cart = JSON.parse(JSON.parse(x));
    console.log(cart);
    
    let table = `
            <table class='table'>
               <thead class='thead-light'> 
                    <tr>
                    <th>Item Name </th>
                    <th>Price </th>
                    <th>Quantity </th>
                    <th>Total Price </th>
                    <th>Action</th> 

                    </tr>
            
                </thead>
                
                `;
       let totalPrice = 0;
        cart.map((item) => {

            table += `
                        <tr>
                        <td>${item.productName}</td>
                        <td>${item.productPrice}</td>
                        <td>${item.productQuantity}</td>
                        <td>${item.productQuantity * item.productPrice}</td>
                        
            
            
                        </tr>
                    `
           totalPrice += item.productQuantity * item.productPrice;
        })

        table = table + `
                    <tr><td colspan='5' class='text-right font-weight-bold m-5'><span class='m-10'>Total Price : ${totalPrice}</span></td></tr>
                    </table>`
    
    $(".order-details-b").html(table);
    
    table="";
    
    
}

function clearCart()
{
    localStorage.removeItem("cart");
    localStorage.removeItem("totalPrice");
}




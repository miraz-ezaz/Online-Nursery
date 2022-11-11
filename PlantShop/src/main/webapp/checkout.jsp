<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are noy logged in ! Login first to access checkout page ");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file= "components/navbar.jsp" %>
        <div class="container text-center mt-3"><%@include file = "components/message.jsp" %></div>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <!--cart-data-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Selected items</h3>
                            <div class="cart-body">
                            </div>   
                        </div>
                        <div class="card-footer">
                            
                            <button type = "button" class="btn btn-outline-primary con-item-btn" onclick="setItem2()">Confirm Items</button>
                        </div>

                    </div>

                </div>

                <div class="col-md-6">
                    <!--form-data-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Selected items</h3>
                            <form action ="OrdersServlet" method="GET" id="ordersForm" onSubmit="submitForm(this.form)" >
                                <input type="hidden" name="userId" value="<%= user.getUserId()%>">
                                <input type="hidden" class="order-cart" name="orderCart" >
                                <input type="hidden" class="total-price" name="totalPrice">
                                <div class="form-group">
                                    <label for="email1">Email address</label>
                                    <input name="orderEmail" value="<%= user.getUserEmail()%>" type="email" class="form-control" id="email1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input name="orderName" value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Your name">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input name="orderPhone" value="<%= user.getUserPhone()%>" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Your Phone Number">
                                </div>
                                <div class="form-group">
                                    <label for="pMethod">Payment Method</label>
                                    <select name = "paymentMethod"class="form-control" id="pMethod">
                                        <option value="Cash on Delivery">Cash on Delivery</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Shipping Address</label>
                                    <textarea name="orderAddress" value="<%= user.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter your shipping address"></textarea>
                                </div>

                                <div class="container text-center">

                                    <button type="submit" class="btn btn-outline-success order-btn" onClick="clearCart()">Order now</button>
                                    <button type = "button"class="btn btn-outline-primary" onclick="goToIndex()">Continue Shopping</button>

                                </div>

                            </form>   
                        </div>

                    </div>
                </div>

            </div>


        </div>
        <%@include file = "components/common_modals.jsp" %>
        
    </body>
</html>

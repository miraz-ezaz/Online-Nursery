<%@page import="java.util.List"%>
<%@page import="com.onlinenursery.plantshop.entities.Orders"%>
<%@page import="com.onlinenursery.plantshop.helper.FactoryProvider"%>
<%@page import="com.onlinenursery.plantshop.dao.OrdersDao"%>
<%@page import="com.onlinenursery.plantshop.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are noy logged in ! Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not an Admin! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%
    OrdersDao odao = new OrdersDao(FactoryProvider.getFactory());
    List<Orders> list = odao.getOrders();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-orders</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file= "components/navbar.jsp" %>
        <%            Orders d_ordr = new Orders();
            String order_id_s = request.getParameter("orderId");
            if (order_id_s != null) {
                int order_id = Integer.parseInt(order_id_s.trim());
                d_ordr = odao.getOrderById(order_id);

            }
            String dt = d_ordr.getDetails();
            String a = "ab";
            System.out.println(a);

        %>


        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Order List</h3>

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">Order Id</th>
                                        <th scope="col">Details</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Payment Method</th>
                                        <th scope="col">Total Price</th>
                                        <th scope="col">Payment Status</th>
                                        <th scope="col">Order Status</th>
                                        <th scope="col">Confirm Order</th>
                                        <th scope="col">Confirm Payment</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%                                    int no = 1;
                                        for (Orders order : list) {
                                            String deta = order.getDetails();

                                    %>

                                    <!--tbody-->
                                    <tr>
                                        <th scope="row"><%= no%></th>
                                        <td><%= order.getOrderId()%></td>
                                        <td> <div data-toggle="modal" data-target="#orderDetails"><button id ="order<%= order.getOrderId()%>"   class="btn btn-outline-primary btn-sm" onclick="viewDetails('order<%= order.getOrderId()%>')" >Details</button></div></td>
                                <script>
                                    $(document).ready(function () {
                                        var data = JSON.stringify(<%= deta%>);
                                    //var det<%= no%> = JSON.parse(data);
                                    //console.log(data);
                                    //console.log(det<%= no%>);
                                    document.getElementById("order<%= order.getOrderId()%>").setAttribute("value", data);
                                    })
                                    

                                </script>
                                <td><%= order.getOrderName()%></td>
                                <td><%= order.getOrderPhone()%></td>
                                <td><%= order.getOrderAddress()%></td>
                                <td><%= order.getPaymentMethod()%></td>
                                <td><%= order.getTotalPrice() %></td>
                                <td><%= order.getPaymentStatus()%></td>
                                <td><%= order.getOrderStatus()%></td>
                                <td><a href="OrdersStatus?Oid=<%= order.getOrderId()%>" ><button class="btn btn-success btn-sm">Confirm</button></a></td>
                                <td><a href="OrdersStatus?pid=<%= order.getOrderId()%>" ><button class="btn btn-success btn-sm">Confirm</button></a></td>


                                </tr>


                                <%
                                        no++;
                                    }
                                %>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!--Order-Modal-->




        <!-- Modal -->
        <%@include file = "components/order_modal.jsp" %>


    </body>
</html>

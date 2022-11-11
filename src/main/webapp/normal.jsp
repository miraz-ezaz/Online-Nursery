<%@page import="java.util.List"%>
<%@page import="com.onlinenursery.plantshop.entities.Orders"%>
<%@page import="com.onlinenursery.plantshop.dao.OrdersDao"%>
<%@page import="com.onlinenursery.plantshop.helper.FactoryProvider"%>
<%@page import="com.onlinenursery.plantshop.entities.User"%>
<%
    User user2 = (User) session.getAttribute("current-user");
    if (user2 == null) {
        session.setAttribute("message", "You are noy logged in ! Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user2.getUserType().equals("admin")) {
            session.setAttribute("message", "You Can't Acess Normal user's Dashboard");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= user2.getUserName()%> - Dashboard</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        <%
            OrdersDao odao = new OrdersDao(FactoryProvider.getFactory());
            List<Orders> Ulist = odao.getOrderByUserId(user2.getUserId());
        %>
        <%@include file= "components/navbar.jsp" %>
        <div class="container mt-3">
            <div class="card">
                <div class="card-header">
                    <h2>Welcome <%= user2.getUserName()%></h2>
                </div>
            </div>

            <div class="row mt-3">
                <!<!-- 1st col -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h1>Your Details</h1>
                        </div>

                        <div class="card-body">
                            <h1>Name : <%= user2.getUserName()%></h1>
                            <h3>Email : <%= user2.getUserEmail()%></h3>
                            <h3>Phone : <%= user2.getUserPhone()%></h3>
                            <h3>Address : <%= user2.getUserAddress()%></h3>

                        </div>
                    </div>


                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h1 class="ur-order">Your Orders</h1>
                        </div>
                        <div class="card-body">

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <%@include file= "components/common_modals.jsp" %>
    </body>
</html>



<%@page import="com.onlinenursery.plantshop.helper.Helper"%>
<%@page import="com.onlinenursery.plantshop.entities.Category"%>
<%@page import="com.onlinenursery.plantshop.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.onlinenursery.plantshop.entities.Product"%>
<%@page import="com.onlinenursery.plantshop.dao.ProductDao"%>
<%@page import="com.onlinenursery.plantshop.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Shop - Home</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file= "components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <% String cat = request.getParameter("category");
                    String act ="";
                    String act2 ="";
                    
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    
                    if(cat == null){ 
                        list = dao.getAllProducts();
                        act2 ="active";
                         
                    }
                    
                    else if (cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                        act2 = "active";
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);

                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                    
                    
                %>

                <!--show categories-->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action <%= act2 %>">
                            All Products
                        </a>

                        <%
                            for (Category c : clist) {
                                if(cat == null){
                                    act2 ="active";
                                }
                                
                                else if (cat.trim().equals("all")) {
                                    act2 = "active";
                                }
                                else if( cat!=null && c.getCategoryId() == (Integer.parseInt(cat.trim())) && cat.trim()!= "all")
                                {
                                    act = "active";
                                }
                                
                                else{
                                    act = "";
                                }
                                

                        %>

                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action <%= act %>"><%= c.getCategoryTittle()%></a>

                        <%
                            }
                        %>


                    </div>
                </div>
                <!--show product-->

                <div class="col-md-10">

                    <!--row-->

                    <div class="row mt-4">
                        <!--col-12-->
                        <div class="col-md-12">
                            <div class="card-columns">
                                <!--traversing-product-->
                                <%
                                    for (Product p : list) {
                                %>
                                
                                <!--product-card-->
                                <div class="card">
                                    <div class="container texr-center">
                                        <img  src="img/products/<%= p.getpPhoto()%>"  class="card-img-top" alt="<%= p.getpName()%>">
                                    </div> 
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName()%></h5>

                                        <p class="card-text">

                                            <%= Helper.get10Word(p.getpDesc())%>

                                        </p>

                                    </div>
                                    <div class="card-footer">
                                        <button class="btn custom-bg" onclick="add_to_cart(<%= p.getPid() %>,'<%= p.getpName() %>',<%= p.getPriceAfterDiscount() %>)">Add to Cart</button>
                                        <button class="btn btn-outline-success ">&#2547 <%= p.getPriceAfterDiscount()%>/- <span class=" discount-label"><del> &#2547 <%= p.getpPrice() %></del> &#2547 <%= p.getpDiscount() %> off</span></button>

                                    </div>
                                </div>
                                <%
                                    }

                                    if (list.size() == 0) {
                                        out.println("<h3>No item in this category</h3>");
                                    }
                                %>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

                                <%@include file = "components/common_modals.jsp" %>
                                
    </body>
</html>

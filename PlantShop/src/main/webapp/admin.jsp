<%@page import="java.util.Map"%>
<%@page import="com.onlinenursery.plantshop.helper.Helper"%>
<%@page import="com.onlinenursery.plantshop.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.onlinenursery.plantshop.helper.FactoryProvider"%>
<%@page import="com.onlinenursery.plantshop.dao.CategoryDao"%>
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

<!--product-category-->
<%
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();

    //getting count
    Map<String, Long> m = Helper.getCount(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file= "components/navbar.jsp" %>

        <div class="container admin">

            <div class="container-fluid mt-3">

                <%@include file="components/message.jsp" %>

            </div>

            <div class="row mt-3">
                <!<!-- 1st col -->
                <div class="col-md-4">
                    <!<!-- 1st box -->
                    <div class="card" data-toggle="tooltip" data-placement="left" title="Number of users in this website">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid" src="img/user.png" alt="user_icon">
                            </div>
                            <h1><%= m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>

                        </div>

                    </div>

                </div>

                <!<!-- 2nd col -->
                <div class="col-md-4">
                    <!<!-- 2nd box -->
                    <div class="card" data-toggle="tooltip" data-placement="bottom" title="Total number of categories">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid" src="img/category.png" alt="user_icon">
                            </div>
                            <h1 ><%= list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>

                        </div>

                    </div>
                </div>

                <!<!-- 3rd col -->
                <div class="col-md-4">
                    <!<!-- 3rd box -->
                    <div class="card" data-toggle="tooltip" data-placement="right" title="Total number of products">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid" src="img/products.png" alt="user_icon">
                            </div>
                            <h1><%= m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>

                        </div>

                    </div>
                </div>

            </div>
            <!--2nd row-->
            <div class="row mt-3">
                <!<!-- 1st col -->
                <div class="col-md-6">
                    <!<!-- 1st box -->
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid" src="img/add category.png" alt="user_icon">
                            </div>

                            <h1 class="text-uppercase text-muted">Add Category</h1>

                        </div>

                    </div>

                </div>
                <!<!-- 2nd col -->
                <div class="col-md-6">
                    <!<!-- 2nd box -->
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid" src="img/plus.png" alt="user_icon">
                            </div>

                            <h1 class="text-uppercase text-muted">Add Products</h1>

                        </div>

                    </div>


                </div

            </div>

        </div>
        <!-- add category modal -->

        <!--3rd-row-->
        <div class="row mt-3">
            <div class="col-md-12">
                <div class="card" onclick="window.location = 'orders.jsp'">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid" src="img/orders.png" alt="user_icon">
                            </div>

                            <h1 class="text-uppercase text-muted">Orders</h1>

                        </div>

                    </div>
            </div>
            
        </div>

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h5 class="modal-title" id="exampleModalLongTitle">Add Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">

                            <div class="form-group">
                                <input class="form-control" style="height: 50px" type="text"  name="catTitle" placeholder="Enter Category Tittle" required />  

                            </div>
                            <div class="form-group">
                                <textarea style="height: 300px" class="form-control" name="catDescription" placeholder="Enter Category Details" required></textarea>

                            </div>
                            <div class="container text-center ">

                                <button style="color: black" class="btn btn-outline-success custom-bg ">Add Category</button>

                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!-- end category modal -->

        <!--+++++++++++++++++++++++++++++++++++++++++-->
        <!-- product modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--form-->

                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct"> 
                            <!--product-tittle-->
                            <div class="form-group">
                                <input type="text" style="height: 50px" class="form-control" placeholder="Enter tiitle of the product" name="pName" required>

                            </div>

                            <!--product-description-->

                            <div class="form-group">
                                <textarea style="height: 150px" class="form-control" name="pDesc" placeholder="Enter Product Details" required></textarea>

                            </div>
                            <!--product-price-->
                            <div class="form-group">
                                <input type="number" style="height: 50px" class="form-control" placeholder="Enter price of the product" name="pPrice" required>

                            </div>

                            <!--product-discount-->
                            <div class="form-group">
                                <input type="number" style="height: 50px" class="form-control" placeholder="Enter discount of product" name="pDiscount" required>

                            </div>

                            <!--product-quantity-->

                            <div class="form-group">
                                <input type="number" style="height: 50px" class="form-control" placeholder="Enter product quantity" name="pQuantity" required>

                            </div>



                            <div class="form-group">

                                <select name="catId" class="form-control" id="">
                                    <%                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTittle()%></option>
                                    <%
                                        }
                                    %>
                                </select>

                            </div>

                            <!--product-photo-->

                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required>

                            </div>

                            <!--submit-button-->

                            <div class="container text-center ">

                                <button style="color: black" class="btn btn-outline-success custom-bg ">Add Product</button>

                            </div>

                        </form>

                        <!--end-form-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>



        <!-- end product modal -->

        <%@include file = "components/common_modals.jsp" %>

        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </body>
</html>

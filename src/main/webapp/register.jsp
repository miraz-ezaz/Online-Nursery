                                                                              
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <%@include file = "components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file= "components/navbar.jsp" %>
        <div class="container-fluid">
            
            
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <%@include file= "components/message.jsp" %>
                    <div class="card-body px-5">
                        
                              <div class="text-center">
                                  <img src="img/register_icon.png" style="max-width: 100px" class="img-fluid" alt="">
                        </div>
                <h3 class="text-center my-3">Register Here</h3>
                <form action="RegisterServlet" method="post">
                    <div class="form-group">
                        <label for="name">User Name</label>
                        <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Here">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Phone Number">
                    </div>
                    <div class="form-group">
                        <label for="phone">Address</label>
                        <textarea name="user_address" style="height: 200px" class="form-control" placeholder="Enter Your Address"></textarea>
                    </div>
                    <div class="container texr-center">
                        <button type="submit" class="btn btn-outline-success">Register</button>
                        <button type="button" class="btn btn-outline-warning">Reset</button>
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

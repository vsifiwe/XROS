<%-- 
    Document   : reviewm
    Created on : May 1, 2021, 3:10:11 PM
    Author     : X
--%>

<%@page import="Domain.Restaurant"%>
<%@page import="java.util.List"%>
<%@page import="Controller.GenericDao"%>
<%@page import="Domain.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave a review</title>
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">

        <%
            User user = (User) request.getSession().getAttribute("user");

            if (user == null) {
        %>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="error-template">
                        <h1>
                        </h1>
                        <h2>
                            401 Unauthorized</h2>
                        <div class="error-details">
                            Sorry, you need to login to access this page!
                        </div>
                        <div class="error-actions">
                            <a href="http://localhost:8084/XROS/index.html" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
                                Take Me Home </a><a href="http://localhost:8084/XROS/login.jsp" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-envelope"></span> Contact Support </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%
        } else {

            GenericDao rdao = new GenericDao<>(Restaurant.class);
            List<Restaurant> restaurants = rdao.findAll();
            String rid = request.getParameter("id");
            Long id;
            Restaurant r = null;
            if (rid != null) {
                id = Long.parseLong(rid);
                r = (Restaurant) rdao.findbyID(id);
            }

        %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">XROS</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="viewReviews.jsp">Reviews</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="orderscreen.jsp">Make an order</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="x/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>




        <br/>
        <br/>
        <br/>
        <br/>

        <div class="container">
            <h1>Leave a review</h1>
            <form action="x/review">
                <div class="form-group">
                    <label for="exampleFormControlemail">Email address</label>
                    <input type="email" class="form-control" id="exampleFormControlemail" value="<%=user.getEmail()%>" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlname">Full Name</label>
                    <input type="text" class="form-control" id="exampleFormControlname"  value="<%=user.getName()%>" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlrestaurant">Restaurant Name</label>
                    <%
                        if (r != null) {
                    %>
                    <input type="text" class="form-control" id="exampleFormControlrestaurant"  value="<%=r.getRestaurant_name()%>" readonly name="restaurant">
                    <%
                    } else {
                    %>

                    <input type="text" list="restaurants" class="form-control" id="exampleFormControlrestaurant" name="restaurant">
                    <datalist id="restaurants">
                        <%
                            for (Restaurant re : restaurants) {
                        %>
                        <option value="<%=re.getRestaurant_name()%>">
                        <%
                            }
                        %>
                    </datalist>
                    <%
                        }
                    %>

                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Write your review</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="review"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit Review</button>
            </form>
        </div>
        <%            }
        %>
    </body>
</html>

<%-- 
    Document   : addMenu
    Created on : Apr 25, 2021, 5:41:32 PM
    Author     : X
--%>

<%@page import="Domain.Menu"%>
<%@page import="java.util.List"%>
<%@page import="Domain.Restaurant"%>
<%@page import="Controller.GenericDao"%>
<%@page import="Controller.GenericDao"%>
<%@page import="Domain.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <%
            User u = (User) request.getSession().getAttribute("user");

            if (u == null) {

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
        <%        } else {
            List<Menu> menu = new GenericDao<>(Menu.class).findAll();
            List<Restaurant> restaurants = new GenericDao<>(Restaurant.class).findAll();
        %>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index.html">Start Bootstrap</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="review.jsp">Leave a review</a></li>
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

            <h2> Search for a menu and restaurant</h2>
            <hr>
            <form action="x/addmenu">
                <div class="row my-2">
                    <div class="col-sm-auto">
                        <i class="fas fa-utensils h4 text-body"></i>
                    </div>
                    <div class="col-9">
                        <input class="form-control form-control-lg form-control-borderless" list="restaurants" type="search" placeholder="Search restaurants" name="restaurant">
                        <datalist id="restaurants">
                            <%
                                for (Restaurant r : restaurants) {
                            %>
                            <option value="<%=r.getRestaurant_name()%>"><%
                                }
                                %>
                        </datalist>
                    </div>
                    <div class="col-sm-auto">
                        <button class="btn btn-lg btn-success" type="submit"><i class="fas fa-search"></i></button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-auto">
                        <i class="fas fa-list h4 text-body"></i>
                    </div>
                    <div class="col-9">
                        <input class="form-control form-control-lg form-control-borderless" list="menus" type="search" placeholder="Search menu items" name="menu">
                        <datalist id="menus">
                            <%
                                for (Menu m : menu) {
                            %>
                            <option value="<%=m.getMenu_name()%>"><%
                                }
                                %>
                        </datalist>

                    </div>
                    <div class="col-sm-auto">

                    </div>
                </div>
            </form>
        </div> 


        <%
            }
        %>
    </body>
</html>

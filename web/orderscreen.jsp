<%-- 
    Document   : orderscreen
    Created on : Apr 17, 2021, 9:40:38 PM
    Author     : X
--%>

<%@page import="Domain.User"%>
<%@page import="java.util.List"%>
<%@page import="Domain.Restaurant"%>
<%@page import="Controller.GenericDao"%>
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
                User u =(User) request.getSession().getAttribute("user");
            
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
        <% }
        else { %>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index.html">Start Bootstrap</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="review.jsp">Leave a review</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="viewReviews.jsp">Reviews</a></li>
                        <%
                            if (u.isMerchant()){
                        %>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="createrestaurant.jsp">Create a Restaurant</a></li>
                        <%
                            }
                        %>
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
            <h1 class="padding">Choose your favourite restaurant</h1>
            <div class="row">
                
                <%
                
                
                
                
                %>
                
                
                
                
                
                
                
                <%
                            
                            GenericDao<Restaurant> cdao = new GenericDao<>(Restaurant.class);
                            List<Restaurant> restaurants = cdao.findAllRestaurants();

                            for (Restaurant r : restaurants) {
                        %>
                <div class="col-sm my-4">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="./assets/img/portfolio/<%=r.getPicture()%>" alt="Restaurant Picture">
                        <div class="card-body">
                            <h5 class="card-title"><%=r.getRestaurant_name()%></h5>
                            <p class="card-text"><%=r.getDescription()%></p>
                            <a href="viewMenu.jsp?id=<%=r.getRestaurant_id()%>" class="btn btn-primary mr-5">View Menu</a>
                            <a href="review.jsp?id=<%=r.getRestaurant_id()%>" class="btn btn-outline-success">Review</a>
                        </div>
                    </div>
                </div>
                        <%
                            }
                        %>
                
            </div>
        </div>
                        <% } %>
    </body>
</html>

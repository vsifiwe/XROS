<%-- 
    Document   : viewMenu
    Created on : Apr 19, 2021, 2:49:04 PM
    Author     : X
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="Domain.Menu"%>
<%@page import="Domain.User"%>
<%@page import="Domain.Restaurant"%>
<%@page import="Controller.GenericDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose food</title>
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
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
        <% } else { %>
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
        <%
            GenericDao<Restaurant> dao = new GenericDao<>(Restaurant.class);
            Long id = Long.parseLong(request.getParameter("id"));
            Restaurant r = dao.findbyID(id);

        %>
        <div class="container">
            </br>
            <h1>Order from <%=r.getRestaurant_name()%></h1>

            <ul class="list-unstyled">
                <%
                    for (Menu m : r.getMenu_items()) {
                        DecimalFormat formatter = new DecimalFormat("###,###,###.## RWF");
                        String formatted_price = formatter.format(m.getMenu_price());
                %>
                <li class="media my-4">
                    <img src="./assets/img/portfolio/2.jpg" class="mr-3" alt="...">
                    <div class="media-body">
                        <h4 class="mt-0 mb-1"><%=m.getMenu_name()%></h4>
                        <p><%=m.getDescription()%></p>
                        <h5>Price:</h5><p><%=formatted_price %></p>
                        <%
                            if(u.isExisting(m.getMenu_id().toString())){
                        %>
                        <a href="x/removemenuitem?mid=<%=m.getMenu_id() %>&rid=<%=r.getRestaurant_id() %>" class="btn btn-danger">Remove</a>
                        <%
                            } else {
                        %>
                        <a href="x/addmenuitem?mid=<%=m.getMenu_id() %>&rid=<%=r.getRestaurant_id() %>" class="btn btn-primary">Add</a>
                        <%
                            }
                        %>
                    </div>
                </li>
                <%
                    }
                %>

            </ul>
                
              <h4 class="mt-0 mb-1">The total is <%=u.totalPayment() %></h4>  
              <a href="x/placeorder" class="btn btn-primary my-4">Place Order</a>
        </div>
        <% }%>
    </body>
</html>

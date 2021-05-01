<%-- 
    Document   : viewReviews
    Created on : May 1, 2021, 4:27:31 PM
    Author     : X
--%>

<%@page import="java.util.List"%>
<%@page import="Controller.GenericDao"%>
<%@page import="Domain.Review"%>
<%@page import="Domain.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Reviews</title>
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
        <% } else {
            GenericDao rdao = new GenericDao<>(Review.class);
            List<Review> reviews = rdao.findAll();
        %>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index.html">XROS</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="review.jsp">Leave a review</a></li>
                            <%
                                if (u.isMerchant()) {
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
            <h1>View all reviews</h1>
            <!--You need to add a table here for all reviews-->
            <table class="table table-hover table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">First</th>
                        <th scope="col">Last</th>
                        <th scope="col">Handle</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                    </tr>
                </tbody>
            </table>

            
        </div>


        <%
            }
        %>
    </body>
</html>

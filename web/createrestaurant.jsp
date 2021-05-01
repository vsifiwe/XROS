<%-- 
    Document   : createRestaurant
    Created on : Apr 17, 2021, 11:04:42 PM
    Author     : X
--%>

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
        <% } else { %>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="index.html">Start Bootstrap</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="review.jsp">Leave a review</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="viewReviews.jsp">Reviews</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="addMenu.jsp">Add Menu to restaurant</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="orderscreen.jsp">Make an order</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="x/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br/>
        <br/>
        <br/>
        <div id="content" class="flex">
            <div class="container">
                <div class="page-content page-container" id="page-content">
                    <div class="padding">
                        <div class="row">
                            <div class="col-md-6">
                                <form action="x/createrestaurant">
                                    <div class="card">
                                        <div class="card-header"><strong>Enter restaurant details</strong></div>
                                        <div class="card-body">
                                            <div class="form-group"><label class="text-muted" for="exampleInputrname">Restaurant Name</label><input required type="text" class="form-control" id="exampleInputrname" aria-describedby="rnameHelp" placeholder="Enter Restaurant Name" name="rname"></div>
                                            <div class="form-group"><label class="text-muted" for="exampleInputoname">Owner name</label><input required type="text" class="form-control" id="exampleInputoname" aria-describedby="onameHelp" placeholder="Enter Owner Name" name="oname"></div>
                                            <div class="form-group"><label class="text-muted" for="exampleInputDescription">Description</label><input required type="text" class="form-control" id="exampleInputPassword1" placeholder="Eg: The greatest restaurant on earth" name="description"></div>
                                            <br>
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="customFile" name="picture" required accept="image/*">
                                                    <label class="custom-file-label" for="customFile">Restaurant Picture</label>
                                                </div>
                                        </div>
                                        <div class="card-footer"><button type="submit" class="btn btn-primary">Create</button></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </body>
</html>

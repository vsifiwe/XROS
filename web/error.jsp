<%-- 
    Document   : error
    Created on : Apr 17, 2021, 10:25:23 PM
    Author     : X
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="error-template">
                        <h1>
                            Oops!</h1>
                        <h2>
                            404 Not Found</h2>
                        <div class="error-details">
                            Sorry, an error has occured, Requested page not found!
                        </div>
                        <div class="error-actions">
                            <a href="http://localhost:8084/XROS/index.html" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
                                Take Me Home </a><a href="http://localhost:8084/XROS/login.jsp" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-envelope"></span> Contact Support </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

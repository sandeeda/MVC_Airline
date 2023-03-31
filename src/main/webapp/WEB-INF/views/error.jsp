<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@page isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Failed</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="alert alert-danger text-center">
                    <i class="fa fa-times-circle-o fa-5x"></i>
                    <h2>Login Failed!</h2>
                    <p>Your username or password is incorrect. Please try again.</p>
                    <a href="${pageContext.request.contextPath }/" class="btn btn-danger"><i class="fa fa-sign-in"></i> Try Again</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
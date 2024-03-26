<%-- 
    Document   : error
    Created on : Oct 9, 2023, 5:32:03 PM
    Author     : LENOVO
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            background-image: url('E.jpg'); /* Add your background image path */
            background-size: cover;
            font-family: Arial, sans-serif;
            text-align: center;
            color: #fff; /* Set text color to white or another contrasting color */
        }
        .error-container {
            background-color: rgba(0, 0, 0, 0.6); /* Semi-transparent background for better visibility */
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            margin: 0 auto;
            margin-top: 100px;
        }
        /* Add more CSS for styling */
    </style>
</head>
<body>
    <div class="error-container">
        <h2>Error</h2>
        <p>${errorMessage}</p>
        <p><a href="index.html">Click here to login</a></p>
    </div>
</body>
</html>



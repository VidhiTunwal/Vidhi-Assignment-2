<%-- 
    Document   : NewBook
    Created on : Oct 9, 2023, 8:55:05 PM
    Author     : LENOVO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Book</title>
</head>
<body>
    <%
        // Retrieve values from the form
        String BookID = request.getParameter("BookID");
        String Name = request.getParameter("Name");
        String Publisher = request.getParameter("Publisher");
        String Price = request.getParameter("Price");
        String PublishedYear = request.getParameter("PublishedYear");

        // Database connection details
       String jdbcURL = "jdbc:derby://localhost:1527/LMS";
        String dbUser = "SOFT";
        String dbPassword = "SOFT";

        try {
            // Connect to the database
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/LMS", "SOFT","SOFT");

            // Insert the book data into the database
            String query = "INSERT INTO Book (BookID, Name, Publisher, Price, PublishedYear) VALUES (?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, BookID);
            pstmt.setString(2, Name);
            pstmt.setString(3, Publisher);
            pstmt.setString(4, Price);
            pstmt.setString(5, PublishedYear);
            
            pstmt.executeUpdate();

            // Close the database connection
            conn.close();
        
    %>
    <h2>Book Entry Successful</h2>
    <p>Book data has been successfully saved.</p>
    <a href="NewBook.html">Back to New Book Entry</a>
    <%
        } catch (SQLException e) {
            e.printStackTrace();
    %>
    <h2>Error</h2>
    <p>An error occurred while saving student data.</p>
    <a href="NewBook.html">Back to New Book Entry</a>
    <%
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>
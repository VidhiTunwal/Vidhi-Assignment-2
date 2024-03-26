<%-- 
    Document   : Login
    Created on : Oct 9, 2023, 5:28:22 PM
    Author     : LENOVO
--%>
   <%@page import="java.lang.String"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
      
 <% 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String errorMessage = "";

        // Database connection details
        String jdbcURL = "jdbc:derby://localhost:1527/LMS";
        String dbUser = "SOFT";
        String dbPassword = "SOFT";

        try {
            // Connect to the database
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/LMS", "SOFT", "SOFT");

            // Create a SQL query to check login credentials
            String query = "SELECT * FROM Login WHERE username=? AND password=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Successful login, redirect to home.html
                response.sendRedirect("Home.html");
            } else {
                // Invalid credentials, display error message and provide a link to go back to login.html
                errorMessage = "Wrong username or password. Click <a href='login.html'>here</a> to login again.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

            // Close the database connection
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>

    </body>
</html>

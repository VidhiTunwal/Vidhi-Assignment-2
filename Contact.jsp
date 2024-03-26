<%-- 
    Document   : Contact
    Created on : Oct 8, 2023, 9:48:51 PM
    Author     : LENOVO
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
    </head>
    <body>
        <%
         String Name = request.getParameter("Name");
        String Email = request.getParameter("Email");
        String Mobile = request.getParameter("Mobile");
        String Message = request.getParameter("Message");
        Connection con=null;
        PreparedStatement preparedStatement=null;
        

        try {
            // Connect to the Derby database
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String jdbcUrl = "jdbc:derby://localhost:1527/LMS";
            String dbUser = "SOFT";
            String dbPassword = "SOFT";
            con= DriverManager.getConnection("jdbc:derby://localhost:1527/LMS","SOFT","SOFT");

            // Insert data into the contact table
            String sql = "INSERT INTO Contact (Name, Email, Mobile, Message) VALUES (?, ?, ?, ?)";
            preparedStatement=con.prepareStatement(sql);
            preparedStatement.setString(1, Name);
            preparedStatement.setString(2, Email);
            preparedStatement.setString(3, Mobile);
            preparedStatement.setString(4, Message);
            preparedStatement.executeUpdate();

            // Close the database connection
            preparedStatement.close();
            con.close();

            // Redirect back to the contact page with a success message
            response.sendRedirect("Home.html");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle errors and redirect with an error message
            out.println("error"+e.getMessage());
            
            
        }
        
%>
    </body>
</html>

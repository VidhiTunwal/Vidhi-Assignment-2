<%-- 
    Document   : NewStudent
    Created on : Oct 9, 2023, 7:35:59 PM
    Author     : LENOVO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Entry </title>
</head>
<body>
    <%
        String Student_ID = request.getParameter("Student_ID");
        String Name = request.getParameter("Name");
        String Father_Name = request.getParameter("Father_Name");
        String Course_Name = request.getParameter("Course_Name");
         String Branch_Name = request.getParameter("Branch_Name");
        
        

        // Database connection details
        String jdbcURL = "jdbc:derby://localhost:1527/LMS";
        String dbUser = "SOFT";
        String dbPassword = "SOFT";

        try {
            // Connect to the database
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/LMS", "SOFT", "SOFT");

            // Insert the student data into the database
            String query = "INSERT INTO Student (Student_ID,Name,Father_Name,Course_Name,Branch_Name) VALUES (?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, Student_ID);
            pstmt.setString(2, Name);
            pstmt.setString(3, Father_Name);
            pstmt.setString(4, Course_Name);
             pstmt.setString(5, Branch_Name);
            
            
            pstmt.executeUpdate();

            // Close the database connection
            conn.close();
    %>
    <h2>Student Entry Successful</h2>
    <p>Student data has been successfully saved.</p>
    <script type="text/javascript">
        alert("student entery save successfully");
    </script>
   <!-- <a href="NewStudent.html">Back to New Student Entry</a> -->
    <%
        } catch (SQLException e) {
            e.printStackTrace();
    %>
    <h2>Error</h2>
    <p>An error occurred while saving student data.</p>
    <a href="NewStudent.html">Back to New Student Entry</a>
    <%
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>


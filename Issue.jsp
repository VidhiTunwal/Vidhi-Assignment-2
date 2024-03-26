<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   
</head>
<body>
    <%
        // Retrieve values from the form
        String BookID = request.getParameter("BookID");
        String Student_ID = request.getParameter("Student_ID");
        String IssueDate = request.getParameter("IssueDate");
        String DueDate= request.getParameter("DueDate");
        String ReturnBook = request.getParameter("ReturnBook");

        // Database connection details
       String jdbcURL = "jdbc:derby://localhost:1527/LMS";
        String dbUser = "SOFT";
        String dbPassword = "SOFT";

        try {
            // Connect to the database
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/LMS", "SOFT","SOFT");

            // Insert the book data into the database
            String query = "INSERT INTO Issue (BookID,Student_ID,IssueDate,DueDate,ReturnBook) VALUES (?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, BookID);
            pstmt.setString(2, Student_ID);
            pstmt.setString(3, IssueDate);
            pstmt.setString(4, DueDate);
            pstmt.setString(5,ReturnBook);
            
            pstmt.executeUpdate();

            // Close the database connection
            conn.close();
        
    %>
    <h2>Book Issued Successfully</h2>
    <p>Issue data has been successfully saved.</p>
    <a href="Issue_Book.html">Back to Issue Entry</a>
    <%
        } catch (SQLException e) {
            e.printStackTrace();
    %>
    <h2>Error</h2>
    <p>An error occurred while saving student data.</p>
    <a href="Issue_Book.html">Back to Issue Entry</a>
    <%
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>


<%@ page import="java.sql.*" %>
<%
    String BookID = request.getParameter("BookID");
    String Student_ID = request.getParameter("Student_ID");
    
    String jdbcURL = "jdbc:derby://localhost:1527/LMS";
    String dbUser = "SOFT";
    String dbPassword = "SOFT";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    String responseMessage = "";

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        connection = DriverManager.getConnection("jdbc:derby://localhost:1527/LMS", "SOFT", "SOFT");

        String query = "SELECT ReturnBook FROM Issue WHERE BookID = ? AND Student_ID = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, BookID);
        preparedStatement.setString(2, Student_ID);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            String returnStatus = resultSet.getString("ReturnBook");
            responseMessage = "Return Status: " + returnStatus; // Debugging
            if ("No".equals(returnStatus)) {
                String updateQuery = "UPDATE Issue SET ReturnBook = 'YES' WHERE BookID = ? AND Student_ID = ?";
                preparedStatement = connection.prepareStatement(updateQuery);
                preparedStatement.setString(1, BookID);
                preparedStatement.setString(2, Student_ID);
                int rowsUpdated = preparedStatement.executeUpdate();

                if (rowsUpdated > 0) {
                    responseMessage = "Book successfully returned.";
                } else {
                    responseMessage = "Error updating the book return status.";
                }
            } else {
                responseMessage = "Book is already returned.";
            }
        } else {
            responseMessage = "Book is not issued for this user.";
        }
    } catch (Exception e) {
        e.printStackTrace();
        responseMessage = "Connection Error.";
    } finally {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<div>
    <h1>Return Book</h1>
    <p><%= responseMessage %></p>
    <a href="Return_Book.html">Return Entry</a>
</div>

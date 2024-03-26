<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NEW BOOKS</title>
    <style>
    body {
            background-image: url('au.jpg'); /* Add your background image path */
            background-size: cover;
            font-family: Arial, sans-serif;
            text-align: center;
            color: #000; /* Set text color to white for better visibility */
        }

        h2 {
            padding: 20px;
        }

        table {
            width: 80%;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
        }
       table, th, td {
            border: 1px solid #fff;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            color: #000; /* Set text color to black for data */
        }

        th {
            background-color: #333;
            color: #fff;
        }

        a {
             color: #336699; /* Dark blue color */
            text-decoration: none;
            font-weight: bold; /* Make the link bold */
            font-size: 18px; /* Increase font size */
        }
        </style>
</head>
<body>
    <h2> New Books</h2>
    <table border="1">
        <tr>
            <th>Book ID</th>
            <th>Name</th>
            <th>Publisher</th>
            <th>Price</th>
            <th>Published Year</th>
        </tr>
        <%
            // Database connection details
             String jdbcURL = "jdbc:derby://localhost:1527/LMS";
        String dbUser = "SOFT";
        String dbPassword = "SOFT";
         
            try {
                // Connect to the database
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/LMS", "SOFT", "SOFT");

                // Retrieve book records from the database
                String query = "SELECT * FROM Book";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("BookID") %></td>
            <td><%= rs.getString("Name") %></td>
            <td><%= rs.getString("Publisher") %></td>
            <td><%= rs.getString("Price") %></td>
            <td><%= rs.getString("PublishedYear") %></td>
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
    </table>
    <br>
    <a href="NewBook.html">Back to Book Entry</a>
</body>
</html>


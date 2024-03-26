

<%@ page import="java.sql.*" %>
<%@ page import="XYZ.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Statistics</title>
    <style>
        /* Add your CSS styles for the page layout here */
        body {
            background-image: url('stat.jpeg'); /* Replace with your background image URL */
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        .container {
            margin: 20px;
        }

        h1 {
            text-align: center;
            color: #fff;
        }

        /* Style for tables */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #000;
        }

        th, td {
            padding: 10px;
            text-align: left;
            color: #fff;
        }

        th {
            background-color: #333;
        }

        /* Style for the close button */
        .close-button {
            display: block;
            width: 150px;
            margin: 0 auto;
            padding: 10px;
            background-color: #333;
            color: #fff;
            text-align: center;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Statistics</h1>

        <!-- Issue Details Table -->
       
        <h2 style="color: white;">Issue Details</h2>
        <table>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Book ID</th>
                <th>Book Name</th>
                <th>Issue Date</th>
                <th>Due Date</th>
            </tr>
            <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                try {
                    con = ConnectionProvider.getCon();
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT Issue.Student_ID, Student.Name AS Student_Name, Issue.BookID, Book.Name AS Book_Name, Issue.IssueDate, Issue.DueDate FROM Issue INNER JOIN Student ON Issue.Student_ID = Student.Student_ID INNER JOIN Book ON Book.BookID = Issue.BookID WHERE Issue.ReturnBook = 'No'");
                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("Student_ID") %></td>
                    <td><%= rs.getString("Student_Name") %></td>
                    <td><%= rs.getString("BookID") %></td>
                    <td><%= rs.getString("Book_Name") %></td>
                    <td><%= rs.getString("IssueDate") %></td>
                    <td><%= rs.getString("DueDate") %></td>
                </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) {
                            rs.close();
                        }
                        if (st != null) {
                            st.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>

        <!-- Return Details Table -->
        <h2 style="color: white;">Return Details</h2>
        <table>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Book ID</th>
                <th>Book Name</th>
                <th>Issue Date</th>
                <th>Due Date</th>
            </tr>
            <%
                Connection con1 = null;
                Statement st1 = null;
                ResultSet rs1 = null;
                try {
                    con1 = ConnectionProvider.getCon();
                    st1 = con1.createStatement();
                    rs1 = st1.executeQuery("SELECT Issue.Student_ID, Student.Name AS Student_Name, Issue.BookID, Book.Name AS Book_Name, Issue.IssueDate, Issue.DueDate FROM Issue INNER JOIN Student ON Issue.Student_ID = Student.Student_ID INNER JOIN Book ON Book.BookID = Issue.BookID WHERE Issue.ReturnBook = 'YES'");
                    while (rs1.next()) {
            %>
                <tr>
                    <td><%= rs1.getString("Student_ID") %></td>
                    <td><%= rs1.getString("Student_Name") %></td>
                    <td><%= rs1.getString("BookID") %></td>
                    <td><%= rs1.getString("Book_Name") %></td>
                    <td><%= rs1.getString("IssueDate") %></td>
                    <td><%= rs1.getString("DueDate") %></td>
                </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs1 != null) {
                            rs1.close();
                        }
                        if (st1 != null) {
                            st1.close();
                        }
                        if (con1 != null) {
                            con1.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>

        <!-- Close Button -->
        <a href="Home.html" class="close-button">Close</a>
    </div>
</body>
</html>

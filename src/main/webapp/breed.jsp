<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Breed Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 80%;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .breed-details {
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .breed-details h3 {
            margin-top: 0;
            color: #333;
        }

        .breed-details p {
            margin-bottom: 10px;
            line-height: 1.5;
        }

        .breed-details strong {
            font-weight: bold;
        }

        .adopt-button {
            text-align: center;
            margin-top: 20px;
        }

        .adopt-button button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .adopt-button button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Breed Details</h2>
        <%@ page import="java.sql.Connection" %>
        <%@ page import="java.sql.DriverManager" %>
        <%@ page import="java.sql.PreparedStatement" %>
        <%@ page import="java.sql.ResultSet" %>
        <%@ page import="java.sql.SQLException" %>
        <%@ page import="java.io.PrintWriter" %>

        <% 
            String breed = request.getParameter("breed");

            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/cat2";
            String username = "root";
            String password = "priya32";

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the database connection
                conn = DriverManager.getConnection(url, username, password);

                // Prepare SQL query to retrieve breed details
                String sql = "SELECT category, age, lifespan, description FROM breeds WHERE LOWER(breed_name) LIKE LOWER(CONCAT('%', ?, '%')) OR REPLACE(breed_name, ' ', '-') LIKE REPLACE(CONCAT('%', ?, '%'), ' ', '-')";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, breed);
                stmt.setString(2, breed);
                
                // Execute the query
                rs = stmt.executeQuery();

                if (rs.next()) {
                    // Breed found, retrieve details and display
                    String category = rs.getString("category");
                    String age = rs.getString("age");
                    String lifespan = rs.getString("lifespan");
                    String description = rs.getString("description");

                    // Modify breed name to uppercase and remove underscores
                    breed = breed.replace("_", " ").toUpperCase();

        %>
                    <div class="breed-details">
                        <h3><%= breed %></h3>
                        <p><strong>Category:</strong> <%= category %></p>
                        <p><strong>Age:</strong> <%= age %></p>
                        <p><strong>Average Lifespan:</strong> <%= lifespan %></p>
                        <p><strong>Description:</strong> <%= description %></p>
                    </div>
        <%
                } else {
                    // Breed not found
        %>
                    <p>Breed not found: <%= breed %></p>
        <%
                }
            } catch (ClassNotFoundException | SQLException e) {
                // Error handling: print stack trace and error message
                e.printStackTrace();
        %>
                <p>Error: <%= e.getMessage() %></p>
        <%
            } finally {
                // Close JDBC objects
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
        %>
                    <p>Error: <%= e.getMessage() %></p>
        <%
                }
            }
        %>
<div class="adopt-button">
    <button onclick="window.location.href='Application.html'">ADOPT</button>
</div>


</body>
</html>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fetch Breed Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #009688;
        }
        form {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"] {
            padding: 8px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button[type="submit"] {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #45a049;
        }
        .breed-details {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .breed-details h2 {
            color: #009688;
            margin-bottom: 10px;
        }
        .breed-details p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <h1>Fetch Breed Details</h1>
    
    <form method="get" action="fetchBreedDetails.jsp">
        <label for="breedName">Enter Breed Name:</label>
        <input type="text" id="breedName" name="breedName">
        <button type="submit">Fetch Details</button>
    </form>
    
    <% 
    // Retrieve breed name from the request parameter
    String breedName = request.getParameter("breedName");

    // Check if breed name is provided
    if (breedName != null && !breedName.isEmpty()) {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish connection to the database
            String url = "jdbc:mysql://localhost:3306/cat2";
            String username = "root";
            String password = "priya32";
            Connection conn = DriverManager.getConnection(url, username, password);

            // SQL query to fetch breed details
            String sql = "SELECT * FROM breeds WHERE breed_name = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, breedName);

            // Execute the query
            ResultSet rs = stmt.executeQuery();

            // Check if any rows are returned
            if (rs.next()) {
                // Retrieve breed details from the result set
                String category = rs.getString("category");
                String age = rs.getString("age");
                String lifespan = rs.getString("lifespan");
                String description = rs.getString("description");

                // Display breed details
                %>
                <div class="breed-details">
                    <h2>Breed Details for <%= breedName %>:</h2>
                    <p><strong>Category:</strong> <%= category %></p>
                    <p><strong>Age:</strong> <%= age %></p>
                    <p><strong>Lifespan:</strong> <%= lifespan %></p>
                    <p><strong>Description:</strong> <%= description %></p>
                </div>
                <%
            } else {
                out.println("<p>No breed found with the name: " + breedName + "</p>");
            }

            // Close the resources
            rs.close();
            stmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
    %>
</body>
</html>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Breed Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f2f2f2;
        }
        h1 {
            text-align: center;
            color: #009688;
            margin-bottom: 30px;
        }
        form {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], textarea {
            padding: 8px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 300px;
            box-sizing: border-box;
        }
        button[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button[type="submit"]:hover {
            background-color: #45a049;
        }
        .message {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            background-color: #dff0d8;
            border: 1px solid #d0e9c6;
            border-radius: 4px;
            color: #3c763d;
        }
        .error {
            background-color: #f2dede;
            border-color: #ebccd1;
            color: #a94442;
        }
    </style>
</head>
<body>
    <h1>Update Breed Details</h1>
    
    <!-- Breed details update form -->
    <form method="post" action="updateBreedDetails.jsp">
        <label for="breedName">Breed Name:</label>
        <input type="text" id="breedName" name="breedName" required><br>
        <label for="age">Age:</label>
        <input type="text" id="age" name="age" required><br>
        <label for="lifespan">Lifespan:</label>
        <input type="text" id="lifespan" name="lifespan" required><br>
        <label for="description">Description:</label><br>
        <textarea id="description" name="description" rows="4" cols="50" required></textarea><br>
        <button type="submit">Update Details</button>
    </form>

    <%-- Update breed details in the database --%>
    <%
        // Retrieve form data
        String breedName = request.getParameter("breedName");
        String age = request.getParameter("age");
        String lifespan = request.getParameter("lifespan");
        String description = request.getParameter("description");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/cat2";
        String username = "root";
        String password = "priya32";

        try {
            // Check if the form is submitted
            if (breedName != null && !breedName.isEmpty() && age != null && !age.isEmpty() &&
                lifespan != null && !lifespan.isEmpty() && description != null && !description.isEmpty()) {

                // Load the MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish connection to the database
                Connection conn = DriverManager.getConnection(url, username, password);

                // SQL query to update breed details
                String sql = "UPDATE breeds SET age=?, lifespan=?, description=? WHERE breed_name=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, age);
                stmt.setString(2, lifespan);
                stmt.setString(3, description);
                stmt.setString(4, breedName);

                // Execute the update query
                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
    %>
        <div class="message">
            <h1>Breed details updated successfully.</h1>
        </div>
    <%
                } else {
    %>
        <div class="message error">
            <h1>No breed found with the name: <%= breedName %></h1>
        </div>
    <%
                }

                // Close the resources
                stmt.close();
                conn.close();
            }
        } catch (ClassNotFoundException | SQLException e) {
    %>
        <div class="message error">
            <h1>Error: <%= e.getMessage() %></h1>
        </div>
    <%
        }
    %>
</body>
</html>

package example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteBreedServlet")
public class DeleteBreedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve breed name and category from request parameter
        String breedName = request.getParameter("breedName");
        String category = request.getParameter("category");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/cat2";
        String username = "root";
        String password = "priya32";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            // Prepare SQL query to delete breed details
            String sql = "DELETE FROM breeds WHERE breed_name = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, breedName);

                // Execute the delete query
                int rowsAffected = stmt.executeUpdate();

                // Check if any rows were affected (i.e., breed deleted)
                if (rowsAffected > 0) {
                    // Breed deleted successfully
                    // Redirect to homepage.jsp
                    response.sendRedirect("Homepage.jsp");
                } else {
                    // Breed not found
                    response.getWriter().println("Breed not found: " + breedName);
                }
            }
        } catch (SQLException e) {
            // Error handling
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

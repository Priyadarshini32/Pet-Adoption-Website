package example;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/CreateBreedServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CreateBreedServlet extends HttpServlet {
    
    // Database connection parameters
    private static final String url = "jdbc:mysql://localhost:3306/cat2";
    private static final String username = "root";
    private static final String password = "priya32";
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String breedName = request.getParameter("breedName");
        String category = request.getParameter("category");
        String age = request.getParameter("age");
        String lifespan = request.getParameter("lifespan");
        String description = request.getParameter("description");
        Part imagePart = request.getPart("image");

        // Extract image file name
        String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

        // Define the upload path
        String uploadPath = getServletContext().getRealPath("") + File.separator + category;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Save the image file to the directory
        String imagePath = uploadPath + File.separator + fileName;
        try {
            imagePart.write(imagePath);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Construct the relative path to the image for the web app
        String imageWebPath = request.getContextPath() + "/" + category + "/" + fileName;


        // Store breed details in the database
        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String sql = "INSERT INTO breeds (breed_name, category, age, lifespan, description) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, breedName);
                stmt.setString(2, category);
                stmt.setString(3, age);
                stmt.setString(4, lifespan);
                stmt.setString(5, description);
                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("New breed added successfully.");
                } else {
                    System.out.println("Failed to add new breed.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set breed name, image path, and category as request attributes
        request.setAttribute("breedName", breedName);
        request.setAttribute("imagePath", imageWebPath);
        request.setAttribute("category", category);

        // Forward the request to category.jsp
        request.getRequestDispatcher("category.jsp?category=" + category).forward(request, response);
    }
}

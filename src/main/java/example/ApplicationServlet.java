package example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ApplicationServlet")
public class ApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String reason = request.getParameter("reason");
        String dateString = request.getParameter("date");
        
        // Convert date string to java.sql.Date
        java.sql.Date date = java.sql.Date.valueOf(dateString);

        // Process the application data here (e.g., store in database, send email notification)
        String url = "jdbc:mysql://localhost:3306/cat2";
        String username = "root";
        String password = "priya32";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String sql = "INSERT INTO application (name, email, phone, address, reason, date) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, phone);
                stmt.setString(4, address);
                stmt.setString(5, reason);
                stmt.setDate(6, date);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    // Application data inserted successfully
                    response.setContentType("text/html");
                    response.getWriter().println("<!DOCTYPE html>");
                    response.getWriter().println("<html>");
                    response.getWriter().println("<head>");
                    response.getWriter().println("<title>Application Submitted</title>");
                    response.getWriter().println("<style>");
                    response.getWriter().println("body { font-family: Arial, sans-serif; text-align: center; background-color: #f0f0f0; }");
                    response.getWriter().println(".container { width: 80%; margin: 50px auto; padding: 20px; border: 2px solid #4CAF50; border-radius: 10px; background-color: #fff; }");
                    response.getWriter().println("h2 { color: #4CAF50; }");
                    response.getWriter().println("p { font-size: 18px; }");
                    response.getWriter().println(".contact-info { margin-top: 20px; }");
                    response.getWriter().println("button { padding: 10px 20px; font-size: 16px; background-color: #4CAF50; color: #fff; border: none; border-radius: 5px; cursor: pointer; margin: 10px; }");
                    response.getWriter().println("button:hover { background-color: #45a049; }");
                    response.getWriter().println("</style>");
                    response.getWriter().println("</head>");
                    response.getWriter().println("<body>");
                    response.getWriter().println("<div class=\"container\">");
                    response.getWriter().println("<h2>Application Submitted Successfully</h2>");
                    response.getWriter().println("<p>Thank you for submitting your application.</p>");
                    response.getWriter().println("<div class=\"contact-info\">");
                    response.getWriter().println("<p>Contact Information:</p>");
                    response.getWriter().println("<p>Phone: +9498982391</p>");
                    response.getWriter().println("<p>Email: petadoptionsite@gmail.com</p>");
                    response.getWriter().println("</div>");
                    response.getWriter().println("<button onclick=\"window.location.href='logout.jsp'\">Logout</button>");
                    response.getWriter().println("<button onclick=\"window.location.href='Login.jsp'\">Login Again</button>");
                    response.getWriter().println("</div>");
                    response.getWriter().println("</body>");
                    response.getWriter().println("</html>");
                } else {
                    // Failed to insert application data
                    handleError(response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database error
            handleError(response);
        }
    }

    private void handleError(HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<!DOCTYPE html>");
        response.getWriter().println("<html>");
        response.getWriter().println("<head><title>Error</title></head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<h2>Error</h2>");
        response.getWriter().println("<p>Sorry, an error occurred while processing your application.</p>");
        response.getWriter().println("<button onclick=\"window.location.href='Login.jsp'\">Login Again</button>");
        response.getWriter().println("</body>");
        response.getWriter().println("</html>");
    }
}

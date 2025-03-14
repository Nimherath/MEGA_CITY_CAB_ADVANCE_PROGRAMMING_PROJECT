package Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/AdminAddTaxiServlet")
public class AdminAddTaxiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(AdminAddTaxiServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get taxi details from form
        String model = request.getParameter("model");
        String image = request.getParameter("image");
        String ratingStr = request.getParameter("rating");
        String seatsStr = request.getParameter("seats");
        String priceStr = request.getParameter("price");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Convert input values
            double rating = Double.parseDouble(ratingStr);
            int seats = Integer.parseInt(seatsStr);
            double price = Double.parseDouble(priceStr);

            // Database connection details
            String dbURL = "jdbc:mysql://localhost:3308/mega_city_cab";
            String dbUser = "root";
            String dbPassword = "12345678";

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Insert taxi into database
            String sql = "INSERT INTO taxis (model, image, rating, seats, price) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, model);
            stmt.setString(2, image);
            stmt.setDouble(3, rating);
            stmt.setInt(4, seats);
            stmt.setDouble(5, price);

            // Execute update
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                request.setAttribute("successMessage", "Taxi added successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to add taxi.");
            }

            // Redirect back to manage taxis page
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "JDBC Driver not found", e);
            request.setAttribute("errorMessage", "Database driver error. Please contact support.");
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "Database connection issue. Please try again later.");
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                LOGGER.log(Level.WARNING, "Failed to close database resources", ex);
            }
        }
    }
}

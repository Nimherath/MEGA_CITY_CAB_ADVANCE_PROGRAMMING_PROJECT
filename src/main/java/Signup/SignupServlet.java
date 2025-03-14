package Signup;

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


@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(SignupServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form data
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        // Basic validation
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Database connection details
            String dbURL = "jdbc:mysql://localhost:3308/mega_city_cab";
            String dbUser = "root";
            String dbPassword = "12345678";

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Insert user into database
            String sql = "INSERT INTO users (first_name, last_name, email, phone, address, password) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, phone);
            stmt.setString(5, address);
            stmt.setString(6, password); // Ideally, hash the password before storing

            // Execute query
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                request.setAttribute("successMessage", "Account created successfully! Please log in.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Failed to create account. Please try again.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "JDBC Driver not found", e);
            request.setAttribute("errorMessage", "Database driver error. Please contact support.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "Database connection issue. Please try again later.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } finally {
            // Close resources in the correct order
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException ex) {
                LOGGER.log(Level.WARNING, "Failed to close statement", ex);
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                LOGGER.log(Level.WARNING, "Failed to close connection", ex);
            }
        }
    }
}

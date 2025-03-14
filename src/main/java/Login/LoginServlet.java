package Login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(LoginServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get user credentials from form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email and password cannot be empty.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Database connection details
            String dbURL = "jdbc:mysql://localhost:3308/mega_city_cab";
            String dbUser = "root";
            String dbPassword = "12345678";

            // Load MySQL JDBC Driver
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                LOGGER.log(Level.SEVERE, "MySQL JDBC Driver not found!", e);
                throw new ServletException("Database driver not found!", e);
            }

            // Establish connection
            try {
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Database connection failed!", e);
                throw new ServletException("Database connection error! Please try again later.", e);
            }

            // Query to check user credentials
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password); // Ideally, use hashed password comparison

            rs = stmt.executeQuery();

            if (rs.next()) {
                try {
                    // Create a session and store user data
                    HttpSession session = request.getSession();
                    session.setAttribute("userEmail", rs.getString("email"));
                    session.setAttribute("userName", rs.getString("first_name") + " " + rs.getString("last_name"));
                    session.setAttribute("userPhone", rs.getString("phone"));
                    session.setAttribute("userAddress", rs.getString("address"));
                    session.setAttribute("userRole", rs.getString("role")); // Store role

                    // Redirect based on role
                    if ("admin".equals(rs.getString("role"))) {
                        response.sendRedirect("admin_dashboard.jsp");
                    } else {
                        response.sendRedirect("home.jsp");
                    }
                } catch (NullPointerException e) {
                    LOGGER.log(Level.SEVERE, "Session creation failed!", e);
                    throw new ServletException("Session handling error! Please try again.", e);
                }
            } else {
                // Invalid login
                request.setAttribute("errorMessage", "Invalid email or password!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error occurred!", e);
            request.setAttribute("errorMessage", "A database error occurred! Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (ServletException e) {
            LOGGER.log(Level.SEVERE, "Servlet exception occurred!", e);
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error occurred!", e);
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                LOGGER.log(Level.WARNING, "Failed to close database resources", ex);
            }
        }
    }
}

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


public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("email");
        String userName = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String dbURL = "jdbc:mysql://localhost:3308/mega_city_cab";
            String dbUser = "root";
            String dbPassword = "12345678";

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Update user details in the database
            String sql = "UPDATE users SET first_name = ?, last_name = ?, phone = ?, address = ? WHERE email = ?";
            stmt = conn.prepareStatement(sql);
            String[] nameParts = userName.split(" ");
            stmt.setString(1, nameParts[0]); // First Name
            stmt.setString(2, nameParts.length > 1 ? nameParts[1] : ""); // Last Name
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.setString(5, userEmail);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("profile.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to update user details.");
                request.getRequestDispatcher("edit_user.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}

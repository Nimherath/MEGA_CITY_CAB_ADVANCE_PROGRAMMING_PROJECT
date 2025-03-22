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


public class DeleteTaxiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String taxiId = request.getParameter("id");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String dbURL = "jdbc:mysql://localhost:3306/mega_city_cab";
            String dbUser = "root";
            String dbPassword = "12345678";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql = "DELETE FROM taxis WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(taxiId));

            stmt.executeUpdate();
            response.sendRedirect("manage_taxis.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_taxis.jsp?error=Could not delete taxi");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ignored) {}
        }
    }
}

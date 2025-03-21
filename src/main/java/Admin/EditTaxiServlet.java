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

@WebServlet("/EditTaxiServlet")
public class EditTaxiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taxiId = request.getParameter("taxiId");
        String model = request.getParameter("model");
        String image = request.getParameter("image");
        double price = Double.parseDouble(request.getParameter("price"));
        int seats = Integer.parseInt(request.getParameter("seats"));
        float rating = Float.parseFloat(request.getParameter("rating"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String dbURL = "jdbc:mysql://localhost:3306/mega_city_cab";
            String dbUser = "root";
            String dbPassword = "12345678";

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Update taxi details in the database
            String sql = "UPDATE taxis SET model = ?, image = ?, rating = ?, seats = ?, price = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, model);
            stmt.setString(2, image);
            stmt.setFloat(3, rating);
            stmt.setInt(4, seats);
            stmt.setDouble(5, price);
            stmt.setInt(6, Integer.parseInt(taxiId));

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("admin_dashboard.jsp"); // Redirect to the manage taxis page after update
            } else {
                request.setAttribute("errorMessage", "Failed to update taxi details.");
                request.getRequestDispatcher("edit_taxi.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}

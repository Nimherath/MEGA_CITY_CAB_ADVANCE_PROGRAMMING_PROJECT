package Booking;

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
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;


public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(BookingServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user details from session (User must be logged in)
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if user is not logged in
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");

        // Get form data
        String fullName = request.getParameter("name");
        String phone = request.getParameter("phone");
        String pickupLocation = request.getParameter("pickup");
        String dropoffLocation = request.getParameter("dropoff");
        String pickupDate = request.getParameter("date");
        String pickupTime = request.getParameter("time");
        String taxiType = request.getParameter("taxi");

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

            // Insert booking data into the database
            String sql = "INSERT INTO bookings (user_email, full_name, phone, pickup_location, dropoff_location, pickup_date, pickup_time, taxi_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, userEmail);
            stmt.setString(2, fullName);
            stmt.setString(3, phone);
            stmt.setString(4, pickupLocation);
            stmt.setString(5, dropoffLocation);
            stmt.setString(6, pickupDate);
            stmt.setString(7, pickupTime);
            stmt.setString(8, taxiType);

            // Execute query
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                // Send email confirmation
                sendBookingConfirmationEmail(userEmail, fullName, phone, pickupLocation, dropoffLocation, pickupDate, pickupTime, taxiType);

                request.setAttribute("successMessage", "Taxi booked successfully! A confirmation email has been sent.");
                request.getRequestDispatcher("confirmation.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Failed to book taxi. Please try again.");
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "JDBC Driver not found", e);
            request.setAttribute("errorMessage", "Database driver error. Please contact support.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "Database connection issue. Please try again later.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
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

    /**
     * Sends a booking confirmation email to the user.
     */
    private void sendBookingConfirmationEmail(String userEmail, String fullName, String phone, String pickupLocation, String dropoffLocation, String pickupDate, String pickupTime, String taxiType) {
        final String senderEmail = "dhanusaima511@gmail.com";  // Replace with your email
        final String senderPassword = "nuvx tkrz lvdf skuq";  // Replace with your email password
        final String smtpHost = "smtp.gmail.com"; // SMTP server for Gmail

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
            message.setSubject("Mega City Cab - Booking Confirmation");
            message.setText("Dear " + fullName + ",\n\n" +
                    "Your taxi booking has been successfully placed!\n\n" +
                    "📍 Pickup: " + pickupLocation + "\n" +
                    "📍 Dropoff: " + dropoffLocation + "\n" +
                    "📅 Date: " + pickupDate + "\n" +
                    "⏰ Time: " + pickupTime + "\n" +
                    "🚖 Taxi Type: " + taxiType + "\n\n" +
                    "Thank you for booking with Mega City Cab! 🚖");

            Transport.send(message);
            LOGGER.info("Booking confirmation email sent successfully to " + userEmail);

        } catch (MessagingException e) {
            LOGGER.log(Level.SEVERE, "Failed to send booking confirmation email", e);
        }
    }
}

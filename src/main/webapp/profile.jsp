<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession, java.sql.*" %>

<%
    // Ensure the user is logged in
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        return;
    }

    // Get user details from session
    String userName = (String) sessionUser.getAttribute("userName");
    String userEmail = (String) sessionUser.getAttribute("userEmail");
    String userPhone = (String) sessionUser.getAttribute("userPhone");
    String userAddress = (String) sessionUser.getAttribute("userAddress");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile | Mega City Cab</title>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- BOX ICONS -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <!-- CUSTOM STYLES -->
    <link rel="stylesheet" href="style/grid.css">
    <link rel="stylesheet" href="style/app.css">
    <style>
        .containerc {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            color:#000;
        }
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-header h2 {
            margin-bottom: 10px;
        }
        .profile-info {
            text-align: left;
            margin-bottom: 20px;
        }
        .profile-info p {
            margin: 5px 0;
        }
        .bookings-list {
            margin-top: 20px;
        }
        .booking-item {
            background: #f8f8f8;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            text-align: left;
        }
        .btn {
            display: block;
            width: 100%;
            background: #fdd835;
            color: #000;
            border: none;
            padding: 12px;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
        }
        .btn:hover {
            background: #ffc107;
        }
    </style>
</head>
<body>
  <!-- NAV -->
<header class="header">
    <div class="logo-container">
        <a href="home.jsp" class="logo-link">
            <span class="logo-text">MEGA</span>
            <span class="logo-highlight">CITY</span>
            <span class="logo-text">CAB</span>
        </a>
    </div>
    
    <nav class="nav-menu">
        <ul class="nav-list">
            <li class="nav-item"><a href="home.jsp" class="nav-link">Home</a></li>
            <li class="nav-item"><a href="taxi.jsp" class="nav-link">Taxi</a></li>
            <li class="nav-item"><a href="booking.jsp" class="nav-link">Book a Taxi</a></li>
            <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact Us</a></li>
            <li class="nav-item"><a href="about.jsp" class="nav-link">About Us</a></li>
        </ul>
    </nav>
    <ul class="nav-list right">
        <li class="nav-item profile-icon">
            <a href="profile.jsp" class="nav-link">
                <i class="bx bxs-user-circle"></i>
            </a>
        </li>
    </ul>        
</header>
<!-- END NAV -->

<!-- PROFILE SECTION -->
<div class="containerc">
    <div class="profile-header">
        <h2>My Profile</h2>
        <p>Welcome back, <%= userName %>!</p>
    </div>
    <div class="profile-info">
        <p><strong>Email:</strong> <%= userEmail %></p>
        <p><strong>Phone:</strong> <%= userPhone %></p>
        <p><strong>Address:</strong> <%= userAddress %></p>
    </div>
    
    <h3>My Booked Taxis</h3>
    <div class="bookings-list">
        <%
            // Fetch user bookings from the database
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                String dbURL = "jdbc:mysql://localhost:3306/mega_city_cab";
                String dbUser = "root";
                String dbPassword = "12345678";

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                String sql = "SELECT taxi_type, pickup_date, pickup_location, dropoff_location, fare FROM bookings WHERE user_email = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, userEmail);
                rs = stmt.executeQuery();

                boolean hasBookings = false;
                while (rs.next()) {
                    hasBookings = true;
        %>
        <div class="booking-item">
            <p><strong>Taxi:</strong> <%= rs.getString("taxi_type") %></p>
            <p><strong>Date:</strong> <%= rs.getString("pickup_date") %></p>
            <p><strong>Pickup:</strong> <%= rs.getString("pickup_location") %></p>
            <p><strong>Dropoff:</strong> <%= rs.getString("dropoff_location") %></p>
            <p><strong>Fare:</strong> $<%= rs.getString("fare") %></p>
        </div>
        <%  
                }
                if (!hasBookings) {
        %>
        <p>No bookings found.</p>
        <%  
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <p>Error loading bookings. Please try again later.</p>
        <%  
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception ignored) {}
                if (stmt != null) try { stmt.close(); } catch (Exception ignored) {}
                if (conn != null) try { conn.close(); } catch (Exception ignored) {}
            }
        %>
    </div>
    <a href="index.jsp" class="btn">Logout</a>
</div>

<!-- FOOTER SECTION -->
<footer class="section">
    <div class="container">
        <div class="row">
            <div class="col-4 col-md-6 col-sm-12">
                <div class="content">
                    <a href="index.html" class="logo">
                        <i class='main-color'></i>MEGA<span class="main-color">|</span>TAXI<span class="main-color">|</span>CAB
                    </a>
                    <p>
                        Reliable and affordable taxi services at your fingertips. Book a ride anytime, anywhere.
                    </p>
                    <div class="social-list">
                         <a href="https://www.facebook.com" class="social-item">
                            <i class="bx bxl-facebook"></i>
                        </a>
                        <a href="https://twitter.com" class="social-item">
                            <i class="bx bxl-twitter"></i>
                        </a>
                        <a href="https://instagram.com" class="social-item">
                            <i class="bx bxl-instagram"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-8 col-md-6 col-sm-12">
                <div class="row">
                    <div class="col-3 col-md-6 col-sm-6">
                        <div class="content">
                            <p><b>Mega Taxi Cab</b></p>
                            <ul class="footer-menu">
                                <li><a href="aboutus.html">About us</a></li>
                                <li><a href="services.html">Our Services</a></li>
                                <li><a href="pricing.html">Pricing</a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-3 col-md-6 col-sm-6">
                        <div class="content">
                            <p><b>Ride With Us</b></p>
                            <ul class="footer-menu">
                                <li><a href="book-taxi.html">Book a Taxi</a></li>
                                <li><a href="driver-signup.html">Become a Driver</a></li>
                                <li><a href="safety.html">Safety</a></li>
                                <li><a href="faq.html">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-3 col-md-6 col-sm-6">
                        <div class="content">
                            <p><b>Help & Support</b></p>
                            <ul class="footer-menu">
                                <li><a href="support.html">Customer Support</a></li>
                                <li><a href="terms.html">Terms & Conditions</a></li>
                                <li><a href="privacy.html">Privacy Policy</a></li>
                                <li><a href="contact.html">Get in Touch</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-3 col-md-6 col-sm-6">
                        <div class="content">
                            <p><b>Download App</b></p>
                            <ul class="footer-menu">
                                <li>
                                    <a href="https://play.google.com/store">
                                        <img src="./images/google-play.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="https://www.apple.com/app-store/">
                                        <img src="./images/app-store.png" alt="">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- END FOOTER SECTION -->
 <!-- COPYRIGHT SECTION -->
    <div class="copyright">
        MEGA CITY CAB
    </div>
    <!-- END COPYRIGHT SECTION -->

</body>
</html>

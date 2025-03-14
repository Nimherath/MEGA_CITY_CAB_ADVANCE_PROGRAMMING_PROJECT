<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> <!-- Import ResultSet -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mega City Cab</title>
      <!-- GOOGLE FONTS -->
      <link rel="preconnect" href="https://fonts.gstatic.com">
      <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;700;900&display=swap" rel="stylesheet">
      <!-- BOX ICONS -->
      <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
      <!-- OWL CAROUSEL -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
  
  <link rel="stylesheet" href="style/aboutus.css">
  <link rel="stylesheet" href="style/app.css">
  <link rel="stylesheet" href="style/grid.css">
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
            <li class="nav-item">
                <a href="home.jsp" class="nav-link">
                    Home
                    <span class="underline"></span>
                </a>
            </li>
            <li class="nav-item">
                <a href="taxi.jsp" class="nav-link">
                    Taxi
                    <span class="underline"></span>
                </a>
            </li>
         <li class="nav-item"><a href="booking.jsp" class="nav-link">Book a Taxi</a></li>
            <li class="nav-item">
                <a href="contact.jsp" class="nav-link">
                    Contact Us
                    <span class="underline"></span>
                </a>
            </li>
            <li class="nav-item">
                <a href="about.jsp" class="nav-link">
                    About Us
                    <span class="underline"></span>
                </a>
            </li>
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
<!-- About Section -->
<div class="container-2">
  <div class="about-section">
      <h2>About Mega City Cab</h2>
      <p>
          Welcome to Mega City Cab, your trusted transportation service! Whether you need a quick ride to work or a luxurious taxi for a special occasion, we provide safe, comfortable, and reliable travel solutions across the city.
      </p>
  </div>

  <!-- Mission and Vision Section -->
  <div class="mission-vision-section">
      <div class="mission">
          <h3>MISSION</h3>
          <p>
              Our mission is to provide safe, reliable, and affordable transportation to our customers, ensuring comfort and punctuality with every ride.
          </p>
      </div>
      <div class="vision">
          <h3>VISION</h3>
          <p>
              To become the most trusted taxi service in the city by integrating innovative technology with top-tier customer service.
          </p>
      </div>
  </div>

  <!-- Customer Feedback Section -->
  <div class="feedback-section">
      <h2>Customer Reviews</h2>
      <div class="feedback">
          <img src="https://thumbs.dreamstime.com/b/indian-business-man-talking-phone-young-front-modern-office-building-52555685.jpg" alt="User">
          <blockquote>
              "Mega City Cab offers excellent service! Always on time and friendly drivers."
          </blockquote>
          <cite>- Alex D.</cite>
      </div>
      <div class="feedback">
          <img src="https://img.freepik.com/free-photo/young-man-happy-expression-business-desk-company-concept-ai-generated_1194-589229.jpg" alt="User">
          <blockquote>
              "Affordable and comfortable rides. I highly recommend them!"
          </blockquote>
          <cite>- Sarah K.</cite>
      </div>
  </div>
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

<!-- SCRIPT -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>

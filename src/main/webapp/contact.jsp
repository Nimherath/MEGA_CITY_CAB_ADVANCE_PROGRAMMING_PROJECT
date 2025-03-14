<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Mega City Cab</title>
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
        }
        h2{
        color:#000;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            font-weight: 600;
            display: block;
            color: #000;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
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

    <!-- CONTACT FORM -->
    <div class="containerc">
        <h2>Contact Us</h2>
        <p>Have questions or feedback? Reach out to us.</p>
        <form action="ContactServlet" method="post">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" name="name" id="name" placeholder="Enter your full name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="tel" name="phone" id="phone" placeholder="Enter your phone number" required>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea name="message" id="message" placeholder="Write your message here" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn">Send Message</button>
        </form>
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

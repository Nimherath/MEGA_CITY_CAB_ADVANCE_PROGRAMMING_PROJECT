<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Ensure the user is logged in
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get user details from session
    String userName = (String) sessionUser.getAttribute("userName");
    String userPhone = (String) sessionUser.getAttribute("userPhone");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Taxi | Mega City Cab</title>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- GOOGLE MAPS API -->
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY&libraries=places" async defer></script>
        <link rel="stylesheet" href="style/grid.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="style/app.css">
    <script>
        let pickupMarker, dropoffMarker, map;

        function initMap() {
            const defaultLocation = { lat: 37.7749, lng: -122.4194 }; // San Francisco (Default)
            map = new google.maps.Map(document.getElementById("map"), {
                center: defaultLocation,
                zoom: 12
            });

            // Click to set Pickup Location
            google.maps.event.addListener(map, "click", function (event) {
                if (!pickupMarker) {
                    pickupMarker = new google.maps.Marker({
                        position: event.latLng,
                        map: map,
                        title: "Pickup Location"
                    });
                } else {
                    pickupMarker.setPosition(event.latLng);
                }
                getAddress(event.latLng, "pickup");
            });

            // Click to set Dropoff Location (Right Click)
            google.maps.event.addListener(map, "rightclick", function (event) {
                if (!dropoffMarker) {
                    dropoffMarker = new google.maps.Marker({
                        position: event.latLng,
                        map: map,
                        title: "Dropoff Location",
                        icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
                    });
                } else {
                    dropoffMarker.setPosition(event.latLng);
                }
                getAddress(event.latLng, "dropoff");
            });
        }

        function getAddress(latLng, type) {
            const geocoder = new google.maps.Geocoder();
            geocoder.geocode({ location: latLng }, function (results, status) {
                if (status === "OK") {
                    if (results[0]) {
                        if (type === "pickup") {
                            document.getElementById("pickup").value = results[0].formatted_address;
                        } else {
                            document.getElementById("dropoff").value = results[0].formatted_address;
                        }
                    }
                }
            });
        }
    </script>
    <style>
        .booking-container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .booking-container h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: 600;
            display: block;
            color: #000;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        #map {
            width: 100%;
            height: 300px;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .book-btn {
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
        }
        .book-btn:hover {
            background: #ffc107;
        }
    </style>
</head>
<body onload="initMap()">
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
            <li class="nav-item">
                <a href="booking.jsp" class="nav-link">
                    Bookings
                    <span class="underline"></span>
                </a>
            </li>
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
  

<!-- BOOKING FORM -->
<div class="booking-container">
    <h2>Book Your Taxi</h2>

    <form action="BookingServlet" method="POST">
        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" value="<%= userName %>" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" value="<%= userPhone %>" required>
        </div>
        <div class="form-group">
            <label for="map">Select Locations on the Map:</label>
            <div id="map"></div>
        </div>
        <div class="form-group">
            <label for="pickup">Pickup Location</label>
            <input type="text" id="pickup" name="pickup" placeholder="Click on the map to set location" required readonly>
        </div>
        <div class="form-group">
            <label for="dropoff">Dropoff Location</label>
            <input type="text" id="dropoff" name="dropoff" placeholder="Right-click on the map to set location" required readonly>
        </div>
        <div class="form-group">
            <label for="date">Pickup Date</label>
            <input type="date" id="date" name="date" required>
        </div>
        <div class="form-group">
            <label for="time">Pickup Time</label>
            <input type="time" id="time" name="time" required>
        </div>
        <div class="form-group">
            <label for="taxi">Select Taxi Type</label>
            <select id="taxi" name="taxi" required>
                <option value="">Select a Taxi</option>
                <option value="Luxury Taxi">Luxury Taxi</option>
                <option value="Standard Taxi">Standard Taxi</option>
                <option value="SUV Taxi">SUV Taxi</option>
                <option value="Economy Taxi">Economy Taxi</option>
            </select>
        </div>
        <button type="submit" class="book-btn">Book Now</button>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
</body>
</html>

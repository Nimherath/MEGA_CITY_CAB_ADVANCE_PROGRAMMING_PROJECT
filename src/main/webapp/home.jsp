<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega-City-Cab</title>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;700;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- BOX ICONS -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <!-- OWL CAROUSEL -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
    <!-- CUSTOM STYLES -->
    <link rel="stylesheet" href="style/grid.css">
    <link rel="stylesheet" href="style/app.css">
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
  <!-- HERO SECTION -->
<div class="hero-section">
    <!-- HERO SLIDE -->
    <div class="hero-slide">
        <div class="owl-carousel carousel-nav-center" id="hero-carousel">
            <!-- SLIDE ITEM -->
            <div class="hero-slide-item">
                <img src="https://www.carfinance247.co.uk/dA/3a4aa2e81864e60428530c062abf9595/asset/Taxi%20driver%20car%20finance.jpg" alt="">
                <div class="overlay"></div>
                <div class="hero-slide-item-content">
                    <div class="item-content-wraper">
                        <div class="item-content-title top-down">
                            Book Your Ride Now
                        </div>
                        <div class="ride-infos top-down delay-2">
                            <div class="ride-info">
                                <i class="bx bxs-car"></i>
                                <span>Fast & Reliable</span>
                            </div>
                            <div class="ride-info">
                                <i class="bx bxs-map"></i>
                                <span>Anywhere, Anytime</span>
                            </div>
                            <div class="ride-info">
                                <i class="bx bxs-wallet"></i>
                                <span>Affordable Prices</span>
                            </div>
                            <div class="ride-info">
                                <i class="bx bxs-lock"></i>
                                <span>Safe & Secure</span>
                            </div>
                        </div>
                        <div class="item-content-description top-down delay-4">
                            Experience the best taxi booking service with just a few clicks. Reliable, affordable, and available 24/7.
                        </div>
                        <div class="item-action top-down delay-6">
                            <a href="book-taxi.html" class="btn btn-hover">
                                <i class="bx bxs-right-arrow"></i>
                                <span>Book Now</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

 
    <!-- AVAILABLE TAXIS SECTION -->
    <div class="section">
        <div class="container">
            <div class="section-header">Available Taxis</div>
            <div class="taxis-slide carousel-nav-center owl-carousel">
                <a href="booking.jsp" class="taxi-item">
                    <img src="https://images.pexels.com/photos/1521580/pexels-photo-1521580.jpeg" alt="Luxury Taxi">
                    <div class="taxi-item-content">
                        <div class="taxi-item-title">Luxury Taxi</div>
                        <div class="taxi-infos">
                            <div class="taxi-info"><i class="bx bxs-star"></i><span>4.9</span></div>
                            <div class="taxi-info"><i class="bx bxs-user"></i><span>4 Seats</span></div>
                            <div class="taxi-info"><i class="bx bxs-wallet"></i><span>Premium Fare</span></div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

      <!-- FOOTER SECTION -->
<footer class="section">
    <div class="container">
        <div class="row">
            <div class="col-4 col-md-6 col-sm-12">
                <div class="content">
                    <a href="booking.jsp" class="logo">
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

    <!-- SCRIPTS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#hero-carousel').owlCarousel({
                items: 1,
                loop: true,
                autoplay: true,
                autoplayTimeout: 3000,
                autoplayHoverPause: true
            });
            $('.taxis-slide').owlCarousel({
                items: 3,
                loop: true,
                margin: 15,
                autoplay: true,
                autoplayTimeout: 3000,
                autoplayHoverPause: true,
                responsive: {
                    0: { items: 1 },
                    600: { items: 2 },
                    1000: { items: 3 }
                }
            });
        });
    </script>
</body>
</html>

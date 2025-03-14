<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Success | Mega City Cab</title>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- BOX ICONS -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <!-- CUSTOM STYLES -->
    <link rel="stylesheet" href="style/grid.css">
    <link rel="stylesheet" href="style/app.css">
    <style>
        .containerc {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            color: #000;
        }
        h2 {
            color: #28a745;
        }
        .success-icon {
            font-size: 50px;
            color: #28a745;
            margin-bottom: 10px;
        }
        .btn {
            display: inline-block;
            background: #fdd835;
            color: #000;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
            text-decoration: none;
        }
        .btn:hover {
            background: #ffc107;
        }
    </style>
</head>
<body>

<!-- NAVIGATION -->
<header class="header">
    <div class="logo-container">
        <a href="home.jsp" class="logo-link">
            <span class="logo-text">MEGA</span>
            <span class="logo-highlight">CITY</span>
            <span class="logo-text">CAB</span>
        </a>
    </div>
</header>

<!-- SUCCESS MESSAGE -->
<div class="containerc">
    <i class="bx bx-check-circle success-icon"></i>
    <h2>Message Sent Successfully!</h2>
    <p>Thank you for contacting us. We will get back to you as soon as possible.</p>
    <a href="home.jsp" class="btn">Return to Home</a>
</div>

</body>
</html>

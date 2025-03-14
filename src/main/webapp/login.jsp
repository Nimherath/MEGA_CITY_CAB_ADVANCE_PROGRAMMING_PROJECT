<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Mega City Cab</title>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- BOX ICONS -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <!-- CUSTOM STYLES -->
    <link rel="stylesheet" href="style/grid.css">
    <link rel="stylesheet" href="style/app.css">
    <style>
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .login-container h2 {
            color: #333;
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
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .form-group input::placeholder {
            color: #aaa;
            font-size: 14px;
        }
        .login-btn {
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
        .login-btn:hover {
            background: #ffc107;
        }
        p {
            color: #000;
        }
    </style>
</head>
<body>
    <!-- NAVIGATION -->
    <header class="header">
        <div class="logo-container">
            <a href="index.jsp" class="logo-link">
                <span class="logo-text">MEGA</span>
                <span class="logo-highlight">CITY</span>
                <span class="logo-text">CAB</span>
            </a>
        </div>
    </header>

    <!-- LOGIN FORM -->
    <div class="login-container">
        <h2>Login to Your Account</h2>
        <form action="LoginServlet" method="POST">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter Email Address" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter Password" required>
            </div>
            <button type="submit" class="login-btn">Login</button>
        </form>
        <p>Don't have an account? <a href="signup.jsp">Sign Up</a></p>
        <p><a href="#">Forgot Password?</a></p>
    </div>


</body>
</html>
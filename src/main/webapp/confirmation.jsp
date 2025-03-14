<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <style>
        .confirmation-container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            color:#000;
        }
        .btn {
            display: inline-block;
            background: #fdd835;
            color: #000;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            text-decoration: none;
        }
        .btn:hover {
            background: #ffc107;
        }
    </style>
</head>
<body>

<div class="confirmation-container">
    <h2>Booking Confirmed!</h2>
    <p>Your taxi has been successfully booked.</p>
    <a href="profile.jsp" class="btn">View My Bookings</a>
</div>

</body>
</html>
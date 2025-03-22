<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Booking | Mega City Cab</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style/grid.css">
    <link rel="stylesheet" href="style/app.css">
    <style>
        .container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            color:#000;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin: 10px 0;
            font-weight: bold;
        }
        input, select {
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .btn {
            padding: 12px;
            background: #fdd835;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
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
                <a href="admin_dashboard.jsp" class="nav-link">
                    Taxi
                    <span class="underline"></span>
                </a>
            </li>
            <li class="nav-item">
                <a href="manage_user.jsp" class="nav-link">
                    User
                    <span class="underline"></span>
                </a>
            </li>
            <li class="nav-item">
                <a href="manage_booking.jsp" class="nav-link">
                   Bookings
                    <span class="underline"></span>
                </a>
            </li>
            <li class="nav-item">
                <a href="index.jsp" class="nav-link">
                    Logout
                    <span class="underline"></span>
                </a>
            </li>
        </ul>
    </nav>
</header>
<!-- END NAV -->

<%
    String bookingId = request.getParameter("id");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String pickupLocation = "", dropoffLocation = "", pickupDate = "", taxiType = "";
    double fare = 0;

    try {
        String dbURL = "jdbc:mysql://localhost:3306/mega_city_cab";
        String dbUser = "root";
        String dbPassword = "12345678";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        String sql = "SELECT * FROM bookings WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(bookingId));
        rs = stmt.executeQuery();

        if (rs.next()) {
            pickupLocation = rs.getString("pickup_location");
            dropoffLocation = rs.getString("dropoff_location");
            pickupDate = rs.getString("pickup_date");
            taxiType = rs.getString("taxi_type");
            fare = rs.getDouble("fare");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception ignored) {}
        if (stmt != null) try { stmt.close(); } catch (Exception ignored) {}
        if (conn != null) try { conn.close(); } catch (Exception ignored) {}
    }
%>

<div class="container">
    <h2>Edit Booking</h2>
    <form action="UpdateBookingServlet" method="post">
        <input type="hidden" name="id" value="<%= bookingId %>">
        
        <label for="pickup_location">Pickup Location</label>
        <input type="text" id="pickup_location" name="pickup_location" value="<%= pickupLocation %>" required>

        <label for="dropoff_location">Dropoff Location</label>
        <input type="text" id="dropoff_location" name="dropoff_location" value="<%= dropoffLocation %>" required>

        <label for="pickup_date">Pickup Date</label>
        <input type="text" id="pickup_date" name="pickup_date" value="<%= pickupDate %>" required>

        <label for="taxi_type">Taxi Type</label>
        <select name="taxi_type" id="taxi_type">
            <option value="Sedan" <%= taxiType.equals("Sedan") ? "selected" : "" %>>Sedan</option>
            <option value="SUV" <%= taxiType.equals("SUV") ? "selected" : "" %>>SUV</option>
            <option value="Minivan" <%= taxiType.equals("Minivan") ? "selected" : "" %>>Minivan</option>
        </select>

        <label for="fare">Fare ($)</label>
        <input type="number" id="fare" name="fare" value="<%= fare %>" required>

        <button type="submit" class="btn">Update Booking</button>
    </form>
</div>

</body>
</html>

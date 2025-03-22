<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Taxis | Mega City Cab</title>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- BOX ICONS -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <!-- CUSTOM STYLES -->
    <link rel="stylesheet" href="style/grid.css">
    <link rel="stylesheet" href="style/app.css">
    <style>
        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
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
        .taxi-list {
            margin-top: 30px;
            color:#000;
        }
        .taxi-item {
            background: #f8f8f8;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .taxi-item button {
            background: #d9534f;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }
        .taxi-item button:hover {
            background: #c9302c;
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
  

    <!-- ADD TAXI FORM -->
    <div class="container">
        <h2>Add Taxi</h2>
        <form action="AdminAddTaxiServlet" method="post">
            <div class="form-group">
                <label for="model">Taxi Model:</label>
                <input type="text" name="model" id="model" required>
            </div>
            <div class="form-group">
                <label for="image">Image URL:</label>
                <input type="text" name="image" id="image" required>
            </div>
            <div class="form-group">
                <label for="rating">Rating:</label>
                <input type="number" name="rating" id="rating" step="0.1" min="0" max="5" required>
            </div>
            <div class="form-group">
                <label for="seats">Seats:</label>
                <input type="number" name="seats" id="seats" required>
            </div>
            <div class="form-group">
                <label for="price">Price per Ride:</label>
                <input type="text" name="price" id="price" required>
            </div>
            <button type="submit" class="btn">Add Taxi</button>
        </form>
    </div>

    <!-- LIST OF TAXIS -->
    <div class="container taxi-list">
        <h2>Manage Taxis</h2>
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                String dbURL = "jdbc:mysql://localhost:3306/mega_city_cab";
                String dbUser = "root";
                String dbPassword = "12345678";

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                String sql = "SELECT * FROM taxis";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                while (rs.next()) {
        %>
        <div class="taxi-item">
            <span><strong><%= rs.getString("model") %></strong> - <%= rs.getInt("seats") %> Seats - $<%= rs.getDouble("price") %></span>
            <button onclick="editTaxi(<%= rs.getInt("id") %>)">Edit</button>
            <button onclick="deleteTaxi(<%= rs.getInt("id") %>)">Delete</button>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <p>Error loading taxis. Please try again later.</p>
        <%
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception ignored) {}
                if (stmt != null) try { stmt.close(); } catch (Exception ignored) {}
                if (conn != null) try { conn.close(); } catch (Exception ignored) {}
            }
        %>
    </div>

    <script>
        function editTaxi(id) {
            window.location.href = "edit_taxi.jsp?id=" + id;
        }

        function deleteTaxi(id) {
            if (confirm("Are you sure you want to delete this taxi?")) {
                window.location.href = "DeleteTaxiServlet?id=" + id;
            }
        }
    </script>

</body>
</html>

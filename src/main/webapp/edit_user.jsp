<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User | Mega City Cab</title>
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- CUSTOM STYLES -->
    <link rel="stylesheet" href="style/grid.css">
    <link rel="stylesheet" href="style/app.css">
    <style>
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            color:#000;
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
    </header>

    <!-- EDIT USER FORM -->
    <div class="container">
        <h2>Edit User</h2>
        <%
            

            String userEmail = (String) session.getAttribute("userEmail");
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3308/mega_city_cab";
                String dbUser = "root";
                String dbPassword = "12345678";

                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Fetch user details from the database
                String sql = "SELECT * FROM users WHERE email = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, userEmail);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    String userName = rs.getString("first_name") + " " + rs.getString("last_name");
                    String userPhone = rs.getString("phone");
                    String userAddress = rs.getString("address");
        %>
        <form action="UpdateUserServlet" method="post">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" name="name" id="name" value="<%= userName %>" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="text" name="phone" id="phone" value="<%= userPhone %>" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" name="address" id="address" value="<%= userAddress %>" required>
            </div>
            <input type="hidden" name="email" value="<%= userEmail %>">
            <button type="submit" class="btn">Update Details</button>
        </form>
        <%
                } else {
                    out.println("<p>User not found.</p>");
                }
            } catch (ClassNotFoundException e) {
                out.println("<p>Error loading database driver: " + e.getMessage() + "</p>");
            } catch (SQLException e) {
                out.println("<p>Database error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                }
            }
        %>
    </div>

</body>
</html>

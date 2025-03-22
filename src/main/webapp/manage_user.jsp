<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users | Mega City Cab</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style/grid.css">
    <link rel="stylesheet" href="style/app.css">
    <style>
        .container {
            max-width: 900px;
            margin: 50px auto;
            background: #fff;
            color:#000;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            text-align: left;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #fdd835;
            color: #000;
        }
        .btn {
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            border: none;
            cursor: pointer;
        }
        .edit-btn {
            background: #17a2b8;
        }
        .delete-btn {
            background: #d9534f;
        }
        .delete-btn:hover {
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
  

<div class="container">
    <h2>Manage Users</h2>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
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

                String sql = "SELECT * FROM users";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("first_name") + " " + rs.getString("last_name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("role") %></td>
                <td>
                    <a href="edit_user.jsp?id=<%= rs.getInt("id") %>" class="btn edit-btn">Edit</a>
                    <a href="DeleteUserServlet?id=<%= rs.getInt("id") %>" class="btn delete-btn" onclick="return confirm('Are you sure?');">Delete</a>
                </td>
            </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
            <tr><td colspan="5">Error loading users. Please try again.</td></tr>
        <%
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>

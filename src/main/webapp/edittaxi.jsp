<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
    String taxiId = request.getParameter("id"); // Get the taxi ID to edit
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String model = "";
    String image = "";
    double price = 0.0;
    int seats = 0;
    float rating = 0.0;

    try {
        String dbURL = "jdbc:mysql://localhost:3308/mega_city_cab";
        String dbUser = "root";
        String dbPassword = "12345678";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        String sql = "SELECT * FROM taxis WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(taxiId));
        rs = stmt.executeQuery();

        if (rs.next()) {
            model = rs.getString("model");
            image = rs.getString("image");
            price = rs.getDouble("price");
            seats = rs.getInt("seats");
            rating = rs.getFloat("rating");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Taxi | Mega City Cab</title>
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
        .form-group input, .form-group select {
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

    <div class="container">
        <h2>Edit Taxi</h2>
        <form action="EditTaxiServlet" method="post">
            <input type="hidden" name="taxiId" value="<%= taxiId %>">
            <div class="form-group">
                <label for="model">Taxi Model:</label>
                <input type="text" name="model" id="model" value="<%= model %>" required>
            </div>
            <div class="form-group">
                <label for="image">Image URL:</label>
                <input type="text" name="image" id="image" value="<%= image %>" required>
            </div>
            <div class="form-group">
                <label for="rating">Rating:</label>
                <input type="number" name="rating" id="rating" step="0.1" min="0" max="5" value="<%= rating %>" required>
            </div>
            <div class="form-group">
                <label for="seats">Seats:</label>
                <input type="number" name="seats" id="seats" value="<%= seats %>" required>
            </div>
            <div class="form-group">
                <label for="price">Price per Ride:</label>
                <input type="text" name="price" id="price" value="<%= price %>" required>
            </div>
            <button type="submit" class="btn">Update Taxi</button>
        </form>
    </div>

</body>
</html>

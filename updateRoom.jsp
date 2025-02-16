
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Room</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
        }

        .container {
            max-width: 800px;
            margin-top: 50px;
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 2rem;
            color: #007bff;
            margin-bottom: 30px;
        }

        .form-group label {
            font-size: 1.1rem;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
        }

        .btn-primary, .btn-secondary {
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .alert {
            font-size: 1.2rem;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Update Room</h2>

        <%
            // Get parameters from the form
            String roomId = request.getParameter("room_id");
            String roomName = request.getParameter("room_name");
            String priceStr = request.getParameter("price");
            String sizeStr = request.getParameter("size");
            String bedType = request.getParameter("bed_type");
            String imageUrl = request.getParameter("image_url");
            String description = request.getParameter("description");
            String bookingLink = request.getParameter("bookinglink"); // Get the booking link

            // Check if all required fields are provided
            if (roomId != null && roomName != null && priceStr != null && sizeStr != null && bedType != null && imageUrl != null && description != null) {
                double price = Double.parseDouble(priceStr);
                int size = Integer.parseInt(sizeStr);

                // Database connection
                Connection conn = null;
                PreparedStatement stmt = null;
                String url = "jdbc:mysql://localhost:3306/apartment?useUnicode=true&characterEncoding=UTF-8";
                String dbUser = "root";
                String dbPassword = "";

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    // SQL query to update room details, including the booking link
                    String sql = "UPDATE rooms SET room_name = ?, price = ?, size = ?, bed_type = ?, image_url = ?, description = ?, bookinglink = ? WHERE room_id = ?";
                    stmt = conn.prepareStatement(sql);

                    // Set parameters
                    stmt.setString(1, roomName);
                    stmt.setDouble(2, price);
                    stmt.setInt(3, size);
                    stmt.setString(4, bedType);
                    stmt.setString(5, imageUrl);
                    stmt.setString(6, description);
                    stmt.setString(7, bookingLink); // Set the booking link
                    stmt.setString(8, roomId);

                    int rowsUpdated = stmt.executeUpdate();
                    
                    if (rowsUpdated > 0) {
                        out.println("<div class='alert alert-success'>Room updated successfully!</div>");
                    } else {
                        out.println("<div class='alert alert-danger'>Error: Room update failed!</div>");
                    }

                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            } else {
                out.println("<div class='alert alert-danger'>Error: Missing required fields!</div>");
            }
        %>

        <a href="viewRooms.jsp" class="btn btn-secondary">Back to Room List</a>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

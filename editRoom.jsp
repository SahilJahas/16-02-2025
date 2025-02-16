<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Room</title>
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
        <h2 class="text-center">Edit Room</h2>

        <%
            // Database connection
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/apartment?useUnicode=true&characterEncoding=UTF-8";
            String dbUser = "root";
            String dbPassword = "";
            String roomId = request.getParameter("id"); // Get the room id from the URL parameter

            try {
                // Load MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUser, dbPassword);

                // Query to fetch the room details for editing
                String sql = "SELECT * FROM rooms WHERE room_id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, roomId);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    String roomName = rs.getString("room_name");
                    double price = rs.getDouble("price");
                    int size = rs.getInt("size");
                    String bedType = rs.getString("bed_type");
                    String imageUrl = rs.getString("image_url");
                    String description = rs.getString("description");
                    String bookingLink = rs.getString("bookinglink"); // Fetch the booking link

        %>
        <form method="post" action="updateRoom.jsp">
            <input type="hidden" name="room_id" value="<%= roomId %>">

            <div class="form-group">
                <label for="roomName">Room Name</label>
                <input type="text" class="form-control" id="roomName" name="room_name" value="<%= roomName %>" required>
            </div>

            <div class="form-group">
                <label for="price">Price (INR)</label> <!-- Changed label from USD to INR -->
                <input type="number" step="0.01" class="form-control" id="price" name="price" value="<%= price %>" required>
            </div>

            <div class="form-group">
                <label for="size">Size (sq ft)</label>
                <input type="number" class="form-control" id="size" name="size" value="<%= size %>" required>
            </div>

            <div class="form-group">
                <label for="bedType">Bed Type</label>
                <input type="text" class="form-control" id="bedType" name="bed_type" value="<%= bedType %>" required>
            </div>

          <div class="form-group">
    <label for="imageUrl">Image URL</label>
    <input type="text" class="form-control" id="imageUrl" name="image_url" value="<%= imageUrl %>" required>
    <% if (imageUrl != null && !imageUrl.isEmpty()) { %>
        <img src="<%= imageUrl %>" alt="Room Image" class="mt-3" style="max-width: 100%; height: auto;">
    <% } %>
</div>


            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="4" required><%= description %></textarea>
            </div>

            <div class="form-group">
                <label for="bookingLink">Booking Link</label>
                <input type="text" class="form-control" id="bookingLink" name="bookinglink" value="<%= bookingLink != null ? bookingLink : "" %>">
            </div>

            <button type="submit" class="btn btn-primary">Update Room</button>
            <a href="viewRooms.jsp" class="btn btn-secondary">Cancel</a>
        </form>

        <% 
                } else {
                    out.println("<div class='alert alert-danger'>Room not found!</div>");
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
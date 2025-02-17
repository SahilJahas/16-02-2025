<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
  .btn-add-room {
    padding: 12px 24px;
    background: linear-gradient(145deg, #6e7dff, #3f51b5); /* Gradient effect */
    color: white;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.15), -2px -2px 8px rgba(255, 255, 255, 0.3); /* Soft shadow effect */
    cursor: pointer;
    transition: all 0.3s ease;
  }

  .btn-add-room:hover {
    background: linear-gradient(145deg, #3f51b5, #6e7dff); /* Reverse gradient on hover */
    transform: scale(1.05); /* Slightly enlarge the button */
    box-shadow: 4px 4px 16px rgba(0, 0, 0, 0.25), -4px -4px 16px rgba(255, 255, 255, 0.4); /* Stronger shadow on hover */
  }

  .btn-add-room:focus {
    outline: none;
  }
</style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Room</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJ03Ruq7l6p1JIH4I6EIZT5T0htn4w0wEx8c24VJgS1IHVdBoPXAYWVh9v5p" crossorigin="anonymous">
    
    <style>
        body {
            background: linear-gradient(to bottom, #ffffff, #d1e7f1);
            font-family: 'Arial', sans-serif;
            padding: 0;
            margin: 0;
        }
        .container {
            max-width: 1263px;
            margin-top: 50px;
        }
        h2 {
            color: #f39c12; 
            font-size: 2.5rem; 
            font-weight: bold;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1);
        }
        .card {
            background-color: #ffffff;
            border: 1px solid #4caf50;
            border-radius: 16px; 
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            padding: 20px; 
        }
        .form-label {
            color: #34495e; 
            font-size: 1.2rem;  
            font-weight: bold;
        }
        .form-control, .form-select {
            border-radius: 10px;
            border: 1px solid #2980b9; 
            font-size: 1rem; 
            padding: 12px;
            width: 100%; 
            box-sizing: border-box; 
            margin-bottom: 10px;
        }
        .form-control:focus, .form-select:focus {
            border-color: #3498db;
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.5);
        }
        .btn-primary {
            background-color: #1abc9c;
            border-color: #16a085;
            font-size: 1.2rem; 
            padding: 15px 25px;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #16a085;
            border-color: #1abc9c;
        }
        .alert {
            border-radius: 10px;
            padding: 15px;
            font-size: 1.1rem;
        }
        .alert-success {
            background-color: #28a745;
            color: white;
        }
        .alert-danger {
            background-color: #e74c3c;
            color: white;
        }
        .btn-link {
            color: #3498db;
            text-decoration: none;
            font-size: 1rem;
        }
        .btn-link:hover {
            text-decoration: underline;
        }
        @media (max-width: 768px) {
            h2 {
                font-size: 2rem;
            }
            .container {
                margin-top: 30px;
            }
            .card {
                padding: 15px;
            }
        }
    </style>
</head>

<body>

<div class="container">
    <h2 class="text-center mb-4">Add Room</h2>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String roomName = request.getParameter("room_name");
            String roomType = request.getParameter("room_type");
            String priceParam = request.getParameter("price");
            int size = Integer.parseInt(request.getParameter("size"));
            String bedType = request.getParameter("bed_type");
            String imageUrl = request.getParameter("image_url");
            String description = request.getParameter("description");
            String bookingLink = request.getParameter("booking_link");

            Connection conn = null;
            PreparedStatement stmt = null;
            String url = "jdbc:mysql://localhost:3306/apartment?useUnicode=true&characterEncoding=UTF-8";
            String dbUser = "root";
            String dbPassword = "";

            try {
                double price = 0.0;
                if (priceParam != null && !priceParam.isEmpty()) {
                    try {
                        price = Double.parseDouble(priceParam);
                    } catch (NumberFormatException e) {
                        out.println("<div class='alert alert-danger text-center'>Invalid price value. Please enter a valid number.</div>");
                        return;
                    }
                } else {
                    out.println("<div class='alert alert-danger text-center'>Price is required.</div>");
                    return;
                }

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUser, dbPassword);

                String sql = "INSERT INTO rooms (room_name, room_type, price, size, bed_type, image_url, description, bookinglink) "
                            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, roomName);
                stmt.setString(2, roomType);
                stmt.setDouble(3, price);
                stmt.setInt(4, size);
                stmt.setString(5, bedType);
                stmt.setString(6, imageUrl);
                stmt.setString(7, description);
                stmt.setString(8, bookingLink);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<div class='alert alert-success text-center'>Room added successfully!</div>");
                } else {
                    out.println("<div class='alert alert-danger text-center'>Error adding room. No rows were affected.</div>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='alert alert-danger text-center'>Database error: " + e.getMessage() + "</div>");
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        }
    %>

    <form action="" method="POST">
        <div class="card p-4 shadow-lg">
            <div class="mb-3">
                <label for="room_name" class="form-label">Room Name:</label>
                <input type="text" class="form-control" id="room_name" name="room_name" required>
            </div>

            <div class="mb-3">
                <label for="room_type" class="form-label">Room Type:</label>
                <input type="text" class="form-control" id="room_type" name="room_type" required>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Price (₹):</label>
                <input type="number" class="form-control" id="price" name="price" required>
            </div>

            <div class="mb-3">
                <label for="size" class="form-label">Room Size (sq ft):</label>
                <input type="number" class="form-control" id="size" name="size" required>
            </div>

            <div class="mb-3">
                <label for="bed_type" class="form-label">Bed Type:</label>
                <input type="text" class="form-control" id="bed_type" name="bed_type" required>
            </div>

            <div class="mb-3">
                <label for="image_url" class="form-label">Room Image URL:</label>
                <input type="text" class="form-control" id="image_url" name="image_url">
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Room Description:</label>
                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
            </div>

            <div class="mb-3">
                <label for="booking_link" class="form-label">Booking Link:</label>
                <input type="text" class="form-control" id="booking_link" name="booking_link">
            </div>

           <div class="d-grid gap-2">
    <button type="submit" class="btn-add-room">Add Room</button>
</div>

        </div>
    </form>

    <br>
    <a href="viewRooms.jsp" class="btn btn-link">View All Rooms</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybT1XVdXf4f7yTOtW5e6r6EOv8hCZ1Go5lEjc3Ut98g8u7FqG" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0sy0vUqkk9BzF1Eq3nv/p6uWHEoOBXxYs7X57tH0VrlPbX3S" crossorigin="anonymous"></script>

</body>

</html>

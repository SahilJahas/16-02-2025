<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Rooms</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Custom styles for card and table */
        .room-card {
            margin-top: 20px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .card-header {
            background-color: #f8f9fa;
            font-size: 1.2em;
            font-weight: bold;
        }
        .table img {
            max-width: 100px;
            height: auto;
        }
        .btn-sm {
            margin-right: 5px;
        }
        .actions-column {
            width: 150px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-4 mb-4">All Available Rooms</h2>

        <div class="card-body">
            <%
                // Database connection
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                String url = "jdbc:mysql://localhost:3306/apartment?useUnicode=true&characterEncoding=UTF-8";
                String dbUser = "root";
                String dbPassword = "";

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    // Query to fetch all rooms, ordered by room type
                    String sql = "SELECT * FROM rooms ORDER BY room_type";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    // Initialize variable for room type grouping
                    String currentRoomType = "";

                    // Loop through the result set and display rooms
                    while (rs.next()) {
                        String roomType = rs.getString("room_type");

                        // Check if a new room type section should be started
                        if (!roomType.equals(currentRoomType)) {
                            if (!currentRoomType.isEmpty()) {
                                out.println("</tbody></table>");
                            }

                            out.println("<div class='room-card card'>");
                            out.println("<div class='card-header'>" + roomType + "</div>");
                            out.println("<table class='table table-striped table-bordered table-responsive'>");
                            out.println("<thead><tr>");
                            out.println("<th>Room Name</th>");
                            out.println("<th>Price (INR)</th>"); // Changed from USD to INR
                            out.println("<th>Size (sq ft)</th>");
                            out.println("<th>Bed Type</th>");
                            out.println("<th>Image</th>");
                            out.println("<th>Description</th>");
                            // Removed Booking Link column
                            out.println("<th class='actions-column'>Actions</th>"); // Actions column
                            out.println("</tr></thead>");
                            out.println("<tbody>");

                            currentRoomType = roomType; // Update current room type
                        }

                        // Display room details for the current room type
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("room_name") + "</td>");
                        out.println("<td>" + rs.getDouble("price") + "</td>"); // Price remains the same
                        out.println("<td>" + rs.getInt("size") + "</td>");
                        out.println("<td>" + rs.getString("bed_type") + "</td>");
                        out.println("<td><img src='" + rs.getString("image_url") + "' alt='Room Image' style='max-width: 100px; height: auto;'></td>");
                        out.println("<td>" + rs.getString("description") + "</td>");
                        
                        // Removed the booking link and button
                        // out.println("<td><a href='" + bookingLink + "' class='booking-link' target='_blank'>Book Now</a></td>");

                        // Actions column
                        out.println("<td class='actions-column'>"); // Actions column
                        
                        // Edit and Delete buttons
                        String roomId = rs.getString("room_id"); // Assuming room_id is the unique identifier
                        out.println("<a href='editRoom.jsp?id=" + roomId + "' class='btn btn-warning btn-sm'>Edit</a>");
                        out.println("<a href='deleteRoom.jsp?id=" + roomId + "' class='btn btn-danger btn-sm' onclick='return confirm(\"Are you sure you want to delete this room?\")'>Delete</a>");

                        out.println("</td>");
                        out.println("</tr>");
                    }

                    // Close the table for the last room type
                    if (currentRoomType.length() > 0) {
                        out.println("</tbody></table></div>");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<div class='alert alert-danger text-center'>Error: " + e.getMessage() + "</div>");
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
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>

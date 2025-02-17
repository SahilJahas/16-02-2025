<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Booking Details</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Bootstrap CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Add some extra space for tables */
        table {
            margin-bottom: 30px;
        }

        /* Room Type Header Styling */
        h3 {
            color: #ffc107; /* Change color to yellow */
            margin-top: 20px;
        }

        /* Table Hover effect */
        tr:hover {
            background-color: #f8f9fa;
        }

        /* Card Header */
        .card-header {
            background-color: #ffc107; /* Change card header background to yellow */
        }
    </style>
</head>

<body>

    <div class="container my-5">
        <div class="row">
            <div class="col-lg-12">
                <div class="card shadow-lg">
                    <div class="card-header text-white text-center">
                        <h2>All Bookings</h2>
                    </div>
                    <div class="card-body">
                        <%
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

                                // SQL query to get all bookings and group them by room_type
                                String sql = "SELECT * FROM bookings ORDER BY room_type";
                                stmt = conn.prepareStatement(sql);
                                rs = stmt.executeQuery();

                                // Initialize variables to hold booking data by room type
                                String currentRoomType = "";

                                // Loop through result set and display the bookings
                                while (rs.next()) {
                                    String roomType = rs.getString("room_type");
                                    
                                    // Check if we need to display a new room type heading
                                    if (!roomType.equals(currentRoomType)) {
                                        if (!currentRoomType.isEmpty()) {
                                            out.println("</tbody>");  // Close the previous room type section
                                            out.println("</table>");
                                        }
                                        out.println("<h3>Room Type: " + roomType + "</h3>");
                                        out.println("<table class='table table-striped table-bordered'>");
                                        out.println("<thead><tr>");
                                        out.println("<th>Booking ID</th>");
                                        out.println("<th>First Name</th>");
                                        out.println("<th>Last Name</th>");
                                        out.println("<th>Mobile</th>");
                                        out.println("<th>Email</th>");
                                        out.println("<th>Check-In</th>");
                                        out.println("<th>Check-Out</th>");
                                        out.println("<th>Adults</th>");
                                        out.println("<th>Kids</th>");
                                        out.println("<th>Number of Rooms</th>");
                                        out.println("</tr></thead>");
                                        out.println("<tbody>");
                                        currentRoomType = roomType;
                                    }

                                    // Display booking details for the current room type
                                    out.println("<tr>");
                                    out.println("<td>" + rs.getInt("id") + "</td>");
                                    out.println("<td>" + rs.getString("first_name") + "</td>");
                                    out.println("<td>" + rs.getString("last_name") + "</td>");
                                    out.println("<td>" + rs.getString("mobile") + "</td>");
                                    out.println("<td>" + rs.getString("email") + "</td>");
                                    out.println("<td>" + rs.getDate("check_in") + "</td>");
                                    out.println("<td>" + rs.getDate("check_out") + "</td>");
                                    out.println("<td>" + rs.getInt("adult_count") + "</td>");
                                    out.println("<td>" + rs.getInt("kid_count") + "</td>");
                                    out.println("<td>" + rs.getInt("num_rooms") + "</td>");
                                    out.println("</tr>");
                                }

                                // Close the table for the last room type
                                if (currentRoomType.length() > 0) {
                                    out.println("</tbody>");
                                    out.println("</table>");
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                                out.println("<div class='alert alert-danger text-center'>Error: " + e.getMessage() + "</div>");
                            } finally {
                                try {
                                    if (stmt != null) stmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException se) {
                                    se.printStackTrace();
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery and Bootstrap JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>

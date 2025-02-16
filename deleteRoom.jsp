<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Room</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        .confirmation-message {
            text-align: center;
            margin-top: 50px;
        }
        .confirmation-message h3 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            // Retrieve room ID from the request parameter
            String roomId = request.getParameter("id");

            // Database connection
            Connection conn = null;
            PreparedStatement stmt = null;
            int rowsAffected = 0;

            String url = "jdbc:mysql://localhost:3306/apartment?useUnicode=true&characterEncoding=UTF-8";
            String dbUser = "root";
            String dbPassword = "";

            try {
                // Load MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUser, dbPassword);

                // SQL query to delete room
                String sql = "DELETE FROM rooms WHERE room_id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, roomId);

                // Execute the query
                rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<div class='confirmation-message'><h3>Room deleted successfully!</h3>");
                    out.println("<a href='viewRooms.jsp' class='btn btn-primary'>Go back to Room List</a></div>");
                } else {
                    out.println("<div class='confirmation-message'><h3>Room deletion failed. Room not found!</h3>");
                    out.println("<a href='viewRooms.jsp' class='btn btn-danger'>Go back to Room List</a></div>");
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

    <!-- Bootstrap JS and jQuery -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>

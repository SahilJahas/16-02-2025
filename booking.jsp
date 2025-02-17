<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>

<!DOCTYPE html>
<html lang="en">
  <html lang="en">
    <head>
        <meta charset="utf-8">
        <title>LOFT CITY | Responsive Travel & Tourism Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicons -->
        <link href="img/favicon.ico" rel="icon">
        <link href="img/apple-favicon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,700|Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet"> 

        <!-- Vendor CSS File -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/slick/slick.css" rel="stylesheet">
        <link href="vendor/slick/slick-theme.css" rel="stylesheet">
        <link href="vendor/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Main Stylesheet File -->
        <link href="css/hover-style.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- Header Section Start -->
        <header id="header">
            <a href="index.jsp" class="logo"><img src="img/logo.png" alt="logo"></a>
            <div class="phone"><i class="fa fa-phone"></i>+1 234 567 8900</div>
            <div class="mobile-menu-btn"><i class="fa fa-bars"></i></div>
            <nav class="main-menu top-menu">
                <ul>
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="room.html">Apartments</a></li>
                    <li><a href="amenities.html">Amenities</a></li>
                    <li><a href="booking.jsp">Booking</a></li>
                    <li><a href="login.html">Login</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                </ul>
            </nav>
        </header>
        <!-- Header Section End -->

<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String url = "jdbc:mysql://localhost:3306/apartment?useUnicode=true&characterEncoding=UTF-8";
    String dbUser = "root";
    String dbPassword = "";
    Set<String> roomTypesSet = new HashSet<>(); // Using Set to store unique room types

    try {
        // Ensure the driver is loaded
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // SQL query to fetch room types from the database (assuming a 'rooms' table with 'room_type' field)
        String sql = "SELECT room_type FROM rooms";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        // Store the room types in a Set (this will eliminate duplicates automatically)
        while (rs.next()) {
            roomTypesSet.add(rs.getString("room_type"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }

    // Convert the Set back to a List for use in the dropdown
    List<String> roomTypes = new ArrayList<>(roomTypesSet);
%>

<!-- Booking Form Section Start -->
<div id="booking">
    <div class="container">
        <div class="section-header">
            <h2>Book Your Room</h2>
            <p>Fill in the details below to book your apartment room. We look forward to hosting you at Loft City!</p>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="booking-form">
                    <form name="bookingForm" id="bookingForm" action="viewbooking.jsp" method="POST" novalidate="novalidate" onsubmit="return validateForm()">
                        <div class="form-row">
                            <div class="control-group col-sm-6">
                                <label>First Name</label>
                                <input type="text" class="form-control" id="first_name" name="first_name" placeholder="E.g. John" required="required" />
                            </div>
                            <div class="control-group col-sm-6">
                                <label>Last Name</label>
                                <input type="text" class="form-control" id="last_name" name="last_name" placeholder="E.g. Sina" required="required" />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="control-group col-sm-6">
                                <label>Mobile</label>
                                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="E.g. +1 234 567 8900" required="required" />
                            </div>
                            <div class="control-group col-sm-6">
                                <label>Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="E.g. email@example.com" required="required" />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="control-group col-sm-6">
                                <label>Check-In</label>
                                <input type="text" class="form-control datetimepicker-input" id="check_in" name="check_in" data-toggle="datetimepicker" data-target="#checkin" placeholder="E.g. 2025/01/29" required="required" />
                            </div>
                            <div class="control-group col-sm-6">
                                <label>Check-Out</label>
                                <input type="text" class="form-control datetimepicker-input" id="check_out" name="check_out" data-toggle="datetimepicker" data-target="#checkout" placeholder="E.g. 2025/01/29" required="required" />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="control-group col-sm-6">
                                <label>Adult</label>
                                <select class="custom-select" id="adult_count" name="adult_count" required="required">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </div>
                            <div class="control-group col-sm-6">
                                <label>Kid</label>
                                <select class="custom-select" id="kid_count" name="kid_count" required="required">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </div>
                        </div>
                        <!-- Room Type -->
                        <div class="control-group">
                            <label>Room Type</label>
                            <select class="custom-select" id="room_type" name="room_type" required="required">
                                <option value="">Select Room Type</option>

                                <!-- Dynamically added room types from database -->
                                <%
                                    // Loop through the roomTypes list and create options for room types
                                    for (String dbRoomType : roomTypes) {
                                %>
                                    <option value="<%= dbRoomType %>"><%= dbRoomType %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>

                        <!-- Number of Rooms -->
                        <div class="control-group">
                            <label>Number of Rooms</label>
                            <select class="custom-select" id="num_rooms" name="num_rooms" required="required">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>

                        <!-- Submit Button -->
                        <div class="button">
                            <button type="submit" id="bookingButton">Book Now</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Booking Form Section End -->

<script>
    // Front-end validation for email format and mobile number format
    function validateForm() {
        const email = document.getElementById("email").value;
        const mobile = document.getElementById("mobile").value;
        
        // Email validation regex (basic)
        const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!emailPattern.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }
        
        // Mobile number validation regex (basic)
        const mobilePattern = /^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/;
        if (!mobilePattern.test(mobile)) {
            alert("Please enter a valid mobile number.");
            return false;
        }
        
        return true;
    }
</script>

  <!-- Footer Section Start -->
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="social">
                            <a href="https://instagram.com/yourprofile" target="_blank"><li class="fa fa-instagram"></li></a>
                            <a href="https://twitter.com/yourprofile" target="_blank"><li class="fa fa-twitter"></li></a>
                            <a href="https://facebook.com/yourprofile" target="_blank"><li class="fa fa-facebook-f"></li></a>
                        </div>
                    </div>
                    <div class="col-12">
                        <ul>
                            <li><a href="">Home</a></li>
                            <li><a href="">About</a></li>
                            <li><a href="">Terms</a></li>
                            <li><a href="">Contact</a></li>
                        </ul>
                    </div>
                    <div class="col-12">
                        <p>Copyright &#169; <a href="https://htmlcodex.com">HTML Codex</a> All Rights Reserved.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Section End -->
<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- Vendor JavaScript File -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery/jquery-migrate.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/easing/easing.min.js"></script>
        <script src="vendor/superfish/hoverIntent.js"></script>
        <script src="vendor/superfish/superfish.min.js"></script>
        <script src="vendor/wow/wow.min.js"></script>
        <script src="vendor/slick/slick.min.js"></script>
        <script src="vendor/tempusdominus/js/moment.min.js"></script>
        <script src="vendor/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="vendor/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        
        <!-- Main Javascript File -->
      <script>
    $(document).ready(function() {
        $('#checkin').datetimepicker({
            format: 'YYYY/MM/DD' // Set to year/month/day format
        });
        $('#checkout').datetimepicker({
            format: 'YYYY/MM/DD', // Set to year/month/day format
            useCurrent: false // Important for "Check-Out" field to be after "Check-In"
        });

        $("#checkin").on("change.datetimepicker", function(e) {
            $('#checkout').datetimepicker('minDate', e.date); // Ensure checkout is after check-in
        });
    });
</script>
        <script src="js/main.js"></script>
</body>
</html>

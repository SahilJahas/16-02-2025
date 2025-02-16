<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>

<!DOCTYPE html>
<html lang="en">
    <head>
    <style type="text/css">.room-content {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 30px;
}

.room-content.room-left .room-img {
    order: 1;
}
.room-content.room-right .room-img {
    order: 2;
}


.room-left .room-des {
    order: 2; /* Description comes second */
}

.room-right .room-des {
    order: 1; /* Description comes first */
    
}

/* Add other styles as needed */
    </style>
        <meta charset="utf-8">
        <title>LOFT CITY | Responsive Travel & Tourism Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicons -->
        <link href="img/favicon.ico" rel="icon">
        <link href="img/apple-favicon.png" rel="apple-touch-icon">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

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
            <a href="index.html" class="logo"><img src="img/logo.png" alt="logo"></a>
            <div class="phone"><i class="fa fa-phone"></i>+1 234 567 8900</div>
            <div class="mobile-menu-btn"><i class="fa fa-bars"></i></div>
            <nav class="main-menu top-menu">
                <ul>
                    <li class="active"><a href="index.html">Home</a></li>
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
        
        <!-- Header Bottom Start -->
        <div id="header-bottom">
            <!-- Search Section Start -->
            <div id="search" class="search-slider">
                <div class="container">
                    <h1>Feel at Home When You're Away</h1>
                    <div class="form-row">
                        <div class="control-group col-md-3">
                            <label>Check-In</label>
                            <div class="form-group">
                                <div class="input-group date" id="date-3" data-target-input="nearest">
                                    <input type="text" class="form-control datetimepicker-input" data-target="#date-3"/>
                                    <div class="input-group-append" data-target="#date-3" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="control-group col-md-3">
                            <label>Check-Out</label>
                            <div class="form-group">
                                <div class="input-group date" id="date-4" data-target-input="nearest">
                                    <input type="text" class="form-control datetimepicker-input" data-target="#date-4"/>
                                    <div class="input-group-append" data-target="#date-4" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="control-group col-md-3">
                            <div class="form-row">
                                <div class="control-group col-md-6">
                                    <label>Adult</label>
                                    <select class="custom-select">
                                        <option selected>0</option>
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
                                <div class="control-group col-md-6 control-group-kid">
                                    <label>Kid</label>
                                    <select class="custom-select">
                                        <option selected>0</option>
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
                        </div>
                        <div class="control-group col-md-3">
                            <button class="btn btn-block">Search</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Search Section End -->
            
            <!-- Slider Section Start -->
            <div id="headerSlider" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#headerSlider" data-slide-to="0" class="active"></li>
                    <li data-target="#headerSlider" data-slide-to="1"></li>
                    <li data-target="#headerSlider" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/slider/header-slider-1.jpg" alt="Royal Hotel">
                    </div>

                    <div class="carousel-item">
                        <img src="img/slider/header-slider-2.jpg" alt="Royal Hotel">
                    </div>

                    <div class="carousel-item">
                        <img src="img/slider/header-slider-3.jpg" alt="Royal Hotel">
                    </div>
                </div>

                <a class="carousel-control-prev" href="#headerSlider" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#headerSlider" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- Slider Section End -->
        </div>
        <!-- Header Bottom End -->
        
        <!-- Search Section Start -->
        <div id="search" class="search-home">
            <div class="container">
                <div class="form-row">
                    <div class="control-group col-md-3">
                        <label>Check-In</label>
                        <div class="form-group">
                            <div class="input-group date" id="date-5" data-target-input="nearest">
                                <input type="text" class="form-control datetimepicker-input" data-target="#date-5"/>
                                <div class="input-group-append" data-target="#date-5" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="control-group col-md-3">
                        <label>Check-Out</label>
                        <div class="form-group">
                            <div class="input-group date" id="date-6" data-target-input="nearest">
                                <input type="text" class="form-control datetimepicker-input" data-target="#date-6"/>
                                <div class="input-group-append" data-target="#date-6" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="control-group col-md-3">
                        <div class="form-row">
                            <div class="control-group col-md-6">
                                <label>Adult</label>
                                <select class="custom-select">
                                    <option selected>0</option>
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
                            <div class="control-group col-md-6 control-group-kid">
                                <label>Kid</label>
                                <select class="custom-select">
                                    <option selected>0</option>
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
                    </div>
                    <div class="control-group col-md-3">
                        <button class="btn btn-block">Search</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Search Section End -->
        
        <!-- Welcome Section Start -->
        <div id="welcome">
            <div class="container">
                <h3>Welcome to Loft City</h3>
                <h4>Urban Holiday Apartments in San Francisco</h4> 
                <p>Loft city Apartments in San Francisco offer a stylish and comfortable stay in the heart of the city. These modern, fully-equipped apartments feature spacious living areas, contemporary decor, and convenient amenities like Wi-Fi, smart TVs, and fully stocked kitchens. Ideal for both short-term and extended stays, they provide a home-away-from-home experience with easy access to popular attractions like Fisherman’s Wharf, Golden Gate Park, and vibrant neighborhoods such as the Mission District and Chinatown. Whether you're visiting for business or leisure, Loft city Apartments offer the perfect base for exploring San Francisco.</p>
                <a href="book.jsp">Book Now</a>
            </div>
        </div>
        <!-- Welcome Section End -->
        
        <!-- Amenities Section Start -->
        <div id="amenities">
            <div class="container">
                <div class="section-header">
                    <h2>Amenities & Services</h2>
                    <p>
                       Each apartment is equipped with modern essentials such as high-speed Wi-Fi, smart TVs, and fully stocked kitchens with appliances, cookware, and dishware. Guests can enjoy spacious living areas with contemporary furnishings, creating a relaxing atmosphere during their stay. Additional amenities include on-site laundry facilities, 24/7 customer support, and secure entry for peace of mind. For those looking to explore the city, the apartments are ideally located near public transportation, with easy access to popular attractions and dining options. Whether you're staying for a few days or a few weeks, Urban Holiday Apartments provide everything you need for a seamless and enjoyable experience.
                    </p>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="item">
                            <i class="icon icon-2"></i>
                            <h3>Air Conditioner</h3>
                            <p>Stay cool and comfortable throughout your stay with the apartment's efficient air conditioning system.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="item">
                            <i class="icon icon-3"></i>
                            <h3>Bathtub</h3>
                            <p>Relax and unwind in the spacious bathtub, ideal for a long soak after a day of exploring the city and stay cool.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="item">
                            <i class="icon icon-4"></i>
                            <h3>Shower</h3>
                            <p>Enjoy a refreshing shower in a modern, well-appointed bathroom, designed for convenience and comfort.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="item">
                            <i class="icon icon-6"></i>
                            <h3>Television</h3>
                            <p>Unwind with your favorite shows and movies on the flat-screen TV, equipped with streaming options for your entertainment needs.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="item">
                            <i class="icon icon-7"></i>
                            <h3>WiFi</h3>
                            <p>Stay connected with high-speed WiFi throughout the apartment, making it easy to work, stream, or keep in touch with loved ones.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="item">
                            <i class="icon icon-8"></i>
                            <h3>Telephone</h3>
                            <p>The apartment is equipped with a telephone for local and international calls, ensure you to stay in touch</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="item">
                            <i class="icon icon-9"></i>
                            <h3>Mini Bar</h3>
                            <p>Enjoy a selection of beverages and snacks available in the mini bar, perfect for a quick refreshment or relaxing evening in.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="item">
                            <i class="icon icon-10"></i>
                            <h3>Kitchen</h3>
                            <p> Fully equipped kitchen includes appliances, cookware, and utensils, providing everything you need to prepare your own meals.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<div id="rooms">
    <div class="container">
        <div class="section-header">
            <h2>Apartments & Suites</h2>
            <p>
                We offer the perfect blend of comfort and style, providing a relaxing space for both short and extended stays. Each unit is thoughtfully designed with spacious layouts, modern furnishings, and a range of amenities to make your stay as enjoyable as possible. Whether you're traveling solo, with family, or for business, our apartments and suites cater to all needs, offering a home-like atmosphere in the heart of San Francisco. Enjoy a peaceful retreat with all the conveniences of city living, including fully equipped kitchens, comfortable living areas, and premium services.
            </p> 
        </div>

        <div class="row">
            <%
                // Database connection and logic
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

                    // Query to fetch all rooms, including the booking link, ordered by room type
                    String sql = "SELECT * FROM rooms ORDER BY room_type";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();

                    // Loop through the result set and display rooms
                    int count = 0; // Counter to alternate the order
                    while (rs.next()) {
                        String roomType = rs.getString("room_type");
                        String roomName = rs.getString("room_name");
                        double price = rs.getDouble("price");
                        int size = rs.getInt("size");
                        String bedType = rs.getString("bed_type");
                        String imageUrl = rs.getString("image_url");
                        String description = rs.getString("description");
                        String bookingLink = rs.getString("bookinglink");  // New field for booking link

                        // Alternate the room layout direction (left or right)
                        String layoutClass = (count % 2 == 0) ? "room-left" : "room-right";
            %>

            <%
                // Define the fallback image URL
                String imgSrc = (imageUrl != null && !imageUrl.isEmpty()) ? imageUrl : "default-image.jpg";
            %>

            <div class="col-md-12 room">
                <div class="row room-content <%= layoutClass %>">
                    <!-- If count is even, place image on the left -->
                    <div class="col-md-6 <%= (count % 2 == 0) ? "" : "order-md-2" %>">
                        <div class="room-img">
                            <!-- Updated image styling for proper proportions -->
                            <img src="<%= imgSrc %>" alt="<%= roomName %>" class="img-fluid" style="object-fit: cover; height: 250px; width: 100%;">
                        </div>
                    </div>
                    <!-- Room details on the other side -->
                    <div class="col-md-6">
                        <div class="room-des">
                            <h3><%= roomName %></h3>
                            <h1>&#8377;<%= price %><span>/ Night</span></h1>
                            <ul class="room-size">
                                <li><i class="fa fa-arrow-right"></i>Size: <%= size %> sq ft</li>
                                <li><i class="fa fa-arrow-right"></i>Beds: <%= bedType %></li>
                            </ul>
                            <ul class="room-icon">
                                <li class="icon-1"></li>
                                <li class="icon-2"></li>
                                <li class="icon-3"></li>
                                <li class="icon-4"></li>
                                <li class="icon-5"></li>
                                <li class="icon-6"></li>
                                <li class="icon-7"></li>
                                <li class="icon-8"></li>
                                <li class="icon-9"></li>
                                <li class="icon-10"></li>
                            </ul>
                            <div class="room-link">
                                <!-- Read More Button (Triggers Modal) -->
                                <a href="#" data-toggle="modal" data-target="#modal-<%= roomName.replace(" ", "-").toLowerCase() %>">Read More</a>
                                <!-- Booking Link -->
                                <a href="<%= bookingLink != null ? bookingLink : '#' %>">Book Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal for each room (Display room details on click) -->
            <div class="modal fade" id="modal-<%= roomName.replace(" ", "-").toLowerCase() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"><%= roomName %></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <%= description %>  <!-- Full description shown here -->
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <%
                    count++; // Increment the counter to alternate
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
</div>
<!-- Room Section End -->




<!-- Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Optional: Initialize Bootstrap modal if needed (for Bootstrap 5) -->
<script>
    // For Bootstrap 5, initialize modals dynamically
    const modalTriggers = document.querySelectorAll('[data-toggle="modal"]');
    modalTriggers.forEach(trigger => {
        trigger.addEventListener('click', function() {
            const targetId = this.getAttribute('data-target');
            const modal = new bootstrap.Modal(document.querySelector(targetId));
            modal.show();
        });
    });
</script>


        
              
      
        
        <!-- Subscribe Section Start -->
        <div id="subscribe">
            <div class="container">
                <div class="section-header">
                    <h2>Subscribe for Special Offer</h2>
                    <p>
                       
Don’t miss out on exclusive deals and discounts! Subscribe to our newsletter and be the first to know about special offers, limited-time promotions, and upcoming events. Whether you're planning a vacation, a business trip, or a weekend getaway, our subscribers receive the best rates and perks. Join our community today and start enjoying the benefits of staying with us!
                    </p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="subscribe-form">
                            <form>
                                <input type="email" required="required" placeholder="Enter your email here" />
                                <button>submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Subscribe Section End -->
    
        
        <!-- Call Section Start -->
        <div id="call-us">
            <div class="container">
                <div class="section-header">
                    <h2>Click Below to Call Us</h2>
                    <p>
                        Don't hesitate! Reach out now by clicking the button below to connect with one of our friendly customer service representatives. We're ready to assist you with anything you need—big or small.
                    </p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <a href="tel:+12345678900">+1 234 567 8900</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Call Section End -->
        
        <!-- Footer Section Start -->
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="social">
                            <a href=""><li class="fa fa-instagram"></li></a>
                            <a href=""><li class="fa fa-twitter"></li></a>
                            <a href=""><li class="fa fa-facebook-f"></li></a>
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
						<p>Template By <a href="https://htmlcodex.com">HTML Codex</a></p>
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
        <script src="vendor/stickyjs/sticky.js"></script>
        <script src="vendor/superfish/hoverIntent.js"></script>
        <script src="vendor/superfish/superfish.min.js"></script>
        <script src="vendor/wow/wow.min.js"></script>
        <script src="vendor/slick/slick.min.js"></script>
        <script src="vendor/tempusdominus/js/moment.min.js"></script>
        <script src="vendor/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="vendor/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        
        <!-- Booking Javascript File -->
        <script src="js/booking.js"></script>
        <script src="js/jqBootstrapValidation.min.js"></script>
  
        <!-- Main Javascript File -->
        <script src="js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.0/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        

    </body>
</html>
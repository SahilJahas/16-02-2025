<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background-color: #f8f9fa;
            color: #343a40;
            transition: background-color 0.3s;
        }

        /* Sidebar Styles */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 250px;
            background-color: #c82333; /* Dark Red */
            color: white;
            transition: width 0.3s, background-color 0.3s;
            padding-top: 30px;
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        .sidebar h4 {
            font-size: 1.5rem;
            text-align: center;
            margin-bottom: 40px;
            font-weight: 600;
            color: #ffffff;
            letter-spacing: 2px;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            color: #d1d8e0;
            text-decoration: none;
            padding: 15px 20px;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #a71d2a; /* Lighter Red */
            color: #ffffff;
        }

        .sidebar a i {
            margin-right: 15px;
            font-size: 1.3rem;
        }

        .sidebar.collapsed {
            width: 80px;
            background-color: #ab1f2e;
        }

        .sidebar.collapsed a span {
            display: none;
        }

        .sidebar.collapsed h4 {
            font-size: 1.2rem;
        }

        /* Content Styles */
        .content {
            margin-left: 250px;
            padding: 30px;
            transition: margin-left 0.3s;
        }

        .content.collapsed {
            margin-left: 80px;
        }

        /* Navbar */
        .navbar {
            background-color: #ffffff;
            background-image: url('https://www.transparenttextures.com/patterns/flowers.png'); /* Adding flower background */
            background-repeat: no-repeat;
            background-size: cover;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            padding: 15px 30px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #e1e4e8;
        }

        .navbar button {
            background-color: transparent;
            border: none;
            font-size: 1.8rem;
            cursor: pointer;
        }

        .navbar span {
            font-weight: 600;
            font-size: 1.6rem;
            margin-left: 15px;
            color: #c82333; /* Red Color */
        }

        /* Upload Section */
        .upload-container {
            border: 2px dashed #dc3545; /* Red Border */
            border-radius: 10px;
            padding: 40px;
            text-align: center;
            background-color: #ffffff;
            cursor: pointer;
            transition: border-color 0.3s, background-color 0.3s;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .upload-container:hover {
            background-color: #f1f3f5;
            border-color: #bd2130; /* Darker Red */
        }

        .upload-container.dragover {
            border-color: #bd2130;
        }

        .upload-container i {
            font-size: 3rem;
            color: #6c757d;
        }

        .upload-container p {
            margin: 15px 0;
            color: #6c757d;
            font-size: 1.1rem;
        }

        .upload-container .text-primary {
            font-weight: bold;
            color: #007bff;
        }

        .upload-preview img {
            max-width: 100%;
            margin-top: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Card Styles */
        .card {
            margin-bottom: 20px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-left: 5px solid #dc3545; /* Red Border */
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        /* Buttons */
        .upload-btn {
            width: 100%;
            font-size: 1.2rem;
            padding: 15px;
            font-weight: 600;
            background-color: #dc3545; /* Red Button */
            border: none;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .upload-btn:hover {
            background-color: #bd2130; /* Darker Red */
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="sidebar" id="sidebar">
        <h4 class="text-center">Admin Panel</h4>
        <a href="viewRooms.jsp" class="active"><i class="bi bi-house-door"></i> <span>Edit Room Details</span></a>
        <a href="adminViewbooking.jsp"><i class="bi bi-people"></i> <span>Booked Rooms</span></a>
        <a href="addroomAdmin.jsp"><i class="bi bi-bar-chart-line"></i> <span>Add Rooms</span></a>
        <a href="slidesection.jsp"><i class="bi bi-gear"></i> <span>Slide Section</span></a>
        <a href="#"><i class="bi bi-box-arrow-right"></i> <span>Logout</span></a>
    </div>

    <div class="content" id="content">
        <nav class="navbar">
            <span>Admin Dashboard</span>
        </nav>

        <div class="container mt-4">
            <!-- Add more content here (e.g., cards, stats, etc.) -->
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

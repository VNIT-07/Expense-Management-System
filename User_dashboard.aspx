<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_dashboard.aspx.cs" Inherits="a.User_dashboard" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Tracker</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        /* Fixed Navbar */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background-color: #001a66;
            padding: 10px 20px;
        }

        /* Prevent content from hiding behind navbar */
        body {
            padding-top: 56px;
        }

        /* Navbar Branding */
        .navbar-brand {
            color: white;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        .navbar-brand:hover {
            color: lightgray;
        }

        /* Navbar Icons */
        .nav-icon {
            width: 36px;
            height: 36px;
            border-radius: 50%;
        }

        /* Logout Icon */
        .logout-icon i {
            font-size: 20px;
            color: white;
            margin-right: 10px;
        }

        .logout-icon img {
            width: 36px;
            height: 36px;
            border-radius: 50%;
        }

        .logout-icon i:hover {
            color: lightgray;
        }
    </style>
</head>
<body>
    <!-- Universal Fixed Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <a href="/" class="navbar-brand">Expense.Web</a>

            <div class="d-flex align-items-center">
                <!-- Profile Icon -->
                <a href="/Profile" class="me-3">
                    <img src="/images/profile.png" alt="Profile" class="nav-icon">
                </a>

                <!-- Logout Icon -->
                <a href="/Logout" class="logout-icon">
                    <i class="bi bi-box-arrow-right"></i>
                    <img src="/images/Logout.png">
                </a>
            </div>
        </div>
    </nav>

    <!-- Bootstrap Icons Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>

</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_dashboard.aspx.cs" Inherits="a.User_dashboard" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Tracker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .navbar-custom {
            background-color: #001a66; 
            padding: 10px 20px;
        }

        .navbar-brand {
            color: white;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        .navbar-brand:hover {
            color: lightgray;
        }

        .nav-item a {
            color: white;
            text-decoration: none;
            font-size: 18px;
        }

        .nav-item a:hover {
            color: lightgray;
        }

        .profile-icon img {
            border-radius: 50%; /* Makes the profile image circular */
            width: 36px;
            height: 36px;
        }

        .logout-icon img {
            border-radius: 50%; /* Makes the profile image circular */
            width: 36px;
            height: 36px;
        }


        .logout-icon i:hover {
            color: lightgray;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-custom">
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <a href="/" class="navbar-brand">Expense.Web</a>

            <div class="d-flex align-items-center">
                <a href="/Profile" class="profile-icon me-3">
                    <img src="/images/profile.png" alt="Profile">
                </a>

                <!-- Logout Link -->
                <a href="/Logout" class="logout-icon">
                    <i class="bi bi-box-arrow-right"></i>
                    <img src="/images/Logout.png">
                </a>
            </div>
        </div>
    </nav>

    <!-- Add Bootstrap Icons 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>-->
</body>
</html>

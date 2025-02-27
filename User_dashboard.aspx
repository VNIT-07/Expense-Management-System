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
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Prevent content from hiding behind navbar */
        body {
            padding-top: 70px;
            background-color: #f8f9fa;
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
         .footer {
             position: static;
             bottom: 0;
             width: 100%;
         }

         .footer a {
             text-decoration: none;
             font-size: 18px;
             transition: color 0.3s ease;
         }

         .footer a:hover {
             color: #3498db;
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

            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <i class="bi bi-cash-stack display-4 text-primary"></i>
                            <h4>Total Expenses</h4>
                            <p>$2,450</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <i class="bi bi-wallet2 display-4 text-success"></i>
                            <h4>Available Balance</h4>
                            <p>$5,320</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <i class="bi bi-graph-up display-4 text-danger"></i>
                            <h4>Monthly Spending</h4>
                            <p>$1,200</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
    <div class="container">
        <p class="mb-1">© 2025 Expenses.web. All rights reserved.</p>
        <div>
                    <a href="#"><i class="bi bi-facebook"></i></a>
                    <a href="#"><i class="bi bi-twitter"></i></a>
                    <a href="#"><i class="bi bi-instagram"></i></a>
                    <a href="#"><i class="bi bi-linkedin"></i></a>
        </div>
    </div>
</footer>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

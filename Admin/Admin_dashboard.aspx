<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_dashboard.aspx.cs" Inherits="a.Admin_dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
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
<body>
    <form id="form1" runat="server">
        <div>
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

        </div>
    </form>

    <footer class="footer bg-dark text-light text-center py-3">
    <div class="container">
        <p class="mb-1">© 2025 Expenses.web. All rights reserved.</p>
        <div>
            <a href="#" class="text-light me-3"><i class="bi bi-facebook"></i></a>
            <a href="#" class="text-light me-3"><i class="bi bi-twitter"></i></a>
            <a href="#" class="text-light me-3"><i class="bi bi-instagram"></i></a>
            <a href="#" class="text-light"><i class="bi bi-linkedin"></i></a>
        </div>
    </div>
</footer>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_dashboard.aspx.cs" Inherits="Expense_Tracker.User_dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Expense Tracker</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }
        @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Press Start 2P', cursive;
            background-color: #F8F8DC; /* Light Beige */
            color: #333;
            text-align: center;
        }

        /* ✅ Navigation Bar */
        .navbar {
            background: #34568B; /* Dark Blue */
            padding: 15px;
            text-align: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 14px;
            padding: 10px 20px;
            display: inline-block;
            border: 3px solid white;
            box-shadow: 3px 3px 0px black;
        }

        .navbar a:hover {
            background: white;
            color: black;
        }

        /* ✅ Dashboard Header */
        .dashboard-header {
            font-size: 2.2rem;
            font-weight: bold;
            color: black; /* Dark Blue */
            text-shadow: 4px 4px #34568B; /* Light Blue Shadow */
            margin-bottom: 30px;
        }

        /* ✅ Dashboard Container */
        .dashboard-container {
            max-width: 900px;
            margin: 40px auto;
            background: #F8F8DC; /* White */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 8px 8px #34568B;
            border: 4px solid #34568B;
        }

        .dashboard-container h2 {
            color: #34568B;
        }

        /* ✅ Cards */
        .card {
            border-radius: 12px;
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.1);
            background: #FFF;
            padding: 20px;
            border: 3px solid #34568B;
        }

        h3 {
            color: #34568B;
        }

        /* ✅ Table */
        .table-container {
            margin-top: 20px;
        }

        .table-custom {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            font-family: 'Press Start 2P', cursive;
            font-size: 10px;
            border: 3px solid #34568B;
        }

        .table-custom th, .table-custom td {
            border: 2px solid black;
            padding: 8px;
            text-align: center;
        }

        .table-custom th {
            background: #34568B;
            color: white;
        }

        /* ✅ Buttons */
        .btn {
            background: #34568B; /* Dark Blue */
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            cursor: pointer;
            font-family: 'Press Start 2P', cursive;
            font-size: 12px;
            transition: 0.3s ease-in-out;
            box-shadow: 3px 3px #3B82F6;
        }

        .btn:hover {
            background: white;
            color: #34568B;
            border: 2px solid #34568B;
        }

        /* ✅ Delete Button */
        .btn-danger {
            background: #E74C3C; /* Red */
            border: 2px solid #A93226;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .btn-danger:hover {
            background: white;
            color: #E74C3C;
        }

        /* ✅ Input Fields & Dropdown */
        input, select {
            display: block;
            width: 90%;
            padding: 10px;
            margin: 10px auto;
            border: 2px solid #34568B;
            font-family: 'Press Start 2P', cursive;
            font-size: 12px;
        }

        select {
            width: 90%;
        }

        /* ✅ Button Container */
        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .button-row {
            display: flex;
            justify-content: space-between;
            width: 100%;
            gap: 10px;
        }

        /* ✅ Footer */
        .footer {
            margin-top: 20px;
            font-size: 12px;
            background: #34568B;
            color: white;
            padding: 10px;
            box-shadow: 0px -4px 6px rgba(0, 0, 0, 0.1);
        }

        .footer a {
            text-decoration: none;
            color: white;
            transition: 0.3s;
        }

        .footer a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <!-- NAVIGATION BAR -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="User_dashboard.aspx"><i class="bi bi-cash-stack"></i> Expense Tracker</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Reports.aspx"><i class="bi bi-table"></i> View Expenses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Expense_Calculator.aspx"><i class="bi bi-plus-circle"></i> Add Expense</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="User_profile.aspx"> Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="User_Login.aspx"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <form id="form1" runat="server">
        
        <br />
        <!-- Dashboard Header -->
        <h1 class="dashboard-header">User Dashboard</h1>

        <!-- Dashboard Container -->
        <div class="dashboard-container">
            <h2>Expense Summary</h2>
            
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card">
                        <h3>Total Expenses</h3>
                        <asp:Label ID="lblTotalExpense" runat="server" CssClass="fs-4" Text="₹0.00"></asp:Label>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <h3>Available Balance</h3>
                        <asp:Label ID="lblAvailableBalance" runat="server" CssClass="fs-4" Text="₹0.00"></asp:Label>
                    </div>
                </div>
            </div>

            <!-- Balance Section -->
            <div class="mt-4">
                <asp:TextBox ID="txtBalanceAmount" runat="server" CssClass="form-control text-center mb-2" placeholder="Enter amount" TextMode="Number"></asp:TextBox>
                <asp:Button ID="btnAddBalance" runat="server" CssClass="btn btn-primary" Text="Add Balance" OnClick="btnAddBalance_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger mt-2"></asp:Label>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 Expense Tracker. All rights reserved.</p>
            <p><a href="terms_of_service.html">Terms of Service</a> | <a href="privacy_policy.html">Privacy Policy</a></p>
        </footer>
    
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

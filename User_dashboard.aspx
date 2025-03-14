<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_dashboard.aspx.cs" Inherits="Expense_Tracker.User_dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Dashboard - Expense Tracker</title>

    <!-- ✅ Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"/>

    <!-- ✅ Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet"/>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Press Start 2P', cursive;
            background: url('img/UserDashboardBG.jpeg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            text-align: center;
        }

        /* ✅ Navbar */
        .navbar {
            background: black !important;
            border-bottom: 4px solid #3B82F6;
        }

        .navbar-brand {
            font-size: 1.2rem;
            color: #3B82F6 !important;
        }

        .navbar-nav .nav-link {
            color: white !important;
        }

        .navbar-nav .nav-link:hover {
            color: #3B82F6 !important;
        }

        /* ✅ Dashboard Panel */
        .dashboard-container {
            width: 80%;
            max-width: 900px;
            padding: 40px;
            margin: 50px auto;
            border: 4px solid white;
            background: rgba(0, 0, 0, 0.95);
            box-shadow: 8px 8px #3B82F6;
            color: white;
        }

        .dashboard-container h2 {
            color: #3B82F6;
            margin-bottom: 25px;
        }

        /* ✅ Rectangle Container */
        .stat-container {
            background: black;
            padding: 20px;
            border-radius: 8px;
            border: 3px solid #3B82F6;
            box-shadow: 4px 4px #3B82F6;
            margin: 20px auto;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        /* ✅ Cards Inside Rectangle */
        .card {
            background: white !important;
            border: 2px solid #3B82F6;
            color: black;
            padding: 20px;
            text-align: center;
            font-size: 1rem;
            box-shadow: 4px 4px #3B82F6;
            width: 40%;
            margin: 10px;
        }

        .card h4 {
            color: #3B82F6;
            margin-top: 10px;
        }

        .card i {
            font-size: 2rem;
            color: #3B82F6;
        }

        /* ✅ Footer */
        .footer {
            padding: 20px;
            border-top: 4px solid white;
            background: black;
            box-shadow: 8px 8px #3B82F6;
            margin-top: 40px;
            color: white;
        }

        .footer a {
            color: #3B82F6;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- ✅ Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="Dashboard.aspx">Expense.web</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="Expense_Calculator.aspx"><i class="bi bi-plus-circle"></i> Add Expense</a></li>
                        <li class="nav-item"><a class="nav-link" href="Reports.aspx"><i class="bi bi-bar-chart"></i> Reports</a></li>
                        <li class="nav-item"><a class="nav-link" href="Settings.aspx"><i class="bi bi-gear"></i> Settings</a></li>
                        <li class="nav-item"><a class="nav-link text-danger" href="User_Login.aspx"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- ✅ Dashboard Content -->
        <div class="dashboard-container">
            <h2> <asp:Label ID="lblUserName" runat="server" Text="User"></asp:Label></h2>

            <!-- ✅ Rectangle Box for Total Expenses & Available Balance -->
            <div class="stat-container">
                <div class="card">
                    <i class="bi bi-cash-stack"></i>
                    <h4>Total Expenses</h4>
                    <p><asp:Label ID="lblTotalExpense" runat="server" Text="0"></asp:Label></p>
                </div>
                <div class="card">
                    <i class="bi bi-wallet2"></i>
                    <h4>Available Balance</h4>
                    <p><asp:Label ID="lblAvailableBalance" runat="server" Text="0"></asp:Label></p>
                </div>
                    <div class="card">
                    <i class="bi bi-calendar2-check"></i>
                    <h4>Monthly Spending</h4>
                    <p><asp:Label ID="lblMonthlySpending" runat="server" Text="0"></asp:Label></p>
                </div>
            </div>
        </div>

        <!-- ✅ Footer -->
        <footer class="footer">
            <p>&copy; 2025 Expense Tracker. All Rights Reserved.</p>
            <p><a href="terms_of_service.html">Terms of Service</a> | <a href="privacy_policy.html">Privacy Policy</a></p>
        </footer>

        <!-- ✅ Bootstrap Script -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>

        <!-- my code -->

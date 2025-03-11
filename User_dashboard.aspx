<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_dashboard.aspx.cs" Inherits="a.User_dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Dashboard</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background-color: #001a66; 
            padding: 10px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        body {
            padding-top: 70px;
            background-color: #f8f9fa;
        }

        .footer {
            background-color: #001a66;
            color: white;
            padding: 15px 0;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        .footer a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-size: 18px;
            transition: 0.3s;
        }

        .footer a:hover {
            color: #3498db; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- ✅ Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="Dashboard.aspx"><h3>Expense.web</h3></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="Expense_Calculator.aspx"><i class="bi bi-plus-circle"></i> Add Expense</a></li>
                        <li class="nav-item"><a class="nav-link" href="ViewExpense.aspx"><i class="bi bi-list"></i> View Expenses</a></li>
                        <li class="nav-item"><a class="nav-link" href="Reports.aspx"><i class="bi bi-bar-chart"></i> Reports</a></li>
                        <li class="nav-item"><a class="nav-link" href="Settings.aspx"><i class="bi bi-gear"></i> Settings</a></li>
                        <li class="nav-item"><a class="nav-link text-danger" href="User_Login.aspx"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- ✅ User Greeting -->
        <div class="container mt-5">
            <h2>Hi, <asp:Label ID="lblUserName" runat="server" Text="User"></asp:Label></h2>

            <!-- ✅ Expense Cards -->
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <i class="bi bi-cash-stack display-4 text-primary"></i>
                            <h4>Total Expenses</h4>
                            <p><asp:Label ID="lblTotalExpense" runat="server" Text="0"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <i class="bi bi-wallet2 display-4 text-success"></i>
                            <h4>Available Balance</h4>
                            <p><asp:Label ID="lblAvailableBalance" runat="server" Text="0"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <i class="bi bi-graph-up display-4 text-danger"></i>
                            <h4>Monthly Spending</h4>
                            <p><asp:Label ID="lblMonthlySpending" runat="server" Text="0"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ✅ Footer -->
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>

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
        .auto-style1 {
            margin-left: 364px;
            margin-top: 79px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="Dashboard.aspx"><h3>Expense.web</h3></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                      <!--   <li class="nav-item"><a class="nav-link" href="Dashboard.aspx"><i class="bi bi-speedometer2"></i> Dashboard</a></li>-->
                        <li class="nav-item"><a class="nav-link" href="Expense_Calculator.aspx"><i class="bi bi-plus-circle"></i> Add Expense</a></li>
                        <li class="nav-item"><a class="nav-link" href="ViewExpenses.aspx"><i class="bi bi-list"></i> View Expenses</a></li>
                        <li class="nav-item"><a class="nav-link" href="Reports.aspx"><i class="bi bi-bar-chart"></i> Reports</a></li>
                        <li class="nav-item"><a class="nav-link" href="Settings.aspx"><i class="bi bi-gear"></i> Settings</a></li>
                        <li class="nav-item"><a class="nav-link text-danger" href="User_Login.aspx"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-5">
            <h2>Hi, Vanit</h2>
            <!--<p class="text-center text-muted">Manage your expenses efficiently with real-time tracking and reports.</p>-->
            
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <asp:GridView ID="GVData" runat="server" Width="801px" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" AutoGenerateSelectButton="True" CellPadding="4" CssClass="auto-style1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

    </form>

    </body>
</html>

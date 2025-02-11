<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Login.aspx.cs" Inherits="F1.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Expense Management System - Login</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons (Optional) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Expenses.web</a>
                <div class="ms-auto">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="User_Registration.aspx">
                                <i class="bi bi-pencil-square"></i> User Registration
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Admin_login.aspx">
                                <i class="bi bi-lock"></i> Admin Login
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Login Form -->
        <div class="container d-flex justify-content-center align-items-center" style="height: 90vh;">
            <div class="card p-4 shadow-sm" style="max-width: 400px; width: 100%;">
                <h2 class="text-center mb-4">User Login</h2>
                
                <div class="mb-3">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Email / Registration Number"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                </div>

                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary w-100" Text="Login" OnClick="btnLogin_Click" />

                <div class="text-center mt-3">
                    <a href="forgot_password.aspx" class="text-decoration-none">Forgot password?</a>
                </div>
            </div>
        </div>

    </form>

    <!-- Bootstrap JS (For interactive components like Navbar, Modals, etc.) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

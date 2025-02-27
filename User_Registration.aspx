<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Registration.aspx.cs" Inherits="F1.User_Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    
    <!-- Bootstrap CSS -->
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
        }

        body {
            padding-top: 56px;
            background: url('img/Regist.JPG') no-repeat center center fixed;
            background-size: cover;
        }

        .card {
           /* background: rgba(255, 255, 255, 0.8);  White with 80% opacity */
            opacity: 0.9; /* Adjust transparency */
            border-radius: 15px; /* Smooth rounded corners */
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
<body class="bg-light">
    <form id="form1" runat="server">
        
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="User_login.aspx">Expense.web</a>
                <div class="ms-auto">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="User_Login.aspx"><i class="bi bi-person"></i> User Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="Admin_Login.aspx"><i class="bi bi-lock"></i> Admin Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Registration Form -->
        <div class="container d-flex justify-content-center align-items-center" style="height: 90vh;">
            <div class="card p-4 shadow-sm text-center" style="max-width: 400px; width: 100%;">
                <div class="d-flex justify-content-center">
                    <img src="img/UserIcon1.jpeg" alt="User Icon" style="width: 80px; height: 80px;">
                </div>
                <h2 class="text-center mb-4"><h4>User Registration</h4></h2>
                
                <div class="mb-3">
                    <asp:TextBox ID="txtFname" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                </div>
               
                <div class="mb-3">
                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="Contact Number"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Email"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txtCpassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Select Country" Value="" />
                        <asp:ListItem Text="United States" Value="US" />
                        <asp:ListItem Text="India" Value="IN" />
                        <asp:ListItem Text="United Kingdom" Value="UK" />
                        <asp:ListItem Text="Canada" Value="CA" />
                        <asp:ListItem Text="Australia" Value="AU" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                </div>
                <div class="form-check mb-3">
                    <asp:CheckBox ID="chkTerms" runat="server"  />
                    <label class="form-check-label" for="chkTerms">I agree to the <a href="terms_condition.html">terms and conditions</a></label>
                </div>
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success w-100" Text="Register" OnClick="btnSubmit_Click" />
            </div>
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

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

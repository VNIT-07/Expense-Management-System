<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Registration.aspx.cs" Inherits="F1.User_Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="User_login.aspx">Expense Management System</a>
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
            <div class="card p-4 shadow-sm" style="max-width: 500px; width: 100%;">
                <h2 class="text-center mb-4">User Registration</h2>
                
                <div class="mb-3">
                    <asp:TextBox ID="txtFname" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txtMname" runat="server" CssClass="form-control" placeholder="Middle Name"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txtLname" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" TextMode="Number" placeholder="Contact Number"></asp:TextBox>
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
                    <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Select Currency" Value="" />
                        <asp:ListItem Text="USD" Value="USD" />
                        <asp:ListItem Text="INR" Value="INR" />
                        <asp:ListItem Text="EUR" Value="EUR" />
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txtIncomeSource" runat="server" CssClass="form-control" placeholder="Income Source"></asp:TextBox>
                </div>
                <div class="form-check mb-3">
                    <asp:CheckBox ID="chkTerms" runat="server" CssClass="form-check-input" />
                    <label class="form-check-label" for="chkTerms">I agree to the <a href="terms_condition.html">terms and conditions</a></label>
                </div>
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success w-100" Text="Register" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

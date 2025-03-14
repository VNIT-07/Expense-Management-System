<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_login.aspx.cs" Inherits="Expense_Tracker.User_Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Login - Expense Tracker</title>

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
            background: black;
        }

        body {
            font-family: 'Press Start 2P', cursive;
            background: black;
            color: white;
            text-align: center;
        }

        .login-container {
            width: 400px;
            padding: 40px;
            margin: 80px auto;
            border: 4px solid #3B82F6; /* Neon Blue */
            background: black;
            box-shadow: 8px 8px #3B82F6;
            border-radius: 12px;
        }

        .login-container h2 {
            color: #3B82F6; /* Neon Blue */
            margin-bottom: 25px;
        }

        .input-field {
            width: 100%;
            padding: 18px;
            margin: 12px 0;
            background: #1E1E1E; /* Dark Grey */
            border: 3px solid #3B82F6; /* Neon Blue */
            color: white;
            text-align: center;
            font-size: 1.1rem;
            border-radius: 8px;
        }

        .forgot-password {
            font-size: 0.9rem;
            color: #C7B7E7; /* Soft Purple */
            text-decoration: none;
            display: block;
            margin-top: 10px;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        .login-btn {
            width: 100%;
            padding: 18px;
            font-size: 1.2rem;
            color: black;
            background: #3B82F6; /* Neon Blue */
            border: 3px solid #3B82F6;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
            border-radius: 8px;
        }

        .login-btn:hover {
            background: black;
            color: #3B82F6;
        }

        .large-header {
            font-size: 2.8rem;
            text-shadow: 4px 4px #3B82F6; /* Neon Blue Shadow */
            margin: 40px 0;
        }

        .footer {
            padding: 20px;
            border-top: 4px solid white;
            background: rgba(22, 33, 62, 0.85);
            box-shadow: 8px 8px #3B82F6;
            margin-top: 60px;
            border-radius: 8px;
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

    <!-- Large Header -->
    <h1 class="large-header">Welcome Back</h1>

    <!-- Login Form -->
    <div class="login-container">
        <h2>USER LOGIN</h2>

        <form id="form1" runat="server">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" TextMode="Email" placeholder="Email"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Password"></asp:TextBox>

            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>

            <a href="Forgot_Password.aspx" class="forgot-password">Forgot Password?</a>

            <br>

            <asp:Button ID="btnLogin" runat="server" CssClass="login-btn" Text="LOGIN" OnClick="btnLogin_Click" />
        </form>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2025 Expense Tracker. All Rights Reserved.</p>
        <p><a href="terms_of_service.html">Terms of Service</a> | <a href="privacy_policy.html">Privacy Policy</a></p>
    </footer>

</body>
</html>

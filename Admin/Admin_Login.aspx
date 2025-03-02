<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="F1.ADMINLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style>
        body {
            background-image: url(login.png);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            width: 400px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }

        .login-container table {
            width: 100%;
        }

        .login-container td {
            padding: 10px;
            font-size: 14px;
        }

        .login-container input {
            width: 95%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            font-size: 14px;
        }

        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: #ffffff;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-container button:hover {
            background-color: #0056b3;
        }

        .login-container a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }

        .login-container a:hover {
            text-decoration: underline;
        }

        .auto-style1 {
            width: 139px;
        }

        footer {
            margin-top: 20px;
            text-align: center;
            color: #555555;
            font-size: 14px;
        }

        footer a {
            color: #007bff;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
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
    <form id="form1" runat="server">
        <div class="login-container">
            <h2 style="font-family: 'Century Gothic'">Admin Login</h2>
            <table>
                <tr>
                    <td class="auto-style1" style="font-family: 'Century Gothic'; font-size: large;">Email:</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter Email" TextMode="Email" Width="175px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-family: 'Century Gothic'; font-size: large;">Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter password" TextMode="Password" Width="175px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" BackColor="#99CCFF" />
                    </td>
                </tr>
            </table>
            <a href="ForgotPassword.aspx">Forgot Password?</a>
        </div>
    </form>
    <footer>
    <u><a href="User_Login.aspx"><h4 style="color: #000000">Back</h4></a></u>    

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
    </footer>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Login.aspx.cs" Inherits="F1.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Expense Management System - Login</title>
    <style>
        body {
            margin: 0;
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #343a40;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .navbar h1 {
            font-size: 18px;
            margin: 0;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            padding: 0;
            margin: 0;
        }

        .navbar ul li {
            margin: 0 15px;
        }

        .navbar ul li a {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        .navbar ul li a:hover {
            text-decoration: underline;
        }

        .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 50px); /* Adjust height for navbar */
            padding: 20px;
        }

        .login-container {
            width: 400px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .login-container label {
            display: block;
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }

        .login-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
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
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <h1>Expense Management System</h1>
            <ul>
                <li><h3><a href="User_Registration.aspx">&#128221; User Registration</a></h3></li>
                <li><h3><a href="Admin_login.aspx">&#128274; Admin Login</a></h3></li>
            </ul>
        </div>
        <div class="main-content">
            <div class="login-container">
                <h2>User Login</h2>
                
                <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" Width="362px"></asp:TextBox>
                
                <asp:TextBox ID="txtRegNum" runat="server" TextMode="Email" placeholder="Email / Registration Number" Width="362px"></asp:TextBox>
                
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" Width="363px"></asp:TextBox>
                
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" BackColor="#99CCFF" />
                
                <a href="forgot_password.aspx">Forgot password?</a>
                <u><a href="User_SignIn.aspx">Sign in</a></u>

                <br />&nbsp;

            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_SignIn.aspx.cs" Inherits="F1.User_SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Sign-In</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
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
            height: calc(100vh - 50px); 
            padding: 20px;
        }

        .sign-in-container {
            width: 400px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .sign-in-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .sign-in-container label {
            display: block;
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }

        .sign-in-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        .sign-in-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        .sign-in-container button:hover {
            background-color: #0056b3;
        }

        .sign-in-container a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        .sign-in-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <h1>Expense Management System</h1>
            <ul>
                <!--<li><a href="User_Registration.aspx">User Registration</a></li>-->
                <li><a href="User_Login.aspx"><u>Back</u></a></li>
            </ul>
        </div>

        <div class="main-content">
            <div class="sign-in-container">
                <h2>User Sign-In</h2>

                <label for="txtUsername">Email</label>
                <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter your username"></asp:TextBox>

                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>

                <asp:Button ID="btnSignIn" runat="server" Text="Sign In" OnClick="btnSignIn_Click"  />

                <a href="#forgot_password.aspx">Forgot password?</a>
            </div>
        </div>
    </form>
</body>
</html>

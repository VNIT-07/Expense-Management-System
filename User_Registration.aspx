<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Registration.aspx.cs" Inherits="F1.User_Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        .navbar {
            background-color: #343a40;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .navbar h1 {
            color: white;
            font-size: 18px;
            margin: 0;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
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

        .form-container {
            width: 50%;
            margin: 50px auto;
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-container table {
            width: 100%;
            border-collapse: collapse;
        }

        .form-container td {
            padding: 10px;
        }

        .form-container input,
        .form-container select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-container input[type="checkbox"] {
            width: auto;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Expense Management System</h1>
        <ul>
            <li><a href="User_Login.aspx">&#128101; User Login</a></li>
            <li><a href="Admin_Login.aspx">&#128274; Admin Login</a></li>
        </ul>
    </div>
    
    <!-- Registration Form -->
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>User Registration</h2>
            <table>
                <!-- Registration Number
                <tr>
    <td><label for="txtRegNum">Registration Number:</label></td>
    <td><asp:TextBox ID="txtRegNum" runat="server" placeholder="Enter registration number"></asp:TextBox></td>
</tr> -->

                <!-- First Name -->
                <tr>
                    <td><label for="txtFname">First Name:</label></td>
                    <td><asp:TextBox ID="txtFname" runat="server" placeholder="Enter first name"></asp:TextBox></td>
                </tr>

                <!-- Middle Name -->
                <tr>
                    <td><label for="txtMname">Middle Name:</label></td>
                    <td><asp:TextBox ID="txtMname" runat="server" placeholder="Enter middle name"></asp:TextBox></td>
                </tr>

                <!-- Last Name -->
                <tr>
                    <td><label for="txtLname">Last Name:</label></td>
                    <td><asp:TextBox ID="txtLname" runat="server" placeholder="Enter last name"></asp:TextBox></td>
                </tr>

                <!-- Contact Number -->
                <tr>
                    <td><label for="txtContact">Contact Number:</label></td>
                    <td><asp:TextBox ID="txtContact" runat="server" placeholder="Enter contact number" TextMode="Number"></asp:TextBox></td>
                </tr>

                <!-- Email -->
                <tr>
                    <td><label for="txtEmail">Email:</label></td>
                    <td><asp:TextBox ID="txtEmail" runat="server" placeholder="Enter email" TextMode="Email"></asp:TextBox></td>
                </tr>

                <!-- Password -->
                <tr>
                    <td><label for="txtPassword">Password:</label></td>
                    <td><asp:TextBox ID="txtPassword" runat="server" placeholder="Enter password" TextMode="Password"></asp:TextBox></td>
                </tr>

                <!-- Confirm Password -->
                <tr>
                    <td><label for="txtCpassword">Confirm Password:</label></td>
                    <td><asp:TextBox ID="txtCpassword" runat="server" placeholder="Confirm password" TextMode="Password"></asp:TextBox></td>
                </tr>

                <!-- Currency Preference -->
                <tr>
                    <td><label for="ddlCurrency">Currency Preference:</label></td>
                    <td>
                        <asp:DropDownList ID="ddlCurrency" runat="server">
                            <asp:ListItem Text="Select Currency" Value="" />
                            <asp:ListItem Text="USD" Value="USD" />
                            <asp:ListItem Text="INR" Value="INR" />
                            <asp:ListItem Text="EUR" Value="EUR" />
                        </asp:DropDownList>
                    </td>
                </tr>

                <!-- Income Source -->
                <tr>
                    <td><label for="txtIncomeSource">Income Source:</label></td>
                    <td><asp:TextBox ID="txtIncomeSource" runat="server" placeholder="Enter income source"></asp:TextBox></td>
                </tr>

                <!-- Terms and Conditions -->
                <tr>
                    <td colspan="2">
                        <asp:CheckBox ID="chkTerms" runat="server" />
                        <label for="chkTerms">I agree to the <a href="terms_condition.html">terms and conditions</a></label>
                    </td>
                </tr>

                <!-- Submit Button -->
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Register" BackColor="#99CCFF" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

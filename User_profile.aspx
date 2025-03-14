<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_profile.aspx.cs" Inherits="a.User_profile" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }
        .profile-container {
            width: 40%;
            margin: auto;
            background: white;
            padding: 20px;
            box-shadow: 0px 0px 10px gray;
            border-radius: 8px;
            margin-top: 50px;
        }
        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 2px solid gray;
        }
        label {
            font-weight: bold;
        }
        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="profile-container">
            <h2>User Profile</h2>

            <!-- Profile Picture -->
            <asp:Image ID="imgProfile" runat="server" CssClass="profile-pic" ImageUrl="~/images/default-user.png" />
            <br /><br />
            <asp:FileUpload ID="fuProfilePic" runat="server" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload Picture" CssClass="btn" OnClick="btnUpload_Click" />
            <br /><br />

            <!-- User Details -->
            <label>User Name:</label>
            <asp:Label ID="lblUserName" runat="server" Text="N/A"></asp:Label>
            <br /><br />

            <label>Email:</label>
            <asp:Label ID="lblEmail" runat="server" Text="N/A"></asp:Label>
            <br /><br />

            <label>Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ReadOnly="true"></asp:TextBox>
            <br /><br />

            <label>Contact:</label>
            <asp:Label ID="lblContact" runat="server" Text="N/A"></asp:Label>
            <br /><br />

            <label>Available Balance:</label>
            <asp:Label ID="lblBalance" runat="server" Text="$0.00"></asp:Label>
            <br /><br />

            <!-- Update Password -->
            <h3>Change Password</h3>
            <label>New Password:</label>
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br /><br />

            <label>Confirm Password:</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
            <br /><br />

            <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" CssClass="btn" OnClick="btnUpdatePassword_Click" />
            <br /><br />

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>

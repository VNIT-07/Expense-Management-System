<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Profile.aspx.cs" Inherits="Expense_Tracker.User_Profile" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <!-- Bootstrap & Custom Styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: black;
            color: white;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        .profile-container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 3px solid #3B82F6;
            background: rgba(0, 0, 0, 0.9);
            box-shadow: 5px 5px #3B82F6;
        }

        .profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 3px solid #3B82F6;
            margin-bottom: 10px;
        }

        .btn-custom {
            background: #3B82F6;
            color: black;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        .btn-custom:hover {
            background: black;
            color: #3B82F6;
            border: 2px solid #3B82F6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="profile-container">
            <asp:Panel ID="pnlUserProfile" CssClass="profile-container" runat="server">
                <h2>User Profile</h2>

                <!-- Profile Image -->
                <asp:Image ID="imgProfile" runat="server" CssClass="profile-img" />

                <h4><asp:Label ID="lblFullName" runat="server"></asp:Label></h4>
                <p>Email: <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
                <p>Contact: <asp:Label ID="lblContact" runat="server"></asp:Label></p>
                <p>Country: <asp:Label ID="lblCountry" runat="server"></asp:Label></p>

                <asp:Button ID="btnEditProfile" CssClass="btn-custom" runat="server" Text="Edit Profile" OnClick="btnEditProfile_Click"  />
            </asp:Panel>
        </div>
    </form>
</body>
</html>

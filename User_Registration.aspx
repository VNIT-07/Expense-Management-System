
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Registration.aspx.cs" Inherits="Expense_Tracker.User_Registration" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <script>
        function selectAvatar(imgSrc) {
            document.getElementById("selectedAvatar").value = imgSrc;
            document.getElementById("avatarPreview").src = imgSrc;
        }
    </script>
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
            background-size: cover;
            color: white;
            text-align: center;
            background-color: black;
        }

        .registration-container {
            width: 500px;
            padding: 40px;
            margin: 50px auto;
            border: 4px solid #3B82F6;
            background: rgba(0, 0, 0, 0.9);
            box-shadow: 8px 8px #3B82F6;
        }

        .registration-container h2 {
            color: #3B82F6;
            margin-bottom: 25px;
        }

        .input-field {
            width: 100%;
            padding: 18px;
            margin: 12px 0;
            background: black;
            border: 3px solid #3B82F6;
            color: white;
            text-align: center;
            font-size: 1.1rem;
        }

        .avatar-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            cursor: pointer;
            border: 3px solid #3B82F6;
            transition: 0.3s ease-in-out;
        }

        .avatar:hover {
            transform: scale(1.1);
            border-color: yellow;
        }

        .selected-avatar {
            border-color: yellow !important;
        }

        .checkbox-container {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            font-size: 0.9rem;
        }

        .register-btn {
            width: 100%;
            padding: 18px;
            font-size: 1.2rem;
            color: black;
            background: #3B82F6;
            border: 3px solid #3B82F6;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .register-btn:hover {
            background: black;
            color: #3B82F6;
        }

        .large-header {
            font-size: 2.8rem;
            text-shadow: 4px 4px #0f3460;
            margin: 40px 0;
        }

        .footer {
            padding: 20px;
            border-top: 4px solid white;
            background: rgba(22, 33, 62, 0.9);
            box-shadow: 8px 8px #0f3460;
            margin-top: 60px;
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
    <form id="form1" runat="server">
        <div class="registration-container">
            <h2>User Registration</h2>

            <!-- Avatar Selection Moved Above Full Name -->
            <label>Select Avatar</label>
            <div class="avatar-container">
                <img src="img/UserIcon.jpeg" class="avatar" onclick="selectAvatar('img/UserIcon.jpeg')" />
                <img src="img/UserLoginBG.jpeg" class="avatar" onclick="selectAvatar('img/UserLoginBG.jpeg')" />
                <img src="avatar3.png" class="avatar" onclick="selectAvatar('avatar3.png')" />
            </div>

            <input type="hidden" id="selectedAvatar" runat="server" />
            <img id="avatarPreview" src="" width="80" />

            <script>
                function selectAvatar(src) {
                    document.getElementById("avatarPreview").src = src; // Update preview image
                    document.getElementById("selectedAvatar").value = src; // Store selected avatar
                }

                document.getElementById("avatarInput").addEventListener("change", function (event) {
                    let file = event.target.files[0]; // Get the selected file
                    if (file) {
                        let reader = new FileReader();
                        reader.onload = function (e) {
                            document.getElementById("avatarPreview").src = e.target.result; // Set the image preview
                            document.getElementById("selectedAvatar").value = e.target.result; // Save base64 data (if needed for ASP.NET)
                        };
                        reader.readAsDataURL(file); // Convert image to base64
                    }
                });
            </script>



            <br /><br />

            <!-- Full Name Field -->
            <label>Full Name</label>
            <asp:TextBox ID="txtFname" CssClass="input-field" runat="server"></asp:TextBox>
            <br />

            <label>Contact Number</label>
            <asp:TextBox ID="txtContact" CssClass="input-field" runat="server"></asp:TextBox>
            <br />

            <label>Email</label>
            <asp:TextBox ID="txtEmail" CssClass="input-field" runat="server"></asp:TextBox>
            <br />

            <label>Password</label>
            <asp:TextBox ID="txtPassword" CssClass="input-field" runat="server" TextMode="Password"></asp:TextBox>
            <br />

            <label>Confirm Password</label>
            <asp:TextBox ID="txtCpassword" CssClass="input-field" runat="server" TextMode="Password"></asp:TextBox>
            <br />

            <label>Country</label>
            <asp:DropDownList ID="ddlCountry" CssClass="input-field" runat="server">
                <asp:ListItem Text="Select Country" Value="" />
                <asp:ListItem Text="India" Value="India" />
                <asp:ListItem Text="USA" Value="USA" />
                <asp:ListItem Text="UK" Value="UK" />
            </asp:DropDownList>
            <br />

            <label>Balance</label>
            <asp:TextBox ID="txtBalance" CssClass="input-field" runat="server" Text="0"></asp:TextBox>
            <br />

            <asp:CheckBox ID="chkTerms" runat="server" />
            <label for="chkTerms">I agree to the terms and conditions</label>
            <br />

            <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="register-btn" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>

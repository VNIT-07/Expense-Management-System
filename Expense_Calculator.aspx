<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expense_Calculator.aspx.cs" Inherits="a.Expense_Calculator" %>

<!DOCTYPE html>
<html lang="en">
   <head runat="server">
    <title>Expense Management System - Login</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
     <style>


          .navbar {
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 1000; 
            }

            body {
                padding-top: 56px; 
            }
        .expense-form {
            width: 100%;
            max-width: 450px;
            background: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            margin: 50px auto;
        }

        .expense-form h2 {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }

        .form-control {
            font-size: 14px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-label {
            font-weight: 600;
        }

        .btn-primary {
            width: 100%;
            background-color: #007bff;
            border: none;
            font-size: 16px;
            padding: 10px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        @media (max-width: 500px) {
            .expense-form {
                padding: 20px;
                width: 90%;
            }
        }
        .profile-icon img {
    border-radius: 50%; 
    width: 36px;
    height: 36px;
}

.logout-icon img {
    border-radius: 50%; 
    width: 36px;
    height: 36px;
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
    <!-- From Uiverse.io by elijahgummer --> 

<body class="bg-light">
    <form id="form2">
        
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Expenses.web</a>

        <div class="d-flex align-items-center">
            <a href="/Profile" class="profile-icon me-3">
                <img src="/images/profile.png" alt="Profile">
            </a>

            <a href="/Logout" class="logout-icon">
                <img src="/images/Logout.png">
            </a>
        </div>
    </div>
</nav>



    <form id="form1" runat="server">
        <div class="expense-form">
            <h2>Expense Tracker</h2>
            
            <div class="mb-3">
                <label class="form-label">Name (Expense)</label>
                <asp:TextBox ID="txtExpensName" runat="server" CssClass="form-control" placeholder="Enter expense name"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Price</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter price"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Quantity</label>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" placeholder="Enter Quantity" TextMode="Number"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Expense Created</label>
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">Payment Method</label>
                <asp:DropDownList ID="ddlPayMethod" runat="server" CssClass="form-control">
                    <asp:ListItem>Credit Card</asp:ListItem>
                    <asp:ListItem>Debit Card</asp:ListItem>
                    <asp:ListItem>Cash</asp:ListItem>
                    <asp:ListItem>UPI</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="mb-3">
                <label class="form-label">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter description"></asp:TextBox>
            </div>

            <asp:Button ID="btnAdd" runat="server" Text="Create Expense" CssClass="btn btn-primary" OnClick="btnAdd_Click"/>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

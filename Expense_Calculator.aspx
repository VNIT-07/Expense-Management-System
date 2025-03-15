<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expense_Calculator.aspx.cs" Inherits="a.Expense_Calculator" %>

<!DOCTYPE html>
<html>
<head>
    <title>Expense Management</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap');

        .navbar {
            background: #001a66;
            padding: 15px;
            text-align: left;
        }

         .navbar a {
             color: white;
             text-decoration: none;
             font-size: 14px;
             padding: 10px 20px;
             display: inline-block;
             border: 3px solid white;
             box-shadow: 3px 3px 0px black;
         }

         .navbar a:hover {
             background: white;
             color: black;
         }

        body {
            font-family: 'Press Start 2P', cursive;
            background-color: #f8f8dc;
            text-align: center;
        }

        /* Expense Calculator Header */
        h2 {
            font-size: 20px;
            color: #3B82F6;
            text-shadow: 3px 3px #AAC4F6; /* Light blue shadow */
        }


        .form-container {
            display: inline-block;
            padding: 20px;
            background: #fff;
            border: 3px solid #34568B;
            border-radius: 10px;
            box-shadow: 6px 6px 0px #34568B;
            text-align: center;
            width: 320px;
        }

        input, select {
            display: block;
            width: 90%;
            padding: 10px;
            margin: 10px auto;
            border: 2px solid #34568B;
            font-family: 'Press Start 2P', cursive;
            font-size: 12px;
        }

        h3{
            color: #34568B;
        }

        /* Button Styling */
        .btn {
            background: #34568B;
            color: white;
            border: none;
            padding: 10px;
            width: 95%;
            margin: 5px auto;
            cursor: pointer;
            font-family: 'Press Start 2P', cursive;
            font-size: 12px;
            transition: 0.3s ease-in-out;
            box-shadow: 3px 3px #3B82F6;
        }

        .btn:hover {
            background: white;
            color: #34568B;
            border: 2px solid #34568B;
        }

        .btn-no-color {
            background: none;
            border: 2px solid #34568B;
            color: #34568B;
            padding: 10px;
            width: 95%;
            margin: 5px auto;
            cursor: pointer;
            font-family: 'Press Start 2P', cursive;
            font-size: 12px;
            transition: 0.3s ease-in-out;
        }

        .btn-no-color:hover {
            background: #34568B;
            color: white;
        }

        /* Table Enhancements */
        .table-container {
            margin-top: 20px;
        }

        .table-custom {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            font-family: 'Press Start 2P', cursive;
            font-size: 10px;
            border: 3px solid #34568B;
        }

        .table-custom th, .table-custom td {
            border: 2px solid black;
            padding: 8px;
            text-align: center;
        }

        .table-custom th {
            background: #34568B;
            color: white;
        }

    .btn {
        background: #34568B;
        color: white;
        border: none;
        padding: 10px;
        width: 100%;
        cursor: pointer;
        font-family: 'Press Start 2P', cursive;
        font-size: 12px;
        transition: 0.3s ease-in-out;
        box-shadow: 3px 3px #3B82F6;
    }

    .btn:hover {
        background: white;
        color: #34568B;
        border: 2px solid #34568B;
    }

    .button-container {
    display: flex;
    flex-direction: column;
    align-items: center;
}

    .button-row {
    display: flex;
    justify-content: space-between;
    width: 100%;
    gap: 10px;
}

    /* Fix dropdown height */
    select {
        width: 90%;
    }

        /* Footer */
        .footer {
            margin-top: 20px;
            font-size: 12px;
            background: #34568B;
            color: white;
            padding: 10px;
            box-shadow: 0px -4px 6px rgba(0, 0, 0, 0.1);
        }

        .footer a {
            text-decoration: none;
            color: white;
            transition: 0.3s;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
     <div class="navbar">
     <a href="User_Dashboard.aspx">🔙 Go Back to Dashboard</a>
    </div>
    <form id="form1" runat="server">
        <h2>Expense Management</h2>

        <div class="form-container">
            <h3>Expense Calculator</h3>
            <asp:TextBox ID="txtExpensName" runat="server" Placeholder="Expense Name"></asp:TextBox>
            <asp:TextBox ID="txtPrice" runat="server" Placeholder="Price" TextMode="Number"></asp:TextBox>
            <asp:TextBox ID="txtQuantity" runat="server" Placeholder="Quantity" TextMode="Number"></asp:TextBox>
            <asp:TextBox ID="txtDate" runat="server" Placeholder="dd/mm/yyyy" TextMode="Date"></asp:TextBox>
            <asp:DropDownList ID="ddlPayMethod" runat="server">
                <asp:ListItem Text="Cash" Value="Cash"></asp:ListItem>
                <asp:ListItem Text="Credit Card" Value="Credit Card"></asp:ListItem>
                <asp:ListItem Text="UPI" Value="UPI"></asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtDescription" runat="server" Placeholder="Description"></asp:TextBox>

            <!-- Buttons -->
            <asp:Button ID="btnAdd" runat="server" Text="Create" CssClass="btn" OnClick="btnAdd_Click" />
            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn" OnClick="btnReset_Click" />

            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" OnClick="btnUpdate_Click" Enabled="false" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn" OnClick="btnDelete_Click" Enabled="false" />

        </div>

        <!-- GridView -->
        <div class="table-container">
            <asp:GridView ID="GVData" runat="server" AutoGenerateColumns="False" CssClass="table-custom" OnSelectedIndexChanged="GVData_SelectedIndexChanged">
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Select" />
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="name" HeaderText="Expense Name" />
                    <asp:BoundField DataField="price" HeaderText="Price" />
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="total_amount" HeaderText="Total Amount" />
                    <asp:BoundField DataField="exp_created" HeaderText="Date" />
                    <asp:BoundField DataField="payment_method" HeaderText="Payment Method" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                </Columns>
            </asp:GridView>
        </div>
        <br>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

        <!-- Footer -->
        <div class="footer">
            <p>© 2025 Expense Tracker. All Rights Reserved.</p>
            <p>
                <a href="#">Terms of Service</a> | <a href="#">Privacy Policy</a>
            </p>
        </div>
    </form>
</body>
</html>

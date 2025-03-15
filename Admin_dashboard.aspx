<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="Expense_Tracker.Admin_Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Admin Dashboard - Expense Tracker</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"/>
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&family=Century+Gothic&display=swap" rel="stylesheet"/>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Press Start 2P', cursive;
            background: #F5F5DC; /* Paper Beige */
            color: #333;
            text-align: center;
        }

        .dashboard-header {
            font-size: 2.2rem;
            font-weight: bold;
            color: #3B82F6; /* Deep Blue */
            text-shadow: 4px 4px #AAC4F6; /* Light Blue Shadow */
            margin-bottom: 30px;
        }

        .dashboard-container {
            max-width: 900px;
            margin: 0 auto;
            background: #FFFFFF; /* White */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 8px 8px #3B82F6;
            border: 4px solid #3B82F6;
        }

        .dashboard-container h2 {
            color: #3B82F6;
        }

        .card {
            border-radius: 12px;
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table {
            background: #FFFFFF;
            border: 3px solid #3B82F6;
            font-family: 'Press Start 2P', cursive;
        }

        .btn-danger {
            background: #E74C3C; /* Red */
            border: 2px solid #A93226;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .btn-danger:hover {
            background: white;
            color: #E74C3C;
        }

        .footer {
            padding: 20px;
            border-top: 4px solid #3B82F6;
            background: rgba(200, 200, 200, 0.85);
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
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="dashboard-header">Admin Dashboard</div>
            <h4>Welcome, <asp:Label ID="lblAdminName" runat="server" Text=""></asp:Label></h4>

            <div class="row">
                <div class="col-md-4">
                    <div class="card text-white bg-primary">
                        <div class="card-body">
                            <h5 class="card-title">Total Users</h5>
                            <p class="card-text"><asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Search Bar -->
            <div class="input-group my-3">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click"/>
            </div>

            <div class="table-responsive table-bordered p-3 bg-white">
                <h3>User Management</h3>
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"
                    AutoGenerateColumns="False" DataKeyNames="U_id" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="U_id" HeaderText="User ID" ReadOnly="True" />
                        <asp:BoundField DataField="U_name" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Contact_number" HeaderText="Contact Number" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger btn-sm"
                                    CommandName="DeleteUser" CommandArgument='<%# Eval("U_id") %>'
                                    Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this user?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2025 Expense Tracker. All Rights Reserved.</p>
        <p><a href="terms_of_service.html">Terms of Service</a> | <a href="privacy_policy.html">Privacy Policy</a></p>
    </footer>

</body>
</html>


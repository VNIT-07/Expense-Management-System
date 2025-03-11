<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewExpense.aspx.cs" Inherits="a.ViewExpense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <style>
.gridview-container {
    margin-top: 30px;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.gridview-container table {
    width: 100%;
    border-collapse: collapse;
}

.gridview-container th, .gridview-container td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.gridview-container th {
    background-color: #001a66;
    color: white;
}

    </style>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    <div class="container gridview-container">
    <asp:GridView ID="GVData" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" OnSelectedIndexChanged="GVData_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Expense Name" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="TotalAmount" HeaderText="Amount" />
            <asp:BoundField DataField="Exp_Created" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="Payment_Method" HeaderText="Payment Method" />
            <asp:ButtonField Text="Select" />
            <asp:ButtonField CommandName="Delete" ShowHeader="True" Text="Delete" />
        </Columns>
    </asp:GridView>
</div>
</form>
</body>
</html>

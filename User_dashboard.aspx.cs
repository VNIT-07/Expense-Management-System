using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Expense_Tracker
{
    public partial class User_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["U_id"] == null || !int.TryParse(Session["U_id"].ToString(), out int userId))
                {
                    Response.Redirect("User_Login.aspx");
                }
                else
                {
                    LoadUserData(userId);
                }
            }
        }

        private void LoadUserData(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = @"
                    SELECT U_name, 
                        ISNULL((SELECT SUM(Amount) FROM Expenses WHERE U_id = @U_id), 0) AS TotalExpenses,
                        ISNULL(balance, 0) AS AvailableBalance 
                    FROM User_Registration 
                    WHERE U_id = @U_id";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@U_id", userId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblTotalExpense.Text = reader["TotalExpenses"].ToString();
                        lblAvailableBalance.Text = reader["AvailableBalance"].ToString();
                    }
                }
            }
        }

        protected void btnAddBalance_Click(object sender, EventArgs e)
        {
            if (Session["U_id"] == null || !int.TryParse(Session["U_id"].ToString(), out int userId))
            {
                lblMessage.Text = "User session expired. Please log in again.";
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

            if (decimal.TryParse(txtBalanceAmount.Text, out decimal amount) && amount > 0)
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string updateQuery = "UPDATE User_Registration SET balance = balance + @Amount WHERE U_id = @U_id";

                    using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Amount", amount);
                        cmd.Parameters.AddWithValue("@U_id", userId);
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.Text = "Balance added successfully!";
                LoadUserData(userId);
            }
            else
            {
                lblMessage.Text = "Please enter a valid amount.";
            }
        }
    }
}

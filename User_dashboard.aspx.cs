using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace a
{
    public partial class User_dashboard : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["U_id"] == null || Session["isLogin"] == null || !(bool)Session["isLogin"])
            {
                Response.Redirect("User_Login.aspx");
            }
            else
            {
                int userId = Convert.ToInt32(Session["U_id"]);
                LoadUserDetails(userId);
                LoadExpenseDetails(userId);
            }
        }

        private void LoadUserDetails(int userId)
        {
            string query = "SELECT U_name, Balance FROM User_Registration WHERE U_id = @U_id";

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@U_id", userId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblUserName.Text = reader["U_name"].ToString();
                    lblAvailableBalance.Text = "$" + Convert.ToDecimal(reader["Balance"]).ToString("N2");
                }
                conn.Close();
            }
        }

        private void LoadExpenseDetails(int userId)
        {
            string query = @"
                SELECT 
                    ISNULL(SUM(ExpenseAmount), 0) AS TotalExpense,
                    ISNULL(SUM(CASE WHEN MONTH(ExpenseDate) = MONTH(GETDATE()) THEN ExpenseAmount ELSE 0 END), 0) AS MonthlySpending
                FROM Expenses
                WHERE U_id = @U_id;
";

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@U_id", userId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblTotalExpense.Text = "$" + Convert.ToDecimal(reader["TotalExpense"]).ToString("N2");
                    lblMonthlySpending.Text = "$" + Convert.ToDecimal(reader["MonthlySpending"]).ToString("N2");
                }
                conn.Close();
            }
        }
    }
}

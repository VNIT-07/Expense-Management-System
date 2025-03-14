using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Expense_Tracker
{
    public partial class User_dashboard : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["U_id"] != null && Session["Username"] != null)
                {
                    lblUserName.Text = "Welcome, " + Session["Username"].ToString();
                    LoadUserData(Session["U_id"].ToString());
                }
                else
                {
                    Response.Write("<script>alert('Session expired! Redirecting to login...');</script>");
                    Response.Redirect("User_Login.aspx", true);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
        }

        private void LoadUserData(string userId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string query = @"
                SELECT 
                    (SELECT ISNULL(SUM(ExpenseAmount), 0) FROM Expenses WHERE U_id = @UserId) AS TotalExpense,
                    (SELECT Balance FROM User_Registration WHERE U_id = @UserId) AS Balance,
                    (SELECT ISNULL(SUM(ExpenseAmount), 0) FROM Expenses WHERE U_id = @UserId 
                     AND MONTH(ExpenseDate) = MONTH(GETDATE())) AS MonthlySpending";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            lblTotalExpense.Text = reader["TotalExpense"].ToString();
                            lblAvailableBalance.Text = reader["Balance"] != DBNull.Value ? reader["Balance"].ToString() : "0";
                            lblMonthlySpending.Text = reader["MonthlySpending"].ToString();
                        }
                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                lblTotalExpense.Text = "Error!";
                lblAvailableBalance.Text = "Error!";
                lblMonthlySpending.Text = "Error!";
            }
        }


        protected void btnAddExpense_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(Session["U_id"]);
            decimal expenseAmount = Convert.ToDecimal(txtExpenseAmount.Text);

            decimal userBalance = GetUserBalance(userID);

            if (userBalance >= expenseAmount)
            {
                string updateBalanceQuery = "UPDATE User_Registration SET Balance = Balance - @ExpenseAmount WHERE U_id = @UserID";
                string insertExpenseQuery = "INSERT INTO Expenses (U_id, ExpenseAmount) VALUES (@UserID, @ExpenseAmount)";

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlTransaction transaction = con.BeginTransaction();

                    try
                    {
                        SqlCommand cmd1 = new SqlCommand(updateBalanceQuery, con, transaction);
                        cmd1.Parameters.AddWithValue("@ExpenseAmount", expenseAmount);
                        cmd1.Parameters.AddWithValue("@UserID", userID);
                        cmd1.ExecuteNonQuery();

                        SqlCommand cmd2 = new SqlCommand(insertExpenseQuery, con, transaction);
                        cmd2.Parameters.AddWithValue("@UserID", userID);
                        cmd2.Parameters.AddWithValue("@ExpenseAmount", expenseAmount);
                        cmd2.ExecuteNonQuery();

                        transaction.Commit();
                        Response.Redirect("User_dashboard.aspx");
                    }
                    catch
                    {
                        transaction.Rollback();
                        Response.Write("Something went wrong!");
                    }
                }
            }
            else
            {
                lblMessage.Text = "Insufficient Balance!";
            }
        }

        private decimal GetUserBalance(int userID)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                string query = "SELECT Balance FROM User_Registration WHERE U_id = @UserID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", userID);

                object result = cmd.ExecuteScalar();
                return result != null ? Convert.ToDecimal(result) : 0;
            }
        }
    }
}




using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace a
{
    
    public partial class User_dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        string strcon = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    lblUserName.Text = Session["Username"].ToString();
                    LoadUserData(Session["Username"].ToString());
                }
                else
                {
                    Response.Redirect("User_Login.aspx"); // Redirect if session is null
                }
            }
        }

        private void LoadUserData(string username)
        {
            try
            {
                using (con = new SqlConnection(strcon))
                {
                    con.Open();
                    string query = "SELECT SUM(ExpenseAmount) AS TotalExpense, (SELECT Balance FROM Users WHERE Username = @Username) AS Balance FROM Expenses WHERE Username = @Username";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            lblTotalExpense.Text = reader["TotalExpense"] != DBNull.Value ? reader["TotalExpense"].ToString() : "0";
                            lblAvailableBalance.Text = reader["Balance"] != DBNull.Value ? reader["Balance"].ToString() : "0";
                        }
                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                lblTotalExpense.Text = "Error";
                lblAvailableBalance.Text = "Error";
            }
        }
    }
}

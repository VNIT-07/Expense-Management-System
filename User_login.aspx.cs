using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Expense_Tracker
{
    public partial class User_Login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblError.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string query = "SELECT U_id, U_name, Password FROM User_Registration WHERE Email = @Email AND Password = @Password";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read()) // ✅ User Found
                        {
                            Session["U_id"] = reader["U_id"].ToString();
                            Session["Username"] = reader["U_name"].ToString();
                            reader.Close();
                            Response.Redirect("User_dashboard.aspx"); // ✅ Redirect to Dashboard
                        }
                        else
                        {
                            lblError.Text = "❌ No user found! Check Email and Password.";
                        }

                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "⚠️ Database Error: " + ex.Message;
            }
        }
    }
}

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Expense_Tracker
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        string strconn = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // No session used
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                try
                {
                    conn.Open();
                    string qry = "SELECT COUNT(*) FROM Admin_Login WHERE email = @Email AND password = @Password";

                    using (SqlCommand cmd = new SqlCommand(qry, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                        int result = Convert.ToInt32(cmd.ExecuteScalar());

                        if (result == 0)
                        {
                            Response.Write("❌ Invalid email or password!");
                        }
                        else
                        {
                            // Redirect with email as QueryString
                            Response.Redirect("Admin_Dashboard.aspx?email=" + txtEmail.Text.Trim(), false);
                            Context.ApplicationInstance.CompleteRequest();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("⚠ Error: " + ex.Message);
                }
            }
        }
    }
}

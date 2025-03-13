using System;
using System.Data.SqlClient;
using System.Configuration;

namespace F1
{
    public partial class Login : System.Web.UI.Page
    {
        string strconn = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                Response.Write("<script>alert('Please enter Email and Password.');</script>");
                return;
            }

            string qry = "SELECT U_id FROM User_Registration WHERE Email = @Email AND Password = @Password";

            using (SqlConnection conn = new SqlConnection(strconn))
            {
                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                conn.Open();
                object userId = cmd.ExecuteScalar();
                conn.Close();

                if (userId != null && userId != DBNull.Value)
                {
                    // Store user ID in session
                    Session["U_id"] = Convert.ToInt32(userId);
                    Session["isLogin"] = true;

                    // Debugging Alert: Check if session is set before redirecting
                    Response.Write("<script>alert('Login Successful! User ID: " + userId + "');</script>");
                    Response.Redirect("User_dashboard.aspx", false); // Use false to prevent thread abort
                    Context.ApplicationInstance.CompleteRequest(); // Ensure proper redirection
                }
                else
                {
                    Response.Write("<script>alert('Invalid email or password.');</script>");
                }
            }
        }
    }
}

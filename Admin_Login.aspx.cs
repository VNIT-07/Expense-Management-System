using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace F1
{
    public partial class ADMINLogin : System.Web.UI.Page
    {
        string strconn = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtUsername.Text;
            string password = txtPassword.Text;

            using (SqlConnection conn = new SqlConnection(strconn))
            {
                try
                {
                    conn.Open();

                    string qry = "SELECT COUNT(*) FROM Admin_Login WHERE email = @Email AND password = @Password";

                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    int result = Convert.ToInt32(cmd.ExecuteScalar());

                    if (result == 0)
                    {
                        Response.Write("<script>alert('Invalid login credentials!');</script>");

                    }
                    else
                    {
                        //Response.Write("<script>alert('Redirecting to Home page! Welcome!');</script>");
                        Response.Redirect("Admin_dashboard.aspx");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}
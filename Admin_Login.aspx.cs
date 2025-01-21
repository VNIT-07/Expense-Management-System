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

                    string qry = "SELECT COUNT(*) FROM tbl_Admin_login WHERE email = @Admin_name AND password = @Password";

                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@Admin_name", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    int result = Convert.ToInt32(cmd.ExecuteScalar());

                    if (result == 0)
                    {
                        Response.Write("Invalid login credentials!");
                    }
                    else
                    {
                        MessageBox.Show("Redirecting to Home page! Welcome!");
                        //Response.Redirect("Electronic.aspx");
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
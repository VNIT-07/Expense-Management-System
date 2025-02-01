using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Configuration;
using System.Data;
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
            if (txtUsername.Text == "" || txtEmail.Text == "" || txtPassword.Text == "")
            {
                Response.Write("<script>alert('Missing information');</script>");
            }
            else
            {
                string email = txtEmail.Text;
                string password = txtPassword.Text;

                using (SqlConnection conn = new SqlConnection(strconn))
                {

                    conn.Open();
                    string qry = "SELECT COUNT(*) FROM User_Registration WHERE email=@Email AND password=@Password";

                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);
                    int result = Convert.ToInt16(cmd.ExecuteScalar());

                    if (result == 0)
                    {
                        Response.Write("<script>alert('Invalid login credentials!');</script>");

                    }
                    else
                    {
                        //Response.Write("<script>alert('Redirecting to Home page! Welcome!');</script>");
                        Response.Redirect("User_dashboard.aspx");
                    }
                }
            }
        }
    }
}
    

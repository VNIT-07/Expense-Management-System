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
            string uname = txtUsername.Text;
            string email = txtRegNum.Text;
            string password = txtPassword.Text;

            using (SqlConnection conn = new SqlConnection(strconn))
            {
                try
                {
                    conn.Open();

                    string qry = "SELECT COUNT(*) FROM tbl_User_login WHERE email = @Email AND password = @Password";
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    string ins = "INSERT INTO tbl_User_Login VALUES(@U_name,@Email,@Password)";
                    SqlCommand sd = new SqlCommand(ins, conn);
                    sd.Parameters.AddWithValue("U_name", uname);
                    sd.Parameters.AddWithValue("Email", email);
                    sd.Parameters.AddWithValue("Password", password);
                    sd.ExecuteNonQuery();


                    int result = Convert.ToInt16(cmd.ExecuteScalar()); 

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

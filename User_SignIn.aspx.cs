using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace F1
{
    public partial class User_SignIn : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string email = txtUsername.Text;
            string pass = txtPassword.Text;

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                try
                {
                    conn.Open();

                    //string qry = "SELECT COUNT(*) FROM tbl_User_SignIn WHERE Email=@Email AND Password=@Password";
                    string qry = "SELECT tbl_User_login.*,tbl_User_SignIn.Email FROM tbl_User_login INNER JOIN tbl_User_SignIn ON SELECT tbl_User_login.U_id=tbl_User_SignIn.U_id ";
                  //string qry = "SELECT tblDevice.*,tblBrand.BrandName FROM tblDevice INNER JOIN tblBrand ON tblDevice.b_id=tblBrand.b_id";

                    SqlCommand cmd = new SqlCommand(qry, conn);

                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", pass);

                    int result = Convert.ToInt32(cmd.ExecuteScalar());


                    conn.Close();

                    if (result == 0)
                    {
                        Response.Write("Invalid login credentials!");
                    }
                    else
                    {
                        Response.Redirect("User_Login.aspx");
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

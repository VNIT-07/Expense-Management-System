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

    public partial class User_Registration : System.Web.UI.Page
    {
        string strconn = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            if (txtFname.Text == "" || txtContact.Text == "" || txtEmail.Text == "" || txtPassword.Text == "")
            {
                Response.Write("<script>alert('Missing information');</script>");
                return;
            }
            if (txtPassword.Text != txtCpassword.Text)
            {
                Response.Write("<script>alert('Password and Confirm Password do not match!');</script>");
                return;
            }
            SqlConnection conn = new SqlConnection(strconn);
            string qry = "INSERT INTO User_Registration (U_name,Contact_number,Email,Password,country) VALUES(@U_name,@Contact_number,@Email,@Password,@country)";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@U_name", txtFname.Text);
            cmd.Parameters.AddWithValue("@Contact_number", txtContact.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@country", ddlCountry.SelectedValue);
            conn.Open();
            int log = Convert.ToInt16(cmd.ExecuteNonQuery());
            if (log != 0)
            {
                Response.Write("<script>alert('Registration successful!');</script>");
                Response.Redirect("User_dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Registration failed!');</script>");
            }
            conn.Close();
        }

    }
}
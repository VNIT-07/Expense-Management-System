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
            
            if (txtFname.Text == "" || txtMname.Text == "" || txtLname.Text == "" || txtContact.Text == "" || txtEmail.Text == "" || txtPassword.Text == "" || txtCpassword.Text == "" || ddlCurrency.Text == "" || txtIncomeSource.Text == "")
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
            string qry = "INSERT INTO User_Registration (U_name,Middle_name,Last_name,Contact_number,Email,Password,Currency,Income_source) VALUES(@U_name,@Middle_name,@Last_name,@Contact_number,@Email,@Password,@Currency,@Income_source)";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@U_name", txtFname.Text);
            cmd.Parameters.AddWithValue("@Middle_name", txtMname.Text);
            cmd.Parameters.AddWithValue("@Last_name", txtLname.Text);
            cmd.Parameters.AddWithValue("@Contact_number", txtContact.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@Currency", ddlCurrency.Text);
            cmd.Parameters.AddWithValue("@Income_source", txtIncomeSource.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Registration successful!');</script>");
            Response.Redirect("User_dashboard.aspx");


        }

    }
}
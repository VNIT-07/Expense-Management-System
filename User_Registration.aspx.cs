using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Expense_Tracker
{
    public partial class User_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Page Load Actions
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fullName = txtFname.Text.Trim();
            string contactNumber = txtContact.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtCpassword.Text.Trim();
            string country = ddlCountry.SelectedValue;
            decimal balance = 0;

            if (!decimal.TryParse(txtBalance.Text.Trim(), out balance))
            {
                Response.Write("<script>alert('Invalid Balance Amount!');</script>");
                return;
            }

            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                string checkUserQuery = "SELECT COUNT(*) FROM User_Registration WHERE Email=@Email OR Contact_number=@Contact";
                using (SqlCommand checkCmd = new SqlCommand(checkUserQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);
                    checkCmd.Parameters.AddWithValue("@Contact", contactNumber);
                    int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                    if (count > 0)
                    {
                        Response.Write("<script>alert('Email or Contact Number already exists!');</script>");
                        return;
                    }
                }

                string insertQuery = "INSERT INTO User_Registration (U_name, Contact_number, Email, Password, Country, Balance) " +
                                     "VALUES (@Name, @Contact, @Email, @Password, @Country, @Balance)";
                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", fullName);
                    cmd.Parameters.AddWithValue("@Contact", contactNumber);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Parameters.AddWithValue("@Balance", balance);

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Redirect("User_Login.aspx");
                        Response.Write("<script>alert('Registration Successful!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Registration Failed. Please try again.');</script>");
                    }
                }
            }
        }
    }
}



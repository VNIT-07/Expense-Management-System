using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Expense_Tracker
{
    public partial class User_Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            // Connection string from Web.config
            string connStr = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                int userId = Convert.ToInt32(Session["U_id"]); // Ensure session has a valid user ID

                string query = @"
            SELECT U_name, Email, Contact_number, Country, Avatar 
            FROM User_Registration 
            WHERE U_id = @UserId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblFullName.Text = reader["U_name"].ToString();
                        lblEmail.Text = reader["Email"].ToString();
                        lblContact.Text = reader["Contact_number"].ToString();
                        lblCountry.Text = reader["Country"].ToString();

                        // Set the image path
                        string avatarPath = reader["Avatar"].ToString();
                        if (!string.IsNullOrEmpty(avatarPath))
                        {
                            imgProfile.ImageUrl = avatarPath;  // Assuming it's a valid URL or relative path
                        }
                        else
                        {
                            imgProfile.ImageUrl = "default-avatar.png"; // Default avatar if none is set
                        }
                    }
                    reader.Close();
                }
            }
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_Registration.aspx");
        }
    }
}

        

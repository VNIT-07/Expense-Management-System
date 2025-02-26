using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace a
{
    public partial class Expense_Calculator : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(strcon);
            string qry = "INSERT INTO calculatorDB(name,price,quantity,exp_created,payment_method,description) VALUES(@name,@price,@quantity,@exp_created,@payment_method,@description)";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@name",txtExpensName.Text);
            cmd.Parameters.AddWithValue("@price", txtPrice.Text);
            cmd.Parameters.AddWithValue("@quantity", txtQuantity.Text);
            cmd.Parameters.AddWithValue("@exp_created", txtDate.Text);
            cmd.Parameters.AddWithValue("@payment_method", ddlPayMethod.SelectedValue);
            cmd.Parameters.AddWithValue("@description", txtDescription.Text);

            conn.Open();
            int ok = Convert.ToInt16(cmd.ExecuteNonQuery());
            if (ok != 0)
            {
                Response.Write("Done");
            }
            else
            {
                Response.Write("Done");
            }
                conn.Close();
        }
    }
}
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace a
{
    public partial class Expense_Calculator : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        // ✅ Load Data into GridView
        public void BindGrid()
        {
            conn = new SqlConnection(strcon);
            string qry = "SELECT Id, name, price, quantity, (price * quantity) AS total_amount, exp_created, payment_method, description FROM calculatorDB";

            SqlDataAdapter sda = new SqlDataAdapter(qry, conn);
            DataSet ds = new DataSet();
            conn.Open();
            sda.Fill(ds);
            conn.Close();

            GVData.DataSource = ds.Tables[0].Rows.Count > 0 ? ds : null;
            GVData.DataBind();
        }

        // ✅ Add New Expense
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                conn = new SqlConnection(strcon);
                string qry = "INSERT INTO calculatorDB (name, price, quantity, exp_created, payment_method, description) VALUES (@name, @price, @quantity, @date, @payment, @desc)";
                SqlCommand cmd = new SqlCommand(qry, conn);

                cmd.Parameters.AddWithValue("@name", txtExpensName.Text);
                cmd.Parameters.AddWithValue("@price", Convert.ToDecimal(txtPrice.Text));
                cmd.Parameters.AddWithValue("@quantity", Convert.ToInt32(txtQuantity.Text));
                cmd.Parameters.AddWithValue("@date", txtDate.Text);
                cmd.Parameters.AddWithValue("@payment", ddlPayMethod.SelectedValue);
                cmd.Parameters.AddWithValue("@desc", txtDescription.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblMessage.Text = "Expense added successfully!";
                BindGrid();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        // ✅ Select Data from GridView
        protected void GVData_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GVData.SelectedRow != null)
            {
                GridViewRow row = GVData.SelectedRow;

                txtExpensName.Text = row.Cells[2].Text;
                txtPrice.Text = row.Cells[3].Text;
                txtQuantity.Text = row.Cells[4].Text;
                txtDate.Text = row.Cells[6].Text;
                ddlPayMethod.SelectedValue = row.Cells[7].Text;
                txtDescription.Text = row.Cells[8].Text;

                btnUpdate.Enabled = true;
                btnDelete.Enabled = true;
            }
        }

        // ✅ Update Expense
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (GVData.SelectedRow == null)
                {
                    lblMessage.Text = "Please select a record to update.";
                    return;
                }

                conn = new SqlConnection(strcon);
                string qry = "UPDATE calculatorDB SET name=@name, price=@price, quantity=@quantity, exp_created=@date, payment_method=@payment, description=@desc WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(qry, conn);

                cmd.Parameters.AddWithValue("@id", GVData.SelectedRow.Cells[1].Text);
                cmd.Parameters.AddWithValue("@name", txtExpensName.Text);
                cmd.Parameters.AddWithValue("@price", Convert.ToDecimal(txtPrice.Text));
                cmd.Parameters.AddWithValue("@quantity", Convert.ToInt32(txtQuantity.Text));
                cmd.Parameters.AddWithValue("@date", txtDate.Text);
                cmd.Parameters.AddWithValue("@payment", ddlPayMethod.SelectedValue);
                cmd.Parameters.AddWithValue("@desc", txtDescription.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblMessage.Text = "Expense updated successfully!";
                BindGrid();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        // ✅ Delete Expense
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (GVData.SelectedRow == null)
                {
                    lblMessage.Text = "Please select a record to delete.";
                    return;
                }

                conn = new SqlConnection(strcon);
                string qry = "DELETE FROM calculatorDB WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@id", GVData.SelectedRow.Cells[1].Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                lblMessage.Text = "Expense deleted successfully!";
                BindGrid();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        // ✅ Reset Form Fields
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtExpensName.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtDate.Text = "";
            ddlPayMethod.SelectedIndex = 0;
            txtDescription.Text = "";
        }
    }
}

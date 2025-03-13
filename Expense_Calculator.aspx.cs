using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace a
{
    public partial class Expense_Calculator : System.Web.UI.Page
    {
        SqlConnection conn;
        string strcon = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                BindGrid();
            }
        }

        //insert
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Retrieve values from input controls
            string name = txtExpensName.Text;
            string price = txtPrice.Text;
            string quantity = txtQuantity.Text;
            string date = txtDate.Text;
            string paymentMethod = ddlPayMethod.SelectedValue;

            // Ensure required fields are filled
            if (name == "" || price == "" || quantity == "" || date == "")
            {
                Response.Write("<script>alert('Please fill all fields');</script>");
                return;
            }

            conn = new SqlConnection(strcon);
            
                string query = @"INSERT INTO calculatorDB (Name, Price, Quantity, Exp_Created, Payment_Method) 
                        VALUES (@Name, @Price, @Quantity, @Exp_Created, @Payment_Method)";

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(price));  // Ensure numeric
                cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(quantity));  // Ensure integer
                cmd.Parameters.AddWithValue("@Exp_Created", Convert.ToDateTime(date)); // Ensure date format
                cmd.Parameters.AddWithValue("@Payment_Method", paymentMethod);

                conn.Open();
                cmd.ExecuteNonQuery();
            

            // Refresh GridView to show new data
            BindGrid();

            // Clear input fields
            txtExpensName.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtDate.Text = "";
            ddlPayMethod.SelectedIndex = 0;
        }



        public void BindGrid()
        {
            conn = new SqlConnection(strcon);
            
                string query = "SELECT Id, Name, Price, Quantity, Exp_Created, Payment_Method, (Price * Quantity) AS TotalAmount FROM calculatorDB";

                SqlDataAdapter adpt = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();

                conn.Open();
                adpt.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GVData.DataSource = dt;
                    GVData.DataBind();
                }
                else
                {
                    // If no data, show empty grid with message
                    dt.Rows.Add(dt.NewRow());
                    GVData.DataSource = dt;
                    GVData.DataBind();
                    GVData.Rows[0].Cells.Clear();
                    GVData.Rows[0].Cells.Add(new TableCell { ColumnSpan = dt.Columns.Count, Text = "No records found!", HorizontalAlign = HorizontalAlign.Center });
                }
            
        }





        //update
        protected void btnup_Click(object sender, EventArgs e)
        {
            if (ViewState["SelectedExpenseID"] != null)
            {
                int Id = Convert.ToInt32(ViewState["SelectedExpenseID"]);
                 conn = new SqlConnection(strcon);
                conn.Open();
                string query = "UPDATE calculatorDB SET Name=@Name, Price=@Price, Quantity=@Quantity, Exp_Created=@Exp_Created, Payment_Method=@Payment_Method WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", Id);
                cmd.Parameters.AddWithValue("@Name", txtExpensName.Text);
                cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
                cmd.Parameters.AddWithValue("@Exp_Created", txtDate.Text);
                cmd.Parameters.AddWithValue("@Payment_Method", ddlPayMethod.SelectedValue);
                cmd.ExecuteNonQuery();
                conn.Close();

            BindGrid();
            }
        }

        protected void GVData_SelectedIndexChanged(object sender, EventArgs e)
        {
                GridViewRow selectedRow = GVData.SelectedRow;

                ViewState["SelectedExpenseID"] = GVData.DataKeys[selectedRow.RowIndex].Value;

                txtExpensName.Text = selectedRow.Cells[1].Text.Trim();
                txtPrice.Text = selectedRow.Cells[2].Text.Trim();
                txtQuantity.Text = selectedRow.Cells[3].Text.Trim();
                txtDate.Text = Convert.ToDateTime(selectedRow.Cells[5].Text).ToString("yyyy-MM-dd");
                ddlPayMethod.SelectedValue = selectedRow.Cells[6].Text.Trim();

            
        }

        protected void GVData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GVData.DataKeys[e.RowIndex].Value);

            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string query = "DELETE FROM calculatorDB WHERE Id = @Id";
            SqlCommand cmd = new SqlCommand(query, conn);
                        
            cmd.Parameters.AddWithValue("@Id", id);
            cmd.ExecuteNonQuery();
            BindGrid();
           
        }

    }


}


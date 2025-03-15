using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Configuration;
using System.Text;

namespace a
{
    public partial class Reports : System.Web.UI.Page
    {
        SqlConnection con;
        string strcon = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
                LoadChart();
                Response.Write("<script>console.log('LoadChart() called');</script>");
            }

        }
            public void BindGrid()
        {
            con = new SqlConnection(strcon);
            string qry = "SELECT *, (price * quantity) AS TotalAmount FROM calculatorDB";
            SqlDataAdapter sda = new SqlDataAdapter(qry, con);
            DataSet ds = new DataSet();
            con.Open();
            sda.Fill(ds);
            GVData.DataSource = ds;
            GVData.DataBind();
            con.Close();
        }

        protected void GVData_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GVData.SelectedRow;

            // Retrieve values from the selected row
            string expenseName = row.Cells[1].Text;
            string price = row.Cells[2].Text;
            string quantity = row.Cells[3].Text;
            string totalAmount = row.Cells[4].Text;
            string date = row.Cells[5].Text;
            string paymentMethod = row.Cells[6].Text;
            string description = row.Cells[7].Text;

            // Store selected values in session or display in labels (example)
            Session["SelectedExpense"] = expenseName;
            Response.Write($"Selected Expense: {expenseName}, Price: {price}, Quantity: {quantity}");
        }

        protected void GVData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GVData.SelectedRow;

            int Id = Convert.ToInt32(GVData.DataKeys[e.RowIndex].Value);

            con = new SqlConnection(strcon);
            con.Open();
            string query = " delete from calculatorDB where Id=@Id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("Id", Id);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();
        }

        protected void btnExportCSV_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string qry = "SELECT name, price, quantity, (price * quantity) AS TotalAmount, exp_created, payment_method, description FROM calculatorDB";
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                da.Fill(dt);
            }

            StringBuilder sb = new StringBuilder();
            foreach (DataColumn col in dt.Columns)
            {
                sb.Append(col.ColumnName + ",");
            }
            sb.AppendLine();

            foreach (DataRow row in dt.Rows)
            {
                foreach (var item in row.ItemArray)
                {
                    sb.Append(item.ToString() + ",");
                }
                sb.AppendLine();
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Expenses.csv");
            Response.ContentType = "text/csv";
            Response.Output.Write(sb.ToString());
            Response.Flush();
            Response.End();
        }

        private void LoadChart()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                string qry = "SELECT exp_created, SUM(price * quantity) AS TotalSpent FROM calculatorDB GROUP BY exp_created ORDER BY exp_created";
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                da.Fill(dt);
            }

            string labels = string.Join(",", dt.AsEnumerable().Select(r => "'" + Convert.ToDateTime(r["exp_created"]).ToString("yyyy-MM-dd") + "'"));
            string data = string.Join(",", dt.AsEnumerable().Select(r => r["TotalSpent"].ToString()));

            ClientScript.RegisterStartupScript(this.GetType(), "loadChart", $"loadChart([{labels}], [{data}]);", true);
        }

    }
}




    
       
        

        

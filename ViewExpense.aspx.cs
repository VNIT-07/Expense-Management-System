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

namespace a
{
    public partial class ViewExpense : System.Web.UI.Page
    {
        SqlConnection con;
        string strcon = ConfigurationManager.ConnectionStrings["connection2"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
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

        }
    }
}
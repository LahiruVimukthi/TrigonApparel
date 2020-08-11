using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrigonApparel
{
    public partial class MonthlyAttendanceReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string selall = Request.QueryString["SelAll"];
            Label7.Text = Request.QueryString["ToDate"];
            Label8.Text = Request.QueryString["FromDate"];
            if (selall==null)
            {
                
            }
            int depID = int.Parse(Request.QueryString["DepID"]);
            Label3.Text = Request.QueryString["DepName"];
            Label2.Text = DateTime.Now.Date.ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
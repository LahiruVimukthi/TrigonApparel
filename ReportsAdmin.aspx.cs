using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrigonApparel
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
            
        }

        protected void ButtonDaRep_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("DailyAttendanceSummary.aspx?DepName=" + DropDownListDepDaily.SelectedItem.Text + "&TodayDate=" + TextBox1.Text.ToString()+ "&DepID="+ DropDownListDepDaily.SelectedItem.Value);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                Response.Redirect("MonthlyAttendanceReport.aspx?DepName=" + DropDownList1.SelectedItem.Text + "&FromDate=" + TextBoxFdate.Text.ToString() + "&DepID=" + DropDownList1.SelectedItem.Text + "&ToDate=" + TextBoxTdate.Text.ToString() + "&SelAll="+"All");
            }
            else
            {
                Response.Redirect("MonthlyAttendanceReport.aspx?DepName=" + DropDownList1.SelectedItem.Text + "&FromDate=" + TextBoxFdate.Text.ToString() + "&DepID=" + DropDownList1.SelectedItem.Value + "&ToDate=" + TextBoxTdate.Text.ToString());
            }
    
        }
    }
}
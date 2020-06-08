using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

namespace TrigonApparel
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        private const string V = "Updated";
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private DataTable socialEvents;
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                GridViewApproveLeave.DataBind();
                GridViewAttToFrom.DataBind();
            }

            GridViewAttToFrom.DataBind();
            LoadLeaveDates();

        }
        private void LoadLeaveDates()
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Select Req_Date, Req_Description from Leaves WHERE Employee_ID='"+TextBoxSearchEmpIDApprove.Text+"'", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            socialEvents = ds.Tables[0];
        }

        protected void ButtonApproveLeaves_Click(object sender, EventArgs e)
        {

            foreach (GridViewRow row in GridViewApproveLeave.Rows)
            {
                CheckBox status = (row.Cells[3].FindControl("CheckBoxSelectReq") as CheckBox);
                int applicationid = Convert.ToInt32(row.Cells[1].Text);
                if (status.Checked)
                {
                    updaterow(applicationid, "Approved");
                    
                    Label2.Text = V;

                }


                GridViewApproveLeave.DataBind();



            }
            void updaterow(int applicationID, string Req_Status)
            {
                try
                {

                    SqlConnection con = new SqlConnection(strcon);
                    string squery = "UPDATE dbo.[Leaves] set Req_Status='" + Req_Status + "' where Employee_ID='" + applicationID + "'";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = squery;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    con.Close();


                }
                catch (Exception ex)
                {
                    Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

                }
            }
        }

        protected void GridViewApproveLeave_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CalendarApproveLeaves_SelectionChanged(object sender, EventArgs e)
        {
            System.Data.DataView view = socialEvents.DefaultView;
            view.RowFilter = String.Format(
                              "Req_Date >= #{0}# AND Req_Date < #{1}#",
                              CalendarApproveLeaves.SelectedDate.ToShortDateString(),
                               CalendarApproveLeaves.SelectedDate.AddDays(1).ToShortDateString()
                           );

            if (view.Count > 0)
            {
                GridViewTest.Visible = true;
                GridViewTest.DataSource = view;
                GridViewTest.DataBind();
            }
            else
            {
                GridViewTest.Visible = false;
            }
        }

        protected void CalendarApproveLeaves_DayRender(object sender, DayRenderEventArgs e)
        {
            DataRow[] rows = socialEvents.Select(
                  String.Format(
                     "Req_Date >= #{0}# AND Req_Date < #{1}#",
                     e.Day.Date.ToShortDateString(),
                     e.Day.Date.AddDays(1).ToShortDateString()
                  )
               );
            foreach (DataRow row in rows)
            {
                System.Web.UI.WebControls.Image image;
                image = new System.Web.UI.WebControls.Image();
                image.ImageUrl = this.ResolveUrl("Dot.jpg");
                image.ToolTip = row["Req_Description"].ToString();
                // e.Cell.Controls.Add(image);  
                e.Cell.BackColor = Color.Aqua;
                e.Cell.ForeColor = Color.White;
            }
        }

        protected void LeadEmpID_Click(object sender, EventArgs e)
        {
           
        }

        

        protected void GridViewAttToFrom_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonLeavesLoad_Click1(object sender, EventArgs e)
        {
            LoadLeaves();
        }
        void LoadLeaves()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                string squery = "Select User_Registrations.Employee_ID, F_Name, Req_Date from dbo.[User_Registrations] JOIN dbo.[Leaves] ON Leaves.Employee_ID= User_Registrations.Employee_ID JOIN dbo.[Department] ON User_Registrations.Dep_ID=Department.Dep_ID  Where Department.Dep_ID='" + DropDownListLeavesByDep.SelectedItem.Value + "' AND  Leaves.Req_Status='Approved' AND Leaves.Req_Date between '" + TextBoxLeavesFrom.Text + "' AND '" + TextBoxLeavesTo.Text + "'";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand(squery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridViewAttToFrom.DataSource = dt;
                GridViewAttToFrom.DataBind();


                con.Close();




            }
            catch (Exception ex)
            {
                Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

            }
        }

        protected void ButtonImport_Click(object sender, EventArgs e)
        {
          
            ExportGridToExcel();
        }
       
        private void ExportGridToExcel()
        {
            Response.ClearContent();
            
            Response.AppendHeader("content-disposition","attachment; filename=LeavesSummary.xls");
            Response.ContentType = "application/excel";
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
            GridViewAttToFrom.RenderControl(htmlTextWriter);
            Response.Write(stringWriter.ToString());
            Response.End();
          

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

    }
}
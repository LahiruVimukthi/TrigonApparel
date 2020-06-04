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

namespace TrigonApparel
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private DataTable socialEvents;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadLeaveDates();

            if (!IsPostBack)
            {
                GridViewApproveLeave.DataBind();
            }

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
                    status = null;
                    Label2.Text = "Updated";

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
                              "EventDate >= #{0}# AND EventDate < #{1}#",
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
                     "Req_Date >= #{0}# AND Req_date < #{1}#",
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
    }
}
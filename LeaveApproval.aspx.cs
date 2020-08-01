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
        private const string V = "Approved";
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private DataTable socialEvents;
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                GridViewApproveLeave.DataBind();
               
            }

          
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
                string EmployeeID =(row.Cells[1].Text);
                if (status.Checked)
                {
                    updaterow(EmployeeID, "Approved");
                    
                    Label2.Text = V;

                }


                GridViewApproveLeave.DataBind();



            }
            void updaterow(string EmployeeID, string Req_Status)
            {
                try
                {

                    SqlConnection con = new SqlConnection(strcon);
                    string squery = "UPDATE dbo.[Leaves] set Req_Status='" + Req_Status + "' where Employee_ID='" + EmployeeID + "'";
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
           
        }
      

        protected void ButtonImport_Click(object sender, EventArgs e)
        {

          
        }
       
       
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void ButtonDeclineLeaves_Click(object sender, EventArgs e)
        {
        }

        protected void DropDownListDeclineReason_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonDecSubmit_Click(object sender, EventArgs e)
        {
            if (DropDownListDeclineReason.SelectedItem.Text=="Other")
            {
                foreach (GridViewRow row in GridViewApproveLeave.Rows)
                {
                    CheckBox status = (row.Cells[3].FindControl("CheckBoxSelectReq") as CheckBox);
                    string EmployeeID =(row.Cells[1].Text);
                    if (status.Checked)
                    {
                        updateNewrow(EmployeeID, "Declined");

                        Label2.Text = V;

                    }
                   


                    GridViewApproveLeave.DataBind();



                }
            }

            else
            {
                foreach (GridViewRow row in GridViewApproveLeave.Rows)
                {
                    CheckBox status = (row.Cells[3].FindControl("CheckBoxSelectReq") as CheckBox);
                    string EmployeeID =(row.Cells[1].Text);
                    if (status.Checked)
                    {
                        updaterow(EmployeeID, "Declined");

                        Label2.Text = V;

                    }
                    

                    GridViewApproveLeave.DataBind();



                }
              

            }
            void updaterow(string EmployeeID, string Req_Status)
            {
                try
                {

                    SqlConnection con = new SqlConnection(strcon);
                    string squery = "UPDATE dbo.[Leaves] set Req_Status='" + Req_Status + "',Decline_ID='" + DropDownListDeclineReason.SelectedItem.Value + "' where Employee_ID='" + EmployeeID + "'";
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


            void updateNewrow(string EmployeeID, string Req_Status)
            {
                try
                {

                    SqlConnection con = new SqlConnection(strcon);
                    string squery = "UPDATE dbo.[Leaves] set Req_Status='" + Req_Status + "', Decline_ID='"+DropDownListDeclineReason.SelectedItem.Value+ "' where Employee_ID='" + EmployeeID + "'";
                    string squery2 = "INSERT to dbo.[LeaveDeclineDes] Dec_Description values Dec_Description='"+TextBoxOther.Text+"'";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = squery;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();

                    SqlCommand cmd2 = new SqlCommand();
                    cmd2.CommandText = squery;
                    cmd2.Connection = con;
                    cmd2.ExecuteNonQuery();
                    con.Close();


                }
                catch (Exception ex)
                {
                    Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

                }
            }
        }

        protected void GridViewTest_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonLoadleaves_Click(object sender, EventArgs e)
        {
           GetCurrentLeaves();
        }

        void GetCurrentLeaves()
        {

            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("Select * from Leaves where Dep_ID='" + DropDownListDept.SelectedItem.Value + "' AND Req_Status='Approved' AND Req_Date='"+TextBoxDate.Text+"'", con);
            SqlDataAdapter ap = new SqlDataAdapter(cmd.CommandText, con);
            con.Open();
            DataSet ds = new DataSet();
            ap.Fill(ds);
            LabelCur.Text = "Today: " + ds.Tables[0].Rows.Count.ToString() + " Leaves";

            SqlCommand cmd2 = new SqlCommand("Select * from User_Registrations where Dep_ID='" + DropDownListDept.SelectedItem.Value + "'", con);
            SqlDataAdapter ap2 = new SqlDataAdapter(cmd2.CommandText, con);
            DataSet ds2 = new DataSet();
            ap2.Fill(ds2);
            LabelTot.Text = "Total Line Workers : " + ds2.Tables[0].Rows.Count.ToString();


            con.Close();
        }
    }
}
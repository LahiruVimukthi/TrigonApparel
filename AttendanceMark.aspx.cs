using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TrigonApparel
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void DropDownListAttJob_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {

                SqlConnection con = new SqlConnection(strcon);
                string squery = "Select F_Name, [User_Registrations].Employee_ID from dbo.[User_Registrations] JOIN dbo.[Department] ON Department.Dep_ID= User_Registrations.Dep_ID  Where Department.Dep_ID= '" + DropDownListAtJob.SelectedItem.Value + "'";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand(squery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridViewAttDep.DataSource = dt;
                GridViewAttDep.DataBind();


                con.Close();




            }
            catch (Exception ex)
            {
                Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

            }
            LeaveHistory();
        }

        protected void ButtonLoadAtt_Click(object sender, EventArgs e)
        {


        }

        protected void DropDownList1Test_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewAttDep_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBoxSelectAtt_CheckedChanged(object sender, EventArgs e)
        {




        }



        protected void ButtonLeavesLoad_Click1(object sender, EventArgs e)
        {

        }

        protected void GridViewAttToFrom_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownListAttByDep_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Employee_ID"), new DataColumn("CheckStatus"), new DataColumn("Att_Time"), new DataColumn("Dep_ID"), new DataColumn("At_Date") });
            foreach (GridViewRow row in GridViewAttDep.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("CheckBoxSelectAtt") as CheckBox);
                    if (chkRow.Checked)
                    {
                        LinkButton EID = (LinkButton)row.FindControl("LinkButton1");
                        string Employee_ID = EID.Text;
                        DropDownList Status = (DropDownList)row.FindControl("DropDownListAttStatus");
                        string CStatus = Status.SelectedItem.Text;
                        TextBox AtTime = (TextBox)row.FindControl("TextBoxAttDateTime");
                        string time = AtTime.Text;
                        int DepID = int.Parse(DropDownListAtJob.SelectedItem.Value);
                        string date = TextBoxAttDate.Text.ToString();
                        dt.Rows.Add(Employee_ID, CStatus, time, DepID, date);

                    }

                }
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                foreach (GridViewRow gvrow in GridView1.Rows)
                {
                    string squery = "INSERT INTO [dbo].[Attendance] (CheckStatus,Employee_ID,Dep_ID,CheckIn_Time,At_Date) VALUES(@CheckStatus,@Employee_ID,@Dep_ID,@CheckIn_Time,@At_Date)";
                    string supdate = "UPDATE [dbo].[Attendance] SET CheckOut_Time=@CheckOut_Time WHERE Employee_ID='"+ gvrow.Cells[0].Text + "' AND At_Date='"+ gvrow.Cells[1].Text + "'";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    
                    if (gvrow.Cells[2].Text=="CheckIn")
                    {
                        SqlCommand cmd = new SqlCommand(squery, con);
                        cmd.Parameters.AddWithValue("@CheckIn_Time", gvrow.Cells[3].Text);
                        cmd.Parameters.AddWithValue("@At_Date", gvrow.Cells[1].Text);
                        cmd.Parameters.AddWithValue("@Employee_ID", gvrow.Cells[0].Text);
                        cmd.Parameters.AddWithValue("@Dep_ID", int.Parse(gvrow.Cells[4].Text));
                        cmd.Parameters.AddWithValue("@CheckStatus", gvrow.Cells[2].Text);

                        cmd.ExecuteNonQuery();
                       
                    }
                    else 
                    {
                       
                        SqlCommand cmd2 = new SqlCommand(supdate, con);
                        cmd2.Parameters.AddWithValue("@CheckOut_Time", gvrow.Cells[3].Text);
                      
                        cmd2.ExecuteNonQuery();
                        
                    }
                    con.Close();



                }
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void LeaveHistory()
        {
            string squery = "SELECT Leaves.Employee_ID,Req_Status ,F_Name from [dbo].[Leaves] JOIN User_Registrations ON Leaves.Employee_ID= User_Registrations.Employee_ID WHERE Req_Status='Pending' OR Req_Status='Approved' AND Leaves.Dep_ID='"+DropDownListAtJob.SelectedItem.Value+"' AND Req_Date='"+TextBoxAttDate.Text.ToString()+"'";
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand com = new SqlCommand(squery,con);
            SqlDataAdapter sda = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
    }
}
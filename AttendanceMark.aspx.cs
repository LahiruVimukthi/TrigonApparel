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

            int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            TextBoxAttEmpID.Text = GridViewAttDep.Rows[rowind].Cells[2].Text;
            TextBoxAttEmpName.Text = GridViewAttDep.Rows[rowind].Cells[1].Text;

          
            
        }

        protected void ButtonAddAtt_Click(object sender, EventArgs e)
        {
            if (DropDownListAttStatus.SelectedItem.Value == "1")
            {
                try
                {


                    string squery = " INSERT INTO [dbo].[Attendance] (Employee_ID,At_Date,Att_Time, CheckStatus) VALUES (@Employee_ID,@At_Date,@Att_Time, @CheckStatus)";
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand(squery, con);
                    cmd.Parameters.AddWithValue("@Employee_ID", TextBoxAttEmpID.Text.Trim());
                    cmd.Parameters.AddWithValue("@At_Date", TextBoxAttDate.Text.ToString());
                    cmd.Parameters.AddWithValue("@Att_Time", TextBoxAttDateTime.Text.Trim());
                    cmd.Parameters.AddWithValue("@CheckStatus", DropDownListAttStatus.SelectedItem.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    TextBoxAttEmpID.Text = "";
                    TextBoxAttEmpName.Text = "";



                    Response.Write("<script>alert('Attendance Marked');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }

            else if (DropDownListAttStatus.SelectedItem.Value=="2")
            {
                try
                {


                    string squery = " INSERT INTO [dbo].[Attendance] (Employee_ID,At_Date,Att_Time, CheckStatus) VALUES (@Employee_ID,@At_Date,@Att_Time, @CheckStatus)";
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand(squery, con);
                    cmd.Parameters.AddWithValue("@Employee_ID", TextBoxAttEmpID.Text.Trim());
                    cmd.Parameters.AddWithValue("@At_Date", TextBoxAttDate.Text.ToString());
                    cmd.Parameters.AddWithValue("@Att_Time", TextBoxAttDateTime.Text.Trim());
                    cmd.Parameters.AddWithValue("@CheckStatus", DropDownListAttStatus.SelectedItem.Text.Trim());

                    cmd.ExecuteNonQuery();
                    con.Close();
                    TextBoxAttEmpID.Text = "";
                    TextBoxAttDate.Text = "";



                    Response.Write("<script>alert('Attendance Marked');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            
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
    }
}
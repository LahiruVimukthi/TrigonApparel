using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrigonApparel
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownListAttRepByDep_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

      

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (DropDownListReqStatus.SelectedItem.Text == "Approved")
            {
                try
                {

                    SqlConnection con = new SqlConnection(strcon);
                    string squery = "Select F_Name, [User_Registrations].Employee_ID, Req_Date from dbo.[User_Registrations] JOIN dbo.[Department] ON Department.Dep_ID= User_Registrations.Dep_ID JOIN dbo.Leaves ON Leaves.Employee_ID= User_Registrations.Employee_ID Where Department.Dep_ID= '" + DropDownList1.SelectedItem.Value + "' AND Req_Status='Approved' AND Req_Date between '" + TextBox1.Text + "' AND '" + TextBox2.Text + "'";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                    SqlCommand cmd = new SqlCommand(squery, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    GridViewLeaveRep.DataSource = dt;
                    GridViewLeaveRep.DataBind();


                    con.Close();




                }
                catch (Exception ex)
                {
                    Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

                }
            }

            else if (DropDownListReqStatus.SelectedItem.Text == "Declined")
            {
                try
                {

                    SqlConnection con = new SqlConnection(strcon);
                    string squery = "Select F_Name, [User_Registrations].Employee_ID, Req_Date from dbo.[User_Registrations] JOIN dbo.[Department] ON Department.Dep_ID= User_Registrations.Dep_ID JOIN dbo.Leaves ON Leaves.Employee_ID= User_Registrations.Employee_ID Where Department.Dep_ID= '" + DropDownList1.SelectedItem.Value + "' AND Req_Status='Declined' AND Req_Date between '" + TextBox1.Text + "' AND '" + TextBox2.Text + "'";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                    SqlCommand cmd = new SqlCommand(squery, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    GridViewLeaveRep.DataSource = dt;
                    GridViewLeaveRep.DataBind();


                    con.Close();




                }
                catch (Exception ex)
                {
                    Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

                }
            }
            else if (DropDownListReqStatus.SelectedItem.Text == "Pending")
            {
                try
                {

                    SqlConnection con = new SqlConnection(strcon);
                    string squery = "Select F_Name, [User_Registrations].Employee_ID, Req_Date from dbo.[User_Registrations] JOIN dbo.[Department] ON Department.Dep_ID= User_Registrations.Dep_ID JOIN dbo.Leaves ON Leaves.Employee_ID= User_Registrations.Employee_ID Where Department.Dep_ID= '" + DropDownList1.SelectedItem.Value + "' AND Req_Status='Pending' AND Req_Date between '" + TextBox1.Text + "' AND '" + TextBox2.Text + "'";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                    SqlCommand cmd = new SqlCommand(squery, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    GridViewLeaveRep.DataSource = dt;
                    GridViewLeaveRep.DataBind();


                    con.Close();




                }
                catch (Exception ex)
                {
                    Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

                }
            }

        }

        protected void ButtonAttLoad_Click(object sender, EventArgs e)
        {
            if (DropDownListCheckINOut.SelectedItem.Value == "1")
            {
                try
                {

                    SqlConnection con = new SqlConnection(strcon);

                    string squery = "Select User_Registrations.Employee_ID, F_Name, At_Date, Att_Time from dbo.[User_Registrations] JOIN dbo.[Attendance] ON Attendance.Employee_ID= User_Registrations.Employee_ID JOIN dbo.[Department] ON User_Registrations.Dep_ID=Department.Dep_ID  Where Department.Dep_ID='" + DropDownListAttRepByDep.SelectedItem.Value + "' AND Attendance.CheckStatus='" + DropDownListCheckINOut.SelectedItem.Text + "' AND Attendance.At_Date between '" + TextBoxAttFromDate.Text + "' AND '" + TextBoxToDate.Text + "'";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                    SqlCommand cmd = new SqlCommand(squery, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    GridView1AttRepToFrom.DataSource = dt;
                    GridView1AttRepToFrom.DataBind();


                    con.Close();




                }
                catch (Exception ex)
                {
                    Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

                }


            }
            else if (DropDownListCheckINOut.SelectedItem.Value == "2")
            {
                try
                {

                    SqlConnection con = new SqlConnection(strcon);

                    string squery = "Select User_Registrations.Employee_ID, F_Name, At_Date, Att_Time from dbo.[User_Registrations] JOIN dbo.[Attendance] ON Attendance.Employee_ID= User_Registrations.Employee_ID JOIN dbo.[Department] ON User_Registrations.Dep_ID=Department.Dep_ID  Where Department.Dep_ID='" + DropDownListAttRepByDep.SelectedItem.Value + "' AND Attendance.CheckStatus='" + DropDownListCheckINOut.SelectedItem.Text + "' AND Attendance.At_Date between '" + TextBoxAttFromDate.Text + "' AND '" + TextBoxToDate.Text + "'";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                    SqlCommand cmd = new SqlCommand(squery, con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    GridView1AttRepToFrom.DataSource = dt;
                    GridView1AttRepToFrom.DataBind();


                    con.Close();




                }
                catch (Exception ex)
                {
                    Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

                }
            }
        }

        protected void DropDownListDep2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonLoad_Click(object sender, EventArgs e)
        {
           
        }
        
    }
}
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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void CalendarLeaveReq_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxLeaveDate.Text = CalendarLeaveReq.SelectedDate.ToShortDateString();
        }

        protected void ButtonSubmitLeavReq_Click(object sender, EventArgs e)
        {
            submitRequest();
            SubmitLeaveGrid();
        }
        void submitRequest()
        {
            try
            {
                string aprvstatus = string.Empty;


                if (CheckBoxLeaveReq.Checked)
                {
                    aprvstatus = "Pending";
                }
                else
                {
                    Response.Write("<script>alert('Please tick the checkbox');</script>");
                }
                string squery = "INSERT INTO [dbo].Leaves(Employee_ID,Req_Date,Req_Description,Req_Status) VALUES (@Employee_ID,@Req_Date,@Req_Description,@Req_Status)";
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(squery, con);
                cmd.Parameters.AddWithValue("Employee_ID", TextBoxLeaveEmpID.Text.Trim());
                cmd.Parameters.AddWithValue("Req_Date", CalendarLeaveReq.SelectedDate.ToString("yyyy/MM/dd"));
                cmd.Parameters.AddWithValue("Req_Description", TextBoxLeaveDes.Text.Trim());
                cmd.Parameters.AddWithValue("Req_Status", aprvstatus);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('request Successful');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void SubmitLeaveGrid()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT Employee_ID,Req_Date,Req_Status,Req_Description FROM dbo.[Leaves] ";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand(squery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridViewLeaveReq.DataSource = dt;
                GridViewLeaveReq.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

            }
        }


        protected void TextBoxLeaveDate_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void GridViewReqLeave_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewLeaveReq_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
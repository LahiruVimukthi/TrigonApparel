using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace TrigonApparel
{
    public partial class DailyAttendanceSummary : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Label1.Text = Request.QueryString["TodayDate"];
            Label6.Text= Request.QueryString["DepName"];
           int depID = int.Parse(Request.QueryString["DepID"]);
            Label2.Text = DateTime.Now.Date.ToString();
            GetEmpList(Label1.Text, depID);
            getAbsentCount(Label1.Text, depID);
        }
        void GetEmpList(string TodayDate, int DepID)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT Attendance.Employee_ID,User_Registrations.F_Name,Attendance.CheckIn_Time,Attendance.CheckOut_Time FROM Attendance JOIN User_Registrations ON User_Registrations.Employee_ID=Attendance.Employee_ID JOIN Department ON Attendance.Dep_ID=Department.Dep_ID WHERE Attendance.Dep_ID='"+ DepID + "' AND Attendance.At_Date='"+ TodayDate + "'";
                SqlCommand cmd = new SqlCommand(squery,con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void getAbsentCount(string TodayDate, int DepID)
        {
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("Select * from User_Registrations where Dep_ID='" + DepID + "'", con);
            SqlCommand cmd2 = new SqlCommand("Select * from Leaves where Dep_ID='" + DepID + "' AND Req_Date='"+ TodayDate + "' AND Req_Status='Approved'", con);
            SqlCommand cmd3 = new SqlCommand("Select * from Attendance where Dep_ID='" + DepID + "' AND At_Date='" + TodayDate + "'", con);


            SqlDataAdapter ap = new SqlDataAdapter(cmd.CommandText, con);
            SqlDataAdapter ap2 = new SqlDataAdapter(cmd2.CommandText, con);
            SqlDataAdapter ap3 = new SqlDataAdapter(cmd3.CommandText, con);
            con.Open();
            DataSet ds = new DataSet();
            DataSet ds2 = new DataSet();
            DataSet ds3 = new DataSet();
            ap.Fill(ds);
            ap2.Fill(ds2);
            ap3.Fill(ds3); 
            Label3.Text = ds.Tables[0].Rows.Count.ToString();
            Label5.Text= ds3.Tables[0].Rows.Count.ToString();
            int Absent = int.Parse(ds.Tables[0].Rows.Count.ToString()) - int.Parse(ds3.Tables[0].Rows.Count.ToString());
            Label4.Text = Absent.ToString();
            Label7.Text=ds2.Tables[0].Rows.Count.ToString(); 

        }
        
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            pdfDownload();
        }
        void pdfDownload()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=DailyAttendanceSummary.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }

    

}
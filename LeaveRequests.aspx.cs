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
        int dep;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GridViewLeaveReq.DataBind();
                TextBoxEmID.Text = "";
                TextBoxNam.Text = "";
                

            }
        }

        protected void CalendarLeaveReq_SelectionChanged(object sender, EventArgs e)
        {
           
            string sdates= CalendarLeaveReq.SelectedDate.ToShortDateString();
            ListBox1.Items.Add(sdates);
        }

        protected void ButtonSubmitLeavReq_Click(object sender, EventArgs e)
        {
            submitRequest();
            SubmitLeaveGrid();
            
            TextBoxLeaveDes.Text = "";
            TextBoxLeaveEmpID.Text = "";
            CheckBoxLeaveReq.Checked = false;
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
                if (Page.IsPostBack) {
                    foreach (ListItem row in ListBox1.Items)
                    {
                        string sdates = row.Value;
                        row.Selected = true;
                        string squery = "INSERT INTO [dbo].Leaves(Employee_ID,Req_Date,Req_Description,Req_Status,Dep_ID) VALUES (@Employee_ID,@Req_Date,@Req_Description,@Req_Status,@Dep_ID)";
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        if (TextBoxDep.Text == "Finishing")
                        {
                            dep = 3;
                        }
                        else if (TextBoxDep.Text == "Cutting")
                        {
                            dep = 1;
                        }
                        else
                        {
                            dep = 2;
                        }
                        SqlCommand cmd = new SqlCommand(squery, con);
                        cmd.Parameters.AddWithValue("Employee_ID", TextBoxLeaveEmpID.Text.Trim());
                        cmd.Parameters.AddWithValue("Req_Date", sdates);
                        cmd.Parameters.AddWithValue("Req_Description", TextBoxLeaveDes.Text.Trim());
                        cmd.Parameters.AddWithValue("Req_Status", aprvstatus);
                        cmd.Parameters.AddWithValue("Dep_ID", dep);
                        cmd.ExecuteNonQuery();

                        con.Close();
                        

                    }
                    Response.Write("<script>alert('request Successful');</script>");
                    
                    TextBoxEmID.Text = "";
                    TextBoxNam.Text = "";
                    ListBox1.Items.Clear();
                }
                    
              

               

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
        void GetApprovedLeaves()
        {
          
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("Select * from Leaves where MONTH(Req_Date)='"+DateTime.Now.Month+"' AND Employee_ID='" + TextBoxLeaveEmpID.Text + "' AND Req_Status='Approved'",con);
            SqlDataAdapter ap = new SqlDataAdapter(cmd.CommandText, con);
            con.Open();
            DataSet ds = new DataSet();
            ap.Fill(ds);
            LabelAvaDates.Text="Leaves Taken on " + DateTime.Now.ToString("MMMM")+":" + ds.Tables[0].Rows.Count.ToString();
          

            con.Close();
        }
        void GetPendingLeaves()
        {

            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("Select * from Leaves where MONTH(Req_Date)='" + DateTime.Now.Month + "' AND Employee_ID='" + TextBoxLeaveEmpID.Text + "' AND Req_Status='Pending'",con);
            SqlDataAdapter ap = new SqlDataAdapter(cmd.CommandText, con);
            con.Open();
            DataSet ds = new DataSet();
            ap.Fill(ds);
            LabelPendingDates.Text = "Pending Leaves for "+ DateTime.Now.ToString("MMMM")+":" + ds.Tables[0].Rows.Count.ToString();


            con.Close();
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
        void LoadEmpName()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "Select F_Name, Department_Name from User_Registrations WHERE Employee_ID='" + TextBoxLeaveEmpID.Text + "'";
                SqlCommand com = new SqlCommand(squery, con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader reader = com.ExecuteReader();

                if (reader.Read())

                {
                    Empname.Text = reader["F_Name"].ToString();
                    TextBoxDep.Text = reader["Department_Name"].ToString();


                    reader.Close();

                    con.Close();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void ButtonLoad_Click(object sender, EventArgs e)
        {
            LoadEmpName();
            GetApprovedLeaves();
            GetPendingLeaves();
            AssetHistory();
        }

        protected void ButtonHDLoad_Click(object sender, EventArgs e)
        {
            
        }
        
        void submitHDRequest()
        {
            try
            {
                string aprvstatus = string.Empty;


                if (CheckBoxHDleave.Checked)
                {
                    aprvstatus = "Pending";
                }
                else
                {
                    Response.Write("<script>alert('Please tick the checkbox');</script>");
                }
                string squery = "INSERT INTO [dbo].ShortLeaves(Employee_ID,ToTime,FromTime, SL_Date, Req_Description,Req_Status) VALUES (@Employee_ID,@ToTime,@FromTime, @SL_Date, @Req_Description,@Req_Status)";
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(squery, con);
                cmd.Parameters.AddWithValue("Employee_ID", TextBoxEmID.Text.Trim());
                cmd.Parameters.AddWithValue("FromTime", TextBoxFrTime.Text.Trim());          
                cmd.Parameters.AddWithValue("ToTime", TextBoxToTime.Text.Trim());
                cmd.Parameters.AddWithValue("SL_Date", Calendar1.SelectedDate.ToString("yyyy/MM/dd"));
                cmd.Parameters.AddWithValue("Req_Description", TextBox5.Text.Trim());
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

        protected void Button2_Click(object sender, EventArgs e)
        {
          
            submitHDRequest();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox4.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void ButtonHDLoad_Click1(object sender, EventArgs e)
        {
        }
        

        protected void ButtonHDLLoad_Click(object sender, EventArgs e)
        {

            LoadEmpNameHD(); ;
        }
        void LoadEmpNameHD()
        {
            
            
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    string squery = "Select F_Name, Department_Name from User_Registrations WHERE Employee_ID='" + TextBoxEmID.Text + "'";
                    SqlCommand com = new SqlCommand(squery, con);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlDataReader reader = com.ExecuteReader();

                    if (reader.Read())

                    {
                       TextBoxNam.Text = reader["F_Name"].ToString();
                        TextBoxDept.Text = reader["Department_Name"].ToString();


                        reader.Close();

                        con.Close();

                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        void AssetHistory()
        {
            string squery = "SELECT Req_Date,Req_Status,Req_Description from [dbo].[Leaves] WHERE Employee_ID='"+ TextBoxLeaveEmpID .Text+ "'";
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand com = new SqlCommand(squery, con);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter sda = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            GridViewLeaveHis.DataSource = dt;
            GridViewLeaveHis.DataBind();
        }
    }
}
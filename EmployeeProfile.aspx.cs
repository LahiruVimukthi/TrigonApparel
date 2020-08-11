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
    public partial class EmployeeProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].Equals("Employee"))
            {
               
                LinkButtonLogoutEmp.Visible = true;//Logout
                LinkButton7.Text = "Hello" + " " + Session["Username"].ToString();//helloUser
               bindFeedGrid();
                EmployeeData();



            }
        }

        protected void LinkButtonLogoutEmp_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string squery = "INSERT INTO [dbo].[Feedbacks] (Employee_ID,FeedDate,Feed_Type,Feedback,Status) VALUES(@Employee_ID,@FeedDate,@Feed_Type,@Feedback,@Status)";
                SqlCommand com = new SqlCommand(squery,con);
                com.Parameters.AddWithValue("@Employee_ID", Session["Username"].ToString());
                com.Parameters.AddWithValue("@FeedDate", DateTime.Now.Date.ToString());
                com.Parameters.AddWithValue("@Feed_Type", DropDownList1.SelectedItem.Text);
                com.Parameters.AddWithValue("@Feedback", TextBoxDes.Text);
                com.Parameters.AddWithValue("@Status", "Pending");
                com.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.Url.AbsoluteUri);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void bindFeedGrid()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string squery = "SELECT FeedbackID,Feed_Type,Feedback,Reply FROM Feedbacks WHERE Employee_ID='"+ Session["Username"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(squery,con);
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
            


        }
        void EmployeeData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT * FROM [dbo].[User_Registrations] WHERE Employee_ID='" + Session["Username"].ToString() + "'" ;
                
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand com = new SqlCommand(squery, con);
                SqlDataAdapter sda = new SqlDataAdapter(com);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                TextBoxEID.Text = dt.Rows[0]["Employee_ID"].ToString();
                TextBoxMo.Text = dt.Rows[0]["Phn_Number"].ToString();
                TextBoxCity.Text = dt.Rows[0]["City"].ToString();
                TextBoxState.Text = dt.Rows[0]["State"].ToString();
                TextBoxStreet.Text = dt.Rows[0]["Street"].ToString();
                TextBox2.Text = dt.Rows[0]["Department_Name"].ToString();
                TextBoxNIC.Text = dt.Rows[0]["NIC_Number"].ToString();
                TextBox5.Text = dt.Rows[0]["Gender"].ToString();
                Label14.Text=dt.Rows[0]["Status"].ToString();
                if (dt.Rows[0]["Status"].ToString().Trim() == "Active")
                {
                    Label14.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["Status"].ToString().Trim() == "Inactive")
                {
                    Label14.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
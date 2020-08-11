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
    public partial class WebForm20 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            string EmpID = Request.QueryString["Employee ID"];

            if (!IsPostBack)
            {
                
                GetEmployeeDetails(EmpID);
               
            }
           
            
        }
        void GetEmployeeDetails(string EmpID)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT * FROM [dbo].[User_Registrations] WHERE Employee_ID='" + EmpID + "'";

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand com = new SqlCommand(squery, con);
                SqlDataAdapter sda = new SqlDataAdapter(com);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                TextBox1.Text = dt.Rows[0]["F_Name"].ToString();
                TextBox2.Text = dt.Rows[0]["L_Name"].ToString();
                TextBoxEmID.Text = dt.Rows[0]["Employee_ID"].ToString();
                TextBoxMon.Text = dt.Rows[0]["Phn_Number"].ToString();
                TextBox3.Text = dt.Rows[0]["Department_Name"].ToString();
                TextBoxNIC.Text = dt.Rows[0]["NIC_Number"].ToString();
                TextBoxStreet.Text = dt.Rows[0]["Street"].ToString();
                TextBoxCity.Text = dt.Rows[0]["City"].ToString();
                TextBoxState.Text = dt.Rows[0]["State"].ToString();
                TextBox5.Text = dt.Rows[0]["Gender"].ToString();
                Label16.Text= dt.Rows[0]["Status"].ToString();
                if (dt.Rows[0]["Status"].ToString().Trim()=="Active")
                {
                    Label16.Attributes.Add("class","badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["Status"].ToString().Trim() == "Inactive")
                {
                    Label16.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void updateEmpDetails(string EmpID)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "UPDATE User_Registrations SET F_Name=@F_Name,L_Name=@L_Name,Phn_Number=@Phn_Number,City=@City,State=@State,Street=@Street,Full_Name=@Full_Name,D_o_B=@D_o_B,Marital_Status=@Marital_Status,Supervisor=@Supervisor,D_o_J=@D_o_J,NIC_Number=@NIC_Number,Status=@Status WHERE Employee_ID='" + EmpID + "'";

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand com = new SqlCommand(squery, con);
                com.Parameters.AddWithValue("@F_Name", TextBox1.Text);
                com.Parameters.AddWithValue("@L_Name", TextBox2.Text);
                com.Parameters.AddWithValue("@Phn_Number", TextBoxMon.Text);
                com.Parameters.AddWithValue("@City", TextBoxCity.Text);
                com.Parameters.AddWithValue("@State", TextBoxState.Text);
                com.Parameters.AddWithValue("@Street", TextBoxStreet.Text);
                com.Parameters.AddWithValue("@Full_Name", TextBoxFullN.Text);
                com.Parameters.AddWithValue("@D_o_B", TextBoxDOB.Text.ToString());
                com.Parameters.AddWithValue("@Marital_Status", DropDownListMarital.SelectedItem.Text);
                com.Parameters.AddWithValue("@Supervisor", DropDownList1.SelectedItem.Text);
                com.Parameters.AddWithValue("@D_o_J", TextBoxDoJ.Text.ToString());
                com.Parameters.AddWithValue("@NIC_Number", TextBoxNIC.Text);
                com.Parameters.AddWithValue("@Status", DropDownList2.SelectedItem.Text);
                com.ExecuteNonQuery();
                Label18.Text = "Successfully Updated";
             
                con.Close();
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string EmpID = Request.QueryString["Employee ID"];
            updateEmpDetails(EmpID);
        }
    }
}
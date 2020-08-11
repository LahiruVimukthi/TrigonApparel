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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string CustomID;
        string CurrYear=DateTime.Now.Year.ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCreateProfile_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownListJob_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            RegisterUser();
        }
        void RegisterUser()
        {
            try
            {
                autoincrement();
                
                string gender = string.Empty;
                if (RadioButtonM.Checked)
                {
                    gender = "Male";
                }
                else if (RadioButtonF.Checked)
                {
                    gender = "Female";
                }
                else if (RadioButtonO.Checked)
                {
                    gender = "Other";
                }

                string squery = "INSERT INTO [dbo].[User_Registrations] (F_Name,L_Name,Phn_Number,NIC_Number,City,State,Street,Department_Name,Dep_ID,Employee_ID,Gender,Status) VALUES (@F_Name,@L_Name,@Phn_Number, @NIC_Number,@City,@State,@Street,@Department_Name,@Dep_ID,@Employee_ID,@Gender,@Status)";
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(squery, con);
                cmd.Parameters.AddWithValue("@F_Name", TextBoxFName.Text.Trim());
                cmd.Parameters.AddWithValue("@L_Name", TextBoxLName.Text.Trim());
                cmd.Parameters.AddWithValue("@Phn_Number", TextBoxPhnNmbr.Text.Trim());
                cmd.Parameters.AddWithValue("@NIC_Number", TextBoxNICNmbr.Text.Trim());
                cmd.Parameters.AddWithValue("@City", TextBoxCityAddrs.Text.Trim());
                cmd.Parameters.AddWithValue("@State", TextBoxStateAddrs.Text.Trim());
                cmd.Parameters.AddWithValue("@Street", TextStreetAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Department_Name", DropDownListJob.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Dep_ID", DropDownListJob.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Employee_ID", CustomID);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Status","Active");
                cmd.ExecuteNonQuery();
                GridViewAddEmployees.DataBind();

                con.Close();
                Response.Write("<script>alert('Employee Registered Successfuly');</script>");
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void autoincrement()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (DropDownListJob.SelectedItem.Value == "1")
            {
                string str = "select count(*) from User_Registrations where Dep_ID='1'";
                SqlCommand com = new SqlCommand(str, con);
                con.Open();
                int count = Convert.ToInt16(com.ExecuteScalar()) + 1;
                CustomID = "Cut" +"/"+CurrYear+ "/"+count;
                con.Close();
            }
            else if (DropDownListJob.SelectedItem.Value == "2")
            {
                string str = "select count(*) from User_Registrations where Dep_ID='2'";
                SqlCommand com = new SqlCommand(str, con);
                con.Open();
                int count = Convert.ToInt16(com.ExecuteScalar()) + 1;
                CustomID = "Sew"+"/" +CurrYear+"/"+count;
                con.Close();
            }
            else if (DropDownListJob.SelectedItem.Value == "3")
            {
                string str = "select count(*) from User_Registrations where Dep_ID='3'";
                SqlCommand com = new SqlCommand(str, con);
                con.Open();
                int count = Convert.ToInt16(com.ExecuteScalar()) + 1;
                CustomID = "Fin"+"/" +CurrYear+"/"+count;
                con.Close();
            }
        }

       protected void DropDownListSupervisor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownListMaritalStatus_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownListJobs2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        void GenearteAutoID()
        {

        }

        protected void ButtonLoad_Click(object sender, EventArgs e)
        {
            



        }

       
       
            public void idcheck()
            {
                
            }
        
        void clear()

        {
            
        }


        protected void TextBoxEmployeeID2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonCreatePrf_Click(object sender, EventArgs e)
        {
            CreateProfile();
        }
        void CreateProfile()
        {
         
        }

        protected void ButtonLoadP_Click(object sender, EventArgs e)
        {
           
           
           
           
        }
    
        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonLoadProfile_Click(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LoadCreateProfile();
        }
        void LoadCreateProfile()
        {

          


        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employeedetails.aspx?Employee ID=" + ((LinkButton)sender).Text);
        }
    }
}
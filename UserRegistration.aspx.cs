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
            try
            {
                string squery = "INSERT INTO [dbo].[User_Registrations] (F_Name,L_Name,Phn_Number,NIC_Number,City,State,Street,Department_Name,Dep_ID) VALUES (@F_Name,@L_Name,@Phn_Number,@NIC_Number,@City,@State,@Street,@Department_Name,@Dep_ID)";
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(squery,con);
                cmd.Parameters.AddWithValue("@F_Name",TextBoxFName.Text.Trim());
                cmd.Parameters.AddWithValue("@L_Name", TextBoxLName.Text.Trim());
                cmd.Parameters.AddWithValue("@Phn_Number",TextBoxPhnNmbr.Text.Trim());
                cmd.Parameters.AddWithValue("@NIC_Number", TextBoxEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@City", TextBoxCityAddrs.Text.Trim());
                cmd.Parameters.AddWithValue("@State", TextBoxStateAddrs.Text.Trim());
                cmd.Parameters.AddWithValue("@Street", TextStreetAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Department_Name",DropDownListJob.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Dep_ID",DropDownListJob.SelectedItem.Value);
                cmd.ExecuteNonQuery();
                GridViewAddEmployees.DataBind();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
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
    }
}
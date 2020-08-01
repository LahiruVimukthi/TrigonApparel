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
    public partial class WebForm15 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                AssetDetails();
                EmpDetails();
                GridHisBind();
            }
            
        }
        void AssetDetails()
        {
            try
            {
                string AssetID = Request.QueryString["Asset ID"];
                if (AssetID == null)
                {
                    Response.Redirect("AssetManagement.aspx");
                }
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT Asset_ID,Add_Date,Status,Serial_Number,Category,Model,Description,Current_Status FROM [dbo].[AssetDescription] WHERE Asset_ID='" + AssetID + "' ";
                SqlCommand com = new SqlCommand(squery, con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader reader = com.ExecuteReader();

                if (reader.Read())

                {
                    TextBoxAddDate.Text = reader["Add_Date"].ToString();
                    TextBoxStatus.Text = reader["Status"].ToString();
                    TextBoxSerial.Text = reader["Serial_Number"].ToString();
                    TextBoxCat.Text = reader["Category"].ToString();
                    TextBoxAsModel.Text = reader["Model"].ToString();

                    TextBoxDes.Text = reader["Description"].ToString();
                    TextBoxCuStaus.Text = reader["Current_Status"].ToString();



                    reader.Close();

                    con.Close();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void EmpDetails()
        {
            try
            {
                
                string AssetID = Request.QueryString["Asset ID"];
                if (AssetID == null)
                {
                    Response.Redirect("AssetManagement.aspx");
                }
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT TOP 1 * FROM AssetMgmt WHERE Asset_ID='"+ AssetID + "' ORDER BY Asset_ID DESC ";
                SqlCommand com = new SqlCommand(squery, con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader reader = com.ExecuteReader();

                if (reader.Read())

                {
                    TextBoxAssTo.Text = reader["Employee_ID"].ToString();
                    TextBoxFrom.Text = reader["From_Date"].ToString();
                    TextBoxTo.Text = reader["To_Date"].ToString();
                    reader.Close();
                    con.Close();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GridHisBind()
        {
            try
            {
                string AssetID = Request.QueryString["Asset ID"];
                if (AssetID == null)
                {
                    Response.Redirect("AssetManagement.aspx");
                }
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT Order_ID,Req_Date,From_Date,To_Date,Employee_ID FROM [dbo].[AssetMgmt] WHERE Asset_ID='" + AssetID + "' ";
                SqlCommand com = new SqlCommand(squery, con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader sdr = com.ExecuteReader();
                GridViewAssHistory.DataSource = sdr;
                GridViewAssHistory.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        

    }
}
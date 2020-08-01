using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Text;


namespace TrigonApparel
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                
            }
        }
  
        private void PopulateData()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                string squery = "Select F_Name, [User_Registrations].Employee_ID from dbo.[User_Registrations] JOIN dbo.[Department] ON Department.Dep_ID= User_Registrations.Dep_ID  Where Department.Dep_ID= '" + DropDownListDept.SelectedItem.Value + "'";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand(squery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridViewWork.DataSource = dt;
                GridViewWork.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {

            }
        }
        protected void DropDownListDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateData();
        }

        protected void GridViewPeformance_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            try
            {
                if (e.Row.RowType ==DataControlRowType.DataRow)
                {

                    SqlConnection con = new SqlConnection(strcon);
                    string squery = "Select * from Apraisalindex";
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }

                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void ButtonSaveSk_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gvr in GridViewWork.Rows)
                {
                    TextBox tbtrgt = (TextBox)gvr.FindControl("TextBoxTrgt");
                    Int32 target = Convert.ToInt32(tbtrgt.Text);
                    TextBox tbfin = (TextBox)gvr.FindControl("TextBoxFin");
                    Int32 Finish = Convert.ToInt32(tbfin.Text);
                    TextBox tbdef = (TextBox)gvr.FindControl("TextBoxDef");
                    Int32 defects = Convert.ToInt32(tbdef.Text);
                    InsertRecords(target,Finish,defects,gvr);
                }
                
                Response.Write("<script>alert('Performance Marked');</script>");


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
          

            

        }
     
        private void InsertRecords(Int32 target, Int32 Finish,Int32 defects, GridViewRow gvr)
        {

            string query = "INSERT INTO [dbo.Performance](Employee_ID,Date,Dep_ID,Target,Finished,Defects) VALUES('" + gvr.Cells[0].Text + "','" + TextBoxMonth.Text.ToString() + "','" + DropDownListDept.SelectedItem.Value + "','" + target + "','" + Finish + "','" + defects + "')";
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
        }
    }
}
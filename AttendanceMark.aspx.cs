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
    public partial class WebForm5 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void DropDownListAttJob_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "Select F_Name, Employee_ID from dbo.[User_Registrations] JOIN dbo.[Department] ON Department.Dep_ID= User_Registrations.Dep_ID Where Department.Dep_ID= '" + DropDownListAtJob.SelectedItem.Value + "'";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand(squery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridViewAttDep.DataSource = dt;
                GridViewAttDep.DataBind();


                con.Close();




            }
            catch (Exception ex)
            {
                Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

            }
        }

       protected void ButtonLoadAtt_Click(object sender, EventArgs e)
        {
          
            
        }

        protected void DropDownList1Test_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
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
    public partial class WebForm11 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT * from User_Registrations WHERE Employee_ID='"+TextBoxEmpID.Text+"' ";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = squery;
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["Username"] = dr.GetValue(3).ToString();
                        Session["role"] = "Admin";
                        Session["Status"]= dr.GetValue(20).ToString();
                        
                    }
                    Response.Redirect("UserRegistration.aspx");
                }
                else
                {
                    Response.Write("< script >alert ('Invalid Username');</ Script >");
                }
                con.Close();


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {

        }
    }
}
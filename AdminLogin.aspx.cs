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
    public partial class WebForm16 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT * from Admin_Login WHERE AD_Username='" + TextBoxAdID.Text + "' AND AD_Password='"+TextBoxAdPW.Text+"' ";
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
                        Session["Admin"] = dr.GetValue(0).ToString();
                        Session["role"] = "Admin";
                       

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
    }
}
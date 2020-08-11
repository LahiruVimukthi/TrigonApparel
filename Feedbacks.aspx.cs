using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TrigonApparel
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            CheckBox cb = (CheckBox)GridView1.Rows[rowind].FindControl("CheckBox1");
            if (cb.Checked == true)
            {
                Label6.Text = GridView1.Rows[rowind].Cells[1].Text;
            }
            else
            {
                Label6.Text = "";
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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
                string squery = "UPDATE [dbo].[Feedbacks] SET Reply=@Reply, Status=@Status WHERE FeedbackId='"+Label6.Text+"'";
                SqlCommand com = new SqlCommand(squery, con);
                com.Parameters.AddWithValue("@Reply", TextBoxRep.Text);
                com.Parameters.AddWithValue("@Status", "Attended");

                com.ExecuteNonQuery();
                con.Close();
                Label8.Text = "Succcessfully Saved";
                Response.Redirect(Request.Url.AbsoluteUri);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
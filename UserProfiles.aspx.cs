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
    public partial class WebForm10 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GridViewProfAtt.DataBind();
            }

        }

        protected void ButtonLoad_Click(object sender, EventArgs e)
        {

        }
        void checkLeaves()
        {
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("Select * from Leaves where Employee_ID='" +TextBoxEID.Text + "' AND Req_Status='Approved' AND Req_Date between'" + TextBoxTo.Text + "' AND '"+TextBoxFrom.Text+"'" , con);
            SqlDataAdapter ap = new SqlDataAdapter(cmd.CommandText, con);
            con.Open();
            DataSet ds = new DataSet();
            ap.Fill(ds);
            LabelToTLea2.Text =ds.Tables[0].Rows.Count.ToString();

            SqlCommand cmd2 = new SqlCommand("Select * from Attendance where Employee_ID='" + TextBoxEID.Text + "' AND CheckStatus='CheckIn' AND At_Date between'" + TextBoxTo.Text + "' AND '" + TextBoxFrom.Text + "'", con);
            SqlDataAdapter ap2 = new SqlDataAdapter(cmd2.CommandText, con);
            
            DataSet ds2 = new DataSet();
            ap2.Fill(ds2);
            LabelToAtt2.Text = ds2.Tables[0].Rows.Count.ToString();
            con.Close();
        }

        protected void ButtonGo_Click(object sender, EventArgs e)
        {
            checkLeaves();
        }

        protected void ButtonViewLeaves_Click(object sender, EventArgs e)
        {
            ProfLeaveRecords();


        }
        void ProfLeaveRecords()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);

                string squery = "Select User_Registrations.Employee_ID, Req_Date, Req_Description, Req_Status from User_Registrations JOIN Leaves ON Leaves.Employee_ID= User_Registrations.Employee_ID WHERE User_Registrations.Employee_ID='" + TextBoxEID.Text + "' AND Req_Date between '" + TextBoxFrom.Text + "' AND '" + TextBoxTo.Text + "'";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand(squery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridViewProfAtt.DataSource = dt;
                GridViewProfAtt.DataBind();


                con.Close();




            }
            catch (Exception ex)
            {
                Response.Write("< script >alert ('" + ex.Message + "');</ Script >");

            }
        }

    }
}
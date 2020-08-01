using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrigonApparel
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButtonLogin.Visible = true;//Login
                    LinkButton3.Visible = false;//Logout
                    LinkButton7.Visible = false;//helloUser
                    LinkButtonEmployees.Visible = false;
                    LinkButtonAttendance.Visible = false;
                    LinkButtonPerformance.Visible = false;
                    LinkButtonFeedback.Visible = false;
                    LinkButtonAssets.Visible = false;
                    LinkButtonAnnouncements.Visible = false;
                    LinkButtonreports.Visible = false;

                }
                else if (Session["role"].Equals("Employee"))
                {
                    LinkButtonLogin.Visible = false;//Login
                    LinkButton3.Visible = true;//Logout
                    LinkButton7.Text ="Hello"+" "+Session["Username"].ToString() ;//helloUser
                    LinkButtonEmployees.Visible = false;
                    LinkButtonAttendance.Visible = false;
                    LinkButtonPerformance.Visible = false;
                    LinkButtonFeedback.Visible = false;
                    LinkButtonAssets.Visible = false;
                    LinkButtonAnnouncements.Visible = false;
                    LinkButtonreports.Visible = false;
                }
                else if (Session["role"].Equals("Admin"))
                {
                    LinkButtonLogin.Visible = false;//Login
                    LinkButton3.Visible = true;//Logout
                    LinkButton7.Text = "Hello Admin";//helloUser
                    LinkButtonEmployees.Visible =true;
                    LinkButtonAttendance.Visible = true;
                    LinkButtonPerformance.Visible = true;
                    LinkButtonFeedback.Visible = true;
                    LinkButtonAssets.Visible = true;
                    LinkButtonAnnouncements.Visible = true;
                    LinkButtonreports.Visible = true;
                }

            }
            catch
            {

            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton4_Click1(object sender, EventArgs e)
        {

        }

        protected void LinkButtonAttendance_Click(object sender, EventArgs e)
        {
            Response.Redirect("AttendanceHome.aspx");
        }

        protected void LinkButtonLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }
    }
}
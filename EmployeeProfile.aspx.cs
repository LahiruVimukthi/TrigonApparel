using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrigonApparel
{
    public partial class EmployeeProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"].Equals("Employee"))
            {
               
                LinkButtonLogoutEmp.Visible = true;//Logout
                LinkButton7.Text = "Hello" + " " + Session["Username"].ToString();//helloUser
               
            }
        }

        protected void LinkButtonLogoutEmp_Click(object sender, EventArgs e)
        {

        }
    }
}
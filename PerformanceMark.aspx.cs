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
            if (!IsPostBack)
            {
                TextBoxPerDate.Text = DateTime.Now.ToString("MMMM");
            }
          
        }
  
        void populatework()
        {
            try
            {

                SqlConnection con = new SqlConnection(strcon);
                string squery = "Select F_Name, User_Registrations.Employee_ID from dbo.[User_Registrations] JOIN dbo.[Department] ON Department.Dep_ID= User_Registrations.Dep_ID  Where Department.Dep_ID= '" + DropDownListDept.SelectedItem.Value + "'";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }

                SqlCommand cmd = new SqlCommand(squery, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridViewWorkPerf.DataSource = dt;
                GridViewBeh.DataSource = dt;
                GridViewWorkPerf.DataBind();
                GridViewBeh.DataBind();
                con.Close();
            }
            catch (Exception ex)
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
            populatework();
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
            

            

        }
     
        private void InsertRecords(Int32 target, Int32 Finish,Int32 defects, GridViewRow gvr)
        {

            string query = "INSERT INTO [dbo.Performance](Employee_ID,Date,Dep_ID,Target,Finished,Defects) VALUES('" + gvr.Cells[0].Text + "','" + TextBoxMonth.Text.ToString() + "','" + DropDownListDept.SelectedItem.Value + "','" + target + "','" + Finish + "','" + defects + "')";
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
           
        }
        void addskills()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Employee_ID"), new DataColumn("Target"), new DataColumn("Finished"), new DataColumn("Defects"), new DataColumn("DFU") });
            foreach (GridViewRow row in GridViewWork.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                        
                        LinkButton EID = (LinkButton)row.FindControl("LinkButton1");
                        var EmpID = EID.Text;
                        TextBox trgt = (TextBox)row.FindControl("TextBoxTrgt");
                        TextBox fin = (TextBox)row.FindControl("TextBoxFin");
                        TextBox Def = (TextBox)row.FindControl("TextBoxDef");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
                        int finished = int.Parse(fin.Text);
                        int target = int.Parse(trgt.Text);
                        int defects = int.Parse(Def.Text);
                    double dfu = ((double)defects / (double)finished)*100;
                  
                    dt.Rows.Add(EmpID, target, finished, defects,dfu);
                }
            }
            GridViewAddSkills.DataSource = dt;
            GridViewAddSkills.DataBind();
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            addskills(); 
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
           
        }
        void saveWork()
        {
            try
            {
                string squery = "INSERT INTO [dbo].[Performance] (Employee_ID,Target,Finished,Defects,DFU,Date,Dep_ID) VALUES (@Employee_ID,@Target,@Finished,@Defects,@DFU,@Date,@Dep_ID)";
                SqlConnection con = new SqlConnection(strcon);
                string date = TextBoxMonth.Text.ToString();
                int depID=int.Parse(DropDownListDept.SelectedItem.Value);
                foreach (GridViewRow gvrow in GridViewAddSkills.Rows)
                {
                    
                    
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand(squery, con);
                    cmd.Parameters.AddWithValue("@Employee_ID", gvrow.Cells[0].Text);
                    cmd.Parameters.AddWithValue("@Target", int.Parse(gvrow.Cells[1].Text));
                    cmd.Parameters.AddWithValue("@Finished",int.Parse( gvrow.Cells[2].Text));
                    cmd.Parameters.AddWithValue("@Defects", int.Parse(gvrow.Cells[3].Text));
                    cmd.Parameters.AddWithValue("@DFU", double.Parse(gvrow.Cells[4].Text));
                    cmd.Parameters.AddWithValue("@Date", date);
                    cmd.Parameters.AddWithValue("@Dep_ID", depID);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label5.Text = "Successfully Saved";
                }
               



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

       

       
        protected void Buttonsaveskill_Click(object sender, EventArgs e)
        {
            saveWork();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            addBehavior();
        }
        void addBehavior()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Employee_ID"), new DataColumn("Appearance"), new DataColumn("Safety"), new DataColumn("TrainingImp"), new DataColumn("BehTotal") });
            foreach (GridViewRow row in GridViewBeh.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {

                    LinkButton EID = (LinkButton)row.FindControl("LinkButton3");
                    var EmpID = EID.Text;
                    DropDownList Appear = (DropDownList)row.FindControl("DropDownListApp");
                    DropDownList Safety = (DropDownList)row.FindControl("DropDownListSafe");
                    DropDownList Train = (DropDownList)row.FindControl("DropDownListTrI");
                    int App = int.Parse(Appear.SelectedItem.Value);
                    int Safe = int.Parse(Safety.SelectedItem.Value);
                    int TrImp = int.Parse(Train.SelectedItem.Value);
                    double Total = ((double)App +(double)Safe)+ (double)TrImp;

                    dt.Rows.Add(EmpID, App, Safe, TrImp, Total);
                }
            }
            GridViewSavebeh.DataSource = dt;
            GridViewSavebeh.DataBind();
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            saveBehavior();
        }
        void saveBehavior()
        {
            try
            {
                
                SqlConnection con = new SqlConnection(strcon);
                foreach (GridViewRow gvrow in GridViewSavebeh.Rows)
                {
                    string date = TextBoxMonth.Text.ToString();
                    string squery = "UPDATE [dbo].[Performance] SET Appearance=@Appearance,Safety=@Safety,TrainingImp=@TrainingImp,BehTotal=@BehTotal,Dep_ID=@Dep_ID WHERE Employee_ID='" + gvrow.Cells[0].Text+"' AND Date='"+ date + "'";
                    int depID = int.Parse(DropDownListDept.SelectedItem.Value);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand(squery, con);
                    cmd.Parameters.AddWithValue("@Appearance", int.Parse(gvrow.Cells[1].Text));
                    cmd.Parameters.AddWithValue("@Safety", int.Parse(gvrow.Cells[2].Text));
                    cmd.Parameters.AddWithValue("@TrainingImp", int.Parse(gvrow.Cells[3].Text));
                    cmd.Parameters.AddWithValue("@BehTotal", int.Parse(gvrow.Cells[4].Text));
                    cmd.Parameters.AddWithValue("@Dep_ID", depID);
                    cmd.ExecuteNonQuery();
                   
                    con.Close();
                    Label4.Text = "Successfully saved";
                }
               



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            addSkills();
        }
        void addSkills()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[7] { new DataColumn("Employee_ID"), new DataColumn("Communication"), new DataColumn("Teamwork"), new DataColumn("DecisionMaking"), new DataColumn("JobKnow"), new DataColumn("Leadership"), new DataColumn("TotalScore") });
            foreach (GridViewRow row in GridViewWorkPerf.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {

                    LinkButton EID = (LinkButton)row.FindControl("LinkButton2");
                    var EmpID = EID.Text;

                    DropDownList comm = (DropDownList)row.FindControl("DropDownListCom");
                    DropDownList team = (DropDownList)row.FindControl("DropDownListteam");
                    DropDownList Des = (DropDownList)row.FindControl("DropDownListDes");
                    DropDownList JK = (DropDownList)row.FindControl("DropDownListJK");
                    DropDownList lead = (DropDownList)row.FindControl("DropDownListLead");
                    int commu = int.Parse(comm.SelectedItem.Value);
                    int teamW = int.Parse(team.SelectedItem.Value);
                    int Desc = int.Parse(Des.SelectedItem.Value);
                    int JKn = int.Parse(JK.SelectedItem.Value);
                    int leader= int.Parse(lead.SelectedItem.Value);
                    double Total = ((double)commu + (double)teamW) + (double)Desc+ (double)JKn + (double)leader;

                    dt.Rows.Add(EmpID, commu, teamW, Desc, JKn, leader, Total);
                }
            }
            GridViewSkills.DataSource = dt;
            GridViewSkills.DataBind();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
             saveSkills();

        }
        void saveSkills()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                int depID = int.Parse(DropDownListDept.SelectedItem.Value);
                string date = TextBoxMonth.Text.ToString();

                foreach (GridViewRow gvrow in GridViewSkills.Rows)
                {
                    string squery = "UPDATE [dbo].[Performance] SET Communication=@Communication,Teamwork=@Teamwork,DecisionMaking=@DecisionMaking,JobKnow=@JobKnow,Leadership=@Leadership ,SkillTotal=@SkillTotal,Dep_ID=@Dep_ID WHERE Employee_ID='" + gvrow.Cells[0].Text + "' AND Date='" + date + "'";

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand(squery, con);
                    cmd.Parameters.AddWithValue("@Communication", int.Parse(gvrow.Cells[1].Text));
                    cmd.Parameters.AddWithValue("@Teamwork", int.Parse(gvrow.Cells[2].Text));
                    cmd.Parameters.AddWithValue("@DecisionMaking", int.Parse(gvrow.Cells[3].Text));
                    cmd.Parameters.AddWithValue("@JobKnow", int.Parse(gvrow.Cells[4].Text));
                    cmd.Parameters.AddWithValue("@Leadership", int.Parse(gvrow.Cells[5].Text));
                    cmd.Parameters.AddWithValue("@SkillTotal", double.Parse(gvrow.Cells[6].Text));
                    cmd.Parameters.AddWithValue("@Dep_ID",depID);
                    cmd.ExecuteNonQuery();
                    
                    con.Close();
                    Label3.Text = "Successfully saved";

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }





        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            PanelBeh.Visible = false;
        }
    }
   
}
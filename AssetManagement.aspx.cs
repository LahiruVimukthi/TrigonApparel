using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Drawing;

namespace TrigonApparel
{

    public partial class WebForm14 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        int Asset_ID;
        string From_Date;
        string To_Date;
        static string global_filepath;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            AddROrder();
            TextBoxRDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
           
        }
        protected void ShowMessage(string Message, MessageType type)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), System.Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + type + "');", true);
        }
        void AddROrder()
        {
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("Select * from AssetMgmt", con);
            SqlDataAdapter ap = new SqlDataAdapter(cmd.CommandText, con);
            con.Open();
            DataSet ds = new DataSet();
            ap.Fill(ds);
            TextBoxRorder.Text = "Req" + ds.Tables[0].Rows.Count.ToString();
        }
       

       

        
     

      
        void SaveAsset()
        {
            try
            {
                



                string squery = "INSERT INTO [dbo].[AssetDescription] (Add_Date,Status,Serial_Number,Current_Quantity,Category,Model,Description,Current_Status) VALUES(@Add_Date,@Status,@Serial_Number,@Current_Quantity,@Category,@Model,@Description,@Current_Status)";
                SqlConnection con = new SqlConnection(strcon);
                
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand(squery, con);
                cmd.Parameters.AddWithValue("@Add_Date", TextBox2.Text.ToString());
                cmd.Parameters.AddWithValue("@Status", DropDownListStatus.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Serial_Number", TextBoxSerial.Text.Trim());
                cmd.Parameters.AddWithValue("@Current_Quantity", TextBoxQuan.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", DropDownListSelCat3.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Model", DropDownListMod3.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Description", TextBoxDes.Text.Trim());
                cmd.Parameters.AddWithValue("@Current_Status", "Available");
               
                cmd.ExecuteNonQuery();
                con.Close();
                //Inserting in to Models Table
               

                //Updating quantity column in Models table
                con.Open();             
                SqlCommand sc = new SqlCommand("SELECT SUM(AssetDescription.Current_Quantity) AS CurrentStock FROM dbo.AssetDescription WHERE Model='" + DropDownListMod3.SelectedItem.Text + "'", con);
                SqlDataReader reader;
                reader = sc.ExecuteReader();
                while (reader.Read())
                {
                    //Get the Sum of Column from Database
                    var Quantity = reader["CurrentStock"].ToString();
                    SqlCommand com2 = new SqlCommand("UPDATE Asset_Models SET Asset_Models.Quantity='" + Quantity + "' WHERE Model='"+DropDownListMod3.SelectedItem.Text+"'" , con);
                    com2.ExecuteNonQuery();
                }
                con.Close();
                Response.Redirect(Request.Url.AbsoluteUri);
                

              
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            SaveAsset();
        }

        protected void ButtonAddCat_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand sc2 = new SqlCommand("INSERT INTO dbo.Ass_Category VALUES(@Category)", con);
            sc2.Parameters.AddWithValue("@Category", TextBoxAddCat.Text.Trim());

            sc2.ExecuteNonQuery();
            con.Close();
        }

        protected void ButtonAddMod_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand sc2 = new SqlCommand("INSERT INTO dbo.Asset_Models (Model,AssetType_ID) VALUES (@Model,@AssetType_ID)", con);
            sc2.Parameters.AddWithValue("@Model", TextBoxAddMod.Text.Trim());
            sc2.Parameters.AddWithValue("@AssetType_ID", DropDownListSelCat3.SelectedItem.Value);
            sc2.ExecuteNonQuery();
            con.Close();
        }

        protected void DropDownListMod3_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

       
        void loadModel()
        {

            string squery = "SELECT Model,Models_ID from [dbo].[Asset_Models] WHERE AssetType_ID='" + DropDownListSelCat3.SelectedItem.Value + "'";

            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand(squery, con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownListMod3.DataSource = dt;
            DropDownListMod3.DataValueField = "Models_ID";
            DropDownListMod3.DataTextField = "Model";
            DropDownListMod3.DataBind();



        }

        protected void DropDownListSelCat3_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadModel();
            
        }

        protected void DropDownListSelDep_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadEmployeedd();
        }
        void LoadEmployeedd()
        {

            string squery = "SELECT Employee_ID from User_Registrations WHERE Department_Name='" + DropDownListSelDep.SelectedItem.Text+ "'";

            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand(squery, con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DropDownListSelEmp.DataSource = dt;
            DropDownListSelEmp.DataValueField = "Employee_ID";
            DropDownListSelEmp.DataTextField = "Employee_ID";
            DropDownListSelEmp.DataBind();
            con.Close();
        }

        protected void ButtonGSD_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Order_ID"), new DataColumn("Asset_ID"), new DataColumn("Employee_ID"), new DataColumn("From_Date"), new DataColumn("To_Date") });
            foreach (GridViewRow row in GridViewSelAs.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("CheckBox1") as CheckBox);
                    if (chkRow.Checked)
                    {
                       
                        string Employee_ID = DropDownListSelEmp.SelectedItem.Text;
                        string OID = TextBoxRorder.Text;

                        LinkButton AID = (LinkButton)row.FindControl("LinkButtonAssID");
                        var AssetID = AID.Text;
                        TextBox FD = (TextBox)row.FindControl("TextBoxFDate");
                        TextBox TD = (TextBox)row.FindControl("TextBoxTDate");
                        string FDate = FD.Text;
                        string TDate = TD.Text;

                        dt.Rows.Add(OID,AssetID, Employee_ID, FDate, TDate);
                    }
                    
                }
            }
            gvSelected.DataSource = dt;
            gvSelected.DataBind();
        }

        protected void SaveReq_Click(object sender, EventArgs e)
        {
            submitAssetRequest();
        }
        void submitAssetRequest()
        {
            try
            {
                string squery = "INSERT INTO [dbo].[AssetMgmt] (Order_ID,Asset_ID,Employee_ID,From_Date,To_Date) VALUES (@Order_ID,@Asset_ID,@Employee_ID,@From_Date,@To_Date)";
                
                foreach (GridViewRow gvrow in gvSelected.Rows)
                {

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand(squery, con);
                    cmd.Parameters.AddWithValue("@Order_ID", gvrow.Cells[0].Text);
                    cmd.Parameters.AddWithValue("@Asset_ID",gvrow.Cells[1].Text);
                    cmd.Parameters.AddWithValue("@Employee_ID", gvrow.Cells[2].Text);
                    cmd.Parameters.AddWithValue("@From_Date", gvrow.Cells[3].Text);
                    cmd.Parameters.AddWithValue("@To_Date", gvrow.Cells[4].Text);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    LabelSelected.Text = "Successfully inserted";

                    con.Open();
                    string squery2 = "UPDATE [dbo].[AssetDescription] SET AssetDescription.Current_Status='Requested' Where Asset_ID='" + gvrow.Cells[1].Text + "'";
                    SqlCommand command = new SqlCommand(squery2, con);
                    command.ExecuteNonQuery();
                    con.Close();



                }
                Response.Redirect(Request.Url.AbsoluteUri);

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButtonAssID_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssetDetails.aspx?Asset ID=" + ((LinkButton)sender).Text);
        }

        protected void ButtonGo_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT TOP 1 * FROM [dbo].[AssetMgmt] WHERE Asset_ID='" + TextBox1AID.Text + "' ORDER BY Asset_ID DESC ";
                SqlCommand com = new SqlCommand(squery, con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader reader = com.ExecuteReader();

                if (reader.Read())

                {
                    TextBoxUser.Text = reader["Employee_ID"].ToString();
                    Label6.Text = reader["From_Date"].ToString();
                    Label8.Text = reader["To_Date"].ToString();
                    TextBoxReID.Text= reader["Order_ID"].ToString();
                    reader.Close();

                    con.Close();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            string squery= "UPDATE [dbo].[AssetMgmt] SET To_Date='"+TextBoxETo.Text.ToString()+ "' WHERE Asset_ID='"+TextBox1AID.Text+ "' AND Order_ID='"+TextBoxReID.Text+"' ";
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand command = new SqlCommand(squery,con);
            con.Open();
            command.ExecuteNonQuery();
            con.Close();
            Label9.Text = "Updated successfully";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dispose();
        }

        protected void ButtonDAIDGo_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT * FROM [dbo].[AssetDescription] WHERE Asset_ID='" + TextBoxDAID.Text + "' ";
                SqlCommand com = new SqlCommand(squery, con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader reader = com.ExecuteReader();

                if (reader.Read())

                {
                    TextBoxDMCat.Text = reader["Category"].ToString();
                    TextBoxDMod.Text = reader["Model"].ToString();

                    reader.Close();
                    con.Close();
                    

                }
               

            }
           
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
           void dispose()
        {
            SqlConnection con = new SqlConnection(strcon);
            string squery = "UPDATE [AssetDescription] SET Status='" + DropDownListDStatus.SelectedItem.Text + "', Dispose_Reason='" + TextBoxDRemarks.Text + "' WHERE Asset_ID='"+TextBoxDAID.Text+"'" ;
            con.Open();
            SqlCommand com = new SqlCommand(squery, con);
            com.ExecuteNonQuery();
            con.Close();
            Label14.Text = "Disposed Successfully";
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT TOP 1 * FROM [dbo].[AssetMgmt] WHERE Asset_ID='" + TextBox1.Text + "' ORDER BY Asset_ID DESC ";
                SqlCommand com = new SqlCommand(squery, con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader reader = com.ExecuteReader();

                if (reader.Read())

                {
                    TextBox3.Text = reader["Employee_ID"].ToString();
                    Label19.Text = reader["From_Date"].ToString();
                    Label21.Text = reader["To_Date"].ToString();
                    TextBox4.Text = reader["Order_ID"].ToString();
                    reader.Close();

                    con.Close();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);
            string squery = "UPDATE [AssetMgmt] SET Returned_Date=@Returned_Date WHERE Asset_ID='" + TextBox1.Text+ "' AND Order_ID='"+ TextBox4 .Text+ "' ";
            string squery2 = "UPDATE [AssetDescription] SET Current_Status=@Current_Status WHERE Asset_ID='" + TextBox1.Text + "'";
            con.Open();
            SqlCommand com = new SqlCommand(squery, con);
           
            com.Parameters.AddWithValue("@Returned_Date", TextBox5.Text.ToString());
            com.ExecuteNonQuery();
            SqlCommand com2 = new SqlCommand(squery2, con);
            com2.Parameters.AddWithValue("@Current_Status", "Available");
            com2.ExecuteNonQuery();
            con.Close();
            Label14.Text = "Updated Successfully";
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void GridViewSelAs_DataBound(object sender, EventArgs e)
        {

        }

        protected void GridViewSelAs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
          
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // do your stuffs here, for example if column risk is your third column:
                if (e.Row.Cells[6].Text == "Requested")
                {
                    e.Row.BackColor = Color.Beige;
                }
                if (e.Row.Cells[5].Text == "Inactive")
                {
                    e.Row.BackColor = Color.Cyan;
                }
            }
        }

        protected void ButtonAdGo_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string squery = "SELECT * FROM [dbo].[AssetDescription] WHERE Asset_ID='" + TextBoxAdAssID.Text + "'";
                SqlCommand com = new SqlCommand(squery, con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlDataReader reader = com.ExecuteReader();

                if (reader.Read())

                {
                    
                    TextBoxSerial.Text = reader["Serial_Number"].ToString();
                   
                    TextBoxDes.Text = reader["Description"].ToString();
                    reader.Close();
                    con.Close();

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void ButtonAssUpdate_Click(object sender, EventArgs e)
        {
            string filepath = "~/AssetImages/";
            string filename = Path.GetFileName(FileUploadImg.PostedFile.FileName);
            if (filename == "" || filename == null)
            {
                filepath = global_filepath;

            }
            else
            {
                FileUploadImg.SaveAs(Server.MapPath("AssetImages/" + filename));
                filepath = "~/AssetImages/" + filename;
            }
            string squery= "Update [dbo].[AssetDescription] SET Status=@Status,Serial_Number=@Serial_Number,Category=@Category,Model=@Model,Description=@Description,Imgpath=@Imgpath WHERE Asset_ID='"+ TextBoxAdAssID.Text+ "' ";
            SqlConnection con = new SqlConnection(strcon);  
            con.Open();
            SqlCommand com = new SqlCommand(squery, con);
            com.Parameters.AddWithValue("@Status", DropDownListStatus.SelectedItem.Text);
            com.Parameters.AddWithValue("@Serial_Number", TextBoxSerial.Text);
            com.Parameters.AddWithValue("@Category", DropDownListSelCat3.SelectedItem.Text);
            com.Parameters.AddWithValue("@Model", DropDownListMod3.SelectedItem.Text);
            com.Parameters.AddWithValue("@Description", TextBoxDes.Text);
            com.Parameters.AddWithValue("@Imgpath", filepath);
           
        }

        protected void GridViewSelAs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewSelAs.PageIndex = e.NewPageIndex;
        }
    }
    
   
    
    
}
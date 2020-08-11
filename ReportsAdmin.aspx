<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ReportsAdmin.aspx.cs" Inherits="TrigonApparel.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                         <ul class="nav nav-tabs nav-justified nav-fill" style="font-family: Arial, Helvetica, sans-serif; font-size: medium;"> 

        
  <li><a class="nav-link" data-toggle="pill" href="#Attendance" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Attendance</a></li>
           
  <li><a class="nav-link" data-toggle="pill" href="#Performance" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Performance</a></li>
                            
                              <li><a class="nav-link" data-toggle="pill" href="#Assets" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Assets</a></li>
</ul>
                        <div class="tab-content" style="font-family: Arial, Helvetica, sans-serif; color: #000000">

                            <div id="Attendance" class="tab-pane fade in active">
                                <br />
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                  <div class="row">
                                                    <div class="col-lg-6">
                                                          <div class="card">
                                                              <div class="card-header">Daily Attendance</div>
                                                              <div class="card-body">
                                                                  
                                                     <div class="row">
                                                         <div class="col-lg-6">
                                                             <div class="form-group">
                                                                  <asp:Label ID="Label2" runat="server" Text="Select Department"></asp:Label>
                                                                  <asp:DropDownList ID="DropDownListDepDaily" runat="server" DataSourceID="SqlDataSource1" DataTextField="Dep_Name" DataValueField="Dep_ID" class="form-control form-control-sm"></asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
                                                             </div>
                                                         </div>
                                                        <div class="col-lg-6">
                                                             <div class="form-group">
                                                                  <asp:Label ID="Label3" runat="server" Text="Select Date" ></asp:Label>
                                                                 <asp:TextBox ID="TextBox1" runat="server" class="form-control form-control-sm" TextMode="Date"></asp:TextBox>
                                                             </div>
                                                         </div>
                                                         <div class="row">
                                                             <center>
                                                                   <div class="col-lg-4">
                                                                    <asp:Button ID="ButtonDaRep" runat="server" Text="Generate Daily Report" OnClick="ButtonDaRep_Click"></asp:Button>
                                                             </div>
                                                             </center>
                                                           
                                                         </div>

                                                    </div>
                                             
                                          
                                                                  </div>
                                                              </div>
                                                            </div>
                                                      <div class="col-lg-6">
                                                          <div class="card">
                                                              <div class="card-header">Monthly Attendance</div>
                                                              <div class="card-body">
                                                                 
                                                     <div class="row">
                                                         <div class="col-lg-4">
                                                             <div class="form-group">
                                                                  <asp:Label ID="Label5" runat="server" Text="Select Department"></asp:Label>
                                                                  <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Dep_Name" DataValueField="Dep_ID" class="form-control form-control-sm"></asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
                                                                 <asp:CheckBox ID="CheckBox1" runat="server" Text="Select All" />
                                                             </div>
                                                         </div>
                                                        <div class="col-lg-4">
                                                             <div class="form-group">
                                                                  <asp:Label ID="Label6" runat="server" Text="From Date" ></asp:Label>
                                                                 <asp:TextBox ID="TextBoxFdate" runat="server" class="form-control form-control-sm" TextMode="Date"></asp:TextBox>
                                                             </div>
                                                         </div>
                                                          <div class="col-lg-4">
                                                             <div class="form-group">
                                                                  <asp:Label ID="Label4" runat="server" Text="To Date" ></asp:Label>
                                                                 <asp:TextBox ID="TextBoxTdate" runat="server" class="form-control form-control-sm" TextMode="Date"></asp:TextBox>
                                                             </div>
                                                         </div>
                                                         <div class="row">
                                                             <center>
                                                                   <div class="col-lg-4">
                                                                    <asp:Button ID="Button1" runat="server" Text="Generate Daily Report" OnClick="Button1_Click"></asp:Button>
                                                             </div>
                                                             </center>
                                                           
                                                         </div>

                                                    </div>
                                                              </div>
                                                          </div>
                                                      </div>
                                        </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                      
                                    </div>
                                </div>
                             </div>
                            <div id="Performance" class="tab-pane fade in active">
                                <div class="card-body">
                                    <iframe width="1140" height="541.25" src="https://app.powerbi.com/reportEmbed?reportId=6db3e76b-f235-4ad7-b700-6eadefe49eaa&autoAuth=true&ctid=aa232db2-7a78-4414-a529-33db9124cba7&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly93YWJpLXNvdXRoLWVhc3QtYXNpYS1yZWRpcmVjdC5hbmFseXNpcy53aW5kb3dzLm5ldC8ifQ%3D%3D" frameborder="0" allowFullScreen="true"></iframe>
                                </div>
                             </div>
                         
                            <div id="Assets" class="tab-pane fade in active">

                             </div>
                        </div>
                        </div>
                    </div>
                </div>
    
</asp:Content>

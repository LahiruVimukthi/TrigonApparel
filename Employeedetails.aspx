<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Employeedetails.aspx.cs" Inherits="TrigonApparel.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-tabs nav-justified nav-fill" style="font-family: Arial, Helvetica, sans-serif; font-size: medium;"> 
  <li class="active"><a class="nav-link" data-toggle="pill" href="#PersonalDetails" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Personal Details</a></li>
        
  <li><a class="nav-link" data-toggle="pill" href="#Attendance" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Attendance</a></li>
           
  <li><a class="nav-link" data-toggle="pill" href="#Performance" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Performance</a></li>
                             
</ul>
                   <div class="tab-content">
                         <div id="PersonalDetails" class="tab-pane fade in active">
                                  <div class="row">
                                     <div class="col-lg-12">
                                         <div class="card">
                                             <div class="card-header" style="background-color: #30336b; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: bold"> Personal Details</div>
                                             <div class="card-body">
                                                 <div class="row">
                                                     <div class="col-lg-4">
                                                        <span>Account Status - </span>
                                                            <asp:Label class="badge badge-pill badge-info" ID="Label16" runat="server" Text="Account status"></asp:Label>
                                                     </div>
                                                 </div>
                                                 <div class="row">
                                                      <div class="col-lg-4">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label14" runat="server" Text="First Name"></asp:Label>
                                                             <asp:TextBox ID="TextBox1" runat="server" class="form-control form-control-sm" ></asp:TextBox>
                                                         </div>
                                                     </div>
                                                      <div class="col-lg-4">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label15" runat="server" Text="Last Name"></asp:Label>
                                                             <asp:TextBox ID="TextBox2" runat="server" class="form-control form-control-sm" ></asp:TextBox>
                                                         </div>
                                                     </div>
                                                     <div class="col-lg-4">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label17" runat="server" Text="Account Status"></asp:Label>
                                                             <asp:DropDownList ID="DropDownList2" runat="server">
                                                                 <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                                                 <asp:ListItem Text="Inactve" Value="2"></asp:ListItem>
                                                             </asp:DropDownList>
                                                         </div>
                                                     </div>
                                                 </div>
                                                 <div class="row">
                                                     
                                                     <div class="col-lg-10">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label1" runat="server" Text="Full Name"></asp:Label>
                                                             <asp:TextBox ID="TextBoxFullN" runat="server" class="form-control form-control-sm" ></asp:TextBox>
                                                         </div>
                                                     </div>
                                                     <div class="col-lg-2">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label2" runat="server" Text="Employee ID"></asp:Label>
                                                             <asp:TextBox ID="TextBoxEmID" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                     </div>
                                                 </div>
                                                  <div class="row">
                                                      <div class="col-lg-4">
                                                          <div class="form-group">
                                                             <asp:Label ID="Label8" runat="server" Text="Date of Birth"></asp:Label>
                                                             <asp:TextBox ID="TextBoxDOB" runat="server" class="form-control form-control-sm" TextMode="Date"></asp:TextBox>
                                                         </div>
                                                      </div>
                                                       <div class="col-lg-2">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label13" runat="server" Text="Mobile Number"></asp:Label>
                                                             <asp:TextBox ID="TextBoxMon" runat="server" class="form-control form-control-sm"></asp:TextBox>
                                                         </div>
                                                     </div>
                                                      <div class="col-lg-2">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label3" runat="server" Text="Department" ></asp:Label>
                                                             <asp:TextBox ID="TextBox3" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                     </div>
                                                 <div class="col-lg-4">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label4" runat="server" Text="Supervisor" ></asp:Label>
                                                               <asp:DropDownList ID="DropDownList1" runat="server" class="form-control form-control-sm">
                                                                   <asp:ListItem Text="Gunawaradana BKM"></asp:ListItem>
                                                                    <asp:ListItem Text="Karunanayake LPM"></asp:ListItem>
                                                                    <asp:ListItem Text="Bandara AKL"></asp:ListItem>
                                                               </asp:DropDownList>
                                                  
                                                         </div>
                                                     </div>
                                                </div>  
                                                  <div class="row">
                                                      <div class="col-lg-3">
                                                         
                                                               <div class="form-group">
                                                             <asp:Label ID="Label5" runat="server" Text="Street"></asp:Label>
                                                             <asp:TextBox ID="TextBoxStreet" runat="server" class="form-control form-control-sm"></asp:TextBox>
                                                         </div>
                                                          </div>
                                                          <div class="col-lg-3">
                                                               <div class="form-group">
                                                             <asp:Label ID="Label6" runat="server" Text="City"></asp:Label>
                                                             <asp:TextBox ID="TextBoxCity" runat="server" class="form-control form-control-sm"></asp:TextBox>
                                                         </div>
                                                          </div>
                                                          <div class="col-lg-3">
                                                               <div class="form-group">
                                                             <asp:Label ID="Label7" runat="server" Text="State"></asp:Label>
                                                             <asp:TextBox ID="TextBoxState" runat="server" class="form-control form-control-sm" ></asp:TextBox>
                                                         </div>
                                                          </div>
                                                      </div>
                                                      <div class="row">
                                                      <div class="col-lg-4">
                                                          <div class="form-group">
                                                             <asp:Label ID="Label9" runat="server" Text="Marital Status"></asp:Label>
                                                              <asp:DropDownList ID="DropDownListMarital" runat="server">
                                                                  <asp:ListItem Text="Married"></asp:ListItem>
                                                                    <asp:ListItem Text="Unmarried"></asp:ListItem>
                                                              </asp:DropDownList>
                                                         </div>
                                                      </div>
                                                      <div class="col-lg-3">
                                                          <div class="form-group">
                                                             <asp:Label ID="Label10" runat="server" Text="NIC Number"></asp:Label>
                                                             <asp:TextBox ID="TextBoxNIC" runat="server" class="form-control form-control-sm" ></asp:TextBox>
                                                         </div>
                                                      </div>
                                                      <div class="col-lg-3">
                                                          <div class="form-group">
                                                             <asp:Label ID="Label11" runat="server" Text="Gender"></asp:Label>
                                                             <asp:TextBox ID="TextBox5" runat="server" class="form-control form-control-sm" ReadOnly="true" ></asp:TextBox>
                                                         </div>
                                                      </div>
                                                 </div>
                                                 <div class="row">
                                                     <div class="col-lg-3">
                                                          <div class="form-group">
                                                             <asp:Label ID="Label12" runat="server" Text="Date of join"></asp:Label>
                                                             <asp:TextBox ID="TextBoxDoJ" runat="server" class="form-control form-control-sm" TextMode="Date" ></asp:TextBox>
                                                         </div>
                                                     </div>
                                                      
                                                 </div>
                                                 <div class="row">
                                                     <div class="col-lg-4">
                                                         <asp:Button ID="Button1" runat="server" Text="Update" class="btn btn-warning" OnClick="Button1_Click" />
                                                     </div>
                                                      <div class="col-lg-4">
                                                          <asp:Label ID="Label18" runat="server" ForeColor="#006600" Font-Size="Medium"></asp:Label>
                                                     </div>
                                                 </div>
                                                 </div>
                                                 
                                             </div>
                                         </div>
                                      </div>
                                 </div>
                        <div id="Attendance" class="tab-pane fade in active">

                        </div>
                        <div id="Performance" class="tab-pane fade in active">

                        </div>
                   </div>
            </div>
        </div>
    </div>
</asp:Content>

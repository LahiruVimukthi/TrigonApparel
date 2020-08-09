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
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                  <div class="row">
                                            <div class="col-lg-06">
                                                <asp:Panel ID="Panel1" runat="server" BorderStyle="Inset">
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                              <asp:Label ID="Label1" runat="server" Text="Daily Attendance"></asp:Label>
                                                        </div>
                                                      

                                                    </div>
                                                     <div class="row">
                                                         <div class="col-lg-6">
                                                             <div class="form-group">
                                                                  <asp:Label ID="Label2" runat="server" Text="Select Department"></asp:Label>
                                                                 <asp:DropDownList ID="DropDownListDepDaily" runat="server"></asp:DropDownList>
                                                             </div>
                                                         </div>
                                                        <div class="col-lg-6">
                                                             <div class="form-group">
                                                                  <asp:Label ID="Label3" runat="server" Text="Select Date"></asp:Label>
                                                                 <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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
                                                </asp:Panel>
                                            </div>
                                        </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                      
                                    </div>
                                </div>
                             </div>
                            <div id="Performance" class="tab-pane fade in active">

                             </div>
                         
                            <div id="Assets" class="tab-pane fade in active">

                             </div>
                        </div>
                        </div>
                    </div>
                </div>
</asp:Content>

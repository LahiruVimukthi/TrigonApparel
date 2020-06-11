<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AttendanceMark.aspx.cs" Inherits="TrigonApparel.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
   </script>

    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
<link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:ScriptManager ID="ScriptManagerAtt" runat="server"></asp:ScriptManager>
    <br />
    <br />
    <div class="container">
        <div class="row">
           
             <div class="col-lg-6">
            <div class="card bg-light mb-3">
                <div class="card-header">
                    Employee List
                </div>
                <div class="card-body">
                     <asp:GridView Class="table" ID="GridViewAttDep" runat="server" CellPadding="4" GridLines="None" ForeColor="#333333" OnSelectedIndexChanged="GridViewAttDep_SelectedIndexChanged">
                         <AlternatingRowStyle BackColor="White" />
                         <Columns>
                             <asp:TemplateField HeaderText="Select">
                                 <ItemTemplate>
                                     <asp:CheckBox ID="CheckBoxSelectAtt" runat="server" OnCheckedChanged="CheckBoxSelectAtt_CheckedChanged" AutoPostBack="true"/>
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                         <EditRowStyle BackColor="#7C6F57" />
                         <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                         <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                         <RowStyle BackColor="#E3EAEB" />
                         <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                         <SortedAscendingCellStyle BackColor="#F8FAFA" />
                         <SortedAscendingHeaderStyle BackColor="#246B61" />
                         <SortedDescendingCellStyle BackColor="#D4DFE1" />
                         <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </div>
            </div>
            </div>            
             <div class="col-lg-4">
            <div class="card bg-light mb-3">
                <div class="card-header">
                    Mark Attendnce
                </div>
                <div class="card-body">
                    <div class="row">
                    <div class="form-group form-inline">
                    <label for="Select Department">Select Department:</label>
                    <asp:DropDownList ID="DropDownListAtJob" runat="server" OnSelectedIndexChanged="DropDownListAttJob_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Dep_Name" DataValueField="Dep_ID">
                    </asp:DropDownList>                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Dep_ID], [Dep_Name] FROM [Department]"></asp:SqlDataSource>               
                </div>

                   
                        <div class="form-group form-inline">
                         <label for="AttDate">Date:</label>
                        <asp:TextBox ID="TextBoxAttDate" runat="server" TextMode="Date"></asp:TextBox>
                           
                    </div>
                    </div>
                  
                    <div class="row">
                    <div class="form-group form-inline">
                         <label for="Employee_ID">Employee ID:</label>
                        <asp:TextBox ID="TextBoxAttEmpID" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group form-inline">
                         <label for="EmployeeName">Employee Name:</label>
                        <asp:TextBox ID="TextBoxAttEmpName" runat="server"></asp:TextBox>
                    </div>
                     <div class="form-group form-inline">
                         <label for="Req_Status">Status:</label>
                         <asp:DropDownList ID="DropDownListAttStatus" runat="server" DataSourceID="SqlDataSource4" DataTextField="CheckStatus" DataValueField="CheckID">
                             
                         </asp:DropDownList>
                         
                         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [CheckID], [CheckStatus] FROM [CheckInOut]"></asp:SqlDataSource>
                         
                         
                    </div>
                        <div class="form-group form-inline">
                            <label for="Att_Time">Enter Time:</label>
                            <asp:TextBox ID="TextBoxAttDateTime" runat="server" type="time"></asp:TextBox>
                            
                    </div>
                   
                    <asp:Button ID="ButtonAddAtt" runat="server" Text="Submit" OnClick="ButtonAddAtt_Click" />
                </div>
                </div>
            </div> 
                </div>
           
                
        </div>         
      </div> 
    <hr />
       
       
 
</asp:Content>

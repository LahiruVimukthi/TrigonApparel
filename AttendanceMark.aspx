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
         <div class="row">
    <div class="col-lg-12">
            <div class="card bg-light mb-3">
                <div class="card-header">View Attendance Records</div>
                <div class="card-body">
                    <div class="row">
                        
                         <div class="col-lg-3">
                            <div class="form-inline">
                                <label for="Department">Select Department: </label>
                                <asp:DropDownList ID="DropDownListAttByDep" runat="server" DataSourceID="SqlDataSource2" DataTextField="Dep_Name" DataValueField="Dep_ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Dep_ID], [Dep_Name] FROM [Department]"></asp:SqlDataSource>
                            </div>
                            
                        </div>          
                             <div class="col-lg-3">
                           <div class="form-inline">
                                <asp:Label ID="LabelAttDate" runat="server" Text="From: "></asp:Label>
                               <asp:TextBox ID="TextBoxDate" runat="server" TextMode="Date"></asp:TextBox>
                           </div>
                        </div>
                        
                       
                     
                       <div class="col-lg-3">
                           <asp:Button ID="ButtonAttLoad" runat="server" Text="Load" TextMode="Date" OnClick="ButtonLeavesLoad_Click1"  AutoPostback="False"/>
                       </div>   
                           
                        </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:GridView ID="GridViewAttendanceToFrom" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="3">
                                <Columns>
                                    <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" />
                                    <asp:BoundField DataField="F_Name" HeaderText="Name" />
                                </Columns>

                                <EditRowStyle BorderStyle="Dashed" />
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />

                            </asp:GridView>
                        </div>
                    </div>
                    </div>
                  <br />
                  
                    
                </div>
            </div>
        </div>
       
 
</asp:Content>

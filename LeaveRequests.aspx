<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LeaveRequests.aspx.cs" Inherits="TrigonApparel.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <div class="row">
        <div class="col-lg-12">
             <div class="card-body" style="background-color: #ecf0f1; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: bold">
            <asp:Label ID="Label3" runat="server" Text="Full Day/Half Day Leave Requests"></asp:Label>
        </div>
        </div>
       
    </div>
   
    <div class="row">
       
      <div class="col-lg-6">
            <div class="card">
                <center>
                <div class="card-header" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; background-color: #16a085; color: #FFFFFF; font-weight: bold">Full Day Leaves</div>
                </center>
                    <div class="card-body">
                   
                    <div class="row">
                        
                        <div class="col-lg-3">
                            <div class="form-group">
                            <label for="EmpID">Employee ID:</label>
                                <asp:TextBox ID="TextBoxLeaveEmpID" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                </div>
                                 <div class="form-group">
                                 <asp:Button ID="ButtonLoad" runat="server" Text="Load" OnClick="ButtonLoad_Click" />
                        </div>
                            </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                            <label for="EmpName">Name:</label>
                                <asp:TextBox ID="Empname" runat="server" CssClass="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                               
                        </div>
                            </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                            <label for="DepName">Department:</label>
                                <asp:TextBox ID="TextBoxDep" runat="server" CssClass="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                               
                        </div>
                            </div>
                       
                        </div>
                       
                        <div class="row" font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold">                        
                        <div class="col-lg-6">
                            <div class="form-group">
                                <asp:Label ID="LabelAvaDates" runat="server" ForeColor="#990033" Font-Size="Medium"></asp:Label>                               
                        </div>
                            </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <asp:Label ID="LabelPendingDates" runat="server" ForeColor="#990033" Font-Size="Medium"></asp:Label>                               
                        </div>
                            </div>
                        </div>
                    <div class="row">
                        <br />
                        <div class="col-lg-12">
                            <asp:GridView ID="GridViewLeaveHis" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Size="Small" ForeColor="Black" GridLines="Vertical">
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                <Columns>
                                    <asp:BoundField HeaderText="Date" DataField="Req_Date" DataFormatString="{0:MM/dd/yyyy}" />
                                    <asp:BoundField HeaderText="Status" DataField="Req_Status" />
                                    <asp:BoundField HeaderText="Reason" DataField="Req_Description" />
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#383838" />
                            </asp:GridView>
                        </div>
                    </div>
                        <div class="row">
                            <div class="col-lg-3">
                            <div class="form-group">
                                <label for="LeaveDate">Select Date:</label>
                                <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" CssClass="form-control form-control-sm"></asp:ListBox>
                            </div>
                                </div>
                            <div class="col-lg-3">
                            <div class="form-group">
                                <label for="LeaveDescription">Description:</label>
                                <asp:TextBox ID="TextBoxLeaveDes" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                                </div>
                            <div class="col-lg-3">
                             <div class="row">
                                 <div class="form-group">
                                <asp:CheckBox ID="CheckBoxLeaveReq" runat="server" Text="Request"/>
                                 <asp:Button ID="ButtonSubmitLeavReq" runat="server" Text="Submit" type="submit" OnClick="ButtonSubmitLeavReq_Click" />
                           
                                </div>
                             </div>                           
                                </div> 
                           
                        </div>
                    <div class="row">
                        <div class="col-lg-2">
                            <asp:Calendar ID="CalendarLeaveReq" runat="server" OnSelectionChanged="CalendarLeaveReq_SelectionChanged" Width="350px" SelectionMode="DayWeek" Height="190px" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                <TodayDayStyle BackColor="#CCCCCC" />
                            </asp:Calendar>
                        </div>
                                                  
                    </div>
                             
                            
                           
                        
                       </div>
                       </div>
         </div>
         

     <div class="col-lg-6">
            <div class="card">
                <div class="card-header" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; background-color: #16a085; color: #FFFFFF; font-weight: bold">Half Day Leaves</div>
                <div class="card-body">
                 
                    <div class="row">
                        
                        <div class="col-lg-3">
                            <div class="form-group">
                            <label for="EmpID">Employee ID:</label>
                                <asp:TextBox ID="TextBoxEmID" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                </div>
                                 <div class="form-group">
                                 <asp:Button ID="ButtonHDLLoad" runat="server" Text="Load" OnClick="ButtonHDLLoad_Click"/>
                        </div>
                            </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                            <label for="EmpName">Name:</label>
                                <asp:TextBox ID="TextBoxNam" runat="server" CssClass="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                               
                        </div>
                            </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                            <label for="DepName">Department:</label>
                                <asp:TextBox ID="TextBoxDept" runat="server" CssClass="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                               
                        </div>
                            </div>
                       
                        </div>
                       
                        <div class="row">                        
                        <div class="col-lg-3">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" ForeColor="#009900"></asp:Label>                               
                        </div>
                            </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" ForeColor="#CC0000"></asp:Label>                               
                        </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                            <div class="form-group">
                                <label for="LeaveDate">Select Date:</label>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control form-control-sm" OnTextChanged="TextBoxLeaveDate_TextChanged"></asp:TextBox>
                            </div>
                                </div>
                             <div class="col-lg-3">
                            <div class="form-group">
                                <label for="FromTime">From :</label>
                                <asp:TextBox ID="TextBoxFrTime" runat="server" CssClass="form-control form-control-sm" TextMode="Time"></asp:TextBox>
                            </div>
                                </div>
                             <div class="col-lg-3">
                            <div class="form-group">
                                <label for="ToTime">To:</label>
                                <asp:TextBox ID="TextBoxToTime" runat="server" CssClass="form-control form-control-sm" TextMode="Time"></asp:TextBox>
                            </div>
                                </div>

                            <div class="col-lg-3">
                            <div class="form-group">
                                <label for="LeaveDescription">Description:</label>
                                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                                </div>
                            </div>
                    <div class="row">
                            <div class="col-lg-3">
                             <div class="row">
                                 <div class="form-group">
                                <asp:CheckBox ID="CheckBoxHDleave" runat="server" Text="Request"/>
                                 <asp:Button ID="Button2" runat="server" Text="Submit" type="submit" OnClick="Button2_Click" />
                           
                                </div>
                             </div>                           
                                </div>
                        </div>
                           
                           
                        
                    <div class="row">
                        <div class="col-lg-2">
                            <asp:Calendar ID="Calendar1" runat="server"  Width="350px" SelectionMode="DayWeek" Height="190px" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                <TodayDayStyle BackColor="#CCCCCC" />
                            </asp:Calendar>
                        </div>
                                                  
                    </div>
                    </div>
                             
                            
                           
                        
                        </div>
                        </div>
         </div>
        </ContentTemplate>
    </asp:UpdatePanel>
   
       
      
   <!-- <div class="row">
     <div class="col-lg-12">
         <div class="row">
         <div class="col-lg-6">
            <div class ="card">
                <div class="card-header">
                   Current Leave Requests
                </div>
                <div class="card-body">
                    <asp:GridView class="table" ID="GridViewLeaveReq" runat="server" OnSelectedIndexChanged="GridViewLeaveReq_SelectedIndexChanged" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" />
                            <asp:BoundField DataField="Req_Status" HeaderText="Status" />
                            <asp:BoundField DataField="Req_Description" HeaderText="Description" />
                            <asp:TemplateField HeaderText="Leave Date" >
                                <ItemTemplate>
                                    <asp:Label ID="lbl1" runat="server" DataFormatString="{0:yyyy-MMMM-dd}" HtmlEncode="false"
                                        Text='<%#Eval("Req_Date","{0:yyyy-MMMM-dd}") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </div>
                    </div>
                </div>
    </div>
     </div>      
    
    </div>-->
        
</asp:Content>

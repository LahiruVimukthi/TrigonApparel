<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LeaveApproval.aspx.cs" Inherits="TrigonApparel.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    
     <div class="row">
          <div class="col-lg-8">
            <div class="card text-black bg-light mb-3">
                <div class="card-header">Approvals</div>
                <div class="card-body">
                    <asp:GridView Class="table" ID="GridViewApproveLeave" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridViewApproveLeave_SelectedIndexChanged" Font-Size="Medium" HorizontalAlign="Justify" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBoxSelectReq" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" SortExpression="Employee_ID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="F_Name" HeaderText="F_Name" SortExpression="F_Name" />
                            <asp:BoundField DataField="Dep_Name" HeaderText="Dep_Name" SortExpression="Dep_Name" />
                            <asp:BoundField DataField="Req_Date" HeaderText="Req_Date" SortExpression="Req_Date" DataFormatString="{0:MM/dd/yyyy}"/>
                            <asp:BoundField DataField="Req_Status" HeaderText="Req_Status" SortExpression="Req_Status" />
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
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="Select User_Registrations.Employee_ID, F_Name, Dep_Name, Req_Date, Req_Status from User_Registrations JOIN Department ON User_Registrations.Dep_ID=Department.Dep_ID JOIN Leaves ON Leaves.Employee_ID=User_Registrations.Employee_ID WHERE Req_Status='Pending'"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT Employee_ID,Req_Date,Req_Status,Req_Description FROM dbo.[Leaves] WHERE (Req_Status='Pending') "></asp:SqlDataSource>
                </div>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#003366"></asp:Label>
                <div class="card-footer">
                    <div class="form-group">
                        <asp:Button ID="ButtonApproveLeaves" runat="server" Text="Approve" OnClick="ButtonApproveLeaves_Click" />
                        <asp:Button ID="ButtonDeclineLeaves" runat="server" Text="Decline" OnClick="ButtonDeclineLeaves_Click" />
                    </div>
                     </div>
                    <asp:ScriptManager ID="ScriptManagerDecline" runat="server"></asp:ScriptManager>
                    <div class="row">
                        <div class="col-lg-6">
                              <asp:Panel ID="pnModelPopup" runat="server" CssClass="popup">
                        <div class="card">
                            <div class="card-header">Enter Decline Criteria</div>
                            <div class="card-body">
                             
                                 <div class="row">
                                     <div class="form-inline">
                                     <asp:Label ID="LabelDeclineReason" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#003366"></asp:Label>
                                       
                                     <asp:DropDownList ID="DropDownListDeclineReason" runat="server" DataSourceID="SqlDataSource2" DataTextField="Dec_Des" DataValueField="Dec_ID" OnSelectedIndexChanged="DropDownListDeclineReason_SelectedIndexChanged"></asp:DropDownList>
                                       </div>  
                                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Dec_Des], [Dec_ID] FROM [LeaveDeclineDes]"></asp:SqlDataSource>
                                 </div>
                                 <div class="row">
                                     <div class="form-group">
                                     <asp:Label ID="LabelOther" runat="server"></asp:Label>
                                    <asp:TextBox ID="TextBoxOther" runat="server"></asp:TextBox>
                                         </div>
                                     </div>
                                <div class="row">
                                    <div class="form-group">
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                                    <asp:Button ID="ButtonDecSubmit" runat="server" Text="Submit" OnClick="ButtonDecSubmit_Click" />
                                        </div>
                                 </div>
                        </div>
                            </div>
                                         
                  </asp:Panel>
                        </div>
                    </div>
                  
                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="ButtonDeclineLeaves" DropShadow="true" BackgroundCssClass="modalBackground" CancelControlID="btnCancel" PopupControlID="pnModelPopup"></ajaxToolkit:ModalPopupExtender>
                       
               
            </div>
        </div>           
       
        <div class="col-lg-4">
            
            <div class="row">
            <div class="card">
                <div class="card-header">Check Availability</div>
                    <div class="card-body">
                        <div class="row">
                <div class="form-group form-inline">
                            <label for="EmpID">Enter Employee ID:</label>
                                <asp:TextBox ID="TextBoxSearchEmpIDApprove" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                <asp:Button ID="LeadEmpID" runat="server" Text="Load" OnClick="LeadEmpID_Click" />
                        </div>
                        </div>
                        <div class="row">
                        <asp:Calendar ID="CalendarApproveLeaves" runat="server" OnSelectionChanged="CalendarApproveLeaves_SelectionChanged" SelectionMode="DayWeek" OnDayRender="CalendarApproveLeaves_DayRender" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                             </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <asp:Label ID="LabelToTLeaves" runat="server"></asp:Label>
                                </div>
                            </div>
                             <div class="col-lg-3">
                                <div class="form-group">
                                    <asp:Label ID="LabelCurLeaves" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                <asp:GridView ID="GridViewTest" runat="server" OnSelectedIndexChanged="GridViewTest_SelectedIndexChanged"></asp:GridView>

            </div>
        </div>
            </div>
         
  
    </div>

    <div class="row">
        <div class="col-lg-11">
            <div class="card">
                <div class="card-header">Daily Department Summary</div><br />
                <div class="body">
                  
                        <div class="row">
                            <div class="col-lg-3">
                              <div class="form-group">
                                <asp:Label ID="LabelDep" runat="server" Text="Select Department: "></asp:Label>
                                <asp:DropDownList ID="DropDownListDept" runat="server" DataSourceID="SqlDataSource3" DataTextField="Dep_Name" DataValueField="Dep_ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>                       
                                </div>
                                </div>
                            <div class="col-lg-3">
                            <div class="form-group">
                                <asp:Label ID="LabelDate" runat="server" Text="Date: "></asp:Label>
                                <asp:TextBox ID="TextBoxDate" runat="server" TextMode="Date"></asp:TextBox>          
                                </div>
                                </div>
                            <div class="col-lg-2">
                            <div class="form-group">
                            <asp:Button ID="Button1" runat="server" Text="Load" OnClick="ButtonLoadleaves_Click" />
                    </div>
                                </div>
                            </div>
                            
                       
                             <div class="row">
                                 <div class="col-lg-3">
                             <div class="form-group">
                                <asp:Label ID="LabelTot" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#006600"></asp:Label>                      
                            </div>
                                     </div>
                                 <div class="col-lg-3">
                                  <div class="form-group">
                                <asp:Label ID="LabelCur" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Maroon"></asp:Label>
                                </div>
                                     </div>
                             </div>
                            
                        </div>
                </div>
            </div>        
    </div>

   
       
       
   
</asp:Content>

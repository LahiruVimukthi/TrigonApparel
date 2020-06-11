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
                    <asp:GridView Class="table" ID="GridViewApproveLeave" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridViewApproveLeave_SelectedIndexChanged" Font-Size="Medium" HorizontalAlign="Justify" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBoxSelectReq" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" SortExpression="Employee_ID" />
                            <asp:TemplateField HeaderText="Leave Date" >
                                <ItemTemplate>
                                    <asp:Label ID="lbl1" runat="server" DataFormatString="{0:yyyy-MMMM-dd}" HtmlEncode="false"
                                        Text='<%#Eval("Req_Date","{0:yyyy-MMMM-dd}") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Req_Status" HeaderText="Req_Status" SortExpression="Req_Status" />
                            <asp:BoundField DataField="Req_Description" HeaderText="Req_Description" SortExpression="Req_Description" />
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
                    </div>
                <asp:GridView ID="GridViewTest" runat="server"></asp:GridView>
            </div>
        </div>
            </div>
         
  
    </div>
    <br />
   
       
       
   
</asp:Content>

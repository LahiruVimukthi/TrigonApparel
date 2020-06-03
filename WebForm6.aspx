<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="TrigonApparel.WebForm6" %>
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
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">Request Form</div>
                <div class="card-body">
                    <h4>Make a Request</h4>
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                            <label for="EmpID">Employee ID:</label>
                                <asp:TextBox ID="TextBoxLeaveEmpID" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                             <div class="form-group">
                                <label for="LeaveDate">Select Date:</label>
                                <asp:TextBox ID="TextBoxLeaveDate" runat="server" CssClass="form-control form-control-sm" OnTextChanged="TextBoxLeaveDate_TextChanged"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="LeaveDescription">Description:</label>
                                <asp:TextBox ID="TextBoxLeaveDes" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:CheckBox ID="CheckBoxLeaveReq" runat="server" Text="Request"/>
                            </div>
                             <div class="form-group">
                                 <asp:Button ID="ButtonSubmitLeavReq" runat="server" Text="Submit" type="submit" OnClick="ButtonSubmitLeavReq_Click" />
                            </div>
                            
                            </div>
                        <div class="col-lg-3">
                            <asp:Calendar ID="CalendarLeaveReq" runat="server" OnSelectionChanged="CalendarLeaveReq_SelectionChanged" Width="365px" SelectionMode="DayWeek"></asp:Calendar>
                        </div>
                        </div>
                        </div>
            </div>
         </div>
            </div>
        
</asp:Content>

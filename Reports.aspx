<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="TrigonApparel.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h4>Attendance Reports</h4>
            <hr />
            <div class="card">
                <div class="card-header"> Employee Attendance Records</div>
                <div class="card-body">
                    <div class="row">
                         <div class="col-lg-2">
                            <div class="form-inline">
                                <label for="Department">Select Department: </label>
                                <asp:DropDownList ID="DropDownListAttRepByDep" runat="server" DataSourceID="SqlDataSource1" DataTextField="Dep_Name" DataValueField="Dep_ID" OnSelectedIndexChanged="DropDownListAttRepByDep_SelectedIndexChanged"></asp:DropDownList>
                               
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Dep_ID], [Dep_Name] FROM [Department]"></asp:SqlDataSource>
                               
                            </div>
                            
                        </div>  
                        <div class="col-lg-2">
                           <div class="form-inline">
                                <asp:Label ID="LabelAttFromDate" runat="server" Text="From: "></asp:Label>
                               <asp:TextBox ID="TextBoxAttFromDate" runat="server" TextMode="Date"></asp:TextBox>
                           </div>
                        </div>
                        <div class="col-lg-2">
                           <div class="form-inline">
                                <asp:Label ID="LabelAttToDate" runat="server" Text="To :"></asp:Label>
                               <asp:TextBox ID="TextBoxToDate" runat="server" TextMode="Date"></asp:TextBox>
                           </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-inline">
                                 <asp:Label ID="LabelAttStatus" runat="server" Text="Select Status: "></asp:Label>
                                 <asp:DropDownList ID="DropDownListCheckINOut" runat="server" DataSourceID="SqlDataSource2" DataTextField="CheckStatus" DataValueField="CheckID"></asp:DropDownList>
                                
                                
                                
                                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [CheckStatus], [CheckID] FROM [CheckInOut]"></asp:SqlDataSource>
                                
                                
                                
                            </div>                         
                       </div>
                         <div class="col-lg-2">
                               <div class="form-inline">
                           <asp:Button ID="ButtonAttLoad" runat="server" Text="Load" OnClick="ButtonAttLoad_Click" />
                                   </div>
                       </div> 
                        
                    </div>
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-lg-6">
                             <asp:GridView Class="table" ID="GridView1AttRepToFrom" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Size="Small" ForeColor="#333333" GridLines="None" >
                                 <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" />
                                <asp:BoundField DataField="F_Name" HeaderText="Name" />
                                <asp:BoundField DataField="Att_Time" HeaderText="Time" DataFormatString="{0:HH:mm:ss}" />
                            </Columns>
                                 <EditRowStyle BackColor="#2461BF" />
                                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                 <RowStyle BackColor="#EFF3FB" />
                                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        </div>
                      
                       
                           
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
          <div class="col-lg-12">
            <h4>Leave Reports</h4>
            <hr />
            <div class="card">
                <div class="card-header"> Employee Leave Records</div>
                <div class="card-body">
                    <div class="row">
                         <div class="col-lg-2">
                            <div class="form-inline">
                                <label for="Department">Select Department: </label>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Dep_Name" DataValueField="Dep_ID"></asp:DropDownList>
                               
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Dep_ID], [Dep_Name] FROM [Department]"></asp:SqlDataSource>
                               
                            </div>
                            
                        </div>  
                        <div class="col-lg-2">
                           <div class="form-inline">
                                <asp:Label ID="Label1" runat="server" Text="From: "></asp:Label>
                               <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
                           </div>
                        </div>
                        <div class="col-lg-2">
                           <div class="form-inline">
                                <asp:Label ID="Label2" runat="server" Text="To :"></asp:Label>
                               <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                           </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-inline">
                                 <asp:Label ID="Label3" runat="server" Text="Select Status: "></asp:Label>
                                 <asp:DropDownList ID="DropDownListReqStatus" runat="server">
                                     <asp:ListItem>Approved</asp:ListItem>
                                     <asp:ListItem>Declined</asp:ListItem>
                                     <asp:ListItem>Pending</asp:ListItem>
                                 </asp:DropDownList>
                                 
                            </div>                         
                       </div>
                         <div class="col-lg-2">
                               <div class="form-inline">
                           <asp:Button ID="Button1" runat="server" Text="Load" OnClick="Button1_Click" />
                                   </div>
                       </div> 
                        
                    </div>
                    <br />
                    <br />
                    <div class="row">
                        
                        <asp:GridView Class="table" ID="GridViewLeaveRep" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Size="Small" ForeColor="#333333" GridLines="None" HorizontalAlign="Justify" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" />
                                <asp:BoundField DataField="F_Name" HeaderText="Name" />
                                <asp:BoundField DataField="Req_Date" HeaderText="Leaves" DataFormatString="{0:MM/dd/yyyy}" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                           
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

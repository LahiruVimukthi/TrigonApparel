<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Feedbacks.aspx.cs" Inherits="TrigonApparel.WebForm19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
         $(document).ready(function () {
             $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         });
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="row">
        
        <div class="card-body" style="background-color: #b2bec3; color: #000000; font-weight: bolder; font-family: Arial, Helvetica, sans-serif; font-size: large">
       <center>
            Employee Feedbacks
       </center>    
        </div>
            
    </div>
    <br />
            
   
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Employee_ID],[Feed_Type],[Feedback] ,[FeedDate] from [Feedbacks] WHERE [Feed_Type]='Suggestion'"></asp:SqlDataSource>
            
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                 <ul class="nav nav-tabs nav-justified nav-fill" style="font-family: Arial, Helvetica, sans-serif; font-size: medium;"> 
  <li class="active"><a class="nav-link" data-toggle="pill" href="#Complaints" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Complaints</a></li>
        
  <li><a class="nav-link" data-toggle="pill" href="#Suggestions" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Suggestions</a></li>
           
  <li><a class="nav-link" data-toggle="pill" href="#Compliments" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Compliments</a></li>
                             
</ul>
                <br />
                 <div class="tab-content">
                      <div id="Complaints" class="tab-pane fade in active">
                          <div class="row">
                               <div class="col-lg-06">
            <div class="card">
                <div class="card-header" style="background-color: #273c75; font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #FFFFFF; font-weight: bold">Complaints</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-06">
                             <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="FeedbackID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
                                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="FeedbackID" HeaderText="Feedback ID" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="row">
                                            <div class="col-lg-12">

                                                <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="X-Large" Text='<%# Eval("Feedback") %>' ForeColor="#003366" Font-Bold="True"></asp:Label>

                                            </div>
                                        </div>
                                             <div class="row">
                                            <div class="col-lg-12">

                                                Employee-<asp:Label ID="Label2" runat="server" Text='<%# Eval("Employee_ID") %>' Font-Bold="True"></asp:Label>
                                                &nbsp;| Type-
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Feed_Type") %>'></asp:Label>
                                                &nbsp;| Date-
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("FeedDate") %>' Font-Bold="True" DataFormatString="{0:MM/dd/yyyy}"></asp:Label>

                                            </div>
                                        </div>
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [FeedbackID], [Employee_ID], [Feed_Type], [Feedback], [FeedDate] FROM [Feedbacks] WHERE Status='Pending' AND Feed_Type='Complaint'"></asp:SqlDataSource>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
                          </div>
                          <br />
                            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header" style="background-color: #273c75; color: #FFFFFF; font-size: medium; font-family: Arial, Helvetica, sans-serif; font-weight: bold">
                            Response
                        </div>
                        <div class="card-body">
                             <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="Feedback ID"></asp:Label>
                                <asp:Label ID="Label6" runat="server" ForeColor="Maroon"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="Reply"></asp:Label>
                                <asp:TextBox ID="TextBoxRep" runat="server" class="form-control form-control-sm " TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class  ="row">
                        <div class="col-lg-4">
                            <asp:Button ID="Button1" runat="server" Text="Attend" class="btn btn-sm btn-success" OnClick="Button1_Click" />
                        </div>
                         <div class="col-lg-4">
                             <asp:Label ID="Label8" runat="server" ForeColor="#006600" Font-Bold="True"></asp:Label>
                        </div>
                    </div>
                        </div>
                    </div>
                   
                </div>
            </div>
                      </div>
                      <div id="Suggestions" class="tab-pane fade in active">
                          <div class="row">
                              <div class="col-lg-12">
                                   <asp:GridView ID="GridView3"  runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Font-Size="Large">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
              <asp:BoundField DataField="FeedDate" HeaderText="Date" SortExpression="FeedDate"  DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" SortExpression="Employee_ID" />
            
            <asp:BoundField DataField="Feedback" HeaderText="Feedback" SortExpression="Feedback" />
          
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
                      <div id="Compliments" class="tab-pane fade in active">
                           <div class="row">
       
         <div class="col-lg-12">
             
                         <asp:GridView  ID="GridView2"  runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Font-Size="Large">
                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                             <Columns>
                                 <asp:BoundField DataField="FeedDate" HeaderText="Date" SortExpression="FeedDate"  DataFormatString="{0:MM/dd/yyyy}" />
                                 <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" SortExpression="Employee_ID" />
                                
                                 <asp:BoundField DataField="Feedback" HeaderText="Feedback" SortExpression="Feedback" />
                                 
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
                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT Employee_ID,Feedback,FeedDate from Feedbacks WHERE Feed_Type='Compliment'"></asp:SqlDataSource>
                     
                 
             </div>
         </div>
     
   
                      </div>
                 </div>
            </div>
          </div> 
    </div>
          
      
   
</asp:Content>

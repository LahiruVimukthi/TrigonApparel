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
    <div class="row">
        <div class="col-lg-12">
            <div class="card-body" style="background-color: #ecf0f1; font-family: Arial, Helvetica, sans-serif; font-size: large; font-weight: bolder; color: #2c3e50">
                <center>
                <asp:Label ID="Label1" runat="server" Text="EMPLOYEE ATTENDANCE MARKING"></asp:Label>
            </center>
                    </div>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                 <div class="form-group form-inline">
                    <label for="Select Department" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: bold">Select Department:</label>
                    <asp:DropDownList ID="DropDownListAtJob" runat="server"  class="form-control form-control-sm" OnSelectedIndexChanged="DropDownListAttJob_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Dep_Name" DataValueField="Dep_ID">
                    </asp:DropDownList>                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Dep_ID], [Dep_Name] FROM [Department]"></asp:SqlDataSource>               
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group form-inline">
                         <label for="AttDate" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: bold">Date:</label>
                        <asp:TextBox ID="TextBoxAttDate" runat="server" TextMode="Date" class="form-control form-control-sm"></asp:TextBox>
                           
                    </div>
            </div>            

        </div>
        <div class="row">
           
             <div class="col-lg-8">
            <div class="card bg-light mb-3">
                <div class="card-header" style="font-family: Arial, Helvetica, sans-serif; background-color: #16a085; color: #FFFFFF; font-size: medium; font-weight: bold">
                   Mark Attendance
                </div>
                <div class="card-body">
                     <asp:GridView Class="table" ID="GridViewAttDep" runat="server" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="GridViewAttDep_SelectedIndexChanged" AutoGenerateColumns="False" Font-Names="Arial" Font-Size="Small" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                         <Columns>
                             <asp:TemplateField HeaderText="Select">
                                 <ItemTemplate>
                                     <asp:CheckBox ID="CheckBoxSelectAtt" runat="server"/>
                                 </ItemTemplate>
                             </asp:TemplateField>
                              <asp:TemplateField HeaderText="Employee ID">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("Employee_ID") %>' >LinkButton</asp:LinkButton>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:BoundField HeaderText="Name" DataField="F_name"/>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                  <asp:DropDownList ID="DropDownListAttStatus" runat="server" DataSourceID="SqlDataSource2" DataTextField="CheckStatus" DataValueField="CheckID" >
                         </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT * FROM [CheckInOut]"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT * FROM [CheckInOut]"></asp:SqlDataSource>
                         </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="Time">
                                <ItemTemplate>
                                     <asp:TextBox ID="TextBoxAttDateTime" runat="server" type="time"></asp:TextBox>
                                     </ItemTemplate>
                            </asp:TemplateField>
                         </Columns>
                         <FooterStyle BackColor="White" ForeColor="#333333" />
                         <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                         <RowStyle BackColor="White" ForeColor="#333333" />
                         <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                         <SortedAscendingCellStyle BackColor="#F7F7F7" />
                         <SortedAscendingHeaderStyle BackColor="#487575" />
                         <SortedDescendingCellStyle BackColor="#E5E5E5" />
                         <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </div>
            </div>
            </div>   
            <div class="col-lg-4">
                <div class="row">
                     <asp:Button ID="ButtonAdd" runat="server" Text="Add" class="btn btn-success btn-sm" OnClick="ButtonAdd_Click"/>
                </div>
                <br />
               
               <div class="row">
                   <div class="card">
                       <div class="card-header" style="font-family: Arial, Helvetica, sans-serif; color: #2c3e50; font-weight: bold; font-size: medium;">Today on Leave</div>
                           <div class="card-body">
                                   <div class="col-lg-12">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Font-Names="Arial" Font-Size="Small" ForeColor="Black" GridLines="Vertical">
                       <AlternatingRowStyle BackColor="#CCCCCC" />
                       <Columns>
                           <asp:BoundField HeaderText="Name" DataField="F_Name" />
                            <asp:BoundField HeaderText="Employee ID" DataField="Employee_ID" />
                           <asp:BoundField HeaderText="Status" DataField="Req_Status" />
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
                       
                   </div>
               
              
               </div>
            </div>
             
           
                
        </div> 
        <!--Popup Panel-->
         <div class="row">
            <asp:Panel ID="PanelAtt" runat="server">
                      <asp:UpdatePanel runat="server">
                          <ContentTemplate>
                                <div class="card">
                                    <div class="card-header" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; background-color: #3498db; color: #FFFFFF; font-weight: bold;">Employee Attendance
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="CloseAtt">
                    <span aria-hidden="true">&times;</span>
                </button>
                                    </div>
                             <div class="card-body" style="background-color: #ecf0f1; font-family: Arial, Helvetica, sans-serif; color: #000000">
                           <div class="container">
                          <div class="row">
                               <div class="col-lg-12">
                                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                                       <Columns>
                                           <asp:BoundField HeaderText="Employee ID" DataField="Employee_ID" />
                                           <asp:BoundField HeaderText="Date" DataField="At_Date" DataFormatString="{0:MM/dd/yyyy}" />
                                           <asp:BoundField HeaderText="Status" DataField="CheckStatus" />
                                           <asp:BoundField HeaderText="Time" DataField="Att_Time" DataFormatString="{0:HH:mm:ss}"  />
                                           <asp:BoundField HeaderText="Department" DataField="Dep_ID" />

                                       </Columns>
                                   </asp:GridView>
                               </div>
                          </div>
                               <br />
                          <div class="row">
                              <div class="col-lg-4">
                                   <asp:Button ID="Button5" runat="server" Text="View" OnClick="Button5_Click"  class="btn btn-info btn-sm"/>
                              </div>
                              <div class="col-lg-4">
                              <asp:Button ID="Button6" runat="server" Text="Save" OnClick="Button6_Click"  class="btn btn-success btn-sm"/>
                          </div>
                              <div class="col-lg-4">
                                  <asp:Label ID="Label3" runat="server"></asp:Label>
                              </div>
                              </div>
                         
                      </div>
                      </div>
                      </div>
                          </ContentTemplate>
                      </asp:UpdatePanel>
                    
                   
                     
                  </asp:Panel>
           <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="PanelAtt" TargetControlID="ButtonAdd" BackgroundCssClass="modalBackground" CancelControlID="CloseAtt" ></ajaxToolkit:ModalPopupExtender>
      </div>
       
      </div> 
    <hr />
       
       
 
</asp:Content>

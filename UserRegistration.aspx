<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="TrigonApparel.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <center>
            <p>User Registration</p>
        </center>
    </div>
    <br />
    <div class="row" id="UserReg">
        <div class="col-lg-2">
            <asp:Button ID="ButtonCreateProfile" runat="server" Text="Create Profile" class="btn btn-success btn-sm text-nowrap" OnClick="ButtonCreateProfile_Click" />
        </div>
        <div class="col-lg-2">
            <asp:Button ID="ButtonAddEmployee" runat="server" Text="+ Add Employee" class="btn btn-success btn-sm text-nowrap" OnClick="ButtonCreateProfile_Click" />
        </div>
    </div>

     <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="PanelAddEmployee" runat="server">
        <div class="card w-100 border-success" aria-hidden="true">
            <div class="card-header">
                Add New Employee
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnclose">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="card-body">
                <div class="row">
                  
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="email">First Name:</label>
                                <asp:TextBox ID="TextBoxFName" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="email">Last Name:</label>
                                <asp:TextBox ID="TextBoxLName" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="JobTitle">Job Title:</label>
                                <asp:DropDownList ID="DropDownListJob" runat="server" OnSelectedIndexChanged="DropDownListJob_SelectedIndexChanged" CssClass="form-control form-control-sm" DataSourceID="SqlDataSource1" DataTextField="Dep_Name" DataValueField="Dep_ID" >
                                </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Dep_Name], [Dep_ID] FROM [Department]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="PhoneNumber">PhoneNumber:</label>
                                <asp:TextBox ID="TextBoxPhnNmbr" runat="server" CssClass="form-control form-control-sm" TextMode="Number"></asp:TextBox>                               
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="NIC Number">NIC Number:</label>
                                <asp:TextBox ID="TextBoxNICNmbr" runat="server" CssClass="form-control form-control-sm" TextMode="Number"></asp:TextBox>                               
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10">
                        <div class="form-group ">
                            <label for="Address">Address:</label>
                            <asp:TextBox ID="TextStreetAddress" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine"></asp:TextBox>
                        </div>
                        </div>
                            </div>
                        <hr />
                        <div class="row">
                            <div class="col-sm-10">
                                 <asp:TextBox ID="TextBoxCityAddrs" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-sm-10">
                                <asp:TextBox ID="TextBoxStateAddrs" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <center>
                               <asp:Button runat="server" Text="Submit" class="btn-primary" OnClick="Unnamed1_Click"></asp:Button>
                            </center>                                                
                        </div>
                    
                </div>
            </div>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="PanelAddEmployee" TargetControlID="ButtonAddEmployee" CancelControlID="btnclose"></ajaxToolkit:ModalPopupExtender>
        </asp:Panel>
        </div>

     <!--Employee Details GridView-->
    <div class="row">
        <div class="col-lg-10">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [F_Name], [Phn_Number], [NIC_Number], [Employee_ID], [City], [Supervisor], [Department_Name] FROM [User_Registrations]"></asp:SqlDataSource>
            <asp:GridView class="table table-striped table-bordered" ID="GridViewAddEmployees" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_ID" DataSourceID="SqlDataSource3" CellPadding="4" Font-Size="Small" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="Phn_Number" HeaderText="Phone Number" SortExpression="Phn_Number" />
                    <asp:BoundField DataField="NIC_Number" HeaderText="NIC Number" SortExpression="NIC_Number" />
                    <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="Employee_ID" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="Supervisor" HeaderText="Supervisor" SortExpression="Supervisor" />
                    <asp:BoundField DataField="Department_Name" HeaderText="Department Name" SortExpression="Department_Name" />
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

     <!--Create Profile-->
        <div>       
        <asp:Panel ID="PanelCreateProfile" runat="server" Height="540px" ScrollBars="Auto">
            <div class="card w-100 border-success overflow-hidden">
                <div class="card-header">
                    Create Employee Profile
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="CloseProfile">
                    <span aria-hidden="true">&times;</span>
                </button>  
                </div>              
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                
                                <label for="EmployeeID">Employee ID:</label>
                                <asp:TextBox ID="TextBoxEmployeeID2" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                <asp:Button ID="ButtonLoadP" runat="server" Text="Button" OnClick="ButtonLoadP_Click" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="FirsttName">First Name:</label>
                                <asp:TextBox ID="TextBoxFName2" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label for="LastName">Last Name:</label>
                                <asp:TextBox ID="TextBoxLastName2" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                            <div class="form-group">
                                <label for="FullName">Full Name:</label>
                                <asp:TextBox ID="TextBoxFullName" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                            <div class="form-group">
                                <label for="Email">Email:</label>
                                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                            </div>
                             <div class="col-sm-4">
                                <div class="form-group">
                                <label for="PhoneNumber">Phone Number:</label>
                                <asp:TextBox ID="TextBoxPhnNumbr2" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                            </div>
                            <div class="col-sm-4">
                            <div class="form-group">
                                <label for="NICNumber2">NIC Number:</label>
                                <asp:TextBox ID="TextBoxNIC2" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                            </div>
                            </div>
                            <div class="row">
                                 <div class="col-sm-4">
                                    <div class="form-group">
                                    <label for="JobTitle">Department:</label>
                                    <asp:DropDownList ID="DropDownListJobs2" runat="server" OnSelectedIndexChanged="DropDownListJobs2_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="Dep_Name" DataValueField="Dep_Name" >                              
                                    </asp:DropDownList>                             
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Dep_Name] FROM [Department]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                    <label for="Supervisor">Supervisor:</label>
                                    <asp:DropDownList ID="DropDownListSupervisor" runat="server" OnSelectedIndexChanged="DropDownListSupervisor_SelectedIndexChanged">
                                      <asp:ListItem>Mr. Karunarathne</asp:ListItem>
                                      <asp:ListItem>Mr. Rathnayake</asp:ListItem>
                                      <asp:ListItem>Mrs. Gunathilake</asp:ListItem>
                                  </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-sm-4">                             
                                <div class="form-group">
                                <label for="DoJ">Date of Join:</label>
                                    <asp:TextBox runat="server" ID="TextboxDoJ"  Text="11/01/2006" />
                                    
                                    <ajaxtoolkit:calendarextender runat="server" ID="Calendarextender1" PopupButtonID="TextboxDoJ" CssClass="AjaxCalendar" TargetControlID="TextboxDoJ" Format="dd,MM,yyyy" />
                                </div>
                                </div>
                            </div>                                                       
                            <div class="row">
                                <div class="col-sm-4">
                                <div class="form-group">
                                <label for="DoB">Date of Birth:</label>
                                    <asp:TextBox runat="server" ID="TextboxDoB"  Text="11/01/2006" />
                                    
                                    <ajaxtoolkit:calendarextender runat="server" ID="calExtender2" PopupButtonID="TextboxDoB" CssClass="AjaxCalendar" TargetControlID="TextboxDoB" Format="dd,MM,yyyy" />
                                </div>
                                </div>
                                 <div class="col-sm-4">
                                    <div class="form-group">
                                    <label for="MaritalStatus">Marital status:</label>
                                    <asp:DropDownList ID="DropDownListMaritalStatus" runat="server" OnSelectedIndexChanged="DropDownListMaritalStatus_SelectedIndexChanged">
                                    <asp:ListItem>Married</asp:ListItem>
                                    <asp:ListItem>Unmarried</asp:ListItem>
                                    </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group ">
                                <label for="Address">Address:</label>
                                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine"></asp:TextBox>
                                <br />
                                </div>
                            </div>
                        </div>
                              <div class="row">
                                  <div class="col-sm-10">
                                      <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine"></asp:TextBox>
                                  </div>
                              </div>
                                <br />

                                <div class="row">
                                  <div class="col-sm-10">
                                      <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine"></asp:TextBox>
                                  </div>
                                </div>
                               <br />                                                
                        <br />
                     <div class="row">
                            <center>
                               <asp:Button runat="server" Text="Submit" class="btn-primary" OnClick="Unnamed2_Click"></asp:Button>
                            </center>                                                
                    </div>
                </div>
                   <!-- </div>-->
                <!--</div>-->
          
            
            
       <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="PanelCreateProfile" TargetControlID="ButtonCreateProfile" CancelControlID="CloseProfile" ></ajaxToolkit:ModalPopupExtender>
            </div>
         </asp:Panel>
        </div>
   
    
      
</asp:Content>

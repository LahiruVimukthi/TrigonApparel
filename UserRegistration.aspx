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
            <h4>Employee Registration</h4>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFName" runat="server" ErrorMessage="First Name Empty" ControlToValidate="TextBoxFName" ForeColor="Maroon"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="email">Last Name:</label>
                                <asp:TextBox ID="TextBoxLName" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorLName" runat="server" ErrorMessage="Last Name Empty" ControlToValidate="TextBoxLName" ForeColor="Maroon"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="JobTitle">Department:</label>
                                <asp:DropDownList ID="DropDownListJob" runat="server" OnSelectedIndexChanged="DropDownListJob_SelectedIndexChanged" CssClass="form-control form-control-sm" DataSourceID="SqlDataSource1" DataTextField="Dep_Name" DataValueField="Dep_ID" >
                                </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Dep_Name], [Dep_ID] FROM [Department]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="PhoneNumber">PhoneNumber:</label>
                                <asp:TextBox ID="TextBoxPhnNmbr" runat="server" CssClass="form-control form-control-sm" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhnNumber" runat="server" ErrorMessage="Phone Number Empty" ControlToValidate="TextBoxPhnNmbr" ForeColor="Maroon"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhnNumber" runat="server" ErrorMessage="Invalid Phone Number"  ControlToValidate="TextBoxPhnNmbr" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                            
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="NIC Number">NIC Number:</label>
                                <asp:TextBox ID="TextBoxNICNmbr" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNIC" runat="server" ErrorMessage="Please enter NIC Number" ControlToValidate="TextBoxNICNmbr" ForeColor="Maroon"></asp:RequiredFieldValidator>
                          
                            
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8">
                        
                        <div class="form-group">
                        <label for="Gender">Gender:</label>
                        <asp:RadioButton ID="RadioButtonM" runat="server" GroupName="Gender" Text=" Male" />
                        <asp:RadioButton ID="RadioButtonF" runat="server"  GroupName="Gender"  Text=" Female"/>
                        <asp:RadioButton ID="RadioButtonO" runat="server"  GroupName="Gender"  Text=" Other"/>
                        </div>                       
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10">
                        <div class="form-group ">
                            <label for="Address">Address:</label>
                            <asp:TextBox ID="TextStreetAddress" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorStreet" runat="server" ErrorMessage="Enter Street" ControlToValidate="TextStreetAddress" ForeColor="Black" Font-Italic="True"></asp:RequiredFieldValidator>

                        </div>
                        </div>
                            </div>
                     
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group ">
                                 <asp:TextBox ID="TextBoxCityAddrs" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" ErrorMessage="Enter City" ControlToValidate="TextBoxCityAddrs" Font-Italic="True" ForeColor="Black"></asp:RequiredFieldValidator>
                                    </div>
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group ">
                                <asp:TextBox ID="TextBoxStateAddrs" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorState" runat="server" ErrorMessage="Enter State" ControlToValidate="TextBoxStateAddrs" ForeColor="Black" Font-Italic="True"></asp:RequiredFieldValidator>
                                    </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="form-group ">
                           
                               <asp:Button runat="server" Text="Submit" class="btn-primary" OnClick="Unnamed1_Click"></asp:Button>
                            
                                </div>
                        </div>
                    
                </div>
            </div>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="PanelAddEmployee" TargetControlID="ButtonAddEmployee" CancelControlID="btnclose"></ajaxToolkit:ModalPopupExtender>
        </asp:Panel>
        </div>
    <br />

     <!--Employee Details GridView-->
    <div class="row">
        <div class="col-lg-10">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [F_Name], [Phn_Number], [NIC_Number], [Employee_ID], [City], [Supervisor], [Department_Name] FROM [User_Registrations]"></asp:SqlDataSource>
            <asp:GridView class="table table-striped table-bordered" ID="GridViewAddEmployees" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_ID" DataSourceID="SqlDataSource3" CellPadding="4" Font-Size="Small" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Employee ID">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton8" runat="server" Text='<%# Eval("Employee_ID") %>' OnClick="LinkButton8_Click" CausesValidation="false"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="F_Name" HeaderText="First Name" SortExpression="F_Name" />
                    <asp:BoundField DataField="Phn_Number" HeaderText="Phone Number" SortExpression="Phn_Number" />
                    <asp:BoundField DataField="NIC_Number" HeaderText="NIC Number" SortExpression="NIC_Number" />
                   
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
        
   
    
      
</asp:Content>

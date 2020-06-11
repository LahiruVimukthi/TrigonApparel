<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm9.aspx.cs" Inherits="TrigonApparel.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-lg-6">
        <div class="card-header"> Personal Information          
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">                  
                        <div class="form-group">
                            <label for="FullName">Full Name:</label>
                                <asp:TextBox ID="TextBoxFullName" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="Department">Department:</label>
                                <asp:TextBox ID="TextBoxDep" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="NICnmbr">
                            <label for="NIC">NIC Number:</label>
                                <asp:TextBox ID="TextBoxNIC" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label for="PhoneNmbr">Phone Number:</label>
                                <asp:TextBox ID="TextBoxPhnNmbr" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>                      
            </div>
            <div class="row">
                <div class="col-sm-4">
                        <div class="form-group">
                            <label for="DoB">Date of Birth:</label>
                                <asp:TextBox ID="TextBoxDoB" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div> 
                <div class="col-sm-4">
                        <div class="form-group">
                            <label for="DoJ">Date of Join:</label>
                                <asp:TextBox ID="TextBoxDoJ" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>
                <div class="col-sm-4">
                        <div class="form-group">
                            <label for="Supervisor">Supervisor:</label>
                                <asp:TextBox ID="TextBoxSupe" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>    
            </div>
            <div class="row">
                <div class="form-group">
                            <label for="AddressStreet">Street:</label>
                                <asp:TextBox ID="TextBoxStreet" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                             <label for="AddressCity">City:</label>
                                 <asp:TextBox ID="TextBoxCity" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                              <label for="AddressState">State:</label>
                                 <asp:TextBox ID="TextBoxState" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
            </div>
        </div>
    </div>
</asp:Content>

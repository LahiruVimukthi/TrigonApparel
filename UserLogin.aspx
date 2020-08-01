<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="TrigonApparel.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  
                  <div class="row">
                     <div class="col">
                        <center>
                           <i class="fa fa-user fa-3x" aria-hidden="true"></i>
                           <h3>Employee Login</h3>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>User ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBoxEmpID" runat="server" placeholder="User ID"></asp:TextBox>
                        </div>
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBoxPW" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-md" ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
                        </div>
                        <div class="form-group">
                           <input class="btn btn-info btn-block btn-md" id="Button2" type="button" value="Sign Up" />
                        </div>
                     </div>
                  </div>
               </div>
           
      </div>
   </div>
</asp:Content>

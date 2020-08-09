<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeProfile.aspx.cs" Inherits="TrigonApparel.EmployeeProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <link  rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"/>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>

     <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.3.1.js" ></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" ></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" ></script>
    <link href="fontawesome-free-5.12.1-web/css/all.css" rel="stylesheet" />
    <script src="fontawesome-free-5.12.1-web/js/all.js"></script>

      <link href="CustomStyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg sticky-top" style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; background-color: #40407a; color: #FFFFFF">
                <a class="navbar-brand" href="#" style="color: #FFFFFF">
                    <img src="Images/506-5067615_triangle-white-freetoedit-geometric-trigon-frame-triangle-logo.png" width="50" height="50"/> 
                   TRIGON Apparel-MIHINTHALE
                </a>
 
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" style="color: #FFFFFF">
                    <span class="navbar-toggler-icon"></span>
                </button>
 
                 <div class="collapse navbar-collapse" id="navbarSupportedContent" style="color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-weight: bold; font-size: medium">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="homepage.aspx" style="color: #FFFFFF">Home</a>
                        </li>
                        <li class="nav-item active" >
                            <a class="nav-link" href="#" style="color: #FFFFFF">About Us</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#" style="color: #FFFFFF">Terms</a>
                        </li>
 
                    </ul>
 
                    <ul class="navbar-nav">
                       
                        <li class="nav-item active">
                            <asp:LinkButton class="nav-link" ID="LinkButtonLogoutEmp" runat="server" OnClick="LinkButtonLogoutEmp_Click"  style="color: #FFFFFF">Logout</asp:LinkButton>
                        </li>
 
                        <li class="nav-item active">
                            <asp:LinkButton class="nav-link" ID="LinkButton7" runat="server"  style="color: #FFFFFF" >Hello user</asp:LinkButton>
 
                        </li>
                    </ul>
                </div>

            </nav>
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                         <ul class="nav nav-tabs nav-justified nav-fill" style="font-family: Arial, Helvetica, sans-serif; font-size: medium;"> 
  <li class="active"><a class="nav-link" data-toggle="pill" href="#PersonalDetails" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Personal Details</a></li>
        
  <li><a class="nav-link" data-toggle="pill" href="#Attendance" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Attendance</a></li>
           
  <li><a class="nav-link" data-toggle="pill" href="#Performance" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Performance</a></li>
                              <li><a class="nav-link" data-toggle="pill" href="#Feedbacks" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Feedbacks</a></li>
                              <li><a class="nav-link" data-toggle="pill" href="#Reports" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Reports</a></li>
</ul>
                        <div class="tab-content">
                             <div id="PersonalDetails" class="tab-pane fade in active">
                                  <div class="row">
                                     <div class="col-lg-12">
                                         <div class="card">
                                             <div class="card-header"> My Details</div>
                                             <div class="card-body">
                                                 <div class="row">
                                                     <div class="col-lg-10">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label1" runat="server" Text="Full Name"></asp:Label>
                                                             <asp:TextBox ID="TextBoxFull" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                     </div>
                                                     <div class="col-lg-2">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label2" runat="server" Text="Employee ID"></asp:Label>
                                                             <asp:TextBox ID="TextBoxEID" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                     </div>
                                                 </div>
                                                  <div class="row">
                                                      <div class="col-lg-4">
                                                          <div class="form-group">
                                                             <asp:Label ID="Label8" runat="server" Text="Date of Birth"></asp:Label>
                                                             <asp:TextBox ID="TextBoxDoB" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                      </div>
                                                       <div class="col-lg-2">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label13" runat="server" Text="Mobile Number"></asp:Label>
                                                             <asp:TextBox ID="TextBoxMo" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                     </div>
                                                      <div class="col-lg-2">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label3" runat="server" Text="Department"></asp:Label>
                                                             <asp:TextBox ID="TextBox2" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                     </div>
                                                 <div class="col-lg-3">
                                                         <div class="form-group">
                                                             <asp:Label ID="Label4" runat="server" Text="Supervisor"></asp:Label>
                                                             <asp:TextBox ID="TextBox3" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                     </div>
                                                </div>  
                                                  <div class="row">
                                                      <div class="col-lg-3">
                                                         
                                                               <div class="form-group">
                                                             <asp:Label ID="Label5" runat="server" Text="Street"></asp:Label>
                                                             <asp:TextBox ID="TextBoxStreet" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                          </div>
                                                          <div class="col-lg-3">
                                                               <div class="form-group">
                                                             <asp:Label ID="Label6" runat="server" Text="City"></asp:Label>
                                                             <asp:TextBox ID="TextBoxCity" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                          </div>
                                                          <div class="col-lg-3">
                                                               <div class="form-group">
                                                             <asp:Label ID="Label7" runat="server" Text="State"></asp:Label>
                                                             <asp:TextBox ID="TextBoxState" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                          </div>
                                                      </div>
                                                      <div class="row">
                                                      <div class="col-lg-4">
                                                          <div class="form-group">
                                                             <asp:Label ID="Label9" runat="server" Text="Marital Status"></asp:Label>
                                                             <asp:TextBox ID="TextBoxMarital" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                      </div>
                                                      <div class="col-lg-3">
                                                          <div class="form-group">
                                                             <asp:Label ID="Label10" runat="server" Text="NIC Number"></asp:Label>
                                                             <asp:TextBox ID="TextBoxNIC" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                      </div>
                                                      <div class="col-lg-3">
                                                          <div class="form-group">
                                                             <asp:Label ID="Label11" runat="server" Text="Gender"></asp:Label>
                                                             <asp:TextBox ID="TextBox5" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                      </div>
                                                 </div>
                                                 <div class="row">
                                                     <div class="col-lg-3">
                                                          <div class="form-group">
                                                             <asp:Label ID="Label12" runat="server" Text="Date of join"></asp:Label>
                                                             <asp:TextBox ID="TextBoxDoJ" runat="server" class="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                                                         </div>
                                                     </div>
                                                      
                                                 </div>
                                                 </div>
                                                 
                                             </div>
                                         </div>
                                      </div>
                                 </div>
                             
                            <div id="Attendance" class="tab-pane fade in active">

                             </div>
                            <div id="Performance" class="tab-pane fade in active">

                             </div>
                            <div id="Feedbacks" class="tab-pane fade in active">

                             </div>
                            <div id="Reports" class="tab-pane fade in active">

                             </div>
                        </div>
                        </div>
                    </div>
                </div>
           
         </div>
    </form>
</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfiles.aspx.cs" Inherits="TrigonApparel.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row">
        <div class="col-lg-3">
            <div class="form-group">
                            <label for="EmployeeID">Employee ID:</label>
                              <asp:TextBox ID="TextBoxEID" runat="server" CssClass="form-control form-control-sm" ></asp:TextBox>
                        </div>
        </div>
         <div class="col-lg-3">
            <div class="form-group">
                            <label for="FName">Name:</label>
                              <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-sm"   ReadOnly="true"></asp:TextBox>
                        </div>
        </div>
        <br />
    </div>
    <div class="row">
        <div class="col-lg-10">
       <div class="card">
           <div class="card-body">
               <h4>Personal Information</h4>
                <div class="row">
                  
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="FullName">Full Name:</label>
                                <asp:TextBox ID="TextBoxFName" runat="server" CssClass="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                        </div>

                    </div>
                      <div class="col-sm-2">
                        <div class="form-group">
                            <label for="PhoneNumber">PhoneNumber:</label>
                                <asp:TextBox ID="TextBoxPhnNmbr" runat="server" CssClass="form-control form-control-sm"   ReadOnly="true"></asp:TextBox>                               
                        </div>
                    </div>
                </div>
                <div class="row">
                     <div class="col-sm-04">
                        <div class="form-group">
                            <label for="DoB">Date of Birth:</label>
                                <asp:TextBox ID="TextBoxDoB" runat="server" CssClass="form-control form-control-sm" ReadOnly="true"></asp:TextBox>                               
                        </div>
                    </div>    
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label for="JobTitle">Department:</label>
                              <asp:TextBox ID="TextBoxDep" runat="server" CssClass="form-control form-control-sm"   ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                  
                    <div class="col-sm-02">
                        <div class="form-group">
                            <label for="NIC Number">NIC Number:</label>
                                <asp:TextBox ID="TextBoxNICNmbr" runat="server" CssClass="form-control form-control-sm" ReadOnly="true"></asp:TextBox>                               
                        </div>
                    </div>                          
                    </div> 
                        <div class="row">
                               <div class="col-sm-10">
                               <div class="form-group ">
                                    <label for="Add">Street Address:</label>
                               <asp:TextBox ID="TextBoxStreet" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                               </div>
                               </div>                                        
                        </div>
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group ">
                                  <label for="Add">City Address:</label>
                                 <asp:TextBox ID="TextBoxCityAddrs" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                      
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group ">
                                 <label for="Add">State Address:</label>
                                <asp:TextBox ID="TextBoxStateAddrs" runat="server" CssClass="form-control form-control-sm" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                                </div>
                                </div>
                        </div>
               
               </div>
        </div>
        </div>
     </div>
    <hr />
    <div class="row">
        <div class="col-lg-12">
              <div class="card">
            <div class="card-body">
                <h4>Attendance Records</h4>
                <div class="row">
                    <div class="col-3">
                        <div class="form-group">
                            <asp:Label ID="LabelFrom" runat="server" Text="From:"></asp:Label>
                            <asp:TextBox ID="TextBoxFrom" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                     <div class="col-3">
                        <div class="form-group">
                            <asp:Label ID="LabelTo" runat="server" Text="To:"></asp:Label>
                            <asp:TextBox ID="TextBoxTo" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                    </div> 
                     <div class="col-3">
                        <div class="form-group">
                            <asp:Button ID="ButtonGo" runat="server" Text="Load" OnClick="ButtonGo_Click"/>
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="col-lg-3">
                   <div class="form-group">
                            <asp:Label ID="LabelToTAtt" runat="server" Text="Total Attended Days:" ForeColor="#006600"></asp:Label>
                            <asp:Label ID="LabelToAtt2" runat="server"></asp:Label>
                        </div>
                        </div>
                    <div class="col-lg-3">
                     <div class="form-group">
                            <asp:Label ID="LabelToTLea" runat="server" Text="Total Leaves Taken:" ForeColor="Maroon"></asp:Label>
                            <asp:Label ID="LabelToTLea2" runat="server"></asp:Label>
                        </div>
                        </div>
                </div>
                 <div class="row">
        <div class="col-3">
                        <div class="form-group">
                            <asp:Button ID="ButtonViewLeaves" runat="server" Text="View Leave Records" OnClick="ButtonViewLeaves_Click"/>
                        </div>
                    </div>
     </div>
    
    <div class="row">
        <asp:GridView ID="GridViewProfAtt" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        </asp:GridView>
        <asp:SqlDataSource runat="server"></asp:SqlDataSource>
    </div>
            </div>
        </div>
        </div>
      
    </div>
   
</asp:Content>

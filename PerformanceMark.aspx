<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PerformanceMark.aspx.cs" Inherits="TrigonApparel.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
     <div class="row">
     <div class="col-lg-3">
         <div class="form-group">
             <asp:Label ID="LabelMonth" runat="server" Text="Month"></asp:Label>
             <asp:TextBox ID="TextBoxMonth" runat="server" TextMode="Date"></asp:TextBox>
         </div>
         </div>
     <div class="col-lg-3">
         <div class="form-group">
             <asp:Label ID="Label1" runat="server" Text="Month"></asp:Label>
             <asp:TextBox ID="TextBoxSupe" runat="server"></asp:TextBox>
         </div>  
     </div>
          <div class="col-lg-3">
         <div class="form-group">
             <asp:Label ID="Label2" runat="server" Text="Department"></asp:Label>
             <asp:DropDownList ID="DropDownListDept" runat="server" OnSelectedIndexChanged="DropDownListDept_SelectedIndexChanged" AutoPostBack="true">
                 <asp:ListItem Text="Cutting" Value="1"></asp:ListItem>
                 <asp:ListItem Text="Sewing" Value="2"></asp:ListItem>
                 <asp:ListItem Text="Finishing" Value="3"></asp:ListItem>

             </asp:DropDownList>
         </div>  
     </div>
        </div>
  
   
<div class="container">
<div class="row">
    <div class="col-lg-12">
    <ul class="nav nav-pills">
  <li class="active"><a data-toggle="pill" href="#Work">Work</a></li>
        
  <li><a data-toggle="pill" href="#Skills">Skills</a></li>
           
  <li><a data-toggle="pill" href="#Behaviour">Behaviour</a></li>
</ul>

<div class="tab-content">
  <div id="Work" class="tab-pane fade in active">
    <h3>Work Performances</h3>
   
  </div>
  <div id="Skills" class="tab-pane fade">
    <h3>Skill Index</h3>
  
      <div class="row">
           <div class="col-lg-10">
          
         <asp:GridView ID="GridViewWork" runat="server" AutoGenerateColumns="False">
                  <Columns>
                      <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" />
                      <asp:BoundField DataField="F_Name" HeaderText="Name" />
                      <asp:TemplateField HeaderText="Target Units">
                          <ItemTemplate>
                              <asp:TextBox ID="TextBoxTrgt" runat="server"></asp:TextBox>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Finished Units">
                          <ItemTemplate>
                              <asp:TextBox ID="TextBoxFin" runat="server"></asp:TextBox>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Defects">
                          <ItemTemplate>
                              <asp:TextBox ID="TextBoxDef" runat="server"></asp:TextBox>
                          </ItemTemplate>
                      </asp:TemplateField>
                  </Columns>
              </asp:GridView>
               <div class="row">
                   <asp:Button ID="ButtonSaveSk" runat="server" Text="Save" type="submit" OnClick="ButtonSaveSk_Click" />
                   <asp:Label ID="Label3" runat="server" ></asp:Label>
                   <asp:Label ID="Label4" runat="server" ></asp:Label>
                   <asp:Label ID="Label5" runat="server" ></asp:Label>
               </div>
    
    </div>
       </div>
  </div>
  <div id="Behaviour" class="tab-pane fade">
    <h3>Behaviour Index</h3>
   </div>
  </div>

    </div>
</div>
    </div>
       

</asp:Content>

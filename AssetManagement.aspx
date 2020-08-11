<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AssetManagement.aspx.cs" Inherits="TrigonApparel.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader;

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            "lengthMenu"; [[05, 10, 50, -1], [05, 10, 50, "All"]]
        });
    </script>

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">     
                                                   
                                  <div class="row">
                                      <div class="col-lg-12">
                                           <ul class="nav nav-tabs nav-justified nav-fill" style="font-family: Arial, Helvetica, sans-serif; font-size: medium;"> 
                                   <li class="active">
                                    <a class="nav-link" data-toggle="tab" href="#Asset" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Asset Registration</a>
                                   </li>
                               
                               
                                   <li>
                                    <a class="nav-link" data-toggle="tab" href="#Request" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Asset Requests</a>
                                   </li>
                               
                              
                                   <li>
                                    <a class="nav-link" data-toggle="tab" href="#Issue" style="font-size: medium; font-weight: bold; font-family: Arial, Helvetica, sans-serif;">Asset Issues</a>
                                   </li>
                               </ul>
                               <div class="tab-content">
                         <div id="Asset" class="container tab-pane">
                             <br />
                             <div class="row">
                                 
                             <div class="col-lg-6">
                                     <asp:Panel ID="Panel2" runat="server" >
                       <asp:GridView class="table" ID="GridViewStock" runat="server" AutoGenerateColumns="False" DataKeyNames="Asset_ID" DataSourceID="SqlDataSource7" Font-Size="Small" >

                            <Columns>
                                <asp:BoundField DataField="Asset_ID" HeaderText="Asset_ID" InsertVisible="False" ReadOnly="True" SortExpression="Asset_ID" />
                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                   <div class="row">
                                                       <div class="col-lg-12">
                                                           <asp:Label ID="Label24" runat="server" Text='<%# Eval("Model") %>' Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#003366"></asp:Label>
                                                           &nbsp;|
                                                           <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#003366" Text='<%# Eval("Category") %>'></asp:Label>
                                                       </div>
                                                   </div>
                                                    <div class="row">
                                                       <div class="col-lg-12" style="font-family: Arial, Helvetica, sans-serif; font-size: small">

                                                           &nbsp;<asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" Text='<%# Eval("Status") %>'></asp:Label>
                                                           &nbsp;| Current Status-<asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" Text='<%# Eval("Current_Status") %>'></asp:Label>

                                                       </div>
                                                   </div>
                                                    <div class="row">
                                                       <div class="col-lg-12" style="font-family: Arial, Helvetica, sans-serif; font-size: small">

                                                           Serial/Batch Number-<asp:Label ID="Label28" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" Text='<%# Eval("Serial_Number") %>'></asp:Label>
                                                           &nbsp;|</div>
                                                   </div>
                                                    <div class="row">
                                                       <div class="col-lg-12" style="font-family: Arial, Helvetica, sans-serif; font-size: small">

                                                           Description-
                                                           <asp:Label ID="Label29" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" Text='<%# Eval("Description") %>'></asp:Label>

                                                       </div>
                                                   </div>
                                                </div>
                                                <div class="col-lg-02">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imgpath") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    
                                </asp:TemplateField>
                                
                            </Columns>

                        </asp:GridView>  
                      </asp:Panel>
                             </div>
                                 <div class="col-lg-06">
                                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                             <ContentTemplate>
                                     <div class="card">
                                         <div class="card-header" style="background-color: #00544a; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: medium">Add Asset</div>
                                         <div class="card-body">
                                              <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                         
                                             <div class="row">
                                      <div class="col-lg-08">
                                          <div class="form-inline">
                                              <asp:Label ID="Label30" runat="server" Text="Asset ID"></asp:Label>
                                         
                                          <div class="input-group">
                                              <asp:TextBox ID="TextBoxAdAssID" runat="server" Class="form-control form-control-sm"></asp:TextBox>
                                              <asp:Button ID="ButtonAdGo" runat="server" Text="Go" OnClick="ButtonAdGo_Click" class="btn btn-dark btn-sm" />
                                          </div> 
                                               </div>

                                      </div>
                                      
                                  </div>
                                  <div class="row">
                                  <div class="col-lg-6">
                                      <div class="form-group">
                              <asp:Label ID="LabelCat3" runat="server" Text="Category"></asp:Label>
                                          
                             <asp:DropDownList CssClass="form-control form-control-sm" ID="DropDownListSelCat3" runat="server" DataSourceID="SqlDataSource5" DataTextField="Category" DataValueField="AssetType_ID" OnSelectedIndexChanged="DropDownListSelCat3_SelectedIndexChanged" AutoPostBack="True">
                                  <asp:ListItem Value="0">Other</asp:ListItem>
                              </asp:DropDownList>
                                        
                                          <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [AssetType_ID], [Category] FROM [Ass_Category]"></asp:SqlDataSource>
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBoxAddCat" runat="server"  Class="form-control form-control-sm" ></asp:TextBox>
                                 <asp:Button ID="ButtonAddCat" class="btn btn-danger btn-sm" runat="server" Text="+" OnClick="ButtonAddCat_Click" Font-Bold="True" />
                              </div>
                                        </div>
                                          
                                     </div>
                             
                                  <div class="col-lg-6">
                                      <div class="form-group">
                              <asp:Label ID="LabelMod3" runat="server" Text="Model"></asp:Label>
                              <asp:DropDownList CssClass="form-control form-control-sm" ID="DropDownListMod3" runat="server"  OnSelectedIndexChanged="DropDownListMod3_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Other</asp:ListItem>
                                </asp:DropDownList>
                                          <div class="input-group">
                                              <asp:TextBox ID="TextBoxAddMod" runat="server"  Class="form-control form-control-sm"></asp:TextBox>
                                  <asp:Button ID="ButtonAddMod" class="btn btn-danger btn-sm" runat="server" Text="+" OnClick="ButtonAddMod_Click" Font-Bold="True" />
                                          </div>
                                          
                           
                          </div>
                                        </div>
                                  </div>

                              
                
                                 
                             
                                            
                                             <div class="row">
                                 <div class="col-lg-6">
                   <div class="form-group">
                              <asp:Label ID="LabelSerial" runat="server" Text="Serial Number/Batch Number"></asp:Label>
                              <asp:TextBox ID="TextBoxSerial" runat="server" Class="form-control form-control-sm"></asp:TextBox>
                          </div>
               </div>
                                    <div class="col-lg-6">
                                   <div class="form-group">
                              <asp:Label ID="LabelQuan" runat="server" Text="Quantity"></asp:Label>
                                 <asp:TextBox ID="TextBoxQuan" runat="server" TextMode="Number" CssClass="form-control form-control-sm"></asp:TextBox>
                          </div>
                                </div>
                             </div>
              <div class="row">
                  <div class="col-lg-3">
                                   <div class="form-group">
                              <asp:Label ID="LabelStatus" runat="server" Text="Status"></asp:Label>
                                  <asp:DropDownList ID="DropDownListStatus" runat="server" CssClass="form-control form-control-sm">
                                      <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                      <asp:ListItem Text="Inactive" Value="2"></asp:ListItem>
                                  </asp:DropDownList>
                          </div>
                   </div>
                  <div class="col-lg-3">
                                 <div class="form-group">
                              <asp:Label ID="LabelAddDate" runat="server" Text="Date"></asp:Label>
                              <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                          </div>
                       </div>
                   </div>
                             <div class="row">
                                   <div class="col-lg-8">
                                  <div class="form-group">
                              <asp:Label ID="LabelDes" runat="server" Text="Description"></asp:Label>
                              <asp:TextBox ID="TextBoxDes" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm"></asp:TextBox>
                          </div>
                                               </div>
                             </div>
                           
                            <div class="row">
                                  <div class="col-lg-8">
                                   <div class="form-group">
                             <asp:FileUpload onchange="readURL(this);" CssClass="form-control" ID="FileUploadImg" runat="server" />
                            
                             <img id="imgview" src="AssetImages" Height="150px" Width="100px" />
                            </div>
                                               </div>
                                 <div class="col-lg-4">
                                          <div class="form-group">
                                               <asp:Label ID="Label31" runat="server"></asp:Label>
                                          <div class="btn-group" role="group" aria-label="Basic example">
                                              <asp:Button ID="ButtonSave" class="btn-success btn-md" runat="server" Text="Add" OnClick="ButtonSave_Click" />
                                               <asp:Button ID="ButtonAssUpdate" runat="server" Text="Update"  class="btn btn-secondary btn-md" OnClick="ButtonAssUpdate_Click" />
                                              
                                          </div>
                                          </div>
                                          
                                      </div>
                                 </div>
                                         </div>
                                     </div>
                                      
                             
                             </ContentTemplate>
                          </asp:UpdatePanel>
                             </div>
                            </div>           
              </div> 
                                    <!--Requests-->
            <div id="Request" class="container tab-pane">
                <br />
                      <ul class="nav nav-pills nav-fill nav-justified"">
                          <li class="active">
                             <a class="nav-link" data-toggle="pill" href="#Requisitions" style="font-size: small">Requisitions</a>
                          </li>
                          <li >
                             <a  class="nav-link" data-toggle="pill" href="#Extensions" style="font-size: small" >Extentions</a>
                          </li>
                          <li>
                             <a class="nav-link" data-toggle="pill" href="#Disposals" style="font-size: small">Disposals</a>
                          </li>
                      </ul>
                       <div class="tab-content">
                           <div id="Requisitions"  class="tab-pane fade in active"">
                               <br />
                               <div class="row">
                                   <div class="col-lg-12">
                                       <div class="row">
                                           <div class="col-lg-3">
                                            <div class="form-group">
                                          <asp:Label ID="LabelRDate" runat="server" Text="Date:"></asp:Label>
                                           <asp:TextBox ID="TextBoxRDate" runat="server" CssClass="form-control form-control-sm" ></asp:TextBox>
                                       </div>            
                                   </div>
                                       </div>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                        <div class="row">
                                           
                                            <div class="col-lg-3">
                                                
                                                      <div class="form-group">                             
                                           <asp:Label ID="LabelSelDep" runat="server" Text="Department:"></asp:Label>
                                               <asp:DropDownList ID="DropDownListSelDep" runat="server" DataSourceID="SqlDataSource3" DataTextField="Dep_Name" OnSelectedIndexChanged="DropDownListSelDep_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                          
                                       </div> 
                                                                    
                                               
                                                
                                   </div>
                                   <div class="col-lg-3">
                                       <div class="form-group">
                                           <asp:Label ID="Label1" runat="server" Text="Employee:"></asp:Label>
                                               <asp:DropDownList ID="DropDownListSelEmp" runat="server"></asp:DropDownList>
                                       </div>            
                                   </div>
                                                         
                                          </div>
                                                        </ContentTemplate>
                                         </asp:UpdatePanel> 
                                           
                                         
                               
                               <div class="row">
                                   <div class="col-lg-3">
                                   <div class="form-group">
                                       <asp:Label ID="LabelROrder" runat="server" Text="Request order"></asp:Label>
                                       <asp:TextBox ID="TextBoxRorder" runat="server" ReadOnly="false" CssClass="form-control form-control-sm"></asp:TextBox>
                                   </div>
                                       </div>
                                   </div>
                                       <div class="row">
                                           <div class="col-lg-10">
                                          <asp:GridView ID="GridViewSelAs" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="Asset_ID" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Font-Size="Small" OnDataBound="GridViewSelAs_DataBound" OnRowDataBound="GridViewSelAs_RowDataBound" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-Mode="NextPreviousFirstLast" OnPageIndexChanging="GridViewSelAs_PageIndexChanging">
                           <Columns>
                               <asp:TemplateField HeaderText="Select">
                                   <ItemTemplate>
                                       <asp:CheckBox ID="CheckBox1" runat="server" />
                                   </ItemTemplate>
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="Asset ID">
                                   <ItemTemplate>
                                       <asp:LinkButton ID="LinkButtonAssID" Text='<%#Eval("Asset_ID") %>' runat="server" OnClick="LinkButtonAssID_Click">LinkButton</asp:LinkButton>
                                   </ItemTemplate>
                               </asp:TemplateField>
                               
                               <asp:BoundField DataField="Serial_Number" HeaderText="Serial_Number" SortExpression="Serial_Number" />
                               <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                              
                               <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                               <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                               <asp:BoundField DataField="Current_Status" HeaderText="Status" SortExpression="Current_Status" />
                               <asp:TemplateField HeaderText="From">
                                   <ItemTemplate>
                                       <asp:TextBox ID="TextBoxFDate" runat="server" TextMode="Date"></asp:TextBox>
                                   </ItemTemplate>
                               </asp:TemplateField>
                               <asp:TemplateField HeaderText="To">
                                   <ItemTemplate>
                                        <asp:TextBox ID="TextBoxTDate" runat="server" TextMode="Date"></asp:TextBox>
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
                                        <div class="row">
                                            <div class="col-lg-06">
                                                  <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                      <ContentTemplate>
                                                           
                                                                <div class="row">
                                                                     <div class="form-group">
                                                                    <div class="col-lg-4">
                                                                <asp:Button ID="ButtonGSD" class="btn btn-danger btn-sm" runat="server" Text="Add"  OnClick="ButtonGSD_Click"/>
                                                                    </div>
                                                                </div>
                                                                    </div>
                                                           <div class="row">
                                                                     <div class="form-group">
                                                                    <div class="col-lg-12">
                                                                        <asp:Label ID="LabelEr" runat="server" CssClass="alert-danger"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                    </div>
                                                                <div class="row">
                                                                    
                                               <div class="col-lg-12">
                                                   <div class="form-group">
                                                     <asp:GridView ID="gvSelected" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                                                       AutoGenerateColumns="false" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True">
                                                    <Columns>
                                                        <asp:BoundField DataField="Order_ID" HeaderText="Order ID" ItemStyle-Width="150"/>
                                                        <asp:BoundField DataField="Asset_ID" HeaderText="Asset ID" ItemStyle-Width="150"/>              
                                                        <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" ItemStyle-Width="150" />
                                                        <asp:BoundField DataField="From_Date" HeaderText="From"  ItemStyle-Width="150" DataFormatString="{0:MM/dd/yyyy}" />
                                                        <asp:BoundField DataField="To_Date" HeaderText="To"  ItemStyle-Width="150"  DataFormatString="{0:MM/dd/yyyy}"/>
                                                    </Columns>
                                                    </asp:GridView>
                                               </div>
                                                                    </div>
                                                                </div>
                                                          <div class="row">
                                                              <div class="col-lg-4">
                                                                  <asp:Label ID="LabelSelected" runat="server"></asp:Label>
                                                              </div>
                                                          </div>
                                                
                                           
                                                      </ContentTemplate>
                                                  </asp:UpdatePanel>
                                                </div>
                                         
                                       </div>
                                  
                                       
                                       <div class="row">
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <asp:Button ID="SaveReq" runat="server" Text="Submit Request" class="btn btn-success btn-sm" OnClick="SaveReq_Click" />
                                                 
                                                </div>
                                            </div>
                                       </div>
                                               
                                    </div>  

                                                  </div>
                                   </div>
                           <div id="Extensions" class="tab-pane fade in active">
                               <br />
                               <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                   <ContentTemplate>
                                        <div class="row">
                                          
                                                 
                                   <div class="col-md-6">
                                       <div class="card">
                                           <div class="card-header" style="background-color: #00544a; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: medium">Extensions</div>
                                           <div class="card-body">
                                               <div class="row">
                                                   <div class="col-md-6">
                                                        <div class="form-group">
                                                        <asp:Label ID="LabelAID" runat="server" Text="Asset ID"></asp:Label>
                                                       <div class="input-group">
                                                           <asp:TextBox ID="TextBox1AID" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                                           <asp:Button ID="ButtonGo" runat="server" Text="Go" class="btn btn-success btn-sm" OnClick="ButtonGo_Click" />
                                                       </div>
                                                      
                                                   </div>
                                                   </div>
                                                  <div class="col-md-6">
                                                      <div class="form-group">
                                                            <asp:Label ID="Labeluser" runat="server" Text="User"></asp:Label>
                                                          <asp:TextBox ID="TextBoxUser" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                                                      </div>
                                                  </div>
                                               </div>
                                               <div class="row">
                                                   <div class="col-lg-6">
                                                       <div class="form-group">
                                                           <asp:Label ID="Label10" runat="server" Text="Request ID"></asp:Label>
                                                          <asp:TextBox ID="TextBoxReID" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="row">
                                                   <div class="col-lg-5">
                                                       <div class="form-group">
                                                           <asp:Label ID="Label5" runat="server" Text="From"></asp:Label>
                                                           <asp:Label ID="Label6" runat="server" DataFormatString="{0:MM/dd/yyyy}" ForeColor="#006600" Font-Bold="True"></asp:Label>
                                                       </div>
                                                   </div>
                                                    <div class="col-lg-5">
                                                       <div class="form-group">
                                                           <asp:Label ID="Label7" runat="server" Text="To"></asp:Label>
                                                           <asp:Label ID="Label8" runat="server" DataFormatString="{0:MM/dd/yyyy}" ForeColor="#006600" Font-Bold="True"></asp:Label>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="row">
                                                  
                                                   <div class="col-lg-6">
                                                        <div class="form-group">
                                                            <asp:Label ID="Label3" runat="server" Text="To"></asp:Label>
                                                          <asp:TextBox ID="TextBoxETo" runat="server" TextMode="Date" CssClass="form-control form-control-sm"></asp:TextBox>
                                                        </div>                   
                                               </div>
                                       </div>
                                               <div class="row">
                                                   <div class="col-md-4">
                                                       <div class="form-group">
                                                           <asp:Label ID="Label9" runat="server" ></asp:Label>
                                                           <asp:Button ID="ButtonUpdate" runat="server" Text="Update" class="btn btn-warning" OnClick="ButtonUpdate_Click" />
                                                       </div>
                                                        
                                                   </div>
                                                  
                                               </div>
                                   </div>
                               </div>
                           </div>
                                             <div class="col-md-6">
                                       <div class="card">
                                           <div class="card-header" style="background-color: #00544a; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: medium">Returns</div>
                                           <div class="card-body">
                                               <div class="row">
                                                   <div class="col-md-6">
                                                        <div class="form-group">
                                                        <asp:Label ID="Label15" runat="server" Text="Asset ID"></asp:Label>
                                                       <div class="input-group">
                                                           <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                                           <asp:Button ID="Button2" runat="server" Text="Go" class="btn btn-success btn-sm" OnClick="Button2_Click" />
                                                       </div>
                                                      
                                                   </div>
                                                   </div>
                                                  <div class="col-md-6">
                                                      <div class="form-group">
                                                            <asp:Label ID="Label16" runat="server" Text="User"></asp:Label>
                                                          <asp:TextBox ID="TextBox3" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                                                      </div>
                                                  </div>
                                               </div>
                                               <div class="row">
                                                   <div class="col-lg-6">
                                                       <div class="form-group">
                                                           <asp:Label ID="Label17" runat="server" Text="Request ID"></asp:Label>
                                                          <asp:TextBox ID="TextBox4" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="row">
                                                   <div class="col-lg-5">
                                                       <div class="form-group">
                                                           <asp:Label ID="Label18" runat="server" Text="From"></asp:Label>
                                                           <asp:Label ID="Label19" runat="server" DataFormatString="{0:MM/dd/yyyy}" ForeColor="#006600" Font-Bold="True"></asp:Label>
                                                       </div>
                                                   </div>
                                                    <div class="col-lg-5">
                                                       <div class="form-group">
                                                           <asp:Label ID="Label20" runat="server" Text="To"></asp:Label>
                                                           <asp:Label ID="Label21" runat="server" DataFormatString="{0:MM/dd/yyyy}" ForeColor="#006600" Font-Bold="True"></asp:Label>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="row">
                                                  <div class="col-lg-5">
                                                       <div class="form-group">
                                                           <asp:Label ID="Label22" runat="server" Text="Returned On:"></asp:Label>
                                                           <asp:TextBox ID="TextBox5" runat="server" TextMode="Date"></asp:TextBox>
                                                       </div>
                                                   </div>
                                                   
                                       </div>
                                               <div class="row">
                                                   <div class="col-md-4">
                                                       <div class="form-group">
                                                           <asp:Label ID="Label23" runat="server" ></asp:Label>
                                                           <asp:Button ID="Button3" runat="server" Text="Return" class="btn btn-warning" OnClick="Button3_Click" />
                                                       </div>
                                                        
                                                   </div>
                                                  
                                               </div>
                                   </div>
                               </div>
                           </div>
                          
                                            
                                           
                              
                               </div>
                                   </ContentTemplate>
                               </asp:UpdatePanel>
                                       
                      </div>
                           <div id="Disposals" class="tab-pane fade in active">
                               <br />
                               <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                   <ContentTemplate>
                                        <div class="row">
                                         <div class="col-lg-06">
                                           <div class="card">
                                               <div class="card-header" style="background-color: #00544a; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: medium">Dispose Assets</div>
                                               <div class="card-body">
                                                    <div class="row">
                                           <div class="col-lg-6">
                                               <asp:Label ID="Label2" runat="server" Text="Asset ID"></asp:Label>
                                               <div class="input-group">
                                                   <asp:TextBox ID="TextBoxDAID" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                                    <asp:Button ID="ButtonDAIDGo" runat="server" Text="Go" class="btn btn-success btn-sm" OnClick="ButtonDAIDGo_Click"/>
                                               </div>
                                               
                                           </div>
                                           </div>
                                       <div class="row">
                                           <div class="col-lg-6">
                                                <asp:Label ID="Label4" runat="server" Text="Category"></asp:Label>
                                               <asp:TextBox ID="TextBoxDMCat" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                           </div>
                                            <div class="col-lg-6">
                                                 <asp:Label ID="Label11" runat="server" Text="Model"></asp:Label>
                                               <asp:TextBox ID="TextBoxDMod" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                            </div>
                                       </div>
                                       <div class="row">
                                           <div class="col-lg-3">
                                               <asp:Label ID="Label12" runat="server" Text="Status"></asp:Label>
                                               <asp:DropDownList ID="DropDownListDStatus" runat="server">
                                                   <asp:ListItem Text="Active"></asp:ListItem>
                                                   <asp:ListItem Text="Inactive"></asp:ListItem>
                                               </asp:DropDownList>
                                           </div>
                                            <div class="col-lg-9">
                                                <asp:Label ID="Label13" runat="server" Text="Remarks"></asp:Label>
                                                <asp:TextBox ID="TextBoxDRemarks" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm" ></asp:TextBox>
                                           </div>
                                       </div>
                                       <div class="row">
                                           <div class="col-lg-4">
                                               <asp:Button ID="Button1" runat="server" Text="Dispose" class="btn btn-warning" OnClick="Button1_Click"/>
                                               <asp:Label ID="Label14" runat="server" ForeColor="#006600" Font-Size="Medium"></asp:Label>
                                           </div>
                                       </div>
                                               </div>
                                           </div>
                                       </div>
                                                                      
                               </div>
                                   </ContentTemplate>
                               </asp:UpdatePanel>  
                                    
                                      
                              
                                   
                                  
                           </div>
                
                                 
            </div>

                      
                     
                                       
                               </div> 
             <div id="Issue" class="container tab-pane">
                <h5>Issue</h5>
             </div> 
                                      </div>
                                      
                                  </div>
                                  
                                               
                        </div>
                           
               
       </div>   
                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT Asset_ID, Serial_Number,Category, Model,Current_Status,Status FROM AssetDescription"></asp:SqlDataSource>
          
                     
           
           
        
        
        
    
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT Ass_Category.AssetType_ID, Ass_Category.Category, Asset_Models.Model, Asset_Models.Quantity, Asset_Models.Models_ID FROM Ass_Category INNER JOIN Asset_Models ON Ass_Category.AssetType_ID = Asset_Models.AssetType_ID"></asp:SqlDataSource>
        
        
        
    
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
                      
           
           
          
        
        
    
  
        
        
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [AssetType_ID], [Category] FROM [Ass_Category]"></asp:SqlDataSource>
           
           
          
          
        
    
  
        
        
    
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT Model, Models_ID FROM Asset_Models"></asp:SqlDataSource>
        
       
        
        
    
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:TRIGONdbConnectionString %>" SelectCommand="SELECT [Asset_ID], [Add_Date], [Status], [Serial_Number], [Category], [Model], [Description], [Imgpath], [Current_Status] FROM [AssetDescription]"></asp:SqlDataSource>
       
        
        
    
</asp:Content>

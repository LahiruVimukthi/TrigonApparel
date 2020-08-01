<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AssetDetails.aspx.cs" Inherits="TrigonApparel.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row">
        <div class="col-lg-06">
            <div class="row">
                <div class="col-lg-12">
                     <div class="card">
                <div class="card-header"style="background-color: #3c40c6; font-family: Arial, Helvetica, sans-serif; color: #FFFFFF">Asset Details</div>
               
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <asp:Label ID="LabelAssCat" runat="server" Text="Category"></asp:Label>
                                <asp:TextBox ID="TextBoxCat" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>
                       
                    </div>
                     <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <asp:Label ID="LabelAModel" runat="server" Text="Model"></asp:Label>
                                <asp:TextBox ID="TextBoxAsModel" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>
                        
                        
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Added On"></asp:Label>
                                <asp:TextBox ID="TextBoxAddDate" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-6">                           
                            <div class="form-group">
                                <asp:Label ID="LabelSerial" runat="server" Text="Serial Number"></asp:Label>
                                <asp:TextBox ID="TextBoxSerial" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <asp:Label ID="LabelStatus" runat="server" Text="Status"></asp:Label>
                                <asp:TextBox ID="TextBoxStatus" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>
                         <div class="col-lg-6">
                            <div class="form-group">
                                <asp:Label ID="LabelCuStatus" runat="server"></asp:Label>
                                <asp:TextBox ID="TextBoxCuStaus" runat="server" CssClass="form-control form-control-sm" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <asp:Label ID="LabelDes" runat="server" Text="Description"></asp:Label>
                                <asp:TextBox ID="TextBoxDes" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        </div>
                    <div class="row">
                        <div class="col-lg-06">
                            <div class="form-group">
                                <asp:Label ID="LabelAssTo" runat="server" Text="Asigned To"></asp:Label>
                                <asp:TextBox ID="TextBoxAssTo" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>

                         
                        </div>
                     <div class="row">
                        <div class="col-lg-06">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="From"></asp:Label>
                                <asp:TextBox ID="TextBoxFrom" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>
                          <div class="col-lg-06">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="To"></asp:Label>
                                <asp:TextBox ID="TextBoxTo" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            </div>
                        </div>

                     </div>
                </div>
            </div>
                </div>
            </div>
           
            
        </div>
        <div class="col-lg-6">
            <div class="row">
                <div class="col-lg-12">
                     <div class="card">
                <div class="card-header"style="background-color: #f53b57; font-family: Arial, Helvetica, sans-serif; color: #FFFFFF">Asset History</div>
               <div class="card-body">
                   <asp:GridView ID="GridViewAssHistory" runat="server" class="table" AutoGenerateColumns="False" CellPadding="4" Font-Size="Small" ForeColor="#333333" GridLines="None">
                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                       <Columns>
                           <asp:BoundField DataField="Order_ID" HeaderText="Order ID" />
                           <asp:BoundField DataField="Req_Date" HeaderText="Date of request" DataFormatString="{0:MM/dd/yyyy}" />
                           <asp:BoundField DataField="From_Date" HeaderText="From" DataFormatString="{0:MM/dd/yyyy}"/>
                           <asp:BoundField DataField="To_Date" HeaderText="To" DataFormatString="{0:MM/dd/yyyy}"/>
                           <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" />
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
                
            </div>
           
            
        </div>
    </div>
</asp:Content>

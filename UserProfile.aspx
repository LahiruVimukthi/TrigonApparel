<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="TrigonApparel.UserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <link  rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"/>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>

    <script src="https://code.jquery.com/jquery-3.3.1.js" ></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" ></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" ></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="row">
                <div class="col=lg-6">
                    <asp:Panel ID="PanelPersonal" runat="server" BorderStyle="Dashed">
                        <div class="form-group">
                            <asp:Label ID="LabelFullName" runat="server" Text="FullName"></asp:Label>
                            <asp:TextBox ID="TextBoxFullName" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="LabelPhn" runat="server" Text="Phone Number"></asp:Label>
                            <asp:TextBox ID="TextBoxPhn" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="LabelNIC" runat="server" Text="NIC Number"></asp:Label>
                             <asp:TextBox ID="TextBoxNIC" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="LabelDoB" runat="server" Text="Date of Birth"></asp:Label>
                             <asp:TextBox ID="TextBoxDoB" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

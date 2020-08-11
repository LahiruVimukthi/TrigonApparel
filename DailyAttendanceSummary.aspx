<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyAttendanceSummary.aspx.cs" Inherits="TrigonApparel.DailyAttendanceSummary" EnableEventValidation="false"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-style: solid;
            border-width: 3px;
        }
        .auto-style2 {
            height: 33px;
            width: 911px;
        }
        .auto-style3 {
            height: 44px;
            text-align: center;
            width: 911px;
        }
        .auto-style5 {
            height: 42px;
            width: 911px;
        }
        .auto-style6 {
            width: 104%;
            height: 19px;
            margin-left: 0px;
            margin-bottom: 0px;
        }
        .auto-style7 {
            width: 285px;
        }
        .auto-style8 {
            height: 147px;
            text-align: center;
            width: 911px;
        }
        .auto-style9 {
            height: 25px;
            width: 946px;
        }
        .auto-style13 {
            width: 911px;
        }
        .auto-style15 {
            text-align: center;
            width: 911px;
            height: 46px;
        }
        .auto-style16 {
            text-align: center;
            width: 911px;
            height: 32px;
        }
        .auto-style17 {
            height: 29px;
            text-align: center;
        }
        .auto-style18 {
            height: 17px;
            width: 911px;
        }
        .auto-style19 {
            height: 16px;
            width: 911px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 631px">
            <asp:Panel ID="Panel1" runat="server" Height="618px">
                <table align="center" class="auto-style1">
                    <tr>
                        <td class="auto-style3" style="background-color: #353b48; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: large; font-weight: bold">
                            <h1>TRIGON APPAREL-MIHINTHALE</h1>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style15" style="font-size: medium; color: #000000; font-weight: bold; font-family: Arial, Helvetica, sans-serif; background-color: #FFFFFF;">
                            <h2 class="auto-style9" style="border-style: solid; background-color: #FFFFFF;">Attendance Report -<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </h2>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18" style="border-style: none none solid none; font-size: medium; color: #000000; font-weight: bold; font-family: Arial, Helvetica, sans-serif; background-color: #FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Issued On-<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19" style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #000000; font-weight: bold; background-color: #FFFFFF; border-top-style: none; border-bottom-style: solid;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Department-
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5" style="background-position: #f5f6fa; border-style: none; background-color: #FFFFFF;" >
                            <table class="auto-style6" style="border-style: none; font-family: Arial, Helvetica, sans-serif; font-size: medium; font-weight: bold; background-color: #FFFFFF; color: #000000;">
                                <tr>
                                    <td class="auto-style7" style="border-bottom-style: solid; border-right-style: solid;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Employees-<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td style="border-bottom-style: solid;">Absent-
                                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Present-<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Approved Leaves-
                                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style16" style="border-style: none; color: #FFFFFF; font-size: large; font-weight: bolder; font-family: Arial, Helvetica, sans-serif; background-color: #596275;">Attendance Details</td>
                    </tr>
                    
                    <tr>
                        <td class="auto-style8">
                            &nbsp;
                            <center>
                                   <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Font-Size="Large" Height="101px" Width="593px">
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                <FooterStyle BackColor="#CCCCCC" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#383838" />
                            </asp:GridView>
                            </center>
                         
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style17">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Download" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Signature</td>
                    </tr>
                    <tr>
                        <td class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Manager</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

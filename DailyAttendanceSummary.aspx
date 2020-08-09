<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyAttendanceSummary.aspx.cs" Inherits="TrigonApparel.DailyAttendanceSummary" %>

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
        }
        .auto-style3 {
            height: 44px;
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            height: 42px;
        }
        .auto-style6 {
            width: 100%;
        }
        .auto-style7 {
            width: 285px;
        }
        .auto-style8 {
            height: 147px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 631px">
            <asp:Panel ID="Panel1" runat="server" Height="618px">
                <table align="center" class="auto-style1">
                    <tr>
                        <td class="auto-style3" style="background-color: #353b48; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; font-size: large; font-weight: bold">TRIGON APPAREL-MIHINTHALE</td>
                    </tr>
                    <tr>
                        <td class="auto-style4" style="font-size: medium; color: #000000; font-weight: bold; font-family: Arial, Helvetica, sans-serif">Attendance Report -<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: medium; color: #000000; font-weight: bold; font-family: Arial, Helvetica, sans-serif">Issued On-<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <table class="auto-style6">
                                <tr>
                                    <td class="auto-style7">Total Employees-<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                    </td>
                                    <td>Absent-
                                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Present-<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4" style="color: #000000; font-size: large; font-weight: bold; font-family: Arial, Helvetica, sans-serif">Attendance Details</td>
                    </tr>
                    <tr>
                        <td>Department-
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">
                            <asp:GridView ID="GridView1" runat="server">
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2"></td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlyAttendanceReport.aspx.cs" Inherits="TrigonApparel.MonthlyAttendanceReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 640px;
            margin-top: 0px;
        }
        .auto-style2 {
            width: 100%;
            height: 395px;
        }
        .auto-style3 {
            text-align: center;
            height: 42px;
            margin-top: 0px;
        }
        .auto-style4 {
            height: 30px;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            height: 29px;
        }
        .auto-style7 {
            height: 20px;
        }
        .auto-style8 {
            height: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style2" style="background-color: #dfe6e9; font-family: Arial, Helvetica, sans-serif">
                <tr>
                    <td style="background-color: #FFFFFF">
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style4" style="background-color: #34495e; color: #FFFFFF">
                                    <h1 class="auto-style3">TRIGON APPAREL- MIHINTHALE</h1>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" style="border-top-style: none; border-bottom-style: solid">
                                    <h3 class="auto-style5">Attendance Report-&nbsp; From:&nbsp;
                                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp; To:
                                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                                    </h3>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7" style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; border-top-style: none; border-bottom-style: solid;">Issued Date-
                                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8" style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; border-top-style: none; border-bottom-style: solid;">Department-
                                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp; Total Employees-<asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; Present-<asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; Absent-<asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; Approved-
                                    <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; border-bottom-style: solid; border-top-style: none;">Department-
                                    <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp; Total Employees-<asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; Present-<asp:Label ID="Label15" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; Absent-<asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; Approved-
                                    <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; border-bottom-style: solid; border-top-style: none;">Department-
                                    <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp; Total Employees-<asp:Label ID="Label19" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; Present-<asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; Absent-<asp:Label ID="Label21" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; Approved-
                                    <asp:Label ID="Label22" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; border-bottom-style: solid; border-top-style: none;">Total Employees-<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Working Hours-
                                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Leave Hours-
                                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" Height="121px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="656px">
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

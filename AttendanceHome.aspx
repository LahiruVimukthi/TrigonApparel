<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AttendanceHome.aspx.cs" Inherits="TrigonApparel.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            <br />
        </div>
        <center>
        <div class="row">
            <div class="col-sm-3">
                <div class="card">
                    <div class="card-body bg-primary text-white" >
                        <asp:Button ID="ButtonMarkAttendance" runat="server" Text="Mark Attendance" BackColor="#007BFF" BorderColor="White" BorderStyle="None" Font-Bold="True" Font-Size="Large" ForeColor="White" OnClick="ButtonMarkAttendance_Click" />
                       
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card">
                    <div class="card-body bg-success text-white">
                        <asp:Button ID="ButtonViewAttendance" runat="server" Text="View Attendance" BackColor="#28A745" BorderColor="White" BorderStyle="None" Font-Bold="True" Font-Size="Large" ForeColor="White" OnClick="ButtonViewAttendance_Click" />
                    </div>
                </div>
            </div>
            <div class="col-sm-3" >
                <div class="card">
                    <div class="card-body bg-danger">
                      <asp:Button ID="ButtonLeaveRequests" runat="server" Text="Leave Requests" BackColor="#DC3545" BorderColor="White" BorderStyle="None" Font-Bold="True" Font-Size="Large" ForeColor="White" OnClick="ButtonLeaveRequests_Click" />
                    </div>
                </div>
            </div>
        </div>
            </center>
    </div>
</asp:Content>

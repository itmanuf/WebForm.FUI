<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboardForm.aspx.cs" Inherits="WebForm.FUI.UserDashboardForm" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FUI Table</title>
    <link href="css/user dashboard/userdash.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2><button type="button" class="btn-detail">CREATE NEW FUI</button></h2>
            <div class="user-info">
                <%--<asp:Label ID="lblRequester" runat="server" Text="Requester: " CssClass="requester-label"></asp:Label>
                <asp:Label ID="lblMessage" runat="server" Text="msg: " CssClass="msg-label"></asp:Label>--%>
            </div>
            <div class="table-wrapper">
                <table class="styled-table">
                    <thead>
                        <tr>
                            <th>DocumentNo</th>
                            <th>Nomor FUI</th>
                            <th>ProjectName</th>   
                            <th>Requester Name</th>
                            <th>Requester Department</th>
                            <th>UserDepartment</th>
                            <th>Invest Type</th>
                            <th>Schedule Requirement Start</th>
                            <th>Schedule Requirement End</th>
                            <th>TotalBudget</th>
                            <th>Status Approval</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    
                    <tr class="filter-row">
                        <td><asp:TextBox runat="server" id="DocumentNo" class="idfui" /></td>
                        <td><asp:TextBox runat="server" id="NomorFUI" class="nofui" /></td>
                        <td><asp:TextBox runat="server" id="ProjectName" class="namaproject" /></td>
                        <td><asp:TextBox runat="server" id="RequesterName" class="requester"  /></td>
                        <td><asp:TextBox runat="server" id="RequesterDepartment" class="reqdept" /></td>
                        <td><asp:TextBox runat="server" id="UserDepartment" class="userdept" /></td>
                        <td><asp:TextBox runat="server" id="InvestType" class="invtype"  /></td>
                        <td><asp:TextBox runat="server" id="ScheduleRequirementStart" class="schedulereqstart"  /></td>
                        <td><asp:TextBox runat="server" id="scheduleRequirementEnd" class="schedulereqend" /></td>
                        <td><asp:TextBox runat="server" id="TotalBudget" class="totalbudget" /></td>
                        <td><asp:TextBox runat="server" id="StatusApproval" class="statusaprvl" /></td>                       
                    </tr>

                    <tbody id="DataTableContainer" runat="server">
                       
                    </tbody>
                </table>
                <div style="margin-top: 10px;">
                    <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="btn-search" OnClick="BtnSearch_Click" />
                    <asp:Button ID="BtnReset" runat="server" Text="Show All" CssClass="btn-reset" OnClick="BtnReset_Click" />

                </div>
            </div>
        </div>
    </form>

    <script src="js/dashboard/filter-fui.js"></script>

</body>
</html>

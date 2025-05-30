<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboardForm.aspx.cs" Inherits="WebForm.FUI.UserDashboardForm" %>

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
            <div class="table-wrapper">
                <table class="styled-table">
                    <thead>
                        <tr>
                            <th>ID FUI</th>
                            <th>Nomor FUI</th>
                            <th>Nama Project</th>
                            <th>Requester</th>
                            <th>Requester Dept</th>
                            <th>User Dept</th>
                            <th>Invest Type</th>
                            <th>Schedule Requirement</th>
                            <th>Total Amount</th>
                            <th>Status Approval</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    
                    <tr class="filter-row">
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        
                    </tr>

                    <tbody>
                        <%-- Contoh data dummy, bisa diisi dari server-side code --%>
                        <% for (int i = 0; i < 5; i++) { %>
                        <tr>
                            <td>FUI00<%=i+1 %></td>
                            <td>NF-2025-0<%=i+1 %></td>
                            <td>Project A<%=i+1 %></td>
                            <td>User A</td>
                            <td>Dept A</td>
                            <td>Dept B</td>
                            <td>CapEx</td>
                            <td>Q3 2025</td>
                            <td>100,000</td>
                            <td>Approved</td>
                            <td><button type="button" class="btn-detail">Detail</button></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </form>

    <script src="js/dashboard/filter-fui.js"></script>

</body>
</html>

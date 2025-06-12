<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailItemForm.aspx.cs" Inherits="WebForm.FUI.DetailItemForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/detailItem/DetailItem.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">      
        <div>  
            <h2><button type="button" id="btn-convert" class="convert" value="Submit" onclick="convertPR()"</button></h2>
            <table class="form-table1">
                <thead>
                    <tr>
                        <th>Requester</th>
                        <th>Requester Department</th>
                        <th>Requisition</th>  
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><asp:TextBox ID="txtRequester" runat="server" CssClass="cell-input" /></td>
                        <td><asp:TextBox ID="txtRequestPayment" runat="server" CssClass="cell-input" /></td>
                        <td><asp:TextBox ID="txtDisposition" runat="server" CssClass="cell-input" /></td>

                    </tr>
                </tbody>
            </table>
          </div>
        
        

        <div>
            <table class="form-table2"> 
                <thead>
                    <tr>
                        <th>Nomor FUI</th>
                        <th>No Detail (LineNum)</th>
                        <th>Item</th>
                        <th>Item Description</th>
                        <th>Order Qty</th>
                        <th>Unit</th>
                        <th>Buy from BP</th>
                        <th>Business Partner Description</th>
                        <th>Price</th>
                        <th>Amount</th>
                        <th>Currency</th>
                        <th>Project Code</th>
                        <th>No Purchase Req</th>
                    </tr>                  
                </thead>
                <tbody>
                    <tr>
                        <td><asp:TextBox CssClass="nomorfui" id="nomorfui" runat="server" /></td>
                        <td><asp:TextBox CssClass="nodetail" id="nodetail" runat="server" /></td>
                        <td><asp:TextBox CssClass="item" id="item" runat="server" /></td>
                        <td><asp:TextBox CssClass="itemdescription" id="itemdescription" runat="server" /></td>
                        <td><asp:TextBox CssClass="orderqty" id="orderqty" runat="server" /></td>
                        <td><asp:TextBox CssClass="unit" id="unit" runat="server" /></td>
                        <td><asp:TextBox CssClass="buy" id="buy" runat="server" /></td>
                        <td><asp:TextBox CssClass="bpd" id="bpd" runat="server" /></td>
                        <td><asp:TextBox CssClass="price" id="price" runat="server" /></td>
                        <td><asp:TextBox CssClass="amount" id="amount" runat="server" /></td>
                        <td><asp:TextBox CssClass="currency" id="currency" runat="server" /></td>
                        <td><asp:TextBox CssClass="projectcode" id="projectcode" runat="server" /></td>
                        <td><asp:TextBox CssClass="nopurchase" id="nopurchase" runat="server" /></td>
                        <td><label class="container">
                            <input type="checkbox" checked="checked">
                            <span class="checkmark"></span>
                            </label>
                        </td>
                    </tr>                 
                </tbody>
                    
                
                   
                    
            </table>
        </div>
    </form>
</body>
</html>

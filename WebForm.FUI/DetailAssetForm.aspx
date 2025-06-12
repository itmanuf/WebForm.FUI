<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailAssetForm.aspx.cs" Inherits="WebForm.FUI.DetailAssetForm" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/createfui/CreateFUI.css" rel="stylesheet" />
</head>
<body>
        <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="row">
            <div class="form-container">
                <div class="col-10">
                    <div class="mb-2">
                        <div class="card-header pb-0">                          
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <div>
                                    <asp:Button ID="BtnSubmit" runat="server" Text="Submit Response" CssClass="submit-btn" />
                                    <asp:Button ID="BtnSave" runat="server" Text="Save" CssClass="btn-save" />
                                </div>
                                <asp:Button ID="BtnLogout" runat="server" Text="Logout" CssClass="btn-logout" />
                            </div>


                            <form class="fui-form">                              
                                <div class="form-row">
                                    <label for="project">DocumentNo</label>
                                    <asp:TextBox runat="server" id="id" class="docno" name="docno" ReadOnly="true"  />
                                </div> 
                                
                                <div class="form-row">
                                    <label for="nomorFUI">Nomor FUI</label>
                                    <asp:TextBox runat="server" id="nomorFUI" class="nomorFUI" name="nomorFUI" />
                                </div>

                                <div class="form-row">
                                    <label for="requester">Requester Name</label>
                                    <asp:TextBox runat="server" id="requester" class="requestername" name="requester" />
                                </div>

                                <div class="form-row">
                                    <label for="requester">Requester Department</label>
                                    <asp:TextBox runat="server" id="requesterdep" class="requesterdept" name="requesterdep" />
                                </div>

                                <div class="form-row">
                                    <label for="requester">User Department</label>
                                    <asp:TextBox runat="server" id="userdep" Class="userdept" name="userdep" />
                                </div>

                                <div class="form-row">
                                    <label for="investmentType">Investment Type</label>
                                    <asp:DropDownList runat="server" id="investmentType" CssClass="investtype" name="investmentType"></asp:DropDownList>
                                </div>

                                 <div class="date-group">
                                     <label for="startDate">Masspro Date</label>
                                     <asp:TextBox ID="txtmasproDate" runat="server" CssClass="form-control" />
                                     <ajaxToolkit:CalendarExtender ID="calStartDate" runat="server" TargetControlID="txtmasproDate" Format="yyyy-MM-dd" />

                                 </div>

                                 <%--<div class="date-range-container">
                                     <div class="date-group">
                                           <label for="startDate">Start Date</label>
                                           <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" />
                                           <ajaxToolkit:CalendarExtender ID="calStartDate" runat="server" TargetControlID="txtStartDate" Format="yyyy-MM-dd" />
                                    </div>
     
                                    <div class="date-group">
                                        <label for="endDate">End Date</label>
                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" />
                                        <ajaxToolkit:CalendarExtender ID="calEndDate" runat="server" TargetControlID="txtEndDate" Format="yyyy-MM-dd" />
                                    </div>
                                </div>--%>

                                <div class="form-row">
                                    <label for="requester">Amount (Budgeted)</label>
                                    <asp:TextBox runat="server" id="amount" class="amount" name="amount" oninput="validateCurrencyInput(event)"  />
                                </div>

                                <div class="form-row">
                                    <label for="requester">Additional Budget</label>
                                    <asp:TextBox runat="server" id="budget" class="budget" name="budget" oninput="validateCurrencyInput(event)"  />
                                </div>

                                <div class="form-row">
                                    <label for="requester">Transfer Budget</label>
                                    <asp:TextBox runat="server" id="budget2" class="budget2" name="budget2" oninput="validateCurrencyInput(event)" />
                                </div>

                                <div class="form-row">
                                    <label for="amount">Total Amount</label>
                                    <asp:TextBox runat="server" id="totalamount" class="totalamount" name="amount" ReadOnly="true" Enabled="false"  />
                                </div>

                                <!-- Section Attachment fields -->
                                <div class="form-row">
                                    <label for="fuiForm">Form Lampiran Harga FUI</label>
                                    <asp:FileUpload runat="server" ID="fuiForm" class="fui-form" />
                                    <br />
                                    <asp:Label ID="lblFuiFormFileName" runat="server" CssClass="attachment-label" />
                                    <asp:HyperLink ID="linkFuiFormDownload" runat="server" Target="_blank" CssClass="attachment-link" Text="Download" />
                                </div>

                                <div class="form-row">
                                    <label for="momBod">MOM BOD</label>
                                    <asp:FileUpload runat="server" id="momBod" class="mombod" name="momBod" />
                                    <br />
                                    <asp:Label ID="lblMOMBOD" runat="server" CssClass="attachment-label" />
                                    <asp:HyperLink ID="linkMOMBOD" runat="server" Target="_blank" CssClass="attachment-link" Text="Download" />
                                </div>

                                <div class="form-row">
                                    <label for="memoAsset">Memo Pengalian Asset</label>
                                    <asp:FileUpload runat="server" id="memoAsset" class="memoAsset" name="memoAsset" />
                                    <br />
                                    <asp:Label ID="lblMemo" runat="server" CssClass="attachment-label" />
                                    <asp:HyperLink ID="linkMemo" runat="server" Target="_blank" CssClass="attachment-link" Text="Download" />
                                </div>

                                <div class="form-row">
                                    <label for="beritaAcara">Berita Acara Scrap</label>
                                    <asp:FileUpload runat="server" id="beritaAcara" class="beritaAcara" name="beritaAcara" />
                                    <br />
                                    <asp:Label ID="lblberitaAcara" runat="server" CssClass="attachment-label" />
                                    <asp:HyperLink ID="linkberitaAcara" runat="server" Target="_blank" CssClass="attachment-link" Text="Download" />
                                </div>

                                <div class="form-row">
                                    <label for="attachmentOther">Attachment Other</label>
                                    <asp:FileUpload runat="server" id="attachmentOther" CssClass="attachmentOther" name="attachmentOther" />
                                    <br />
                                    <asp:Label ID="lblAttch1" runat="server" CssClass="attachment-label" />
                                    <asp:HyperLink ID="linkAttch1" runat="server" Target="_blank" CssClass="attachment-link" Text="Download" />
                                </div>

                                <div class="form-row">
                                    <label for="attachmentOther">Attachment Other </label>
                                    <asp:FileUpload runat="server" id="attachmentOther1" class="attachmentOther" name="attachmentOther" />
                                    <br />
                                    <asp:Label ID="lblAttch2" runat="server" CssClass="attachment-label" />
                                    <asp:HyperLink ID="linkAttch2" runat="server" Target="_blank" CssClass="attachment-link" Text="Download" />
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-container2">
                <div class="col-10">
                    <div class="mb-2">
                        <div class="card-header pb-0">
                            <form class="fui-form2">
                                <div class="form-row">
                                    <label for="project">Project Name</label>
                                    <asp:TextBox runat="server" id="project" class="projectname" name="project" />
                                </div>

                                <div class="form-row">
                                    <label for="project">Status Approval</label>
                                    <asp:TextBox runat="server" id="statusaprv" class="statusaprv" name="statusaprv" />
                                </div>

                                <div class="form-row">
                                    <label for="project">Note Approval</label>
                                    <asp:TextBox runat="server" id="noteaprv" class="noteaprv" name="noteaprv" />
                                </div>

                                <div class="form-row">
                                    <label for="project">Status Convert PR</label>
                                    <asp:TextBox runat="server" id="statuscnvrt" class="statuscnvrt" name="statuscnvrt" />
                                </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="card-body px-0 pt-0 pb-2">
            <div class="table-responsive px-2 pt-1 pb-2">
                <table class="asset-table">
                    <thead>
                        <tr>
                            <th>No Induk</th>
                            <th>Asset Name</th>
                            <th>Spec Type</th>
                            <th>Replaced Asset</th>
                            <th>Desc Replaced Asset</th>
                            <th>No. Asset Parent</th>
                            <th>Desc Asset Parent</th>
                            <th>Ledger Account</th>
                            <th>Desc Ledger Account</th>
                            <th>Amount in Origin</th>
                            <th>Amount in IDR</th>
                            <th>Currency</th>
                            <th>Qty</th>
                            <th>Unit</th>
                            <th>Life Year</th>
                            <th>Status Convert per Induk</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <asp:Repeater ID="rptDetailAsset" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("LineNumFUI") %></td>
                        <td><%# Eval("AssetName") %></td>
                        <td><%# Eval("SpecType") %></td>
                        <td><%# Eval("ReplacedAsset") %></td>
                        <td><%# Eval("ReplacedAssetDesc") %></td>
                        <td><%# Eval("AssetParent") %></td>
                        <td><%# Eval("AssetParentDesc") %></td>
                        <td><%# Eval("LedgerAccount") %></td>
                        <td><%# Eval("LedgerAccountDesc") %></td>
                        <td><%# Eval("Amount") %></td>
                        <td><%# Eval("AmountInIDR") %></td>
                        <td><%# Eval("Currency") %></td>
                        <td><%# Eval("Quantity") == null ? "Not Available" : Eval("Quantity").ToString() %></td>
                        <td><%# Eval("Unit") %></td>
                        <td><%# Eval("LifeYear") %></td>
                        <td><%# Eval("StatusConvert") %></td>
                        <td>
                            <button type="button" class="btn-action">Action</button>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
                    
                    <%--<asp:Repeater ID="rptDetailAsset" runat="server" OnItemDataBound="rptDetailAsset_ItemDataBound">
                        <HeaderTemplate>
                            <tbody>
                                </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("LineNumFUI") %></td>
                                <td><asp:TextBox ID="txtAssetName" runat="server" Text='<%# Eval("AssetName") %>' /></td>
                                <td><asp:TextBox runat="server" ID="txtReplacedAsset" Text='<%# Eval("ReplacedAsset") %>'/></td>
                                <td><asp:TextBox runat="server" ID="txtReplacedAssetDesc" Text='<%# Eval("ReplacedAssetDesc") %>'/></td>
                                <td><asp:TextBox runat="server" ID="txtAssetParent" Text='<%# Eval("AssetParent") %>'></asp:TextBox></td>
                                <td><asp:TextBox runat="server" ID="txtAssetParentDesc" Text='<%# Eval("AssetParentDesc") %>'></asp:TextBox></td>
                                <td><asp:TextBox runat="server" ID="txtLedgerAccount" Text='<%# Eval("LedgerAccount") %>'></asp:TextBox></td>
                                <td><asp:TextBox runat="server" ID="txtLedgerAccountDesc" Text='<%# Eval("LedgerAccountDesc") %>'></asp:TextBox></td>
                                <td><asp:TextBox runat="server" ID="txtAmountinorigin" Text='<%# Eval("Amountinorigin") %>'></asp:TextBox></td>
                                <td><asp:TextBox runat="server" ID="txtCurrency" Text='<%# Eval("Currency") %>'></asp:TextBox></td>
                                <td><asp:TextBox runat="server" ID="txtAmountinIDR" Text='<%# Eval("AmountinIDR") %>'></asp:TextBox></td>
                                <td><asp:TextBox runat="server" ID="txtQuantity" Text='<%# Eval("Quantity") %>'></asp:TextBox></td>
                                <td><asp:TextBox runat="server" ID="txtUnit" Text='<%# Eval("Unit") %>'></asp:TextBox></td>
                                <td><asp:TextBox runat="server" ID="txtLifeYear" Text='<%# Eval("LifeYear") %>'></asp:TextBox></td>
                                <td><asp:TextBox runat="server" ID="txtStatusConvert" Text='<%# Eval("StatusConvert") %>'></asp:TextBox></td>
                                <td></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                        </FooterTemplate>
                    </asp:Repeater>--%>




                    <%--<tbody>
                        <tr>
                            <td><asp:TextBox runat="server" Id="noInduk" class="noinduk" name="noInduk"/></td>
                            <td><asp:TextBox runat="server" id="assetName" CssClass="assetname" name="assetName"/></td>
                            <td><asp:TextBox runat="server" ID="specType" CssClass="specType" name="specType"/></td>
                            <td><asp:TextBox runat="server" ID="replacedAsset" class="replacedAsset"  name="replacedAsset" readonly/></td>
                            <td><select name="descReplacedAsset[]" id="descReplacedAsset" class="descReplacedAsset">
                                <option value="">-- Pilih Desc Replaced Asset --</option></select>
                            </td>
                            <td><asp:TextBox runat="server" ID="noAssetParent" CssClass="noAssetParent" name="noAssetParent"/></td>
                            <td><asp:TextBox runat="server" ID="descAssetParent" CssClass="descAssetParent" name="descAssetParent"/></td>
                            <td><asp:TextBox runat="server" ID="LedgerAccount" class="ledgerAccount" name="ledgerAccount" readonly/></td>
                            <td><select name="descledgerAccount[]" class="descledgerAccount">
                                <option value="">-- Pilih Desc Ledger Account --</option></select>
                            </td>
                            <td><asp:TextBox runat="server" ID="amountBudget" CssClass="amount" name="amount"/></td>
                            <td><select name="currency[]" class="currency"></select>
                            </td>
                            <td><asp:DropDownList runat="server" ID="qty" CssClass="qty" name="qty"/></td>
                            <td><asp:DropDownList runat="server" ID="unit" CssClass="unit" name="unit" class="unit"></asp:DropDownList>
                            </td>
                            <td><asp:TextBox runat="server" ID="lifeYear" CssClass="lifeYear" name="lifeYear"/></td>
                            <td><asp:TextBox runat="server" ID="statusConvert" CssClass="statusConvert" name="statusConvert"/></td>
                            <td><asp:Button runat="server" ID="btn-detail" CssClass="btn-detail"/></td>
                        </tr>
                </tbody>--%>
            </table>               

                <button type="button" id="addRowBtn" class="submit-btn" style="margin-top: 10px;">Add Row</button>
         </div>
      </div>       

        <%--<div class="form-row">
            <button type="submit" class="submit-btn">Submit to Approver</button>
        </div>--%>
    </form>
</div>

    </form>

    

</body>
</html>

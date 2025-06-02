<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateFUI.aspx.cs" Inherits="WebForm.FUI.CreateFUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/createfui/CreateFUI.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
    <h2>Create New FUI</h2>
    <form class="fui-form">
        <div class="form-row">
            <label for="project">ID FUI</label>
            <input type="text" id="id" name="project">
        </div>
        <div class="form-row">
            <label for="project">Nama Project</label>
            <input type="text" id="project" name="project">
        </div>
        <div class="form-row">
            <label for="nomorFUI">Nomor FUI</label>
            <input type="text" id="nomorFUI" name="nomorFUI">
        </div>
        <div class="form-row">
            <label for="requester">Requester</label>
            <input type="text" id="requester" name="requester">
        </div>
        <div class="form-row">
            <label for="requester">Requester Department</label>
            <input type="text" id="requesterdep" name="requesterdep">
        </div>
        <div class="form-row">
            <label for="requester">User Department</label>
            <input type="text" id="userdep" name="userdep">
        </div>
        <div class="form-row">
            <label for="investmentType">Investment Type</label>
            <select id="investmentType" name="investmentType"></select>
        </div>
        <div class="form-row">
            <label for="startDate">Start Date</label>
            <input type="date" id="startDate" name="startDate">
        </div>
        <div class="form-row">
             <label for="endDate">End Date</label>
             <input type="date" id="endDate" name="endDate">
        </div>
        <div class="form-row">
            <label for="requester">Amount (Budgeted)</label>
            <input type="text" id="amount" name="amount">
        </div>
        <div class="form-row">
            <label for="requester">Penambahan Budget</label>
            <input type="text" id="budget" name="budget">
        </div>
        <div class="form-row">
            <label for="requester">Pengalihan Budget</label>
            <input type="text" id="budget2" name="budget2">
        </div>
        <div class="form-row">
            <label for="amount">Total Amount</label>
            <input type="number" id="amount" name="amount">
        </div>
        
        <!-- Section Attachment fields -->
        <div class="form-row">
            <label for="fuiForm">Form Lampiran Harga FUI</label>
            <input type="file" id="fuiForm" name="fuiForm">
        </div>
        <div class="form-row">
            <label for="momBod">MOM BOD</label>
            <input type="file" id="momBod" name="momBod">
        </div>
        <div class="form-row">
            <label for="memoAsset">Memo Pengalian Asset</label>
            <input type="file" id="memoAsset" name="memoAsset">
        </div>
        <div class="form-row">
            <label for="beritaAcara">Berita Acara Scrap</label>
            <input type="file" id="beritaAcara" name="beritaAcara">
        </div>
        <div class="form-row">
            <label for="attachmentOther">Attachment Other</label>
            <input type="file" id="attachmentOther" name="attachmentOther">
        </div>
        <div class="form-row">
            <label for="attachmentOther">Attachment Other</label>
            <input type="file" id="attachmentOther" name="attachmentOther">
        </div>

        <!-- New table structure -->
        <table class="asset-table">
            <thead>
                <tr>
                    <th>No Induk</th>
                    <th>Asset Name</th>
                    <th>Spec Type</th>
                    <th>Replaced Asset</th>
                    <th>No. Asset Parent</th>
                    <th>Desc Asset Parent</th>
                    <th>Ledger Account</th>
                    <th>Amount</th>
                    <th>Currency</th>
                    <th>Qty</th>
                    <th>Unit</th>
                    <th>Life Year</th>
                    <th>Status Convert per Induk</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" name="noInduk[]"></td>
                    <td><input type="text" name="assetName[]"></td>
                    <td><input type="text" name="specType[]"></td>
                    <td><input type="text" name="replacedAsset[]"></td>
                    <td><input type="text" name="noAssetParent[]"></td>
                    <td><input type="text" name="descAssetParent[]"></td>
                    <td><input type="text" name="ledgerAccount[]"></td>
                    <td><input type="number" name="amount[]"></td>
                    <td><input type="text" name="currency[]"></td>
                    <td><input type="number" name="qty[]"></td>
                    <td><input type="text" name="unit[]"></td>
                    <td><input type="number" name="lifeYear[]"></td>
                    <td><input type="text" name="statusConvert[]"></td>
                    <td><button type="button" class="btn-detail">Detail</button></td>
                </tr>
            </tbody>
        </table>

        <div class="form-row">
            <button type="submit" class="submit-btn">Submit to Approver</button>
        </div>
    </form>
</div>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateFUI.aspx.cs" Inherits="WebForm.FUI.CreateFUI" Async="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


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
                                    <asp:TextBox runat="server" id="RequesterName" class="requester" Enabled="false"/>
                                </div>

                                <div class="form-row">
                                    <label for="requester">Requester Department</label>
                                    <asp:TextBox runat="server" id="requesterdep" class="requesterdept" name="requesterdep" />
                                </div>

                                <div class="form-row">
                                    <label for="requester">User Department</label>
                                    <asp:DropDownList runat="server" id="userdep" Class="userdept" name="userdep" />
                                </div>

                                <div class="form-row">
                                    <label for="investmentType">Investment Type</label>
                                    <asp:DropDownList runat="server" id="investmentType" CssClass="investtype" name="investmentType"></asp:DropDownList>
                                </div>

                                 <div class="date-range-container">
                                     <div class="date-group">
                                           <label for="startDate">Masspro Date</label>
                                           <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" />
                                           <ajaxToolkit:CalendarExtender ID="calStartDate" runat="server" TargetControlID="txtStartDate" Format="yyyy-MM-dd" />
                                    </div>                                  
                                </div>

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
                                    <asp:FileUpload runat="server" id="fuiForm" class="fui-form" name="fuiForm" />
                                </div>

                                <div class="form-row">
                                    <label for="momBod">MOM BOD</label>
                                    <asp:FileUpload runat="server" id="momBod" class="mombod" name="momBod" />
                                </div>

                                <div class="form-row">
                                    <label for="memoAsset">Memo Pengalian Asset</label>
                                    <asp:FileUpload runat="server" id="memoAsset" class="memoAsset" name="memoAsset" />
                                </div>

                                <div class="form-row">
                                    <label for="beritaAcara">Berita Acara Scrap</label>
                                    <asp:FileUpload runat="server" id="beritaAcara" class="beritaAcara" name="beritaAcara" />
                                </div>

                                <div class="form-row">
                                    <label for="attachmentOther">Attachment Other</label>
                                    <asp:FileUpload runat="server" id="attachmentOther" CssClass="attachmentOther" name="attachmentOther" />
                                </div>

                                <div class="form-row">
                                    <label for="attachmentOther">Attachment Other </label>
                                    <asp:FileUpload runat="server" id="attachmentOther1" class="attachmentOther" name="attachmentOther" />
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
                            <th>Amount in IDR</th>
                            <th>Currency</th>
                            <th>Amount in Origin</th>
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
                            <td><input type="text" class="replacedAsset" name="replacedAsset[]" readonly></td>
                            <td><select name="descReplacedAsset[]" id="descReplacedAsset" class="descReplacedAsset">
                                <option value="">-- Pilih Desc Replaced Asset --</option></select>
                            </td>
                            <td><input type="text" name="noAssetParent[]"></td>
                            <td><input type="text" name="descAssetParent[]"></td>
                            <td><input type="text" class="ledgerAccount" name="ledgerAccount[]" readonly></td>
                            <td><select name="descledgerAccount[]" class="descledgerAccount">
                                <option value="">-- Pilih Desc Ledger Account --</option></select>
                            </td>
                            <td><input type="number" name="amount[]"></td>
                            <td><select name="currency[]" class="currency"></select></td>
                            <td><input type="number" name="amountinorigin[]"></td>
                            <td><input type="number" name="qty[]"></td>
                            <td><select name="unit[]" class="unit"></select></td>
                            <td><input type="number" name="lifeYear[]"></td>
                            <td><input type="text" name="statusConvert[]"></td>
                            <td><button type="button" class="btn-detail">Detail</button></td>
                        </tr>
                </tbody>
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

    <script type="text/javascript" >

        document.addEventListener('DOMContentLoaded', function () {
            const fields = [
                document.getElementById('<%= amount.ClientID %>'),
                document.getElementById('<%= budget.ClientID %>'),
                document.getElementById('<%= budget2.ClientID %>')
                <%--document.getElementById('<%= totalamount.ClientID %>')--%>
            ];

            fields.forEach(input => {
                input.addEventListener('keypress', function (e) {
                    const char = String.fromCharCode(e.which);
                    const isNumber = /\d/.test(char);
                    const isComma = char === ',';
                    const value = input.value;

                    // Hanya angka dan satu koma diizinkan
                    if (!isNumber && !isComma) {
                        e.preventDefault();
                    }

                    if (isComma && value.includes(',')) {
                        e.preventDefault(); // hanya satu koma
                    }
                });

                input.addEventListener('input', function (e) {
                    let value = input.value;

                    // Ganti titik jadi koma (untuk kasus user pakai titik)
                    value = value.replace(/\./g, ',');

                    // Hapus huruf atau simbol selain angka dan koma
                    value = value.replace(/[^0-9,]/g, '');

                    const parts = value.split(',');
                    let integerPart = parts[0];
                    let decimalPart = parts[1] || '';

                    // Hitung total digit (angka saja)
                    let totalDigit = integerPart.length + decimalPart.length;

                    if (totalDigit > 24) {
                        if (decimalPart.length > 0) {
                            decimalPart = decimalPart.slice(0, Math.max(0, 24 - integerPart.length));
                        }
                        if (integerPart.length > 24) {
                            integerPart = integerPart.slice(0, 24);
                            decimalPart = '';
                        }
                    }

                    // Batasi desimal hanya 2 angka
                    decimalPart = decimalPart.slice(0, 2);

                    input.value = decimalPart ? `${integerPart},${decimalPart}` : integerPart;

                    calculateTotal(); // hitung ulang total
                });
            });

            // === VALIDASI FILE ATTACHMENT ===
            const allowedExtensions = ['jpeg', 'jpg', 'pdf', 'docx', 'xlx', 'xlsx'];
            const maxSize = 10 * 1024 * 1024; // 10 MB

            const fileInputs = [
                document.getElementById('<%= fuiForm.ClientID %>'),
                document.getElementById('<%= momBod.ClientID %>'),
                document.getElementById('<%= memoAsset.ClientID %>'),
                document.getElementById('<%= beritaAcara.ClientID %>'),
                document.getElementById('<%= attachmentOther.ClientID %>'),
                document.getElementById('<%= attachmentOther1.ClientID %>')
            ];

            fileInputs.forEach(input => {
                if (input) {
                    input.addEventListener('change', function () {
                        const file = input.files[0];
                        if (!file) return;

                        const allowedExtensions = ['jpeg', 'jpg', 'pdf', 'docx', 'xlx', 'xlsx'];
                        const maxSize = 10 * 1024 * 1024; // 10 MB
                        const fileName = file.name.toLowerCase();
                        const ext = fileName.split('.').pop();
                        const size = file.size;

                        if (!allowedExtensions.includes(ext)) {
                            alert(`File ${file.name} tidak diizinkan.\nHanya: ${allowedExtensions.join(', ')}`);
                            input.value = '';
                            return;
                        }

                        if (size > maxSize) {
                            alert(`Ukuran file ${file.name} melebihi 10 MB.`);
                            input.value = '';
                            return;
                        }
                    });
                }
            });

            //VALIDASI AMOUNT
            const mainAmountInput = document.getElementById('<%= totalamount.ClientID %>');

            function parseIndoNumber(str) {
                if (!str) return 0;
                return parseFloat(str.replace(/\./g, '').replace(',', '.'));
            }

            // Ambil semua input amount di tabel (dengan name="amount[]")
            const tableAmountInputs = document.querySelectorAll('input[name="amount[]"]');

            tableAmountInputs.forEach(input => {
                input.addEventListener('input', function () {
                    const mainAmount = parseIndoNumber(mainAmountInput.value);
                    const total = calculateTableTotal();

                    if (total > mainAmount) {
                        alert(`Nilai amount tidak boleh lebih dari Amount di atas: ${mainAmount}`);
                        input.value = '';
                    }
                });
            });

            //VALIDASI ADD ROW TABLE
            const table = document.querySelector('.asset-table tbody');
            const addRowBtn = document.getElementById('addRowBtn');

            addRowBtn.addEventListener('click', function () {
                const lastRow = table.querySelector('tr:last-child');
                const newRow = lastRow.cloneNode(true);

                // Bersihkan isi setiap input dalam baris baru
                const inputs = newRow.querySelectorAll('input');
                inputs.forEach(input => {
                    input.value = '';
                });

                table.appendChild(newRow);

                // Tambahkan kembali event validasi Amount agar tetap membatasi
                const mainAmountInput = document.getElementById('<%= totalamount.ClientID %>');
                const amountInput = newRow.querySelector('input[name="amount[]"]');
                if (amountInput) {
                    amountInput.addEventListener('input', function () {
                        const mainAmount = parseIndoNumber(mainAmountInput.value);
                        const current = calculateTableTotal();

                        if (current > mainAmount) {
                            alert(`Nilai amount tidak boleh lebih dari Amount di atas: ${mainAmount}`);
                            amountInput.value = '';
                        }
                    });
                }

                populateDescReplacedAssetDropdown();
                populateDescLedgerDropdown();
                populateCurrencyDropdown();
                populateUnitDropdown();
                
            });

            //VALIDASI DROPDOWN REPLACED ASSET
            if (!window.descReplacedAssets) {
                console.error('Data Desc_Replaced_Assets belum dimuat dengan benar!');
                return;
            }
            
            // Fungsi untuk mengisi dropdown Desc_Replaced_Asset dengan data dari backend
            function populateDescReplacedAssetDropdown() {
                const selectElements = document.querySelectorAll('.descReplacedAsset'); // Mengambil semua dropdown Desc_Replaced_Asset
                const data = window.descReplacedAssets; // Data yang dikirim dari backend

                selectElements.forEach(select => {
                    // Clear existing options
                    select.innerHTML = '<option value="">-- Pilih Desc Replaced Asset --</option>';

                    // Tambahkan option ke dropdown untuk setiap Desc Replaced Asset
                    data.forEach(item => {
                        const option = document.createElement('option');
                        option.value = item.Desc_Replaced_Asset;
                        option.textContent = item.Desc_Replaced_Asset;
                        select.appendChild(option);
                    });
                });
            }

            

            // Event listener untuk update Replaced_Asset ketika Desc_Replaced_Asset dipilih
            document.addEventListener('change', function (e) {
                if (e.target && e.target.classList.contains('descReplacedAsset')) {
                    const selectedDesc = e.target.value;

                    const replacedAssetInput = e.target.closest('tr').querySelector('.replacedAsset');


                    // Pastikan elemen replacedAssetInput ditemukan
                    if (replacedAssetInput) {
                        // Cari Replaced_Asset yang sesuai dengan selectedDesc
                        const selectedAsset = window.descReplacedAssets.find(item => item.Desc_Replaced_Asset === selectedDesc);

                        // Jika ditemukan, isi field Replaced Asset
                        if (selectedAsset) {
                            replacedAssetInput.value = selectedAsset.Replaced_Asset;
                        } else {
                            replacedAssetInput.value = ''; // Kosongkan jika tidak ditemukan
                        }
                    } else {
                        console.error('replacedAssetInput tidak ditemukan!');
                    }
                }
            }); 
                                             
            // Memanggil fungsi untuk mengisi dropdown setelah halaman dimuat
            populateDescReplacedAssetDropdown();
            populateDescLedgerDropdown();
            populateCurrencyDropdown();
            populateUnitDropdown();
            
        });


        function populateDescLedgerDropdown() {
            const selects = document.querySelectorAll('.descledgerAccount');
            if (!window.ledgerData) {
                console.error("Ledger data belum tersedia.");
                return;
            }

            selects.forEach(select => {
                select.innerHTML = '<option value="">-- Pilih Desc Ledger Account --</option>';
                window.ledgerData.forEach(item => {
                    const opt = document.createElement('option');
                    opt.value = item.Desc_Ledger_Account;
                    opt.textContent = item.Desc_Ledger_Account;
                    select.appendChild(opt);
                });
            });
        }

        // Set ledger account otomatis saat desc dipilih
        document.addEventListener('change', function (e) {
            if (e.target && e.target.classList.contains('descledgerAccount')) {
                const selectedDesc = e.target.value;
                const ledgerAccountInput = e.target.closest('tr').querySelector('.ledgerAccount');
                const matched = window.ledgerData.find(item => item.Desc_Ledger_Account === selectedDesc);
                if (matched) {
                    ledgerAccountInput.value = matched.Ledger_Account;
                } else {
                    ledgerAccountInput.value = '';
                }
            }
        });   

        function populateCurrencyDropdown() {
            const selects = document.querySelectorAll('.currency');

            if (!window.currencyData) {
                console.error("Currency data belum tersedia.");
                return;
            }

            selects.forEach(select => {
                select.innerHTML = ''; // Kosongkan dulu

                // Tambahkan opsi default
                const defaultOption = document.createElement('option');
                defaultOption.value = '';
                defaultOption.textContent = '-- Pilih Currency --';
                select.appendChild(defaultOption);

                // Tambahkan semua currency dari backend
                window.currencyData.forEach(item => {
                    const opt = document.createElement('option');
                    opt.value = item.Currency;
                    opt.textContent = item.Currency;
                    select.appendChild(opt);
                });
            });
        }

        function populateUnitDropdown() {
            const selects = document.querySelectorAll('.unit');

            if (!window.unitData) {
                console.error("Unit data belum tersedia.");
                return;
            }

            selects.forEach(select => {
                select.innerHTML = ''; // Kosongkan dulu

                // Tambahkan opsi default
                const defaultOption = document.createElement('option');
                defaultOption.value = '';
                defaultOption.textContent = '-- Pilih Unit --';
                select.appendChild(defaultOption);

                // Tambahkan semua unit dari backend
                window.unitData.forEach(item => {
                    const opt = document.createElement('option');
                    opt.value = item.Unit;
                    opt.textContent = item.Unit;
                    select.appendChild(opt);
                });
            });
        }


        function validateCurrencyInput(event) {
            let input = event.target;
            let value = input.value;

            // Ganti titik jadi koma (untuk kasus user pakai titik)
            value = value.replace(/\./g, ',');

            // Hapus huruf atau simbol selain angka dan koma
            value = value.replace(/[^0-9,]/g, '');

            const parts = value.split(',');
            let integerPart = parts[0];
            let decimalPart = parts[1] || '';

            // Hitung total digit (angka saja)
            let totalDigit = integerPart.length + decimalPart.length;

            if (totalDigit > 24) {
                if (decimalPart.length > 0) {
                    decimalPart = decimalPart.slice(0, Math.max(0, 24 - integerPart.length));
                }
                if (integerPart.length > 24) {
                    integerPart = integerPart.slice(0, 24);
                    decimalPart = '';
                }
            }

            // Batasi desimal hanya 2 angka
            decimalPart = decimalPart.slice(0, 2);

            input.value = decimalPart ? `${integerPart},${decimalPart}` : integerPart;
        }


        function parseIndoNumber(str) {
            if (!str) return 0;
            return parseFloat(str.replace(/\./g, '').replace(',', '.'));
        }

        function calculateTotal() {
            //function parseIndoNumber(str) {
            //    if (!str) return 0;
            //    return parseFloat(str.replace(/\./g, '').replace(',', '.')); // "1.000,25" → 1000.25
            //}

            const amount = parseIndoNumber(document.getElementById('<%= amount.ClientID %>').value);
            const budget = parseIndoNumber(document.getElementById('<%= budget.ClientID %>').value);
            const budget2 = parseIndoNumber(document.getElementById('<%= budget2.ClientID %>').value);
            const total = amount + budget + budget2;
            document.getElementById('<%= totalamount.ClientID %>').value = formatToIndo(total);
        }

        function calculateTableTotal() {
            let total = 0;
            const tableAmountInputs = document.querySelectorAll('input[name="amount[]"]');
            tableAmountInputs.forEach(input => {
                const currentAmount = parseIndoNumber(input.value);
                total += currentAmount;
            });
            console.log("Total amount in table: ", total);
            return total;
        }

        function formatToIndo(number) {
            const fixed = number.toFixed(2); // dua desimal
            const parts = fixed.split('.');
            const integerPart = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            return `${integerPart},${parts[1]}`;
        }

    </script>


</body>
</html>

//document.addEventListener('DOMContentLoaded', function () {
//    const fields = [

//        document.getElementById('<%= amount.ClientID %>'),
//        document.getElementById('<%= budget.ClientID %>'),
//        document.getElementById('<%= budget2.ClientID %>')
//    ];

//    fields.forEach(input => {
//        if (input) {  // Check if the input element exists
//            input.addEventListener('keypress', function (e) {

//                console.log('Key pressed on input:', input);

//                const char = String.fromCharCode(e.which);
//                const isNumber = /\d/.test(char);
//                const isComma = char === ',';
//                const value = input.value;

//                if (!isNumber && !isComma) {
//                    e.preventDefault();
//                }

//                if (isComma && value.includes(',')) {
//                    e.preventDefault(); // only one comma allowed
//                }
//            });

//            input.addEventListener('input', function (e) {
//                let value = input.value;
//                value = value.replace(/\./g, ','); // replace dots with commas
//                value = value.replace(/[^0-9,]/g, ''); // allow only numbers and commas
//                input.value = value;
//                calculateTotal(); // recalculate the total

//                console.log("Total calculated");
//            });
//        }
//    });

//    // === VALIDASI FILE ATTACHMENT ===
//    const allowedExtensions = ['jpeg', 'jpg', 'pdf', 'docx', 'xlx', 'xlsx'];
//    const maxSize = 10 * 1024 * 1024; // 10 MB

//    const fileInputs = [
//        document.getElementById('<%= fuiForm.ClientID %>'),
//        document.getElementById('<%= momBod.ClientID %>'),
//        document.getElementById('<%= memoAsset.ClientID %>'),
//        document.getElementById('<%= beritaAcara.ClientID %>'),
//        document.getElementById('<%= attachmentOther.ClientID %>'),
//        document.getElementById('<%= attachmentOther1.ClientID %>')
//    ];

//    fileInputs.forEach(input => {
//        if (input) {
//            input.addEventListener('change', function () {
//                const file = input.files[0];
//                if (!file) return;

//                const allowedExtensions = ['jpeg', 'jpg', 'pdf', 'docx', 'xlx', 'xlsx'];
//                const maxSize = 10 * 1024 * 1024; // 10 MB
//                const fileName = file.name.toLowerCase();
//                const ext = fileName.split('.').pop();
//                const size = file.size;

//                if (!allowedExtensions.includes(ext)) {
//                    alert(`File ${file.name} tidak diizinkan.\nHanya: ${allowedExtensions.join(', ')}`);
//                    input.value = '';
//                    return;
//                }

//                if (size > maxSize) {
//                    alert(`Ukuran file ${file.name} melebihi 10 MB.`);
//                    input.value = '';
//                    return;
//                }
//            });
//        }
//    });

//    // ===== VALIDASI AMOUNT =====
//    const mainAmountInput = document.getElementById('<%= amount.ClientID %>');

//    function parseIndoNumber(str) {
//        if (!str) return 0;
//        return parseFloat(str.replace(/\./g, '').replace(',', '.'));
//    }

//    // Ambil semua input amount di tabel (dengan name="amount[]")
//    const tableAmountInputs = document.querySelectorAll('input[name="amount[]"]');

//    tableAmountInputs.forEach(input => {
//        input.addEventListener('input', function () {
//            const mainAmount = parseIndoNumber(mainAmountInput.value);
//            const total = calculateTableTotal();

//            if (total > mainAmount) {
//                alert(`Nilai amount tidak boleh lebih dari Amount di atas: ${mainAmount}`);
//                input.value = '';
//            }
//        });
//    });

//    //VALIDASI ADD ROW TABLE
//    const table = document.querySelector('.asset-table tbody');
//    const addRowBtn = document.getElementById('addRowBtn');

//    addRowBtn.addEventListener('click', function () {
//        const lastRow = table.querySelector('tr:last-child');
//        const newRow = lastRow.cloneNode(true);

//        // Bersihkan isi setiap input dalam baris baru
//        const inputs = newRow.querySelectorAll('input');
//        inputs.forEach(input => {
//            input.value = '';
//        });

//        table.appendChild(newRow);

//        // Tambahkan kembali event validasi Amount agar tetap membatasi
//        const mainAmountInput = document.getElementById('<%= amount.ClientID %>');
//        const amountInput = newRow.querySelector('input[name="amount[]"]');
//        if (amountInput) {
//            amountInput.addEventListener('input', function () {
//                const mainAmount = parseIndoNumber(mainAmountInput.value);
//                const current = calculateTableTotal();

//                if (current > mainAmount) {
//                    alert(`Nilai amount tidak boleh lebih dari Amount di atas: ${mainAmount}`);
//                    amountInput.value = '';
//                }
//            });
//        }
//    });

//    //VALIDASI DROPDOWN REPLACED ASSET
//    if (!window.descReplacedAssets) {
//        console.error('Data Desc_Replaced_Assets belum dimuat dengan benar!');
//        return;
//    }

//    if (!window.descReplacedAssets) {
//        console.error('Data Desc_Replaced_Assets belum dimuat dengan benar!');
//        return;
//    }

//    // Fungsi untuk mengisi dropdown Desc_Replaced_Asset dengan data dari backend
//    function populateDescReplacedAssetDropdown() {
//        const selectElements = document.querySelectorAll('.descReplacedAsset'); // Mengambil semua dropdown Desc_Replaced_Asset
//        const data = window.descReplacedAssets; // Data yang dikirim dari backend

//        selectElements.forEach(select => {
//            // Clear existing options
//            select.innerHTML = '<option value="">-- Pilih Desc Replaced Asset --</option>';

//            // Tambahkan option ke dropdown untuk setiap Desc Replaced Asset
//            data.forEach(item => {
//                const option = document.createElement('option');
//                option.value = item.Desc_Replaced_Asset;
//                option.textContent = item.Desc_Replaced_Asset;
//                select.appendChild(option);
//            });
//        });
//    }

//    // Event listener untuk update Replaced_Asset ketika Desc_Replaced_Asset dipilih
//    document.addEventListener('change', function (e) {
//        if (e.target && e.target.classList.contains('descReplacedAsset')) {
//            const selectedDesc = e.target.value;
//            const replacedAssetInput = e.target.closest('tr').querySelector('.replacedAsset');

//            // Pastikan elemen replacedAssetInput ditemukan
//            if (replacedAssetInput) {
//                // Cari Replaced_Asset yang sesuai dengan selectedDesc
//                const selectedAsset = window.descReplacedAssets.find(item => item.Desc_Replaced_Asset === selectedDesc);

//                // Jika ditemukan, isi field Replaced Asset
//                if (selectedAsset) {
//                    replacedAssetInput.value = selectedAsset.Replaced_Asset;
//                } else {
//                    replacedAssetInput.value = ''; // Kosongkan jika tidak ditemukan
//                }
//            } else {
//                console.error('replacedAssetInput tidak ditemukan!');
//            }
//        }
//    });

//    // Memanggil fungsi untuk mengisi dropdown setelah halaman dimuat
//    populateDescReplacedAssetDropdown();
//});



//function validateCurrencyInput(event) {
//    let input = event.target;
//    let value = input.value;

//    // Ganti titik jadi koma (untuk kasus user pakai titik)
//    value = value.replace(/\./g, ',');

//    // Hapus huruf atau simbol selain angka dan koma
//    value = value.replace(/[^0-9,]/g, '');

//    const parts = value.split(',');
//    let integerPart = parts[0];
//    let decimalPart = parts[1] || '';

//    // Hitung total digit (angka saja)
//    let totalDigit = integerPart.length + decimalPart.length;

//    if (totalDigit > 24) {
//        if (decimalPart.length > 0) {
//            decimalPart = decimalPart.slice(0, Math.max(0, 24 - integerPart.length));
//        }
//        if (integerPart.length > 24) {
//            integerPart = integerPart.slice(0, 24);
//            decimalPart = '';
//        }
//    }

//    // Batasi desimal hanya 2 angka
//    decimalPart = decimalPart.slice(0, 2);

//    input.value = decimalPart ? `${integerPart},${decimalPart}` : integerPart;
//}


//function parseIndoNumber(str) {
//    if (!str) return 0;
//    return parseFloat(str.replace(/\./g, '').replace(',', '.'));
//}

//function calculateTotal() {
    
//    const amount = parseIndoNumber(document.getElementById('<%= amount.ClientID %>').value);
//    const budget = parseIndoNumber(document.getElementById('<%= budget.ClientID %>').value);
//    const budget2 = parseIndoNumber(document.getElementById('<%= budget2.ClientID %>').value);
//    const total = amount + budget + budget2;
//    document.getElementById('<%= totalamount.ClientID %>').value = formatToIndo(total);
//}

//function calculateTableTotal() {
//    let total = 0;
//    const tableAmountInputs = document.querySelectorAll('input[name="amount[]"]');
//    tableAmountInputs.forEach(input => {
//        const currentAmount = parseIndoNumber(input.value);
//        total += currentAmount;
//    });
//    console.log("Total amount in table: ", total);
//    return total;
//}

//function formatToIndo(number) {
//    const fixed = number.toFixed(2); // dua desimal
//    const parts = fixed.split('.');
//    const integerPart = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
//    return `${integerPart},${parts[1]}`;
//}
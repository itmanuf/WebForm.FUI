document.querySelectorAll('input[type="text"]').forEach(input => {
    input.addEventListener('input', function () {
        let searchParams = new URLSearchParams();

        let requester = document.getElementById("requester").value;  // Assuming an input field for requester
        if (requester) {
            searchParams.append("requester", requester);
        }

        // Ambil nilai dari setiap field input hanya jika ada nilai
        document.querySelectorAll('input[type="text"]').forEach(field => {
            if (field.value.trim() !== "") {
                searchParams.append(field.id, field.value);
            }
        });

        // Jika tidak ada nilai pencarian, jangan kirim permintaan
        if (searchParams.toString()) {
            // Redirect ke halaman dengan parameter pencarian yang baru
            window.location.href = "UserDashboardForm.aspx?" + searchParams.toString();
        }
    });
});

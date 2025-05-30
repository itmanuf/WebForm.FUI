document.addEventListener("DOMContentLoaded", function () {
    const inputs = document.querySelectorAll(".filter-row input");

    inputs.forEach(input => {
        input.addEventListener("input", function () {
            const filters = Array.from(inputs).map(input => input.value);
            const queryParams = new URLSearchParams({
                idFUI: filters[0],
                nomorFUI: filters[1],
                namaProject: filters[2],
                requester: filters[3],
                requesterDept: filters[4],
                userDept: filters[5],
                investType: filters[6],
                schedule: filters[7],
                totalAmount: filters[8],
                status: filters[9]
            });

            fetch("FilterHandler.aspx?" + queryParams)
                .then(response => response.json())
                .then(data => renderTable(data))
                .catch(error => console.error("Fetch error:", error));
        });
    });

    function renderTable(data) {
        const tbody = document.querySelector(".styled-table tbody");
        tbody.innerHTML = "";

        data.forEach(row => {
            const tr = document.createElement("tr");
            tr.innerHTML = `
                <td>${row.IDFUI}</td>
                <td>${row.NomorFUI}</td>
                <td>${row.NamaProject}</td>
                <td>${row.Requester}</td>
                <td>${row.RequesterDept}</td>
                <td>${row.UserDept}</td>
                <td>${row.InvestType}</td>
                <td>${row.ScheduleRequirement}</td>
                <td>${row.TotalAmount}</td>
                <td>${row.StatusApproval}</td>
                <td><button class="btn-detail">Detail</button></td>
            `;

            
            tbody.appendChild(tr);
        });

        thead.innerHTML = '<td><input type="text" /></td>
            < td > <input type="text" /></td >
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td>
                        <td><input type="text" /></td> '

        
    }
});

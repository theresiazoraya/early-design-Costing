<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Add_DetailRekomendasi.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Add Rekomendasi</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Rekomendasi</li>
                    <li class="breadcrumb-item active">Add Rekomendasi</li>
                </ol>
            </nav>
        </div>
        <section class="section">
            <div class="container col-lg-12">
                <div id="addItemForm">
                    <div class="mb-3">
                        <label for="Affco" class="form-label">Affco</label>
                        <select class="form-select" id="Affco">
                            <option value="Aisin">Aisin</option>
                            <option value="Akashi">Akashi</option>
                            <option value="Akebono">Akebono</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="assessmentyear" class="form-label">Assessment Year</label>
                        <input type="text" class="form-control" id="assessmentyear" required>
                    </div>
                    <div class="mb-3">
                        <label for="Recommendation" class="form-label">Recommendation</label>
                        <input type="text" class="form-control" id="Recommendation" required>
                    </div>
                    <div class="mb-3">
                        <label for="MngRespons" class="form-label">Management Response</label>
                        <input type="text" class="form-control" id="MngRespons" required>
                    </div>
                    <div class="mb-3">
                        <label for="DueDate" class="form-label">Due Date</label>
                        <input type="date" class="form-control" id="DueDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="DeptIncharge" class="form-label">Dept Incharge</label>
                        <input type="text" class="form-control" id="DeptIncharge" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <button type="button" class="btn btn-primary" onclick="submitForm()">Submit</button>
                    </div>
                </div>

                <!-- Table to display items -->
                <table class="table" id="dataTable">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Affco</th>
                            <th scope="col">Assessment Year</th>
                            <th scope="col">Recommendation</th>
                            <th scope="col">Management Response</th>
                            <th scope="col">Due Date</th>
                            <th scope="col">Dept Incharge</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Rows will be dynamically added here -->
                    </tbody>
                </table>
            </div>
        </section>
    </main>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>
        // Initialize entries array and editingRow variable
        let entries = [];
        let editingRow = null;

        // Function to handle form submission
        function submitForm() {
            // Retrieve values from form fields
            const affco = document.getElementById('Affco').value;
            const assessmentyear = document.getElementById('assessmentyear').value;
            const recommendation = document.getElementById('Recommendation').value;
            const mngRespons = document.getElementById('MngRespons').value;
            const dueDate = document.getElementById('DueDate').value;
            const deptIncharge = document.getElementById('DeptIncharge').value;

            // Check if all required fields are filled
            if (affco && assessmentyear && recommendation && mngRespons && dueDate && deptIncharge) {
                // Create entry object
                const entry = {
                    no: entries.length + 1,
                    affco: affco,
                    assessmentyear: assessmentyear,
                    recommendation: recommendation,
                    mngRespons: mngRespons,
                    dueDate: dueDate,
                    deptIncharge: deptIncharge
                };

                // Check if editingRow is null (add new entry) or not (edit existing entry)
                if (editingRow === null) {
                    entries.push(entry);
                    addRowToTable(entry);
                } else {
                    entries[editingRow.rowIndex - 1] = entry;
                    updateRow(editingRow, entry);
                }

                // Clear form fields
                clearForm();
            }
        }

        // Function to add a new row to the table
        function addRowToTable(entry) {
            const table = document.getElementById('dataTable').getElementsByTagName('tbody')[0];
            const newRow = table.insertRow();

            newRow.innerHTML = `
            <td>${entry.no}</td>
            <td>${entry.affco}</td>
            <td>${entry.assessmentyear}</td>
            <td>${entry.recommendation}</td>
            <td>${entry.mngRespons}</td>
            <td>${entry.dueDate}</td>
            <td>${entry.deptIncharge}</td>
            <td>
                <button class="btn btn-primary" onclick="editRow(this)"><i class="fas fa-edit"></i></button>
                <button class="btn btn-danger" onclick="deleteRow(this)"><i class="fas fa-trash-alt"></i></button>
            </td>
        `;
        }

        // Function to update an existing row in the table
        function updateRow(row, entry) {
            row.cells[0].innerHTML = entry.no;
            row.cells[1].innerHTML = entry.affco;
            row.cells[2].innerHTML = entry.assessmentyear;
            row.cells[3].innerHTML = entry.recommendation;
            row.cells[4].innerHTML = entry.mngRespons;
            row.cells[5].innerHTML = entry.dueDate;
            row.cells[6].innerHTML = entry.deptIncharge;
            row.cells[7].innerHTML = `
            <button class="btn btn-primary" onclick="editRow(this)"><i class="fas fa-edit"></i></button>
            <button class="btn btn-danger" onclick="deleteRow(this)"><i class="fas fa-trash-alt"></i></button>
        `;
        }

        // Function to edit a row in the table
        function editRow(button) {
            editingRow = button.parentNode.parentNode;
            const cells = editingRow.getElementsByTagName('td');

            // Populate form fields with data from the selected row
            document.getElementById('Affco').value = cells[1].innerHTML;
            document.getElementById('assessmentyear').value = cells[2].innerHTML;
            document.getElementById('Recommendation').value = cells[3].innerHTML;
            document.getElementById('MngRespons').value = cells[4].innerHTML;
            document.getElementById('DueDate').value = cells[5].innerHTML;
            document.getElementById('DeptIncharge').value = cells[6].innerHTML;
        }

        // Function to delete a row from the table
        function deleteRow(button) {
            const row = button.parentNode.parentNode;
            const index = row.rowIndex - 1;
            entries.splice(index, 1);
            document.getElementById('dataTable').deleteRow(row.rowIndex);
            updateRowNumbers();
        }

        // Function to update row numbers after deletion
        function updateRowNumbers() {
            const tableBody = document.getElementById('dataTable').getElementsByTagName('tbody')[0];
            const rows = tableBody.getElementsByTagName('tr');
            for (let i = 0; i < rows.length; i++) {
                rows[i].cells[0].innerText = i + 1;
            }
        }

        // Function to clear form fields
        function clearForm() {
            editingRow = null;
            document.getElementById('Affco').value = '';
            document.getElementById('assessmentyear').value = '';
            document.getElementById('Recommendation').value = '';
            document.getElementById('MngRespons').value = '';
            document.getElementById('DueDate').value = '';
            document.getElementById('DeptIncharge').value = '';
        }
    </script>
</asp:Content>

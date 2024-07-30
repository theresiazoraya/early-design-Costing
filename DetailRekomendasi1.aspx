<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="DetailRekomendasi1.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Rekomendasi</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Rekomendasi</li>
                    <li class="breadcrumb-item active">Detail Rekomendasi</li>
                </ol>
            </nav>
        </div>
        <section class="section">
            <div class="tables-wrapper">
                <form id="dataForm">
                    <div class="row mb-3">
                        <div class="col-lg-12">
                            <button type="button" class="btn btn-primary" onclick="openAddPage()">
                                Add Detail Reccomendation
                            </button>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filterCategory" class="form-label">Affco</label>
                            <select class="form-select" id="filterCategory">
                                <option value="Aisin">Aisin</option>
                                <option value="Akashi">Akashi</option>
                                <option value="Akebono">Akebono</option>
                            </select>
                        </div>
                    </div>
                    <table class="table" id="dataTable">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Affco</th>
                                <th scope="col">Recommendation</th>
                                <th scope="col">Management Response</th>
                                <th scope="col">Due Date</th>
                                <th scope="col">Dept Incharge</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="tableBody">
                            <!-- Dummy data will be dynamically added here -->
                        </tbody>
                    </table>

                </form>
            </div>
        </section>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const dummyData = [
                { no: 1, affco: "Aisin", recommendation: "Recommendation 1", mngRespons: "Response 1", dueDate: "2024-06-10", deptIncharge: "Dept 1" },
                { no: 2, affco: "Akashi", recommendation: "Recommendation 2", mngRespons: "Response 2", dueDate: "2024-06-11", deptIncharge: "Dept 2" },
                { no: 3, affco: "Akebono", recommendation: "Recommendation 3", mngRespons: "Response 3", dueDate: "2024-06-12", deptIncharge: "Dept 3" },
                { no: 4, affco: "Aisin", recommendation: "Recommendation 4", mngRespons: "Response 4", dueDate: "2024-06-13", deptIncharge: "Dept 4" },
                { no: 5, affco: "Akashi", recommendation: "Recommendation 5", mngRespons: "Response 5", dueDate: "2024-06-14", deptIncharge: "Dept 5" }
            ];

            const tableBody = document.getElementById('tableBody');
            const filterCategory = document.getElementById('filterCategory');

            // Populate table with dummy data
            dummyData.forEach(entry => addRowToTable(entry));

            // Filter table when the select value changes
            filterCategory.addEventListener('change', function () {
                const selectedAffco = filterCategory.value;
                filterTableByAffco(selectedAffco);
            });

            function addRowToTable(entry) {
                const newRow = document.createElement('tr');
                newRow.innerHTML = `
                <td>${entry.no}</td>
                <td>${entry.affco}</td>
                <td>${entry.recommendation}</td>
                <td>${entry.mngRespons}</td>
                <td>${entry.dueDate}</td>
                <td>${entry.deptIncharge}</td>
                <td>
                    <a class="btn" onclick="editRow(this)"><i class="fas fa-pencil-alt"></i></a>
                    <a class="btn" onclick="deleteRow(this)"><i class="fas fa-trash-alt"></i></a>
                </td>
            `;
                tableBody.appendChild(newRow);
            }

            function filterTableByAffco(affco) {
                const rows = tableBody.getElementsByTagName('tr');
                for (let i = 0; i < rows.length; i++) {
                    const affcoCell = rows[i].getElementsByTagName('td')[1];
                    if (affco === 'All' || affcoCell.textContent === affco) {
                        rows[i].style.display = ''; // Display the row
                    } else {
                        rows[i].style.display = 'none'; // Hide the row
                    }
                }
            }
        });
    </script>

      <script>
        function openAddPage() {
            window.location.href = 'Add_DetailRekomendasi.aspx';
        }
    </script>

</asp:Content>

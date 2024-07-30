<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="InventoryAging.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Inventory Aging</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Inventory</li>
                    <li class="breadcrumb-item active">Inventory Aging</li>
                </ol>
            </nav>
        </div>
        <section class="section">
            <div class="tables-wrapper">
                <form id="nonEditableForm">
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filterAffco" class="form-label">Nama Affco</label>
                            <select class="form-select" id="filterAffco">
                                <option value="All">All</option>
                                <option value="Aisin">Aisin</option>
                                <option value="Akashi">Akashi</option>
                                <option value="Akebono">Akebono</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filterPeriod" class="form-label">Periode</label>
                            <select class="form-select" id="filterPeriod">
                                <option value="All">All</option>
                                <option value="januari">Januari</option>
                                <option value="februari">Februari</option>
                                <option value="maret">Maret</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filtertahun" class="form-label">Tahun</label>
                            <select class="form-select" id="filtertahun">
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="Filterversi" class="form-label">Versi</label>
                            <select class="form-select" id="filterversi">
                                <option value="All">All</option>
                                <option value="affco">Affco</option>
                                <option value="reperform">reperform</option>
                                <option value="aop">aop</option>
                            </select>
                        </div>

                        <div class="col-lg-3 align-self-end">
                            <button type="button" class="btn btn-primary">Search</button>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-12 d-flex justify-content-end">
                            <button type="button" class="btn btn-success">Download Report to Excel</button>
                        </div>
                    </div>
                    <div style="text-align: right;">
                        <h6>Amount in IDR</h6>
                    </div>
                    <table class="table" id="nonEditableTable">
                        <thead>
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Kode WHSloc</th>
                                <th scope="col">Part Number</th>
                                <th scope="col">Material Name</th>
                                <th scope="col">Last Movement</th>
                                <th scope="col">Qty Ending Inventory</th>
                                <th scope="col">Inventory Amount</th>
                                <th scope="col">< 6 Bulan</th>
                                <th scope="col">6-12 Bulan</th>
                                <th scope="col">> 12 Bulan</th>
                            </tr>
                        </thead>
                        <tbody id="nonEditableTableBody">
                            <!-- Non-editable data will be dynamically added here -->
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const detailsData = [
                {
                    affco: "Akashi",
                    no: 1,
                    kode: "WH001",
                    partNumber: "PN001",
                    materialName: "Material A",
                    description: "Raw Material",
                    lastMovement: "2024-05-01",
                    qtyEnding: 100,
                    amount: 7500000,
                    agingLess6: 60,
                    aging6to12: 30,
                    agingMore12: 10
                },
                {
                    affco: "Akashi",
                    no: 2,
                    kode: "WH002",
                    partNumber: "PN002",
                    materialName: "Material B",
                    description: "Raw Material",
                    lastMovement: "2024-04-10",
                    qtyEnding: 160,
                    amount: 12000000,
                    agingLess6: 100,
                    aging6to12: 40,
                    agingMore12: 20
                },
                {
                    affco: "Akashi",
                    no: 3,
                    kode: "WH003",
                    partNumber: "PN003",
                    materialName: "Material C",
                    description: "Work In Progress",
                    lastMovement: "2024-06-01",
                    qtyEnding: 50,
                    amount: 11250000,
                    agingLess6: 20,
                    aging6to12: 20,
                    agingMore12: 10
                },
                {
                    affco: "Akebono",
                    no: 4,
                    kode: "WH004",
                    partNumber: "PN004",
                    materialName: "Material D",
                    description: "Work In Progress",
                    lastMovement: "2024-05-15",
                    qtyEnding: 80,
                    amount: 18000000,
                    agingLess6: 30,
                    aging6to12: 30,
                    agingMore12: 20
                },
                {
                    affco: "Akebono",
                    no: 5,
                    kode: "WH005",
                    partNumber: "PN005",
                    materialName: "Material E",
                    description: "Finished Goods",
                    lastMovement: "2024-05-20",
                    qtyEnding: 200,
                    amount: 60000000,
                    agingLess6: 100,
                    aging6to12: 70,
                    agingMore12: 30
                },
                {
                    affco: "Akebono",
                    no: 6,
                    kode: "WH006",
                    partNumber: "PN006",
                    materialName: "Material F",
                    description: "Finished Goods",
                    lastMovement: "2024-04-25",
                    qtyEnding: 150,
                    amount: 45000000,
                    agingLess6: 80,
                    aging6to12: 50,
                    agingMore12: 20
                },
                {
                    affco: "Aisin",
                    no: 7,
                    kode: "WH007",
                    partNumber: "PN007",
                    materialName: "Material G",
                    description: "Spareparts",
                    lastMovement: "2024-05-10",
                    qtyEnding: 75,
                    amount: 22500000,
                    agingLess6: 40,
                    aging6to12: 25,
                    agingMore12: 10
                },
                {
                    affco: "Aisin",
                    no: 8,
                    kode: "WH008",
                    partNumber: "PN008",
                    materialName: "Material H",
                    description: "Spareparts",
                    lastMovement: "2024-04-15",
                    qtyEnding: 100,
                    amount: 30000000,
                    agingLess6: 50,
                    aging6to12: 30,
                    agingMore12: 20
                },
                {
                    affco: "Aisin",
                    no: 9,
                    kode: "WH009",
                    partNumber: "PN009",
                    materialName: "Material I",
                    description: "Consumable",
                    lastMovement: "2024-05-20",
                    qtyEnding: 150,
                    amount: 45000000,
                    agingLess6: 80,
                    aging6to12: 50,
                    agingMore12: 20
                },
                {
                    affco: "Aisin",
                    no: 10,
                    kode: "WH010",
                    partNumber: "PN010",
                    materialName: "Material J",
                    description: "Consumable",
                    lastMovement: "2024-04-30",
                    qtyEnding: 175,
                    amount: 52500000,
                    agingLess6: 90,
                    aging6to12: 60,
                    agingMore12: 25
                }
            ];

            const nonEditableTableBody = document.getElementById('nonEditableTableBody');

            // Populate non-editable table with details data
            detailsData.forEach(entry => addNonEditableRowToTable(entry));

            function addNonEditableRowToTable(entry) {
                const newRow = document.createElement('tr');
                newRow.setAttribute('data-affco', entry.affco);
                newRow.innerHTML = `
                    <td>${entry.no}</td>
                    <td>${entry.kode}</td>
                    <td>${entry.partNumber}</td>
                    <td>${entry.materialName}</td>
                    <td>${entry.lastMovement}</td>
                    <td>${entry.qtyEnding}</td>
                    <td>${entry.amount.toLocaleString('id-ID')}</td>
                    <td>${entry.agingLess6}</td>
                    <td>${entry.aging6to12}</td>
                    <td>${entry.agingMore12}</td>
                `;
                nonEditableTableBody.appendChild(newRow);
            }

            // Filter table based on selected Affco
            document.getElementById('filterAffco').addEventListener('change', filterTable);
            document.getElementById('filterPeriod').addEventListener('change', filterTable);

            function filterTable() {
                const selectedAffco = document.getElementById('filterAffco').value;
                const selectedPeriod = document.getElementById('filterPeriod').value;

                const rows = document.querySelectorAll('#nonEditableTableBody tr');
                rows.forEach(row => {
                    const affco = row.getAttribute('data-affco');

                    const affcoMatch = (selectedAffco === 'All' || affco === selectedAffco);
                    const periodMatch = (selectedPeriod === 'All' || row.getAttribute('data-period') === selectedPeriod);

                    if (affcoMatch && periodMatch) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }
        });
    </script>

</asp:Content>


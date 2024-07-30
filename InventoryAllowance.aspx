<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="InventoryAllowance.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Inventory Allowance</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Inventory</li>
                    <li class="breadcrumb-item active">Inventory Allowance</li>
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
                    <h4>Summary Table</h4>
                    <table id="summaryTable" class="table table-striped table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>Inventory Description</th>
                                <th>Inventory Amount</th>
                                <th>Fast Moving (&lt; 6 Bulan)</th>
                                <th>Slow Moving (6-12 Bulan)</th>
                                <th>Deadstock (&gt; 1 Tahun)</th>
                                <th>Allowance Slow Moving</th>
                                <th>Allowance Deadstock</th>
                                <th>Total Allowance Inventory</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Summary data will be populated here by JavaScript -->
                        </tbody>
                    </table>

                    <h4>Details Table</h4>
                    <table id="detailsTable" class="table table-striped table-bordered mt-2">
                        <thead class="thead-dark">
                            <tr>
                                <th>No.</th>
                                <th>Kode WHSloc</th>
                                <th>Part Number</th>
                                <th>Material Name</th>
                                <th>Inventory Description</th>
                                <th>Last Movement</th>
                                <th>Qty Ending Inventory</th>
                                <th>Inventory Amount</th>
                                <th>Aging &lt; 6 Bulan</th>
                                <th>Aging 6-12 Bulan</th>
                                <th>Aging &gt; 12 Bulan</th>
                                <th>% Allowance &lt; 6 Bulan</th>
                                <th>% Allowance 6-12 Bulan</th>
                                <th>% Allowance &gt; 12 Bulan</th>
                                <th>Amount Allowance &lt; 6 Bulan</th>
                                <th>Amount Allowance 6-12 Bulan</th>
                                <th>Amount Allowance &gt; 12 Bulan</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Detail data will be populated here by JavaScript -->
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </main>

    <script>
        $(document).ready(function () {
            const detailsData = [
                {
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
                    agingMore12: 10,
                    percentAllowLess6: "1%",
                    percentAllow6to12: "2%",
                    percentAllowMore12: "3%",
                    amountAllowLess6: 45000,
                    amountAllow6to12: 45000,
                    amountAllowMore12: 22500
                },
                {
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
                    agingMore12: 20,
                    percentAllowLess6: "1%",
                    percentAllow6to12: "2%",
                    percentAllowMore12: "3%",
                    amountAllowLess6: 120000,
                    amountAllow6to12: 120000,
                    amountAllowMore12: 72000
                },
                {
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
                    agingMore12: 10,
                    percentAllowLess6: "1%",
                    percentAllow6to12: "2%",
                    percentAllowMore12: "3%",
                    amountAllowLess6: 45000,
                    amountAllow6to12: 90000,
                    amountAllowMore12: 67500
                },
                {
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
                    agingMore12: 20,
                    percentAllowLess6: "1%",
                    percentAllow6to12: "2%",
                    percentAllowMore12: "3%",
                    amountAllowLess6: 90000,
                    amountAllow6to12: 180000,
                    amountAllowMore12: 108000
                },
                {
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
                    agingMore12: 30,
                    percentAllowLess6: "1%",
                    percentAllow6to12: "2%",
                    percentAllowMore12: "3%",
                    amountAllowLess6: 600000,
                    amountAllow6to12: 1200000,
                    amountAllowMore12: 540000
                },
                {
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
                    agingMore12: 20,
                    percentAllowLess6: "1%",
                    percentAllow6to12: "2%",
                    percentAllowMore12: "3%",
                    amountAllowLess6: 450000,
                    amountAllow6to12: 900000,
                    amountAllowMore12: 270000
                },
                {
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
                    agingMore12: 10,
                    percentAllowLess6: "1%",
                    percentAllow6to12: "2%",
                    percentAllowMore12: "3%",
                    amountAllowLess6: 225000,
                    amountAllow6to12: 450000,
                    amountAllowMore12: 202500
                },
                {
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
                    agingMore12: 20,
                    percentAllowLess6: "1%",
                    percentAllow6to12: "2%",
                    percentAllowMore12: "3%",
                    amountAllowLess6: 300000,
                    amountAllow6to12: 600000,
                    amountAllowMore12: 270000
                },
                {
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
                    agingMore12: 20,
                    percentAllowLess6: "1%",
                    percentAllow6to12: "2%",
                    percentAllowMore12: "3%",
                    amountAllowLess6: 450000,
                    amountAllow6to12: 900000,
                    amountAllowMore12: 270000
                },
                {
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
                    agingMore12: 25,
                    percentAllowLess6: "1%",
                    percentAllow6to12: "2%",
                    percentAllowMore12: "3%",
                    amountAllowLess6: 525000,
                    amountAllow6to12: 1050000,
                    amountAllowMore12: 393750
                }
            ];

            function calculateSummary(data) {
                const summary = {
                    'Raw Material': {
                        inventoryAmount: 0,
                        fastMoving: 0,
                        slowMoving: 0,
                        deadstock: 0,
                        allowanceSlowMoving: 0,
                        allowanceDeadstock: 0,
                        totalAllowanceInventory: 0
                    },
                    'Work In Progress': {
                        inventoryAmount: 0,
                        fastMoving: 0,
                        slowMoving: 0,
                        deadstock: 0,
                        allowanceSlowMoving: 0,
                        allowanceDeadstock: 0,
                        totalAllowanceInventory: 0
                    },
                    'Finished Goods': {
                        inventoryAmount: 0,
                        fastMoving: 0,
                        slowMoving: 0,
                        deadstock: 0,
                        allowanceSlowMoving: 0,
                        allowanceDeadstock: 0,
                        totalAllowanceInventory: 0
                    },
                    'Spareparts': {
                        inventoryAmount: 0,
                        fastMoving: 0,
                        slowMoving: 0,
                        deadstock: 0,
                        allowanceSlowMoving: 0,
                        allowanceDeadstock: 0,
                        totalAllowanceInventory: 0
                    },
                    'Consumable': {
                        inventoryAmount: 0,
                        fastMoving: 0,
                        slowMoving: 0,
                        deadstock: 0,
                        allowanceSlowMoving: 0,
                        allowanceDeadstock: 0,
                        totalAllowanceInventory: 0
                    }
                };

                data.forEach(item => {
                    const desc = item.description;
                    summary[desc].inventoryAmount += item.amount;
                    summary[desc].fastMoving += item.agingLess6;
                    summary[desc].slowMoving += item.aging6to12;
                    summary[desc].deadstock += item.agingMore12;
                    summary[desc].allowanceSlowMoving += item.amountAllow6to12;
                    summary[desc].allowanceDeadstock += item.amountAllowMore12;
                    summary[desc].totalAllowanceInventory += item.amountAllowLess6 + item.amountAllow6to12 + item.amountAllowMore12;
                });

                return summary;
            }

            function populateSummaryTable(summary) {
                const tableBody = document.querySelector('#summaryTable tbody');
                Object.keys(summary).forEach(desc => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${desc}</td>
                        <td>${summary[desc].inventoryAmount.toLocaleString('id-ID')}</td>
                        <td>${summary[desc].fastMoving.toLocaleString('id-ID')}</td>
                        <td>${summary[desc].slowMoving.toLocaleString('id-ID')}</td>
                        <td>${summary[desc].deadstock.toLocaleString('id-ID')}</td>
                        <td>${summary[desc].allowanceSlowMoving.toLocaleString('id-ID')}</td>
                        <td>${summary[desc].allowanceDeadstock.toLocaleString('id-ID')}</td>
                        <td>${summary[desc].totalAllowanceInventory.toLocaleString('id-ID')}</td>
                    `;
                    tableBody.appendChild(row);
                });
            }

            const summary = calculateSummary(detailsData);
            populateSummaryTable(summary);

            detailsData.forEach(item => {
                $('#detailsTable tbody').append(`
                    <tr>
                        <td>${item.no}</td>
                        <td>${item.kode}</td>
                        <td>${item.partNumber}</td>
                        <td>${item.materialName}</td>
                        <td>${item.description}</td>
                        <td>${item.lastMovement}</td>
                        <td>${item.qtyEnding}</td>
                        <td>${item.amount.toLocaleString('id-ID')}</td>
                        <td>${item.agingLess6}</td>
                        <td>${item.aging6to12}</td>
                        <td>${item.agingMore12}</td>
                        <td>${item.percentAllowLess6}</td>
                        <td>${item.percentAllow6to12}</td>
                        <td>${item.percentAllowMore12}</td>
                        <td>${item.amountAllowLess6.toLocaleString('id-ID')}</td>
                        <td>${item.amountAllow6to12.toLocaleString('id-ID')}</td>
                        <td>${item.amountAllowMore12.toLocaleString('id-ID')}</td>
                    </tr>
                `);
            });

        });
    </script>

</asp:Content>


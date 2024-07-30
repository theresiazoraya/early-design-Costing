<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Rollforward.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            text-align: center;
            padding: 8px;
        }

        th {
            background-color: lightgrey;
            color: black;
        }

            th.qty-movement {
                background-color: #b35900;
            }

            th.amount-movement {
                background-color: #007399;
            }

        td {
            border: 1px solid #ddd;
        }
    </style>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Rollforward/Rollback</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Inventory</li>
                    <li class="breadcrumb-item active">Rollforward/Rollback</li>
                </ol>
            </nav>
        </div>
        <section class="section">
            <div class="tables-wrapper">
                <form id="nonEditableForm">
                    <div class="row mb-3">
                        <%--<div class="col-lg-3">
                            <label for="filterAffco" class="form-label">Nama Affco</label>
                            <select class="form-select" id="filterAffco">
                                <option value="All">All</option>
                                <option value="Aisin">Aisin</option>
                                <option value="Akashi">Akashi</option>
                                <option value="Akebono">Akebono</option>
                            </select>
                        </div>--%>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filterPeriod" class="form-label">Periode</label>
                            <select class="form-select" id="filterPeriod">
                                <option value="midyear">Mid-Year</option>
                                <option value="endyear">End Year</option>
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
                        <div class="col-lg-3 align-self-end">
                            <button type="button" class="btn btn-primary">Search</button>
                        </div>
                    </div>
                     <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="Excelfile">Choose Excel File</label>
                            <input type="file" id="ExcelFile" class="form-control-file" accept="application/xlsx">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <button type="submit" class="btn btn-primary">Upload</button>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-12 d-flex justify-content-end">
                            <button type="button" class="btn btn-success">Download Report to Excel</button>
                        </div>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th rowspan="2">No.</th>
                                <th rowspan="2">Part Number</th>
                                <th rowspan="2">Material Name</th>
                                <th rowspan="2">Qty Book</th>
                                <th rowspan="2">Qty Fisik</th>
                                <th rowspan="2">Qty Selisih STO</th>
                                <th colspan="8" class="qty-movement">Qty Movement</th>
                                <th rowspan="2">Qty Total Movement (RollFwd)</th>
                                <th rowspan="2">Ending Qty</th>
                                <th rowspan="2">Price Std</th>
                                <th rowspan="2">Price Actual</th>
                                <th rowspan="2" class="amount-movement">Amount Total Movement (RollFwd)</th>
                                <th rowspan="2" class="amount-movement">Amount Ending Inventory</th>
                                <th rowspan="2" class="amount-movement">Amount Price Variance</th>
                            </tr>
                            <tr>
                                <th class="qty-movement">In 1</th>
                                <th class="qty-movement">In 2</th>
                                <th class="qty-movement">In 3</th>
                                <th class="qty-movement">In 4</th>
                                <th class="qty-movement">Out 1</th>
                                <th class="qty-movement">Out 2</th>
                                <th class="qty-movement">Out 3</th>
                                <th class="qty-movement">Out 4</th>
                            </tr>
                        </thead>
                      <%--  <tbody id="nonEditableTableBody">
                            <!-- Data will be populated here by JavaScript -->
                        </tbody>--%>
                    </table>
                </form>
            </div>
        </section>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const detailsData = [
                {
                    no: 1,
                    partNumber: "PN001",
                    materialName: "Material A",
                    qtyBook: 100,
                    qtyFisik: 95,
                    qtySelisihSTO: -5,
                    qtyMovement: [20, 15, 10, 5, 10, 8, 7, 5],
                    qtyTotalMovementRollFwd: 40,
                    endingQty: 95,
                    priceStd: 100,
                    priceActual: 105,
                    amountTotalMovementRollFwd: 4200,
                    amountEndingInventory: 9975,
                    amountPriceVariance: 475
                },
                {
                    no: 2,
                    partNumber: "PN002",
                    materialName: "Material B",
                    qtyBook: 200,
                    qtyFisik: 210,
                    qtySelisihSTO: 10,
                    qtyMovement: [30, 20, 15, 10, 20, 10, 5, 10],
                    qtyTotalMovementRollFwd: 80,
                    endingQty: 210,
                    priceStd: 150,
                    priceActual: 160,
                    amountTotalMovementRollFwd: 12000,
                    amountEndingInventory: 33600,
                    amountPriceVariance: 2100
                },
                {
                    no: 3,
                    partNumber: "PN003",
                    materialName: "Material C",
                    qtyBook: 150,
                    qtyFisik: 140,
                    qtySelisihSTO: -10,
                    qtyMovement: [25, 20, 15, 10, 15, 10, 5, 5],
                    qtyTotalMovementRollFwd: 40,
                    endingQty: 140,
                    priceStd: 200,
                    priceActual: 210,
                    amountTotalMovementRollFwd: 8400,
                    amountEndingInventory: 29400,
                    amountPriceVariance: 1400
                },
                {
                    no: 4,
                    partNumber: "PN004",
                    materialName: "Material D",
                    qtyBook: 180,
                    qtyFisik: 175,
                    qtySelisihSTO: -5,
                    qtyMovement: [20, 30, 25, 15, 15, 10, 10, 5],
                    qtyTotalMovementRollFwd: 80,
                    endingQty: 175,
                    priceStd: 220,
                    priceActual: 230,
                    amountTotalMovementRollFwd: 17600,
                    amountEndingInventory: 40250,
                    amountPriceVariance: 2750
                },
                {
                    no: 5,
                    partNumber: "PN005",
                    materialName: "Material E",
                    qtyBook: 90,
                    qtyFisik: 85,
                    qtySelisihSTO: -5,
                    qtyMovement: [15, 10, 5, 5, 10, 5, 5, 5],
                    qtyTotalMovementRollFwd: 10,
                    endingQty: 85,
                    priceStd: 250,
                    priceActual: 260,
                    amountTotalMovementRollFwd: 2500,
                    amountEndingInventory: 22100,
                    amountPriceVariance: 850
                }
            ];

            const tableBody = document.getElementById('nonEditableTableBody');

            detailsData.forEach(entry => {
                const newRow = document.createElement('tr');
                newRow.innerHTML = `
                    <td>${entry.no}</td>
                    <td>${entry.partNumber}</td>
                    <td>${entry.materialName}</td>
                    <td>${entry.qtyBook}</td>
                    <td>${entry.qtyFisik}</td>
                    <td>${entry.qtySelisihSTO}</td>
                    ${entry.qtyMovement.map(qty => `<td>${qty}</td>`).join('')}
                    <td>${entry.qtyTotalMovementRollFwd}</td>
                    <td>${entry.endingQty}</td>
                    <td>${entry.priceStd}</td>
                    <td>${entry.priceActual}</td>
                    <td>${entry.amountTotalMovementRollFwd}</td>
                    <td>${entry.amountEndingInventory}</td>
                    <td>${entry.amountPriceVariance}</td>
                `;
                tableBody.appendChild(newRow);
            });
        });
    </script>

</asp:Content>

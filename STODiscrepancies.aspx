<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="STODiscrepancies.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

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
            background-color: #f2f2f2;
            color: white;
        }

        td {
            border: 1px solid #ddd;
        }
    </style>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>STO Discrepancies</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Inventory</li>
                    <li class="breadcrumb-item active">STO Discrepancies</li>
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
                        <div class="col-lg-12 d-flex justify-content-end">
                            <button type="button" class="btn btn-success">Download Report to Excel</button>
                        </div>
                    </div>

                    <div style="text-align: right;">
                        <h6>Amount in IDR</h6>
                    </div>

                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Company Code</th>
                                <th>Company Name</th>
                                <th class="ownership">Ownership</th>
                                <th class="sto-date">STO Date</th>
                                <th class="balance-book">Balance Book</th>
                                <th class="physical">Physical</th>
                                <th class="net-diff">Net Diff</th>
                                <th class="percent-net">% Net</th>
                                <th class="absolute-diff">Absolute Diff</th>
                                <th class="percent-abs">% Abs</th>
                            </tr>
                        </thead>
                        <tbody id="beritaAcaraTableBody">
                            <!-- Data will be populated here by JavaScript -->
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const beritaAcaraData = [
                {
                    companyCode: "C001",
                    companyName: "Akashi",
                    ownership: "subs",
                    stoDate: "2022-12-31",
                    balanceBook: 100000000,
                    physical: 95000000,
                    netDiff: -5000000,
                    percentNet: -5,
                    absoluteDiff: 5000000,
                    percentAbs: 5
                },
                {
                    companyCode: "C002",
                    companyName: "Aisin",
                    ownership: "subs",
                    stoDate: "2022-12-31",
                    balanceBook: 200000000,
                    physical: 210000000,
                    netDiff: 10000000,
                    percentNet: 5,
                    absoluteDiff: 10000000,
                    percentAbs: 5
                },
                {
                    companyCode: "C003",
                    companyName: "Akebono",
                    ownership: "subs",
                    stoDate: "2022-12-31",
                    balanceBook: 150000000,
                    physical: 145000000,
                    netDiff: -5000000,
                    percentNet: -3.33,
                    absoluteDiff: 5000000,
                    percentAbs: 3.33
                },

            ];

            const tableBody = document.getElementById('beritaAcaraTableBody');

            function populateTable(data) {
                tableBody.innerHTML = '';
                data.forEach(entry => {
                    const newRow = document.createElement('tr');
                    newRow.innerHTML = `
                        <td>${entry.companyCode}</td>
                        <td>${entry.companyName}</td>
                        <td>${entry.ownership}</td>
                        <td>${entry.stoDate}</td>
                        <td>${entry.balanceBook.toLocaleString('id-ID')}</td>
                        <td>${entry.physical.toLocaleString('id-ID')}</td>
                        <td>${entry.netDiff.toLocaleString('id-ID')}</td>
                        <td>${entry.percentNet}%</td>
                        <td>${entry.absoluteDiff.toLocaleString('id-ID')}</td>
                        <td>${entry.percentAbs}%</td>
                    `;
                    tableBody.appendChild(newRow);
                });
            }

            document.getElementById('filterAffco').addEventListener('change', function () {
                const selectedAffco = this.value;
                const filteredData = selectedAffco === 'All' ? beritaAcaraData : beritaAcaraData.filter(entry => entry.companyName === selectedAffco);
                populateTable(filteredData);
            });

            // Initial population of the table
            populateTable(beritaAcaraData);
        });
    </script>

</asp:Content>

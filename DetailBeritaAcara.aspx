<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="DetailBeritaAcara.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Detail Berita Acara</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Inventory</li>
                    <li class="breadcrumb-item active">Detail Berita acara</li>
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
                   <%-- <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="Excelfile">Choose Excel File</label>
                            <input type="file" id="ExcelFile" class="form-control-file" accept="application/xlsx">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <button type="submit" class="btn btn-primary">Upload</button>
                        </div>
                    </div>--%>
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
                                <th scope="col">Part Number</th>
                                <th scope="col">Material Name</th>
                                <th scope="col">Qty Book</th>
                                <th scope="col">Qty Fisik</th>
                                <th scope="col">Qty Selisih STO</th>
                                <th scope="col">Price</th>
                                <th scope="col">Amount Book</th>
                                <th scope="col">Amount Fisik</th>
                                <th scope="col">Selisih STO Net (Amount)</th>
                                <th scope="col">Selisih STO Abs (Amount)</th>
                                <th scope="col">Selisih STO Net (%)</th>
                                <th scope="col">Selisih STO Abs (%)</th>
                            </tr>
                        </thead>
                         <tbody id="nonEditableTableBody">
                            
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const nonEditableDummyData = [
                { no: 1, partNumber: "PN001", materialName: "Material A", qtyBook: 100, qtyFisik: 98, qtySelisihSTO: -2, price: 1000, amountBook: 100000, amountFisik: 98000, selisihSTONet: -2000, selisihSTOAbs: 2000, selisihSTONetPercent: -2, selisihSTOAbsPercent: -2 },
                { no: 2, partNumber: "PN002", materialName: "Material B", qtyBook: 200, qtyFisik: 198, qtySelisihSTO: -2, price: 2000, amountBook: 400000, amountFisik: 396000, selisihSTONet: -4000, selisihSTOAbs: 4000, selisihSTONetPercent: -1, selisihSTOAbsPercent: -2 }
            ];

            const nonEditableTableBody = document.getElementById('nonEditableTableBody');

            // Populate non-editable table with dummy data
            nonEditableDummyData.forEach(entry => addNonEditableRowToTable(entry));

            function addNonEditableRowToTable(entry) {
                const newRow = document.createElement('tr');
                newRow.innerHTML = `
                    <td>${entry.no}</td>
                    <td>${entry.partNumber}</td>
                    <td>${entry.materialName}</td>
                    <td>${entry.qtyBook}</td>
                    <td>${entry.qtyFisik}</td>
                    <td>${entry.qtySelisihSTO}</td>
                    <td>${entry.price}</td>
                    <td>${entry.amountBook}</td>
                    <td>${entry.amountFisik}</td>
                    <td>${entry.selisihSTONet}</td>
                    <td>${entry.selisihSTOAbs}</td>
                    <td>${entry.selisihSTONetPercent}</td>
                    <td>${entry.selisihSTOAbsPercent}</td>
                `;
                nonEditableTableBody.appendChild(newRow);
            }
        });
    </script>

</asp:Content>

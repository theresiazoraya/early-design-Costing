<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="RekonSTOController.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        .form-table {
            width: 100%;
            border-collapse: collapse;
        }

            .form-table th, .form-table td {
                text-align: center;
                padding: 8px;
                border: 1px solid #ddd;
            }

        #dataTable th {
            text-align: center;
            vertical-align: middle;
            background-color: #f2f2f2;
        }

        .form-table td.blue-field {
            background-color: #cce5ff;
        }

        .form-table td.green-field {
            background-color: #d4edda;
        }

       #newTextbox {
            width: 100%;
            height: 100px;
            padding: 10px;
            font-size: 18px;
            box-sizing: border-box; 
            border-radius: 10px;
            border: 1px solid #ccc; 
        }
    </style>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Rekonsiliasi STO</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Inventory</li>
                    <li class="breadcrumb-item active">Rekonsiliasi STO</li>
                </ol>
            </nav>
        </div>
        <section class="section">
            <div class="tables-wrapper">
                <form id="editableForm">
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filterAffco" class="form-label">Nama Affco</label>
                            <select class="form-select" id="filterAffco">
                                <option value="Aisin">Aisin</option>
                                <option value="Akashi">Akashi</option>
                                <option value="Akebono">Akebono</option>
                            </select>
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
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Description</th>
                                    <th>Tanggal</th>
                                    <th>Nilai</th>
                                    <th>%</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="background-color: lightsteelblue">Cut off Stock Take 
                                    </td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="14/12/2023" class="form-control blue-field" style="width: 250px" disabled>
                                    </td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="99,379,042,087" class="form-control blue-field" style="width: 250px" disabled>
                                    </td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" class="form-control" style="width: 250px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: lightsteelblue">Others Sloc
                                    </td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="" class="form-control" style="width: 250px">
                                    </td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="-2,292,053,060" class="form-control blue-field" style="width: 250px" disabled>
                                    </td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" class="form-control" style="width: 250px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: lightsteelblue">Berita Acara Stock take (Book)
                                    </td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="" class="form-control" style="width: 250px"></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="96,456,989,027" class="form-control blue-field" style="width: 250px" disabled></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>Pergerakan Berita Acara vs Cut Off</td>
                                    <td>
                                        <input type="text" value="" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td style="background-color: lightsteelblue">Nilai Fisik Inventory per STO Desember 2023</td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="14/12/2023" class="form-control blue-field" style="width: 250px" disabled></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="96,324,633,407" class="form-control blue-field" style="width: 250px" disabled></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="-0.14%" class="form-control blue-field" style="width: 250px" disabled></td>
                                </tr>
                                <tr>
                                    <td style="background-color: lightsteelblue">Selisih Stock take Fisik (Net) **</td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="" class="form-control" style="width: 250px"></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="-132,355,620" class="form-control blue-field" style="width: 250px" disabled></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="0.00%" class="form-control blue-field" style="width: 250px" disabled></td>
                                </tr>
                                <tr>
                                    <td>Absolute Variance **</td>
                                    <td>
                                        <input type="text" value="" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="0" class="form-control blue-field" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="0.00%" class="form-control blue-field" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>Absolute Variance per Part Number**</td>
                                    <td>
                                        <input type="text" value="" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="0" class="form-control blue-field" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="0.00%" class="form-control blue-field" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td style="background-color: lightgreen">Pergerakan s/d 31 Desember 2023
                                    </td>
                                    <td style="background-color: lightgreen">
                                        <input type="text" value="31/12/2023" class="form-control green-field" style="width: 250px" disabled>
                                    </td>
                                    <td style="background-color: lightgreen">
                                        <input type="text" value="" class="form-control green-field" style="width: 250px" disabled>
                                    </td>
                                    <td style="background-color: lightgreen">
                                        <input type="text" value="" class="form-control green-field" style="width: 250px" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    Rollforward/Rollback (transaksi setelah STO) *
                                <td>
                                    <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="834,093,390" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="0.63%" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Selisih Rollforward (Ending qty Rollforward tidak sama dengan TB)</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Pergerakan Nilai buku awal setelah berita acara *</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Bukan Inventory Afco (kesalahan Administrasi) *</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Inventory Cost Variance *</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Price Variance</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Inventory tidak ter STO *</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Inventory yang belum teridentifikasi *</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Good In Transit</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Consumables - BA terpisah</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="31,568,567,388" class="form-control blue-field" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="23.84%" class="form-control blue-field" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Consumables - Write off</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Others Sloc</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Critical Sparepart</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>Jurnal Manual</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="2,529,990,015" class="form-control blue-field" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                    <td>
                                        <input type="text" value="1.91%" class="form-control blue-field" style="width: 250px; background-color: lightgoldenrodyellow"></td>
                                </tr>
                                <tr>
                                    <td>Jurnal Audit</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="2,922,053,060" class="form-control blue-field" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>Jurnal Adjustment WIP</td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" value="-392,063,045" class="form-control blue-field" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td>
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td style="background-color: lightsteelblue">Inventory Gross</td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="132,401,342,622" class="form-control blue-field" style="width: 250px" disabled></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                                <tr>
                                    <td style="background-color: lightsteelblue">Inventory Allowance *</td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="-3,292,784,146" class="form-control blue-field" style="width: 250px" disabled></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="-2.49%" class="form-control blue-field" style="width: 250px" disabled></td>
                                </tr>
                                <tr>
                                    <td style="background-color: lightsteelblue">Nilai Inventory per 31 Desember 2023 (ASPACK)</td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" value="129,108,558,476" class="form-control blue-field" style="width: 250px" disabled></td>
                                    <td style="background-color: lightsteelblue">
                                        <input type="text" class="form-control" style="width: 250px"></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="text-center mt-4">
                            <button type="button" class="btn btn-danger" id="reviseButton">Revise</button>
                        </div>
                        <div class="mt-4" id="textboxContainer"></div>
                </form>
            </div>
        </section>
    </main>

    <script>
        document.getElementById("reviseButton").addEventListener("click", function () {
            var textboxContainer = document.getElementById("textboxContainer");
            textboxContainer.innerHTML = '<input type="text" id="newTextbox" placeholder="Write your remark here">';
        });

        document.addEventListener("DOMContentLoaded", function () {
            const editableDummyData = [
                { description: "Cut off Stock Take", tanggal: "14/12/2023", nilai: 99379042087, percent: 0 },
                { description: "Others Sloc", tanggal: "14/12/2023", nilai: -2922953060, percent: 0 },
                { description: "Berita Acara Stock Take (Book)", tanggal: "14/12/2023", nilai: 96456983027, percent: 0 },
                { description: "Nilai Fisik Inventory per STO Desember 2023", tanggal: "14/12/2023", nilai: 96324633407, percent: -0.14 }
            ];

            const editableTableBody = document.getElementById('editableTableBody');

            // Populate editable table with dummy data
            editableDummyData.forEach(entry => addEditableRowToTable(entry));

            function addEditableRowToTable(entry) {
                const newRow = document.createElement('tr');
                newRow.innerHTML = `
                    <td contenteditable="true">${entry.description}</td>
                    <td contenteditable="true">${entry.tanggal}</td>
                    <td contenteditable="true">${entry.nilai}</td>
                    <td contenteditable="true">${entry.percent}</td>
                `;
                editableTableBody.appendChild(newRow);
            }

            $('#editableTable').on('input', 'td', function () {
                const row = $(this).closest('tr');
                const cells = row.find('td');
                const amountBook = parseFloat(cells.eq(2).text());
                const selisihSTONetAmount = parseFloat(cells.eq(3).text());

                if (amountBook !== editableDummyData[2].nilai || selisihSTONetAmount !== editableDummyData[3].nilai) {
                    row.css('background-color', 'red');
                } else {
                    row.css('background-color', '');
                }
            });


        });
    </script>

</asp:Content>

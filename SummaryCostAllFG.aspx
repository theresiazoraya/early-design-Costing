<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="SummaryCostAllFG.aspx.cs" Inherits="PrototypePortalCosting.SummaryCostAllFG" %>

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
            <h1>Summary Cost All FG </h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Cost By Prod</li>
                    <li class="breadcrumb-item active">Summary Cost All FG </li>
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
                            <label for="filterTahun" class="form-label">Tahun</label>
                            <select class="form-select" id="filterTahun">
                                <option value="All">All</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filterVersion" class="form-label">Version</label>
                            <select class="form-select" id="filterVersion">
                                <option value="Standard">Standard</option>
                                <option value="Actual">Actual</option>
                                <option value="Reperform">Reperform</option>
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
                                <th rowspan="2">No.</th>
                                <th rowspan="2">Part Number</th>
                                <th rowspan="2">Material Name</th>
                                <th rowspan="2">Material Cost</th>
                                <th rowspan="2">Process Cost</th>
                                <th rowspan="2">Total Cost</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>PN12345</td>
                                <td>Material A</td>
                                <td>Rp1.200.000</td>
                                <td>Rp800.000</td>
                                <td>Rp2.000.000</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>PN67890</td>
                                <td>Material B</td>
                                <td>Rp1.800.000</td>
                                <td>Rp1.200.000</td>
                                <td>Rp3.000.000</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>PN54321</td>
                                <td>Material C</td>
                                <td>Rp2.000.000</td>
                                <td>Rp1.500.000</td>
                                <td>Rp3.500.000</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>PN98765</td>
                                <td>Material D</td>
                                <td>Rp2.500.000</td>
                                <td>Rp2.000.000</td>
                                <td>Rp4.500.000</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>PN13579</td>
                                <td>Material E</td>
                                <td>Rp3.000.000</td>
                                <td>Rp2.500.000</td>
                                <td>Rp5.500.000</td>
                            </tr>
                        </tbody>
                    </table>

                </form>
            </div>
        </section>
    </main>


</asp:Content>

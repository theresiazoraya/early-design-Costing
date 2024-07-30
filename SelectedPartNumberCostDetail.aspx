<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="SelectedPartNumberCostDetail.aspx.cs" Inherits="PrototypePortalCosting.SelectedPartNumberCostDetail" %>

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

            th.Routing {
                width: 100%;
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
            <h1>Selected Part Number Cost Detail</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Cost By Prod</li>
                    <li class="breadcrumb-item active">Selected Part Number Cost Detail</li>
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
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filterPeriod" class="form-label">PartNumber</label>
                            <select class="form-select">
                                <option value="All">PN12345</option>
                                <option value="januari">PN67890</option>
                                <option value="februari">PN54321</option>
                                <option value="februari">PN98765</option>
                                <option value="februari">PN13579</option>

                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filterPeriod" class="form-label">Level</label>
                            <select class="form-select">
                                <option value="januari">ALL</option>
                                <option value="januari">1</option>
                                <option value="februari">0</option>
                                <option value="maret">2</option>
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
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th rowspan="2">Level</th>
                                <th rowspan="2">Part Number</th>
                                <th rowspan="2">Material Name</th>
                                <th rowspan="2">Material Req</th>
                                <th rowspan="2">UOM</th>
                                <th rowspan="2">Material Cost (in IDR)</th>
                                <th colspan="2" class="Routing">Routing</th>
                                <th rowspan="2">Cycle Time(in Second)</th>
                                <th colspan="6" class="Cost">Cost</th>
                                <th rowspan="2">Process Cost(in IDR)</th>
                                <th rowspan="2">Product Cost(in IDR)</th>
                            </tr>
                            <tr>
                                <th class="Routing">Work Center</th>
                                <th class="Routing">Work Center Name</th>
                                <th class="Cost">LABOR</th>
                                <th class="Cost">MDEPR</th>
                                <th class="Cost">FOHFI</th>
                                <th class="Cost">FOHFD</th>
                                <th class="Cost">FOHVI</th>
                                <th class="Cost">FOHVD</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>0</td>
                                <td>PN12345</td>
                                <td>Material A</td>
                                <td>100</td>
                                <td>kg</td>
                                <td>Rp1.200.000</td>
                                <td>WC1</td>
                                <td>Center A</td>
                                <td>2 hours</td>
                                <td>Rp500.000</td>
                                <td>Rp300.000</td>
                                <td>Rp200.000</td>
                                <td>Rp150.000</td>
                                <td>Rp250.000</td>
                                <td>Rp100.000</td>
                                <td>Rp1.500.000</td>
                                <td>Rp2.700.000</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>PN67890</td>
                                <td>Material B</td>
                                <td>200</td>
                                <td>pcs</td>
                                <td>Rp1.800.000</td>
                                <td>WC2</td>
                                <td>Center B</td>
                                <td>3 hours</td>
                                <td>Rp700.000</td>
                                <td>Rp400.000</td>
                                <td>Rp300.000</td>
                                <td>Rp200.000</td>
                                <td>Rp350.000</td>
                                <td>Rp150.000</td>
                                <td>Rp2.100.000</td>
                                <td>Rp3.900.000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>PN54321</td>
                                <td>Material C</td>
                                <td>150</td>
                                <td>m</td>
                                <td>Rp2.000.000</td>
                                <td>WC3</td>
                                <td>Center C</td>
                                <td>4 hours</td>
                                <td>Rp600.000</td>
                                <td>Rp500.000</td>
                                <td>Rp400.000</td>
                                <td>Rp300.000</td>
                                <td>Rp450.000</td>
                                <td>Rp200.000</td>
                                <td>Rp2.450.000</td>
                                <td>Rp4.450.000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>PN98765</td>
                                <td>Material D</td>
                                <td>250</td>
                                <td>ltr</td>
                                <td>Rp2.500.000</td>
                                <td>WC4</td>
                                <td>Center D</td>
                                <td>5 hours</td>
                                <td>Rp800.000</td>
                                <td>Rp600.000</td>
                                <td>Rp500.000</td>
                                <td>Rp400.000</td>
                                <td>Rp550.000</td>
                                <td>Rp250.000</td>
                                <td>Rp3.100.000</td>
                                <td>Rp5.600.000</td>
                            </tr>
                            <tr>
                                <td>0</td>
                                <td>PN13579</td>
                                <td>Material E</td>
                                <td>300</td>
                                <td>pcs</td>
                                <td>Rp3.000.000</td>
                                <td>WC5</td>
                                <td>Center E</td>
                                <td>6 hours</td>
                                <td>Rp900.000</td>
                                <td>Rp700.000</td>
                                <td>Rp600.000</td>
                                <td>Rp500.000</td>
                                <td>Rp650.000</td>
                                <td>Rp300.000</td>
                                <td>Rp3.650.000</td>
                                <td>Rp6.650.000</td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </main>


</asp:Content>

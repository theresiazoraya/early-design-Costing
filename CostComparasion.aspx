<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="CostComparasion.aspx.cs" Inherits="PrototypePortalCosting.CostComparasion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        .table-container {
            display: flex;
            justify-content: space-between;
        }

        table {
            border-collapse: collapse;
            width: 45%; /* Adjust the width as necessary */
            margin: 10px;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
    </style>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Cost Comparison</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Cost By Prod</li>
                    <li class="breadcrumb-item active">Cost Comparison</li>
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
                            <label for="filterTahun" class="form-label">Tabel Kiri</label>
                            <select class="form-select" id="tabelkiri">
                                <option value="Standard">Standard</option>
                                <option value="Actual">Actual</option>
                                <option value="Reperform">Reperform</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filterTahun" class="form-label">Tabel kanan</label>
                            <select class="form-select" id="tabelkanan">
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
                                <th rowspan="3">Level</th>
                                <th rowspan="3">Part Number</th>
                                <th rowspan="3">Material Name</th>
                                <th colspan="3" class="STANDARD">STANDARD</th>
                                <th colspan="3" class="ACTUAL">ACTUAL</th>
                                <th colspan="6" class="VARIANCE">VARIANCE</th>
                            </tr>
                            <tr>
                                <th rowspan="2" class="STANDARD">Material Cost</th>
                                <th rowspan="2" class="STANDARD">Process Cost</th>
                                <th rowspan="2" class="STANDARD">Total Cost</th>
                                <th rowspan="2" class="ACTUAL">Material Cost</th>
                                <th rowspan="2" class="ACTUAL">Process Cost</th>
                                <th rowspan="2" class="ACTUAL">Total Cost</th>
                                <th class="VARIANCE" colspan="3">AMOUNT</th>
                                <th class="VARIANCE" colspan="3">%</th>
                            </tr>
                            <tr>
                                <th class="VARIANCE">Material Cost</th>
                                <th class="VARIANCE">Process Cost</th>
                                <th class="VARIANCE">Total Cost</th>
                                <th class="VARIANCE">Material Cost</th>
                                <th class="VARIANCE">Process Cost</th>
                                <th class="VARIANCE">Total Cost</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>PN12345</td>
                                <td>Material A</td>
                                <td>Rp1,200,000</td>
                                <td>Rp800,000</td>
                                <td>Rp2,000,000</td>
                                <td>Rp1,300,000</td>
                                <td>Rp900,000</td>
                                <td>Rp2,200,000</td>
                                <td>Rp100,000</td>
                                <td>Rp50,000</td>
                                <td>Rp150,000</td>
                                <td>5%</td>
                                <td>2.5%</td>
                                <td>7.5%</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>PN67890</td>
                                <td>Material B</td>
                                <td>Rp1,800,000</td>
                                <td>Rp1,200,000</td>
                                <td>Rp3,000,000</td>
                                <td>Rp1,900,000</td>
                                <td>Rp1,300,000</td>
                                <td>Rp3,200,000</td>
                                <td>Rp120,000</td>
                                <td>Rp80,000</td>
                                <td>Rp200,000</td>
                                <td>6.67%</td>
                                <td>4.44%</td>
                                <td>11.11%</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>PN54321</td>
                                <td>Material C</td>
                                <td>Rp2,000,000</td>
                                <td>Rp1,500,000</td>
                                <td>Rp3,500,000</td>
                                <td>Rp2,100,000</td>
                                <td>Rp1,600,000</td>
                                <td>Rp3,700,000</td>
                                <td>Rp150,000</td>
                                <td>Rp100,000</td>
                                <td>Rp250,000</td>
                                <td>7.5%</td>
                                <td>5%</td>
                                <td>12.5%</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>PN98765</td>
                                <td>Material D</td>
                                <td>Rp2,500,000</td>
                                <td>Rp2,000,000</td>
                                <td>Rp4,500,000</td>
                                <td>Rp2,600,000</td>
                                <td>Rp2,100,000</td>
                                <td>Rp4,700,000</td>
                                <td>Rp180,000</td>
                                <td>Rp120,000</td>
                                <td>Rp300,000</td>
                                <td>8%</td>
                                <td>5.33%</td>
                                <td>13.33%</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>PN13579</td>
                                <td>Material E</td>
                                <td>Rp3,000,000</td>
                                <td>Rp2,500,000</td>
                                <td>Rp5,500,000</td>
                                <td>Rp3,100,000</td>
                                <td>Rp2,600,000</td>
                                <td>Rp5,700,000</td>
                                <td>Rp200,000</td>
                                <td>Rp100,000</td>
                                <td>Rp300,000</td>
                                <td>6.67%</td>
                                <td>3.33%</td>
                                <td>10%</td>
                            </tr>
                        </tbody>
                    </table>

                    <%--<div class="table-container">
                        <!-- First Table -->
                        <table class="table table-bordered" style="width: 20%;">
                            <thead>

                                <tr>
                                    <th rowspan="3" style="width: 20%;" class="firsttable">Level</th>
                                    <th rowspan="3" style="width: 40%;" class="firsttable">Part Number</th>
                                    <th rowspan="3" style="width: 40%;" class="firsttable">Material Name</th>
                                </tr>

                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>PN12345</td>
                                    <td>Material A</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>PN67890</td>
                                    <td>Material B</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>PN54321</td>
                                    <td>Material C</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>PN98765</td>
                                    <td>Material D</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>PN13579</td>
                                    <td>Material E</td>
                                </tr>
                            </tbody>
                        </table>

                        <!-- Second Table -->
                        <table class="table table-bordered" style="width: 20%;">
                            <thead>
                                <tr>
                                    <th colspan="3" class="STANDART">STANDART</th>
                                </tr>
                                <tr>
                                    <th class="STANDART" style="width: 33%;">Material Cost</th>
                                    <th class="STANDART" style="width: 33%;">Process Cost</th>
                                    <th class="STANDART" style="width: 34%;">Total Cost</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Rp1,200,000</td>
                                    <td>Rp800,000</td>
                                    <td>Rp2,000,000</td>
                                </tr>
                                <tr>
                                    <td>Rp1,800,000</td>
                                    <td>Rp1,200,000</td>
                                    <td>Rp3,000,000</td>
                                </tr>
                                <tr>
                                    <td>Rp2,000,000</td>
                                    <td>Rp1,500,000</td>
                                    <td>Rp3,500,000</td>
                                </tr>
                                <tr>
                                    <td>Rp2,500,000</td>
                                    <td>Rp2,000,000</td>
                                    <td>Rp4,500,000</td>
                                </tr>
                                <tr>
                                    <td>Rp3,000,000</td>
                                    <td>Rp2,500,000</td>
                                    <td>Rp5,500,000</td>
                                </tr>
                            </tbody>
                        </table>

                        <!-- Third Table -->
                        <table class="table table-bordered" style="width: 20%;">
                            <thead>
                                <tr>
                                    <th colspan="3" class="ACTUAL">ACTUAL</th>
                                </tr>
                                <tr>
                                    <th class="ACTUAL" style="width: 33%;">Material Cost</th>
                                    <th class="ACTUAL" style="width: 33%;">Process Cost</th>
                                    <th class="ACTUAL" style="width: 34%;">Total Cost</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Rp1,300,000</td>
                                    <td>Rp900,000</td>
                                    <td>Rp2,200,000</td>
                                </tr>
                                <tr>
                                    <td>Rp1,900,000</td>
                                    <td>Rp1,300,000</td>
                                    <td>Rp3,200,000</td>
                                </tr>
                                <tr>
                                    <td>Rp2,100,000</td>
                                    <td>Rp1,600,000</td>
                                    <td>Rp3,700,000</td>
                                </tr>
                                <tr>
                                    <td>Rp2,600,000</td>
                                    <td>Rp2,100,000</td>
                                    <td>Rp4,700,000</td>
                                </tr>
                                <tr>
                                    <td>Rp3,100,000</td>
                                    <td>Rp2,600,000</td>
                                    <td>Rp5,700,000</td>
                                </tr>
                            </tbody>
                        </table>

                        <!-- Fourth Table -->
                        <table class="table table-bordered" style="width: 40%;">
                            <thead>
                                <tr>
                                    <th colspan="6" class="VARIANCE">VARIANCE</th>
                                </tr>
                                <tr>
                                    <th class="VARIANCE" colspan="3" style="width: 50%;">AMOUNT</th>
                                    <th class="VARIANCE" colspan="3" style="width: 50%;">%</th>
                                </tr>
                                <tr>
                                    <th class="VARIANCE" style="width: 16.67%;">Material Cost</th>
                                    <th class="VARIANCE" style="width: 16.67%;">Process Cost</th>
                                    <th class="VARIANCE" style="width: 16.67%;">Total Cost</th>
                                    <th class="VARIANCE" style="width: 16.67%;">Material Cost</th>
                                    <th class="VARIANCE" style="width: 16.67%;">Process Cost</th>
                                    <th class="VARIANCE" style="width: 16.67%;">Total Cost</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Rp100,000</td>
                                    <td>Rp50,000</td>
                                    <td>Rp150,000</td>
                                    <td>5%</td>
                                    <td>2.5%</td>
                                    <td>7.5%</td>
                                </tr>
                                <tr>
                                    <td>Rp120,000</td>
                                    <td>Rp80,000</td>
                                    <td>Rp200,000</td>
                                    <td>6.67%</td>
                                    <td>4.44%</td>
                                    <td>11.11%</td>
                                </tr>
                                <tr>
                                    <td>Rp150,000</td>
                                    <td>Rp100,000</td>
                                    <td>Rp250,000</td>
                                    <td>7.5%</td>
                                    <td>5%</td>
                                    <td>12.5%</td>
                                </tr>
                                <tr>
                                    <td>Rp180,000</td>
                                    <td>Rp120,000</td>
                                    <td>Rp300,000</td>
                                    <td>8%</td>
                                    <td>5.33%</td>
                                    <td>13.33%</td>
                                </tr>
                                <tr>
                                    <td>Rp200,000</td>
                                    <td>Rp100,000</td>
                                    <td>Rp300,000</td>
                                    <td>6.67%</td>
                                    <td>3.33%</td>
                                    <td>10%</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>--%>
                </form>
            </div>



        </section>
    </main>
</asp:Content>

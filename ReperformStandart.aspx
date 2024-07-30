<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="ReperformStandart.aspx.cs" Inherits="PrototypePortalCosting.ReperformStandart" %>

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
            <h1>Reperform Standard</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Process Cost</li>
                    <li class="breadcrumb-item active">Reperform Standard</li>
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
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th rowspan="2">No.</th>
                                <th rowspan="2">Cost Center</th>
                                <th rowspan="2">Cost Center Description</th>
                                <th colspan="3" class="STANDARD">STANDARD</th>
                                <th colspan="3" class="REPERFORMSTANDARD">REPERFORM STANDARD</th>
                                <th colspan="3" class="VARIANCE">VARIANCE</th>
                            </tr>
                            <tr>
                                <th class="STANDARD">Cost (Idr)</th>
                                <th class="STANDARD">Jam Kerja (Hour)</th>
                                <th class="STANDARD">Rate (IDR/Hour)</th>
                                <th class="REPERFORMSTANDARD">Cost (IDR)</th>
                                <th class="REPERFORMSTANDARD">Jam Kerja (Hour)</th>
                                <th class="REPERFORMSTANDARD">Rate (IDR/Hour)</th>
                                <th class="VARIANCE">Cost</th>
                                <th class="VARIANCE">Jam Kerja (Hour</th>
                                <th class="VARIANCE">Rate (IDR/Hour)</th>
                            </tr>
                           
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>CC101</td>
                                <td>Production</td>
                                <td>Rp 150,000,000</td>
                                <td>1,000</td>
                                <td>Rp 150,000</td>
                                <td>Rp 150,000,000</td>
                                <td>1,050</td>
                                <td>Rp 150,000</td>
                                <td>Rp 157,500,000</td>
                                <td>50</td>
                                <td>Rp 150,000</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>CC102</td>
                                <td>Maintenance</td>
                                <td>Rp 120,000,000</td>
                                <td>800</td>
                                <td>Rp 150,000</td>
                                <td>Rp 120,000,000</td>
                                <td>850</td>
                                <td>Rp 150,000</td>
                                <td>Rp 127,500,000</td>
                                <td>50</td>
                                <td>Rp 150,000</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>CC103</td>
                                <td>Logistics</td>
                                <td>Rp 90,000,000</td>
                                <td>600</td>
                                <td>Rp 150,000</td>
                                <td>Rp 90,000,000</td>
                                <td>630</td>
                                <td>Rp 150,000</td>
                                <td>Rp 94,500,000</td>
                                <td>30</td>
                                <td>Rp 150,000</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>CC104</td>
                                <td>Quality Control</td>
                                <td>Rp 75,000,000</td>
                                <td>500</td>
                                <td>Rp 150,000</td>
                                <td>Rp 75,000,000</td>
                                <td>520</td>
                                <td>Rp 150,000</td>
                                <td>Rp 78,000,000</td>
                                <td>20</td>
                                <td>Rp 150,000</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>CC105</td>
                                <td>Research & Development</td>
                                <td>Rp 180,000,000</td>
                                <td>1,200</td>
                                <td>Rp 150,000</td>
                                <td>Rp 180,000,000</td>
                                <td>1,250</td>
                                <td>Rp 150,000</td>
                                <td>Rp 187,500,000</td>
                                <td>50</td>
                                <td>Rp 150,000</td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </main>
</asp:Content>

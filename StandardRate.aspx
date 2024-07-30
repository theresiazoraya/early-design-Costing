<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="StandardRate.aspx.cs" Inherits="PrototypePortalCosting.RateBySystem" %>

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
            <h1>Standard Rate</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Process Cost</li>
                    <li class="breadcrumb-item active">Standard Rate</li>
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
                                <th rowspan="2">Work Center</th>
                                <th rowspan="2">Work Center Description</th>
                                <th rowspan="2">Cost Center</th>
                                <th rowspan="2">Cost Center Description</th>
                                <th rowspan="2">Rate Standard</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>WC-101</td>
                                <td>Assembly Line 1</td>
                                <td>CC-501</td>
                                <td>Manufacturing</td>
                                <td>Rp 750,000/jam</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>WC-102</td>
                                <td>Assembly Line 2</td>
                                <td>CC-502</td>
                                <td>Manufacturing</td>
                                <td>Rp 720,000/jam</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>WC-201</td>
                                <td>Painting Station 1</td>
                                <td>CC-503</td>
                                <td>Finishing</td>
                                <td>Rp 800,000/jam</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>WC-202</td>
                                <td>Painting Station 2</td>
                                <td>CC-504</td>
                                <td>Finishing</td>
                                <td>Rp 770,000/jam</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>WC-301</td>
                                <td>Inspection Area</td>
                                <td>CC-505</td>
                                <td>Quality Control</td>
                                <td>Rp 900,000/jam</td>
                            </tr>
                        </tbody>
                    </table>



                </form>
            </div>
        </section>
    </main>
</asp:Content>

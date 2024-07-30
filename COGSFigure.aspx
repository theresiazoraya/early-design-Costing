<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="COGSFigure.aspx.cs" Inherits="PrototypePortalCosting.COGSFigure" %>


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

        td {
            border: 1px solid #ddd;
        }

        .highlight-green {
            background-color: #d4edda;
            color: #155724;
        }

        .highlight-red {
            background-color: #f8d7da;
            color: #721c24;
        }

        .table-bordered th {
            background-color: #2c3e50;
            color: white;
        }
    </style>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>COGS Figure</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Process Cost</li>
                    <li class="breadcrumb-item active">COGS Figure</li>
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
                                <th rowspan="2">NO</th>
                                <th rowspan="2">GL Account</th>
                                <th rowspan="2">Desc.</th>
                                <th colspan="2">COGS</th>
                                <th rowspan="2">Selisih</th>
                            </tr>
                            <tr>
                                <th>TB Sept 2023 (F.01)</th>
                                <th>Report per Order (KOB1)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="13">1</td>
                                <td>5101010000</td>
                                <td>COS / COGS</td>
                                <td>522,646,517</td>
                                <td>522,646,517</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>5101020000</td>
                                <td>COS / COGS FI Post</td>
                                <td>30,229,738</td>
                                <td>30,229,738</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>5101030000</td>
                                <td>COS/COGS Service</td>
                                <td>611,047,950</td>
                                <td>611,047,950</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>5102000000</td>
                                <td>COS/COGS Inventory Write-off Interface</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>5201000000</td>
                                <td>RM Consump</td>
                                <td>2,286,267,730</td>
                                <td>2,286,267,730</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>5207000000</td>
                                <td>Prj Standard Parts Consumption (WE)</td>
                                <td>628,898,724</td>
                                <td>630,794,823</td>
                                <td style="background-color: seagreen;">(1,896,250)</td>
                            </tr>
                            <tr>
                                <td>5212100000</td>
                                <td>Variance CIU CoPC & IO</td>
                                <td>(11,141,082)</td>
                                <td>(11,141,082)</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>5214100000</td>
                                <td>Production output Control</td>
                                <td>5,621,206,804</td>
                                <td>5,640,795,394</td>
                                <td style="background-color: seagreen;">19,589,082</td>
                            </tr>
                            <tr>
                                <td>5214000001</td>
                                <td>Production output Control (FI Post)</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>5220000000</td>
                                <td>Service Output Control</td>
                                <td>(892,197,950)</td>
                                <td>(892,197,950)</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>5221000000</td>
                                <td>Order Output Control</td>
                                <td>109,607,938</td>
                                <td>109,607,938</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>530xxxxxxx</td>
                                <td>DL</td>
                                <td>1,930,081,253</td>
                                <td>1,930,081,257</td>
                                <td>(4)</td>
                            </tr>
                            <tr>
                                <td>540xxxxxxx</td>
                                <td>IDL + FOH</td>
                                <td>5,792,575,435</td>
                                <td>5,809,382,846</td>
                                <td class="highlight-red">(16,807,411)</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>5212100000</td>
                                <td>Var. RM</td>
                                <td>26,469,302</td>
                                <td>-</td>
                                <td style="background-color: darkseagreen;">26,469,302</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>5206000000</td>
                                <td>WIP offsetting account</td>
                                <td>(4,152,744,452)</td>
                                <td>(4,222,000,370)</td>
                                <td>69,255,918</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>5212050000</td>
                                <td>Var. FG</td>
                                <td>118,938,826</td>
                                <td>-</td>
                                <td style="background-color: lightsalmon;">118,938,826</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>5212090000</td>
                                <td>Variance CIU</td>
                                <td>(1,076,524,749)</td>
                                <td>-</td>
                                <td style="background-color: saddlebrown;">(1,076,524,749)</td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>5500000000</td>
                                <td>FOH Non Applied Cost</td>
                                <td>966,916,811</td>
                                <td>-</td>
                                <td style="background-color: steelblue">966,916,811</td>
                            </tr>
                            <tr>
                                <td colspan="3" style="background-color: lightblue; font-weight: bold">TOTAL</td>
                                <td style="background-color: lightblue; font-weight: bold">1,269,866,412</td>
                                <td style="background-color: lightblue; font-weight: bold">1,163,924,205</td>
                                <td style="background-color: lightblue; font-weight: bold">105,942,207</td>
                            </tr>
                        </tbody>
                    </table>

                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th rowspan="2">Desc.</th>
                                <th colspan="2">COGS</th>
                                <th rowspan="2">Variance</th>
                            </tr>
                            <tr>
                                <th>TB Sept 2023 (F.01)</th>
                                <th>Report per Order (KOB1)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Material</td>
                                <td>(7,419,707,087)</td>
                                <td>(6,575,539,898)</td>
                                <td class="highlight-red">(844,167,189)</td>
                            </tr>
                            <tr>
                                <td>DL</td>
                                <td>1,930,081,253</td>
                                <td>1,930,081,257</td>
                                <td>(4)</td>
                            </tr>
                            <tr>
                                <td>IDL + FOH</td>
                                <td>6,759,492,246</td>
                                <td>5,809,382,846</td>
                                <td class="highlight-green">950,109,400</td>
                            </tr>
                            <tr>
                                <td style="background-color: lightblue; font-weight: bold">COGS</td>
                                <td style="background-color: lightblue; font-weight: bold">1,269,866,412</td>
                                <td style="background-color: lightblue; font-weight: bold">1,163,924,205</td>
                                <td style="background-color: lightblue; font-weight: bold">105,942,207</td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </main>
</asp:Content>

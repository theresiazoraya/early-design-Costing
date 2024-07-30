<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="SummaryProgress.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

    <style>
        #dataTable th {
            text-align: center;
            vertical-align: middle;
            background-color: #f2f2f2;
        }

        #dataTable .center-align {
            text-align: center;
        }

        .legend-table th, .legend-table td {
            text-align: center;
            border: 1px solid black;
            padding: 5px;
        }

        .fully-implemented {
            background-color: #8ED7E6;
            color: white;
        }

        .in-progress {
            background-color: #90EE90;
        }

        .follow-up {
            background-color: #F7F197;
        }

        .not-yet-started {
            background-color: #A9A9A9;
            color: white;
        }

        .follow-up-immediate {
            background-color: #FF6347;
            color: white;
        }

        .follow-up-oct {
            background-color: #FF4500;
            color: white;
        }

        .follow-up-dec {
            background-color: #8B0000;
            color: white;
        }

        .not-yet-started-immediate {
            background-color: #FF0000;
            color: white;
        }

        .not-yet-started-nov {
            background-color: #800000;
            color: white;
        }

        .not-yet-started-dec {
            background-color: #800080;
            color: white;
        }

        .not-yet-started-2024 {
            background-color: #4B0082;
            color: white;
        }
    </style>


    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Rekomendasi</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Rekomendasi</li>
                    <li class="breadcrumb-item active">Summary Progress</li>
                </ol>
            </nav>
        </div>
        <section class="section">
            <div class="tables-wrapper">
                <div class="legend-wrapper" style="margin-bottom: 20px;">
                    <table class="legend-table">
                        <thead>
                            <tr>
                                <th>Flag & Status</th>
                                <th>%</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="fully-implemented">
                                <td>Fully Implemented</td>
                                <td>100%</td>
                            </tr>
                            <tr class="in-progress">
                                <td>In Progress</td>
                                <td>>90%</td>
                            </tr>
                            <tr class="follow-up">
                                <td>Follow Up</td>
                                <td><90%</td>
                            </tr>
                            <tr class="not-yet-started">
                                <td>Not Yet Started</td>
                                <td>0%</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Table to display items -->
                <table class="table" id="dataTable">
                    <thead>
                        <tr>
                            <th scope="col">Affco</th>
                            <th scope="col">Assessment Year</th>
                            <th scope="col">Total Recom</th>
                            <th scope="col">Actual Implementation</th>
                            <th scope="col">Actual percentage</th>
                            <th scope="col">Status</th>
                            <th scope="col">Target Follow Up</th>
                            <th scope="col">Report</th>
                            <th scope="col">Remarks</th>
                            <th scope="col">Notes</th>
                            <th scope="col">Next Planning Implementation</th>
                            <th scope="col">Report</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Rows will be dynamically added here -->
                        <tr>
                            <td>FSCM</td>
                            <td class="center-align">2019</td>
                            <td class="center-align">38</td>
                            <td class="center-align">38</td>
                            <td class="center-align">100%</td>
                            <td style="background-color: #8ED7E6; color: black;">Fully Implemented</td>
                            <td style="background-color: #b5f5d3;">Done</td>
                            <td style="background-color: #b5f5d3;">Done</td>
                            <td>-</td>
                            <td>2 rekomendasi terkait update standard sudah diperbarui dengan rekomendasi pada costing assessment 2023</td>
                            <td></td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(1)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>FIM</td>
                            <td class="center-align">2020</td>
                            <td class="center-align">14</td>
                            <td class="center-align">10</td>
                            <td class="center-align">71%</td>
                            <td style="background-color: #F7F197;">Follow Up</td>
                            <td style="background-color: #FF6347;">Immediately</td>
                            <td style="background-color: #f5abdb;">In Progress</td>
                            <td>Menunggu update progress dari FIM</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(2)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>MTM</td>
                            <td class="center-align">2020</td>
                            <td class="center-align">13</td>
                            <td class="center-align">12</td>
                            <td class="center-align">92%</td>
                            <td style="background-color: #90EE90;">In Progress</td>
                            <td style="background-color: #90EE90;">Dec 23</td>
                            <td style="background-color: #f5abdb;">In Progress</td>
                            <td>Sisa 1 point yang masih dalam diskusi internal</td>
                            <td></td>
                            <td class="center-align">Dec 23</td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(3)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>API</td>
                            <td class="center-align">2020</td>
                            <td class="center-align">15</td>
                            <td class="center-align">9</td>
                            <td class="center-align">60%</td>
                            <td style="background-color: #F7F197;">Follow Up</td>
                            <td style="background-color: #FF6347;">Immediately</td>
                            <td style="background-color: #f5abdb;">In Progress</td>
                            <td>Status update sudah 87%. 2 rekomendasi menunggu konfirmasi dari API</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(4)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>GKD</td>
                            <td class="center-align">2021</td>
                            <td class="center-align">11</td>
                            <td class="center-align">6</td>
                            <td class="center-align">55%</td>
                            <td style="background-color: #F7F197;">Follow Up</td>
                            <td style="background-color: #90EE90;">Oct 23</td>
                            <td style="background-color: #f5abdb;">In Progress</td>
                            <td>Menunggu target migrasi sistem baru selesai (Aug 2023)</td>
                            <td></td>
                            <td class="center-align">Oct 23</td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(5)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>SKF</td>
                            <td class="center-align">2021</td>
                            <td class="center-align">23</td>
                            <td class="center-align">18</td>
                            <td class="center-align">78%</td>
                            <td style="background-color: #F7F197;">Follow Up</td>
                            <td style="background-color: #FF6347;">Immediately</td>
                            <td style="background-color: #f5abdb;">In Progress</td>
                            <td>Masih dalam diskusi internal</td>
                            <td></td>
                            <td class="center-align">Dec 23</td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(6)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>AJI</td>
                            <td class="center-align">2021</td>
                            <td class="center-align">19</td>
                            <td class="center-align">19</td>
                            <td class="center-align">100%</td>
                            <td style="background-color: #8ED7E6; color: black;">Fully Implemented</td>
                            <td style="background-color: #b5f5d3;">Done</td>
                            <td style="background-color: #f5abdb;">In Progress</td>
                            <td></td>
                            <td>Drafting Report</td>
                            <td></td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(7)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>UNM</td>
                            <td class="center-align">2022</td>
                            <td class="center-align">3</td>
                            <td class="center-align">0</td>
                            <td class="center-align">0%</td>
                            <td style="background-color: #A9A9A9;">Not Yet Started</td>
                            <td style="background-color: #FF6347;">Immediately</td>
                            <td>Not Yet Started</td>
                            <td>Akan difollow up kembali setelah closing</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(8)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>NKI</td>
                            <td class="center-align">2022</td>
                            <td class="center-align">10</td>
                            <td class="center-align">10</td>
                            <td class="center-align">100%</td>
                            <td style="background-color: #8ED7E6; color: black;">Fully Implemented</td>
                            <td style="background-color: #b5f5d3;">Done</td>
                            <td style="background-color: #f5abdb;">In Progress</td>
                            <td></td>
                            <td>Drafting Report, menunggu supporting data</td>
                            <td class="center-align">Jul 23</td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(9)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>KYB</td>
                            <td class="center-align">2022</td>
                            <td class="center-align">2</td>
                            <td class="center-align">0</td>
                            <td class="center-align">0%</td>
                            <td style="background-color: #A9A9A9;">Not Yet Started</td>
                            <td style="background-color: #90EE90;">Nov 23</td>
                            <td>Not Yet Started</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(10)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>VIN</td>
                            <td class="center-align">2022</td>
                            <td class="center-align">11</td>
                            <td class="center-align">0</td>
                            <td class="center-align">0%</td>
                            <td style="background-color: #A9A9A9;">Not Yet Started</td>
                            <td style="background-color: #90EE90;">Dec 23</td>
                            <td>Not Yet Started</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(11)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>GS</td>
                            <td class="center-align">2023</td>
                            <td class="center-align">13</td>
                            <td class="center-align">0</td>
                            <td class="center-align">0%</td>
                            <td style="background-color: #A9A9A9;">Not Yet Started</td>
                            <td style="background-color: #808080; color: white">2024</td>
                            <td>Not Yet Started</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(12)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>FSCM</td>
                            <td class="center-align">2023</td>
                            <td class="center-align">19</td>
                            <td class="center-align">0</td>
                            <td class="center-align">0%</td>
                            <td style="background-color: #A9A9A9;">Not Yet Started</td>
                            <td style="background-color: #808080; color: white;">2024</td>
                            <td>Not Yet Started</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(13)">Detail</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>


    <script>

        function openDetailPage(rowNumber) {
            // Get the recommendation, management response, due date, and department in charge from the corresponding table cells
            let affco = document.getElementById('dataTable').rows[rowNumber].cells[0].innerText;
            let assessmentyear = document.getElementById('dataTable').rows[rowNumber].cells[1].innerText;
            let totalrecom = document.getElementById('dataTable').rows[rowNumber].cells[2].innerText;
            let actualimplementation = document.getElementById('dataTable').rows[rowNumber].cells[3].innerText;
            let actualpercentage = document.getElementById('dataTable').rows[rowNumber].cells[4].innerText;
            let status = document.getElementById('dataTable').rows[rowNumber].cells[5].innerText;
            let target = document.getElementById('dataTable').rows[rowNumber].cells[6].innerText;
            let report = document.getElementById('dataTable').rows[rowNumber].cells[7].innerText;
            let remarks = document.getElementById('dataTable').rows[rowNumber].cells[8].innerText;
            let notes = document.getElementById('dataTable').rows[rowNumber].cells[9].innerText;
            let nextplanning = document.getElementById('dataTable').rows[rowNumber].cells[10].innerText;

            // Pass these values as query parameters
            window.open(`Add_SummaryProgress.aspx?rowNumber=${rowNumber}&affco=${encodeURIComponent(affco)}&assessmentyear=${encodeURIComponent(assessmentyear)}&totalrecom=${encodeURIComponent(totalrecom)}&actualimplementation=${encodeURIComponent(actualimplementation)}&actualpercentage=${encodeURIComponent(actualpercentage)}&status=${encodeURIComponent(status)}&target=${encodeURIComponent(target)}&report=${encodeURIComponent(report)}&remarks=${encodeURIComponent(remarks)}&notes=${encodeURIComponent(notes)}&nextplanning=${encodeURIComponent(nextplanning)}`, '_blank');
        }
    </script>

</asp:Content>

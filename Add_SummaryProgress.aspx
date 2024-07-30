<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Add_SummaryProgress.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Summary Progress</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Rekomendasi</li>
                    <li class="breadcrumb-item active">Summary P</li>
                </ol>
            </nav>
        </div>
        <div class="container mt-4">

            <div id="detailSection">
                <!-- Details will be dynamically added here -->
            </div>
        </div>
        <section class="section">
            <div class="container col-lg-12">
                <div id="addItemForm">
                    <div class="mb-3">
                        <label for="affco" class="form-label">affco</label>
                        <input type="text" class="form-control" id="affco" required disabled>
                    </div>
                    <div class="mb-3">
                        <label for="asessmentyear" class="form-label">Assessment Year</label>
                        <input type="text" class="form-control" id="assessmentyear" required disabled>
                    </div>
                    <div class="mb-3">
                        <label for="totalrecom" class="form-label">Total Recommendation</label>
                        <input type="text" class="form-control" id="totalrecom" required disabled>
                    </div>
                    <div class="mb-3">
                        <label for="actualimplementation" class="form-label">Actual Implementation</label>
                        <input type="text" class="form-control" id="actualimplementation" required disabled>
                    </div>
                    <div class="mb-3">
                        <label for="actualpercentage">Implementation Percentage</label>
                        <input type="text" class="form-control" id="actualpercentage" required disabled>
                    </div>
                    <div class="mb-3">
                        <label for="status">Status</label>
                        <input type="text" class="form-control" id="status" required disabled>
                    </div>
                    <div class="mb-3">
                        <label for="target">Target Follow Up</label>
                        <input type="text" class="form-control" id="target" required />
                    </div>
                    <div class="mb-3">
                        <label for="report">Report</label>
                        <input type="text" class="form-control" id="report" required />
                    </div>
                    <div class="mb-3">
                        <label for="remarks">Remarks for In Progress and Not Applicable</label>
                        <textarea class="form-control" id="remarks" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="notes">Notes</label>
                        <textarea class="form-control" id="notes" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="nextplanning">Next Planning</label>
                        <textarea class="form-control" id="nextplanning" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="uploadreport">Upload Report</label>
                        <input type="file" class="form-control" id="uploadreport" required>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-lg-12">
                    <button type="button" class="btn btn-primary" onclick="submitDetailForm()">Submit</button>
                </div>
            </div>

        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Get query parameters
            const urlParams = new URLSearchParams(window.location.search);
            const affco = urlParams.get('affco');
            const assessmentyear = urlParams.get('assessmentyear');
            const totalrecom = urlParams.get('totalrecom');
            const actualimplementation = urlParams.get('actualimplementation');
            const actualpercentage = urlParams.get('actualpercentage');
            const status = urlParams.get('status');
            const target = urlParams.get('target');
            const report = urlParams.get('report');
            const remarks = urlParams.get('remarks');
            const notes = urlParams.get('notes');
            const nextplanning = urlParams.get('nextplanning');

            // Set the values in the input fields
            document.getElementById('affco').value = affco;
            document.getElementById('assessmentyear').value = assessmentyear; // corrected the typo here
            document.getElementById('totalrecom').value = totalrecom;
            document.getElementById('actualimplementation').value = actualimplementation;
            document.getElementById('actualpercentage').value = actualpercentage;
            document.getElementById('status').value = status;
            document.getElementById('target').value = target;
            document.getElementById('report').value = report;
            document.getElementById('remarks').value = remarks;
            document.getElementById('notes').value = notes;
            document.getElementById('nextplanning').value = nextplanning;
        });

    </script>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="AddAffco_StatusImplementasi.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Add Rekomendasi</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Rekomendasi</li>
                    <li class="breadcrumb-item active">Add Status Implementasi</li>
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
                        <label for="Recommendation" class="form-label">Recommendation</label>
                        <input type="text" class="form-control" id="Recommendation" required disabled>
                    </div>
                    <div class="mb-3">
                        <label for="MngRespons" class="form-label">Management Response</label>
                        <input type="text" class="form-control" id="MngRespons" required disabled>
                    </div>
                    <div class="mb-3">
                        <label for="DueDate" class="form-label">Due Date</label>
                        <input type="date" class="form-control" id="DueDate" required disabled>
                    </div>
                    <div class="mb-3">
                        <label for="DeptIncharge" class="form-label">Dept Incharge</label>
                        <input type="text" class="form-control" id="DeptIncharge" required disabled>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="Status">Status Implementation</label>
                    <select class="form-control" id="Status" runat="server" onchange="handleStatusChange()">
                        <option value="">select status</option>
                        <option value="FullyImplemented">Fully Implemented</option>
                        <option value="InProgress">In Progress</option>
                        <option value="Follow up">Follow up</option>
                        <option value="Not Yet Started">Not Yet Started</option>
                        <option value="NotApplicable">Not Applicable</option>
                    </select>
                </div>
                <div class="mb-3" id="implementationDateField" style="display: none;">
                    <label for="ImplementationDate">Implementation Date</label>
                    <input type="date" class="form-control" id="ImplementationDate" runat="server" />
                </div>
                <div class="mb-3" id="evidenceField" style="display: none;">
                    <label for="Evidence">Evidence</label>
                    <input type="file" class="form-control-file" id="Evidence" runat="server" />
                </div>
                <div class="mb-3" id="newDeadlineField" style="display: none;">
                    <label for="NewDeadline">New Deadline</label>
                    <input type="date" class="form-control" id="NewDeadline" runat="server" />
                </div>
                <div class="mb-3" id="remarksField" style="display: none;">
                    <label for="Remarks">Remarks for In Progress and Not Applicable</label>
                    <textarea class="form-control" id="Remarks" rows="3" runat="server"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <button type="button" class="btn btn-primary" onclick="submitDetailForm()">Submit</button>
                </div>
            </div>
        </section>
    </main>

    <%--<script>
        function handleStatusChange() {
            var status = document.getElementById('Status').value;

            // Hide all fields by default
            hideAllFields();

            // Show fields based on status
            if (status === 'FullyImplemented') {
                document.getElementById('implementationDateField').style.display = 'block';
                document.getElementById('evidenceField').style.display = 'block';
            } else if (status === 'InProgress') {
                document.getElementById('newDeadlineField').style.display = 'block';
                document.getElementById('remarksField').style.display = 'block';
            } else if (status === 'NotApplicable') {
                document.getElementById('remarksField').style.display = 'block';
            }
        }

        function hideAllFields() {
            document.getElementById('implementationDateField').style.display = 'none';
            document.getElementById('evidenceField').style.display = 'none';
            document.getElementById('newDeadlineField').style.display = 'none';
            document.getElementById('remarksField').style.display = 'none';
        }

        function submitDetailForm() {
            var status = document.getElementById('Status').value;
            var implementationDate = document.getElementById('ImplementationDate').value;
            var evidence = document.getElementById('Evidence').value;
            var newDeadline = document.getElementById('NewDeadline').value;
            var remarks = document.getElementById('Remarks').value;

            // Construct URL with parameters
            var url = 'ViewAffco_StatusImplementasi.aspx' +
                '?status=' + encodeURIComponent(status) +
                '&implementationDate=' + encodeURIComponent(implementationDate) +
                '&evidence=' + encodeURIComponent(evidence) +
                '&newDeadline=' + encodeURIComponent(newDeadline) +
                '&remarks=' + encodeURIComponent(remarks);

            // Redirect to the other page with parameters
            window.location.href = url;
        }

        // On page load, initially hide all fields except Status
        document.addEventListener('DOMContentLoaded', function () {
            hideAllFields(); // Hide all fields initially
            handleStatusChange(); // Call to handle initial status
        });
    </script>--%>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Get query parameters
            const urlParams = new URLSearchParams(window.location.search);
            const recommendation = urlParams.get('recommendation');
            const managementResponse = urlParams.get('managementResponse');
            const dueDate = urlParams.get('dueDate');
            const deptIncharge = urlParams.get('deptIncharge');

            // Set the values in the input fields
            document.getElementById('Recommendation').value = recommendation;
            document.getElementById('MngRespons').value = managementResponse;
            document.getElementById('DueDate').value = dueDate;
            document.getElementById('DeptIncharge').value = deptIncharge;
        });

        function submitDetailForm() {
            // Get form data
            var status = document.getElementById('Status').value;
            var implementationDate = document.getElementById('ImplementationDate').value;
            var evidence = document.getElementById('Evidence').value;
            var newDeadline = document.getElementById('NewDeadline').value;
            var remarks = document.getElementById('Remarks').value;

            // Construct URL with parameters
            var url = 'ViewAffco_StatusImplementasi.aspx' +
                '?status=' + encodeURIComponent(status) +
                '&implementationDate=' + encodeURIComponent(implementationDate) +
                '&evidence=' + encodeURIComponent(evidence) +
                '&newDeadline=' + encodeURIComponent(newDeadline) +
                '&remarks=' + encodeURIComponent(remarks);

            // Redirect to the other page with parameters
            window.location.href = url;
        }
    </script>
</asp:Content>

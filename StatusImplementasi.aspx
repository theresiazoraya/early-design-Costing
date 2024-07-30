<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="StatusImplementasi.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Rekomendasi</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Rekomendasi</li>
                    <li class="breadcrumb-item active">Status Implementasi</li>
                </ol>
            </nav>
        </div>
        <section class="section">
            <div class="tables-wrapper">
                <div class="row mb-3">
                    <div class="col-lg-3">
                        <label for="filteryear" class="form-label">Assessment Year</label>
                        <select class="form-select" id="filteryear">
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                        </select>
                    </div>
                    <div class="col-lg-3 align-self-end">
                        <button type="button" class="btn btn-primary" onclick="filterTable()">Search</button>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-lg-12 d-flex justify-content-end">
                        <button type="button" class="btn btn-success">Download Report to Excel</button>
                    </div>
                </div>
                <!-- Table to display items -->
                <table class="table" id="dataTable">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Recommendation</th>
                            <th scope="col">Assessment Year</th>
                            <th scope="col">Management Response</th>
                            <th scope="col">Due Date</th>
                            <th scope="col">Dept Incharge</th>
                            <th scope="col">Status</th>
                            <th scope="col">Implementation Date</th>
                            <th scope="col">Evidence</th>
                            <th scope="col">New Deadline</th>
                            <th scope="col">Remarks</th>
                            <th scope="col">Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Rows will be dynamically added here -->
                        <tr>
                            <td>1</td>
                            <td>Recommendation 1</td>
                            <td>2024</td>
                            <td>Management Response 1</td>
                            <td>2024-06-10</td>
                            <td>Dept Incharge 1</td>
                            <td id="status1" style="background-color: lightblue">Fully Implemented</td>
                            <td id="implementationDate1">16/06/24</td>
                            <td id="evidence1"></td>
                            <td id="newDeadline1"></td>
                            <td id="remarks1">remarks recommendation1</td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(1)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Recommendation 2</td>
                            <td>2024</td>
                            <td>Management Response 2</td>
                            <td>2024-06-11</td>
                            <td>Dept Incharge 2</td>
                            <td id="status2" style="background-color: #90EE90">In Progress</td>
                            <td id="implementationDate2"></td>
                            <td id="evidence2"></td>
                            <td id="newDeadline2">16/07/24</td>
                            <td id="remarks2"></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(2)">Detail</button>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Recommendation 3</td>
                            <td>2024</td>
                            <td>Management Response 3</td>
                            <td>2024-06-11</td>
                            <td>Dept Incharge 3</td>
                            <td id="status3"></td>
                            <td id="implementationDate3"></td>
                            <td id="evidence3"></td>
                            <td id="newDeadline3"></td>
                            <td id="remarks3"></td>
                            <td>
                                <button type="button" class="btn btn-primary" onclick="openDetailPage(3)">Detail</button>
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
            let recommendation = document.getElementById('dataTable').rows[rowNumber].cells[1].innerText;
            let managementResponse = document.getElementById('dataTable').rows[rowNumber].cells[2].innerText;
            let dueDate = document.getElementById('dataTable').rows[rowNumber].cells[3].innerText;
            let deptIncharge = document.getElementById('dataTable').rows[rowNumber].cells[4].innerText;

            // Pass these values as query parameters
            window.open(`AddAffco_StatusImplementasi.aspx?rowNumber=${rowNumber}&recommendation=${encodeURIComponent(recommendation)}&managementResponse=${encodeURIComponent(managementResponse)}&dueDate=${encodeURIComponent(dueDate)}&deptIncharge=${encodeURIComponent(deptIncharge)}`, '_blank');
        }

        document.addEventListener('DOMContentLoaded', function () {
            // Get query parameters
            const urlParams = new URLSearchParams(window.location.search);
            const status = urlParams.get('status');
            const implementationDate = urlParams.get('implementationDate');
            const evidence = urlParams.get('evidence');
            const newDeadline = urlParams.get('newDeadline');
            const remarks = urlParams.get('remarks');

            // Assuming you want to update the first row (as an example)
            let rowNumber = 1;

            // Update the table with the data
            if (status) document.getElementById('status' + rowNumber).innerText = status;
            if (implementationDate) document.getElementById('implementationDate' + rowNumber).innerText = implementationDate;
            if (evidence) document.getElementById('evidence' + rowNumber).innerText = evidence;
            if (newDeadline) document.getElementById('newDeadline' + rowNumber).innerText = newDeadline;
            if (remarks) document.getElementById('remarks' + rowNumber).innerText = remarks;
        });

    </script>

</asp:Content>

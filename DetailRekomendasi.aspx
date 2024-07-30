<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="DetailRekomendasi.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

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
                    <li class="breadcrumb-item active">Detail Rekomendasi</li>
                </ol>
            </nav>
        </div>
        <section class="section">
            <div class="tables-wrapper">
                <form id="dataForm">
                    <div class="row mb-3">
                        <div class="col-lg-12">
                            <button type="button" class="btn btn-primary" onclick="openAddPage()">
                                Add Detail Recommendation
                            </button>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filterCategory" class="form-label">Affco</label>
                            <select class="form-select" id="filterCategory">
                                <option value="Aisin">Aisin</option>
                                <option value="Akashi">Akashi</option>
                                <option value="Akebono">Akebono</option>
                            </select>
                        </div>
                    </div>
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
                                <th scope="col">Affco</th>
                                <th scope="col">Assessment Year</th>
                                <th scope="col">Recommendation</th>
                                <th scope="col">Management Response</th>
                                <th scope="col">Due Date</th>
                                <th scope="col">Dept Incharge</th>
                                <th scope="col">Status</th>
                                <th scope="col">Implementation Date</th>
                                <th scope="col">Evidence</th>
                                <th scope="col">New Deadline</th>
                                <th scope="col">Remarks</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Rows will be dynamically added here -->
                            <tr>
                                <td id="Aisin">Aisin</td>
                                <td>2024</td>
                                <td>Recommendation 1</td>
                                <td>Management Response 1</td>
                                <td>2024-06-10</td>
                                <td>Dept Incharge 1</td>
                                <td id="status1" style="background-color: lightblue">Fully Implemented</td>
                                <td id="implementationDate1">16/06/24</td>
                                <td id="evidence1">Submitted</td>
                                <td id="newDeadline1"></td>
                                <td id="remarks1"></td>
                                <td>
                                    <button type="submit" class="btn btn-danger">Revise</button></td>
                            </tr>
                            <tr>
                                <td>Aisin</td>
                                <td>2024</td>
                                <td>Recommendation 2</td>
                                <td>Management Response 2</td>
                                <td>2024-06-11</td>
                                <td>Dept Incharge 2</td>
                                <td id="status2" style="background-color: #90EE90">In Progress</td>
                                <td id="implementationDate2"></td>
                                <td id="evidence2"></td>
                                <td id="newDeadline2">16/07/24</td>
                                <td id="remarks2">remarks status in progress</td>
                                <td>
                                    <button type="submit" class="btn btn-danger">Revise</button></td>
                            </tr>
                            <tr>
                                <td>Akashi</td>
                                <td>2024</td>
                                <td>Recommendation 1</td>
                                <td>Management Response 3</td>
                                <td>2024-06-11</td>
                                <td>Dept Incharge 3</td>
                                <td id="status3"></td>
                                <td id="implementationDate3"></td>
                                <td id="evidence3"></td>
                                <td id="newDeadline3"></td>
                                <td id="remarks3"></td>
                                <td>
                                    <button type="submit" class="btn btn-danger">Revise</button></td>
                            </tr>
                            <tr>
                                <td>Akashi</td>
                                <td>2024</td>
                                <td>Recommendation 2</td>
                                <td>Management Response 4</td>
                                <td>2024-06-11</td>
                                <td>Dept Incharge 3</td>
                                <td id="status4"></td>
                                <td id="implementationDate4"></td>
                                <td id="evidence4"></td>
                                <td id="newDeadline4"></td>
                                <td id="remarks4"></td>
                                <td>
                                    <button type="submit" class="btn btn-danger">Revise</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </main>

    <script>
        function openAddPage() {
            window.location.href = 'Add_DetailRekomendasi.aspx';
        }

        function filterTable() {
            let category = document.getElementById('filterCategory').value;
            let year = document.getElementById('filteryear').value;

            let table = document.getElementById('dataTable');
            let tr = table.getElementsByTagName('tr');

            for (let i = 1; i < tr.length; i++) { // Skip the header row
                let tdCategory = tr[i].getElementsByTagName('td')[0]; // First column
                let tdYear = tr[i].getElementsByTagName('td')[1]; // Second column
                if (tdCategory && tdYear) {
                    let categoryText = tdCategory.textContent || tdCategory.innerText;
                    let yearText = tdYear.textContent || tdYear.innerText;
                    if (categoryText === category && yearText === year) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }


    </script>
</asp:Content>

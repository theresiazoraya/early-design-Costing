<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="BeritaAcaraSTO.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        .pdf-preview {
            width: 100%;
            height: 1000px;
            border: 1px solid #ddd;
            margin-top: 20px;
            display: none;
        }
    </style>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Berita Acara STO</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Inventory</li>
                    <li class="breadcrumb-item active">Berita Acara STO</li>
                </ol>
            </nav>
        </div>
        <section class="section">
            <h4>Upload and Preview PDF</h4>
            <form id="pdfUploadForm">
                <div class="form-group">
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
                                <option value="midyear">Mid-Year</option>
                                <option value="endyear">End Year</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="filtertahun" class="form-label">Tahun</label>
                            <select class="form-select" id="filtertahun">
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                            </select>
                        </div>
                        <div class="col-lg-3 align-self-end">
                            <button type="button" class="btn btn-primary">Search</button>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <label for="pdfFile">Choose PDF File</label>
                            <input type="file" id="pdfFile" class="form-control-file" accept="application/pdf">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-3">
                            <button type="submit" class="btn btn-primary">Upload</button>
                        </div>
                    </div>
            </form>

            <table id="fileTable" class="table table-bordered mt-4">
                <thead>
                    <tr>
                        <th>File Name</th>
                        <th>Preview</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Files will be added here dynamically -->
                </tbody>
            </table>

            <embed id="pdfPreview" class="pdf-preview" type="application/pdf">
        </section>
    </main>

    <script>
        document.getElementById('pdfUploadForm').addEventListener('submit', function (event) {
            event.preventDefault();
            const fileInput = document.getElementById('pdfFile');
            const file = fileInput.files[0];
            if (file) {
                const fileURL = URL.createObjectURL(file);
                addFileToTable(file.name, fileURL);
                fileInput.value = ''; // Clear the file input after upload
            } else {
                alert('Please select a PDF file to upload.');
            }
        });

        function addFileToTable(fileName, fileURL) {
            const tableBody = document.querySelector('#fileTable tbody');
            const row = document.createElement('tr');

            const fileNameCell = document.createElement('td');
            fileNameCell.textContent = fileName;

            const previewCell = document.createElement('td');
            const previewButton = document.createElement('button');
            previewButton.textContent = 'Preview';
            previewButton.classList.add('btn', 'btn-primary');
            previewButton.addEventListener('click', function () {
                const pdfPreview = document.getElementById('pdfPreview');
                pdfPreview.src = fileURL;
                pdfPreview.style.display = 'block';
            });

            previewCell.appendChild(previewButton);
            row.appendChild(fileNameCell);
            row.appendChild(previewCell);

            tableBody.appendChild(row);
        }
    </script>
</asp:Content>

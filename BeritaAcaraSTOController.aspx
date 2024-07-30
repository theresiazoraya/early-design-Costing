<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="BeritaAcaraSTOController.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

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
            height: 500px;
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
            <h3>Preview PDF</h3>

            <table id="fileTable" class="table table-bordered mt-4">
                <thead>
                    <tr>
                        <th>Affco</th>
                        <th>File Name</th>
                        <th>Preview</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Dummy files will be added here dynamically -->
                </tbody>
            </table>

            <embed id="pdfPreview" class="pdf-preview" type="application/pdf">
        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Dummy file data
            const dummyFiles = [
                { affco: "Aisin", fileName: "FileAisin.pdf", fileURL: "‪D:/UAT Script 210224.pdf" },
                { affco: "Akashi", fileName: "FileAkashi.pdf", fileURL: "‪‪D:\Data There\DDMS\Langkah langkah.pdf" }
            ];

            // Add dummy files to table
            dummyFiles.forEach(file => {
                addFileToTable(file.affco, file.fileName, file.fileURL);
            });
        });

        function addFileToTable(affco, fileName, fileURL) {
            const tableBody = document.querySelector('#fileTable tbody');
            const row = document.createElement('tr');

            const affcoCell = document.createElement('td');
            affcoCell.textContent = affco;

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
            row.appendChild(affcoCell);
            row.appendChild(fileNameCell);
            row.appendChild(previewCell);

            tableBody.appendChild(row);
        }
    </script>
</asp:Content>

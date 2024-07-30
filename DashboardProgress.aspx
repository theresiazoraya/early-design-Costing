<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="DashboardProgress.aspx.cs" Inherits="PrototypePortalCosting.Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Rekomendasi</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item">Rekomendasi</li>
                    <li class="breadcrumb-item active">Dashboard Summary Progress</li>
                </ol>
            </nav>
        </div>
        <section class="section">
            <div class="container">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Affco</th>
                            <th>#Recommendation</th>
                            <th>Implemented</th>
                            <th>Implemented %</th>
                            <th>In Progress</th>
                            <th>In Progress %</th>
                            <th>Not Applicable</th>
                            <th>Not Applicable %</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <select id="affcoSelect" class="form-control">
                                    <option value="Aisin">Aisin</option>
                                    <option value="akashi">akashi</option>
                                    <option value="akebono">akebono</option>
                                </select>
                            </td>
                            <td id="totalRecommendations">21</td>
                            <td id="implementedCount">9</td>
                            <td id="implementedPercentage"></td>
                            <td id="inProgressCount">11</td>
                            <td id="inProgressPercentage"></td>
                            <td id="notApplicableCount">1</td>
                            <td id="notApplicablePercentage"></td>
                        </tr>
                    </tbody>
                </table>
                <div style="width: 500px; height: 500px; margin: 0 auto;">
                    <canvas id="myPieChart"></canvas>
                </div>
            </div>
        </section>
    </main>

    <script>
        $(document).ready(function () {
            console.log('Document is ready');

            function updateChartData() {
                var affco = $('#affcoSelect').val();
                var recommendations = {
                    Aisin: { total: 21, implemented: 9, inProgress: 11, notApplicable: 1 },
                    akashi: { total: 15, implemented: 5, inProgress: 8, notApplicable: 2 },
                    akebono: { total: 30, implemented: 20, inProgress: 7, notApplicable: 3 }
                };

                var data = recommendations[affco];
                $('#totalRecommendations').text(data.total);
                $('#implementedCount').text(data.implemented);
                $('#inProgressCount').text(data.inProgress);
                $('#notApplicableCount').text(data.notApplicable);

                var implementedPercentage = ((data.implemented / data.total) * 100).toFixed(2);
                var inProgressPercentage = ((data.inProgress / data.total) * 100).toFixed(2);
                var notApplicablePercentage = ((data.notApplicable / data.total) * 100).toFixed(2);

                $('#implementedPercentage').text(implementedPercentage + '%');
                $('#inProgressPercentage').text(inProgressPercentage + '%');
                $('#notApplicablePercentage').text(notApplicablePercentage + '%');

                updateChart(data);
            }

            var ctx = document.getElementById('myPieChart').getContext('2d');
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ['Implemented', 'In Progress', 'Not Applicable'],
                    datasets: [{
                        data: [9, 11, 1],
                        backgroundColor: ['#28a745', '#ffc107', '#dc3545'],
                        hoverBackgroundColor: ['#28a745', '#ffc107', '#dc3545']
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: true,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        },
                        datalabels: {
                            formatter: (value, ctx) => {
                                let sum = 0;
                                let dataArr = ctx.chart.data.datasets[0].data;
                                dataArr.map(data => {
                                    sum += data;
                                });
                                let percentage = (value * 100 / sum).toFixed(2) + "%";
                                return percentage;
                            },
                            color: '#fff',
                            anchor: 'end',
                            align: 'start',
                            offset: -10,
                            borderWidth: 2,
                            borderColor: '#fff',
                            borderRadius: 25,
                            backgroundColor: (context) => {
                                return context.dataset.backgroundColor;
                            }
                        }
                    }
                }
            });

            function updateChart(data) {
                myPieChart.data.datasets[0].data = [
                    data.implemented,
                    data.inProgress,
                    data.notApplicable
                ];
                myPieChart.update();
                console.log('Chart updated');
            }

            $('#affcoSelect').change(function () {
                updateChartData();
            });

            updateChartData(); // Initial call to set data for default selection
        });
    </script>
</asp:Content>


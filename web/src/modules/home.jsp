<%-- 
    Document   : home
    Created on : May 15, 2016, 8:32:02 PM
    Author     : Fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Dashboard
        <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    
    <!-- DONUT CHART -->
    <div class="box box-danger">
        <div class="box-header with-border">
            <h3 class="box-title">Donut Chart</h3>
            <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                
            </div>
        </div>
        <div class="box-body">
            <canvas id="pieChart" style="height: 250px"></canvas>
        </div>
        
    </div>

</section><!-- /.content -->

<script>
    $(function(){
        //PIECHART
        var pieChartCanvas = $('#pieChart').get(0).getContext('2d');
        var pieChart = new Chart(pieChartCanvas);
        var PieData = [
            {
                value: 700,
                color: "#f56954",
                label: "chrome"
            },
            {
                value: 200,
                color: "#f5FF54",
                label: "firefox"
            }
        ];
        
        
        pieChart.Doughnut(PieData);
    });
</script>

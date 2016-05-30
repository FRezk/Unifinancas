/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
       
    //-------------
    //- Receita por categoria CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var receitaCategoriaPieChartCanvas = $("#receitaCategoriaPieChart").get(0).getContext("2d");
    var receitaCategoriaPieChart = new Chart(receitaCategoriaPieChartCanvas);
    $.ajax({
        type: "get",
        url: "src/code/receitaPorCategorias.jsp",
        success: function(retorno){
            var receitaCategoriaPieData = JSON.parse(retorno);
            
            var receitaCategoriaPieOptions = {
                //Boolean - Whether we should show a stroke on each segment
                segmentShowStroke: true,
                //String - The colour of each segment stroke
                segmentStrokeColor: "#fff",
                //Number - The width of each segment stroke
                segmentStrokeWidth: 2,
                //Number - The percentage of the chart that we cut out of the middle
                percentageInnerCutout: 50, // This is 0 for Pie charts
                //Number - Amount of animation steps
                animationSteps: 100,
                //String - Animation easing effect
                animationEasing: "easeOutQuint",
                //Boolean - Whether we animate the rotation of the Doughnut
                animateRotate: true,
                //Boolean - Whether we animate scaling the Doughnut from the centre
                animateScale: true,
                //Boolean - whether to make the chart responsive to window resizing
                responsive: true,
                // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                maintainAspectRatio: true,
                //String - A legend template
                legendTemplate: ""
            };
            //Create pie or douhnut chart
            // You can switch between pie and douhnut using the method below.
            receitaCategoriaPieChart.Doughnut(receitaCategoriaPieData, receitaCategoriaPieOptions);
            
        }
    });
    


    //-------------
    //- Despesa por categoria CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var despesaCategoriaPieChartCanvas = $("#despesaCategoriaPieChart").get(0).getContext("2d");
    var despesaCategoriaPieChart = new Chart(despesaCategoriaPieChartCanvas);
    $.ajax({
        type: "get",
        url: "src/code/despesaPorCategorias.jsp",
        success: function (retorno) {
            var despesaCategoriaPieData = JSON.parse(retorno);
            var despesaCategoriaPieOptions = {
                //Boolean - Whether we should show a stroke on each segment
                segmentShowStroke: true,
                //String - The colour of each segment stroke
                segmentStrokeColor: "#fff",
                //Number - The width of each segment stroke
                segmentStrokeWidth: 2,
                //Number - The percentage of the chart that we cut out of the middle
                percentageInnerCutout: 50, // This is 0 for Pie charts
                //Number - Amount of animation steps
                animationSteps: 100,
                //String - Animation easing effect
                animationEasing: "easeOutQuint",
                //Boolean - Whether we animate the rotation of the Doughnut
                animateRotate: true,
                //Boolean - Whether we animate scaling the Doughnut from the centre
                animateScale: true,
                //Boolean - whether to make the chart responsive to window resizing
                responsive: true,
                // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                maintainAspectRatio: true,
                //String - A legend template
                legendTemplate: ""
            };
            //Create pie or douhnut chart
            // You can switch between pie and douhnut using the method below.
            despesaCategoriaPieChart.Doughnut(despesaCategoriaPieData, despesaCategoriaPieOptions);

        }
    });
    


    //-----------------------
    //- Resumo do Mês Chart -
    //-----------------------

    // Get context with jQuery - using jQuery's .get() method.
    var resumoChartCanvas = $("#resumoChart").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.
    var resumoChart = new Chart(resumoChartCanvas);
    $.ajax({
        type: "get",
        url: "src/code/transacoesMes.jsp",
        success: function (retorno) {
            var resumoChartData = JSON.parse(retorno);
            
            var totalReceitas = 0;
            var totalDespesas = 0;
            
            var receitas = resumoChartData.datasets[0].data;
            var despesas = resumoChartData.datasets[1].data;
            
            //somar receitas
            for(var i = 0; i < receitas.length; i++){
                totalReceitas += receitas[i];
            }
            //somar despesas
            for(var i = 0; i < despesas.length; i++){
                totalDespesas += despesas[i];
            }
            
            var saldo = totalReceitas - totalDespesas;
            
            $('#totalreceitas').text('R$'+totalReceitas);
            $('#totaldespesas').text('R$'+totalDespesas);
            $('#saldo').text('R$'+saldo);

            var resumoChartOptions = {
                //Boolean - If we should show the scale at all
                showScale: true,
                //Boolean - Whether grid lines are shown across the chart
                scaleShowGridLines: false,
                //String - Colour of the grid lines
                scaleGridLineColor: "rgba(0,0,0,.05)",
                //Number - Width of the grid lines
                scaleGridLineWidth: 1,
                //Boolean - Whether to show horizontal lines (except X axis)
                scaleShowHorizontalLines: true,
                //Boolean - Whether to show vertical lines (except Y axis)
                scaleShowVerticalLines: true,
                //Boolean - Whether the line is curved between points
                bezierCurve: true,
                //Number - Tension of the bezier curve between points
                bezierCurveTension: 0.3,
                //Boolean - Whether to show a dot for each point
                pointDot: false,
                //Number - Radius of each point dot in pixels
                pointDotRadius: 4,
                //Number - Pixel width of point dot stroke
                pointDotStrokeWidth: 1,
                //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
                pointHitDetectionRadius: 20,
                //Boolean - Whether to show a stroke for datasets
                datasetStroke: true,
                //Number - Pixel width of dataset stroke
                datasetStrokeWidth: 2,
                //Boolean - Whether to fill the dataset with a color
                datasetFill: true,
                //String - A legend template
                legendTemplate: "",
                //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                maintainAspectRatio: true,
                //Boolean - whether to make the chart responsive to window resizing
                responsive: true
            };

            //Create the line chart
            resumoChart.Line(resumoChartData, resumoChartOptions);

        }
    });
    
});



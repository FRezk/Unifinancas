<%-- 
    Document   : home
    Created on : May 15, 2016, 8:32:02 PM
    Author     : Fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Home
        <small>Resumo geral</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Resumo Geral</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    
    <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Resumo do Mês</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <div class="btn-group">
                  <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Comparar Mês anterior</a></li>
                    <li><a href="#">Comparar Receitas X Despesas</a></li>
<!--                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>-->
                  </ul>
                </div>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-12">
                  <p class="text-center">
                    <strong>Transações: Maio 2016</strong>
                  </p>
                  <div class="chart">
                    <!-- Sales Chart Canvas -->
                    <canvas id="resumoChart" style="height: 180px;"></canvas>
                  </div><!-- /.chart-responsive -->
                </div><!-- /.col -->
                
              </div><!-- /.row -->
            </div><!-- ./box-body -->
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-4 col-xs-4">
                  <div class="description-block border-right">
                    <h5 class="description-header">$35,210.43</h5>
                    <span class="description-text text-green">TOTAL RECEITAS</span>
                  </div><!-- /.description-block -->
                </div><!-- /.col -->
                <div class="col-sm-4 col-xs-4">
                  <div class="description-block border-right">
                    <h5 class="description-header">$10,390.90</h5>
                    <span class="description-text text-red">TOTAL DESPESAS</span>
                  </div><!-- /.description-block -->
                </div><!-- /.col -->
                <div class="col-sm-4 col-xs-4">
                  <div class="description-block border-right">
                    <h5 class="description-header">$24,813.53</h5>
                    <span class="description-text">SALDO</span>
                  </div><!-- /.description-block -->
                </div><!-- /.col -->
              </div><!-- /.row -->
            </div><!-- /.box-footer -->
          </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
    
    
    <div class="row">
        <div class="col-md-6">
            <!-- DONUT CHART -->
            <div class="box box-success">
                <div class="box-header with-border">
                    <h3 class="box-title">Receitas por Categoria</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>

                    </div>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12">
                            <canvas id="receitaCategoriaPieChart" style="height: 250px"></canvas>
                        </div>
                        <div class="col-md-12">
                            <ul class="todo-list no-edit categoria-lista">
                                <li>
                                    <div class="cat-cor" style="background-color: #a66abe"></div>
                                    <span class="control-label" title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #1abc9c"></div>
                                    <span class="control-label" title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #e67e22"></div>
                                    <span class="control-label" title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #e74c3c"></div>
                                    <span class="control-label" title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                            </ul>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        <div class="col-md-6">
            
            <!-- DONUT CHART -->
            <div class="box box-danger">
                <div class="box-header with-border">
                    <h3 class="box-title">Despesas por Categoria</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>

                    </div>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12">
                            <canvas id="despesaCategoriaPieChart" style="height: 250px"></canvas>
                        </div>
                        <div class="col-md-12">
                            <ul class="todo-list no-edit categoria-lista">
                                <li>
                                    <div class="cat-cor" style="background-color: #a66abe"></div>
                                    <span class="control-label" title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #1abc9c"></div>
                                    <span class="control-label" title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #e67e22"></div>
                                    <span class="control-label" title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #e74c3c"></div>
                                    <span class="control-label" title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                                <li>
                                    <div class="cat-cor" style="background-color: #3498db"></div>
                                    <span class="control-label"  title="Nome completo">Nome Categoria</span>
                                </li>
                            </ul>
                        </div>
                    </div>  
                </div>
            </div>
            
        </div>
    </div>
    
    
    <!-- PRODUCT LIST -->
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">Transações Recentes</h3>
            <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
        </div><!-- /.box-header -->
        <div class="box-body">
            <ul class="products-list product-list-in-box">
                <li class="item">
                    <div class="product-img Receita">
                        <i class="icon ion-thumbsup tipoTransacao-icon"></i>
                    </div>
                    <div class="product-info">
                        <a href="javascript::;" class="product-title">Nome Categoria<span class="label label-warning pull-right">$1800</span></a>
                        <span class="product-description">
                            Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum
                            Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum
                        </span>
                    </div>
                </li><!-- /.item -->
                <li class="item">
                    <div class="product-img Receita">
                        <i class="icon ion-thumbsup tipoTransacao-icon"></i>
                    </div>
                    <div class="product-info">
                        <a href="javascript::;" class="product-title">Nome Categoria<span class="label label-warning pull-right">$1800</span></a>
                        <span class="product-description">
                            Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum
                            Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum
                        </span>
                    </div>
                </li><!-- /.item -->
                <li class="item">
                    <div class="product-img Despesa">
                        <i class="icon ion-thumbsdown tipoTransacao-icon"></i>
                    </div>
                    <div class="product-info">
                        <a href="javascript::;" class="product-title">Nome Categoria<span class="label label-warning pull-right">$1800</span></a>
                        <span class="product-description">
                            Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum
                            Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum
                        </span>
                    </div>
                </li><!-- /.item -->
                
            </ul>
        </div><!-- /.box-body -->
        <div class="box-footer text-center">
            <a href="javascript::;" class="uppercase">Ver todas as Transações</a>
        </div><!-- /.box-footer -->
    </div><!-- /.box -->
    
    

</section><!-- /.content -->

<script>
    
        //-------------
        //- Receita por categoria CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.
        var receitaCategoriaPieChartCanvas = $("#receitaCategoriaPieChart").get(0).getContext("2d");
        var receitaCategoriaPieChart = new Chart(receitaCategoriaPieChartCanvas);
        var receitaCategoriaPieData = [
          {
            value: 700,
            color: "#f56954",
            highlight: "#f56954",
            label: "Alimentação"
          },
          {
            value: 500,
            color: "#00a65a",
            highlight: "#00a65a",
            label: "Transporte"
          },
          {
            value: 400,
            color: "#f39c12",
            highlight: "#f39c12",
            label: "Outros"
          },
          {
            value: 600,
            color: "#00c0ef",
            highlight: "#00c0ef",
            label: "Saúde"
          },
          {
            value: 300,
            color: "#3c8dbc",
            highlight: "#3c8dbc",
            label: "Lazer"
          },
          {
            value: 100,
            color: "#d2d6de",
            highlight: "#d2d6de",
            label: "Academia"
          }
        ];
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
        
        $(function(){
        //-------------
        //- Despesa por categoria CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.
        var despesaCategoriaPieChartCanvas = $("#despesaCategoriaPieChart").get(0).getContext("2d");
        var despesaCategoriaPieChart = new Chart(despesaCategoriaPieChartCanvas);
        var despesaCategoriaPieData = [
          {
            value: 700,
            color: "#f56954",
            highlight: "#f56954",
            label: "Alimentação"
          },
          {
            value: 500,
            color: "#00a65a",
            highlight: "#00a65a",
            label: "Transporte"
          },
          {
            value: 400,
            color: "#f39c12",
            highlight: "#f39c12",
            label: "Outros"
          },
          {
            value: 600,
            color: "#00c0ef",
            highlight: "#00c0ef",
            label: "Saúde"
          },
          {
            value: 300,
            color: "#3c8dbc",
            highlight: "#3c8dbc",
            label: "Lazer"
          },
          {
            value: 100,
            color: "#d2d6de",
            highlight: "#d2d6de",
            label: "Academia"
          }
        ];
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
        
        
        //-----------------------
        //- Resumo do Mês Chart -
        //-----------------------

        // Get context with jQuery - using jQuery's .get() method.
        var resumoChartCanvas = $("#resumoChart").get(0).getContext("2d");
        // This will get the first returned node in the jQuery collection.
        var resumoChart = new Chart(resumoChartCanvas);

        var resumoChartData = {
          labels: ["January", "February", "March", "April", "May", "June", "July"],
          datasets: [
            {
              label: "Receitas",
              fillColor: "#11BF9D",
              strokeColor: "#11BF9D",
              pointColor: "#11BF9D",
              pointStrokeColor: "#11BF9D",
              pointHighlightFill: "#A7F2E3",
              pointHighlightStroke: "white",
              data: [65, 59, 80, 81, 56, 55, 40]
            },
            {
              label: "Despesas",
              fillColor: "#E35849",
              strokeColor: "#E35849",
              pointColor: "#E35849",
              pointStrokeColor: "#E35849",
              pointHighlightFill: "#E35849",
              pointHighlightStroke: "white",
              data: [28, 48, 40, 19, 86, 27, 90]
            }
          ]
        };

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
    });
</script>

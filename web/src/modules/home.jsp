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
                    <canvas id="salesChart" style="height: 180px;"></canvas>
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
                    <canvas id="pieChart" style="height: 250px"></canvas>
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
                    <canvas id="pieChart" style="height: 250px"></canvas>
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

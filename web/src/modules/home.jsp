<%-- 
    Document   : home
    Created on : May 15, 2016, 8:32:02 PM
    Author     : Fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
        <div class="col-md-7">
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
                    <h5 class="description-header" id="totalreceitas">$0</h5>
                    <span class="description-text text-green">TOTAL RECEITAS</span>
                  </div><!-- /.description-block -->
                </div><!-- /.col -->
                <div class="col-sm-4 col-xs-4">
                  <div class="description-block border-right">
                    <h5 class="description-header" id="totaldespesas">$0</h5>
                    <span class="description-text text-red">TOTAL DESPESAS</span>
                  </div><!-- /.description-block -->
                </div><!-- /.col -->
                <div class="col-sm-4 col-xs-4">
                  <div class="description-block border-right">
                    <h5 class="description-header" id="saldo">$0</h5>
                    <span class="description-text">SALDO</span>
                  </div><!-- /.description-block -->
                </div><!-- /.col -->
              </div><!-- /.row -->
            </div><!-- /.box-footer -->
          </div><!-- /.box -->
        </div><!-- /.col -->
        
        <div class="col-md-5">
            <!-- PRODUCT LIST -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Transações Recentes</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body" style="min-height: 200px">
                    <ul class="products-list product-list-in-box">
                        <jsp:useBean id="transacaoDAO" scope="page" class="modelo.TransacaoDAO" />

                        <c:forEach items="${transacaoDAO.listarRecentes(4)}" var="transacao">
                            <c:choose>
                                <c:when test="${transacao.getIdUsuario().getIdUsuario() == sessionScope.idUsuario }">


                                    <li class="item">
                                        <div class="product-img tipotransacao${transacao.getIdTipoTransacao().getIdTipoTransacao()}">
                                            <i class="icon ${transacao.getIdTipoTransacao().getIdTipoTransacao() == 2? "ion-thumbsup" : "ion-thumbsdown" } tipoTransacao-icon"></i>
                                        </div>
                                        <div class="product-info">
                                            <a href="" class="product-title">
                                                ${transacao.getIdCategoria().getNome()}
                                                <i class="fa fa-tag" style="color:${transacao.getIdCategoria().getCor()}; margin-left: 8px">
                                                </i>
                                                <c:choose>
                                                    <c:when test="${transacao.getIdEspecie().getIdEspecie() == 1}">
                                                        <span>${transacao.getIdEspecie().getNome()}</span>
                                                    </c:when>
                                                    <c:when test="${transacao.getIdEspecie().getIdEspecie() == 2}">
                                                        <span><img src="${transacao.getIdCartao().getIdBandeira().getLogoUrl()}" class="bandeira-logo" title="${transacao.getIdCartao().getIdBandeira().getNome()}"/>${transacao.getIdCartao().getNome()}</span>
                                                        </c:when>
                                                    </c:choose>
                                                <span class="label pull-right" style="background-color: #333">R$${transacao.getValor()}</span>
                                            </a>
                                            <span class="product-description">
                                                ${transacao.getDescricao()}
                                            </span>
                                        </div>
                                    </li> <!-- /.item -->
                                </c:when>
                            </c:choose>

                        </c:forEach>

                    </ul>
                </div><!-- /.box-body -->
                <div class="box-footer text-center">
                    <a href="transacoes.jsp" class="uppercase">Ver todas as Transações</a>
                </div><!-- /.box-footer -->
            </div><!-- /.box -->
        </div>
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
                                <jsp:useBean id="categoriaDAO" scope="page" class="modelo.CategoriaDAO" />
                                <c:set var="listaCategoria"  value="${categoriaDAO.listarAtivo()}" scope="page"/>

                                <c:forEach items="${listaCategoria}" var="categoria">
                                    <c:choose>
                                        <c:when test="${categoria.getIdUsuario() == sessionScope.idUsuario || categoria.getIdUsuario() == 0}">
                                            <li data-idcat="${categoria.getIdCategoria()}">
                                                <div class="cat-cor" style="background-color: ${categoria.getCor()}"></div>
                                                <span class="control-label">${categoria.getNome()}</span>
                                                <div class="tools">
                                                    <!--<i class="fa fa-times delcat_bt"></i>-->
                                                </div>
                                            </li>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                
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

                                <c:forEach items="${listaCategoria}" var="categoria">
                                    <c:choose>
                                        <c:when test="${categoria.getIdUsuario() == sessionScope.idUsuario  || categoria.getIdUsuario() == 0}">
                                            <li data-idcat="${categoria.getIdCategoria()}">
                                                <div class="cat-cor" style="background-color: ${categoria.getCor()}"></div>
                                                <span class="control-label">${categoria.getNome()}</span>
                                                <div class="tools">
<!--                                                    <i class="fa fa-times delcat_bt"></i>-->
                                                </div>
                                            </li>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                
                            </ul>
                        </div>
                    </div>  
                </div>
            </div>
            
        </div>
    </div>
    
    <div class="row">
        
    </div>
    
    
    

</section><!-- /.content -->


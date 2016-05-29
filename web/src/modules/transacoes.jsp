<%-- 
    Document   : home
    Created on : May 15, 2016, 8:32:02 PM
    Author     : Fernando
--%>

<%@page import="dao.Especie"%>
<%@page import="modelo.EspecieDAO"%>
<%@page import="dao.Transacao"%>
<%@page import="modelo.TransacaoDAO"%>
<%@page import="dao.Bandeira"%>
<%@page import="modelo.BandeiraDAO"%>
<%@page import="dao.Cartao"%>
<%@page import="modelo.CartaoDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.Categoria"%>
<%@page import="modelo.CategoriaDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="loading"><i class="fa fa-circle-o-notch fa-spin"></i></div>

<!-- Modal -->
<div class="modal fade" id="ReceitaModal" tabindex="-1" role="dialog" aria-labelledby="ReceitaModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Nova Receita</h4>
      </div>
        
      <!-- form start -->
      <form id="receitaForm" class="form-horizontal">
      <div class="modal-body">
        
          
              <div class="box-body">
                  <div class="form-group">
                      
                      <div class="col-sm-12">
                          <label for="descricao" class="control-label">Descrição</label>
                          <input name="transacao" type="hidden" value="RECEITA">
                          <textarea name="descricao" class="form-control" id="descricao" placeholder="..."></textarea>
                      </div>
                  </div>
                  
                  <div class="form-group">
                      
                      <div class="col-sm-6">
                          <label for="valor" class="control-label">Valor</label>
                          <input name="valor" type="text" class="form-control" id="valor" placeholder="0.00">
                      </div>
                      <div class="col-sm-4">
                          <label>Data</label>
                          <div class="input-group">
                              <div class="input-group-addon">
                                  <i class="fa fa-calendar"></i>
                              </div>
                              <input name="dtcadastro" type="text" id="data" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                          </div><!-- /.input group -->
                      </div>
                  </div>
                  
                  <div class="form-group">

                      <div class="col-sm-10">
                          <label for="categoria" class="control-label">Categoria</label>
                          <select name="categoria" class="form-control select2" style="width: 100%;">
                              
                              <jsp:useBean id="categoriaDAO" scope="page" class="modelo.CategoriaDAO" />
                              
                              <c:set var="listaCategoria"  value="${categoriaDAO.listar()}" scope="page"/>
                              
                              <c:forEach items="${listaCategoria}" var="categoria">
                                  <c:choose>
                                    <c:when test="${categoria.getIdUsuario() == 0 || categoria.getIdUsuario() == sessionScope.idUsuario}">
                                        <option data-cor="${categoria.getCor()}" value="${categoria.getIdCategoria()}">${categoria.getNome()}</option>
                                    </c:when>
                                  </c:choose>
                              </c:forEach>
                                  
                          </select>
                      </div>
                  </div>
              </div><!-- /.box-body -->
              <!--<div class="box-footer">-->
                  <!--<button type="submit" class="btn btn-info pull-right">Sign in</button>-->
              <!--</div> /.box-footer -->
          
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn bg-olive btn-primary">Cadastrar</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="DespesaModal" tabindex="-1" role="dialog" aria-labelledby="DespesaModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Nova Despesa</h4>
            </div>
            <!-- form start -->
            <form id="despesaForm" class="form-horizontal">
                <div class="modal-body">


                    <div class="box-body">
                        <div class="form-group">

                            <div class="col-sm-12">
                                <label for="descricao" class="control-label">Descrição</label>
                                <input name="transacao" type="hidden" value="DESPESA">
                                <textarea name="descricao" class="form-control" id="descricao" placeholder="..."></textarea>

                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-sm-4">
                                <label for="valor" class="control-label">Valor</label>
                                <input name="valor" type="text" class="form-control" id="valor" placeholder="0.00">
                            </div>
                            <div class="col-sm-4">
                                <label class="control-label">Espécie</label>
                                <select name="especie" id="especie" class="form-control" style="width: 100%;">
                                    <jsp:useBean id="especieDAO" scope="page" class="modelo.EspecieDAO"/>
                                    <c:set var="listaEspecie" value="${especieDAO.listar()}" scope="page"/>
                                    
                                    <c:forEach items="${listaEspecie}" var="especie">
                                        <option value="${especie.getIdEspecie()}">${especie.getNome()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div id="cartao-input" class="col-sm-4" style="display:none">
                                <label class="control-label">Cartão</label>
                                <select class="form-control select2-cartao" style="width: 100%;">
                                    
                                    <jsp:useBean id="cartaoDAO" scope="page" class="modelo.CartaoDAO" />
                                    <c:set var="listaCartao"  value="${cartaoDAO.listar()}" scope="page"/>
                                    
                                    <c:forEach items="${listaCartao}" var="cartao">
                                        <c:choose>
                                            <c:when test="${cartao.getIdUsuario().getIdUsuario() == sessionScope.idUsuario}">
                                                <option data-url-logo="${cartao.getIdBandeira().getLogoUrl()}" value="${cartao.getIdCartao()}">${cartao.getNome()}</option>
                                            </c:when>
                                        </c:choose>
                                        
                                    </c:forEach>
                                        
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <label>Data</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input name="dtcadastro" type="text" id="data" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                                </div><!-- /.input group -->
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-sm-10">
                                <label for="categoria" class="control-label">Categoria</label>
                                <select name="categoria" class="form-control select2" style="width: 100%;">
                                <c:set var="listaCategoria"  value="${categoriaDAO.listar()}" scope="page"/>
                                <c:forEach items="${listaCategoria}" var="categoria">
                                  <c:choose>
                                    <c:when test="${categoria.getIdUsuario() == 0 || categoria.getIdUsuario() == sessionScope.idUsuario}">
                                        <option data-cor="${categoria.getCor()}" value="${categoria.getIdCategoria()}">${categoria.getNome()}</option>
                                    </c:when>
                                  </c:choose>
                              </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div><!-- /.box-body -->
                    <!--<div class="box-footer">-->
                    <!--<button type="submit" class="btn btn-info pull-right">Sign in</button>-->
                    <!--</div> /.box-footer -->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn bg-olive btn-primary">Cadastrar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Transações
        <small>Movimentação</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="home.jsp"><i class="fa fa-dashboard"></i>Home</a></li>
        <li class="active">Transações</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <a class="btn bg-green btn-app" data-toggle="modal" data-target="#ReceitaModal">
                <i class="fa fa-plus-circle"></i> Nova Receita
            </a>
            <a class="btn bg-red btn-app" data-toggle="modal" data-target="#DespesaModal">
                <i class="fa fa-minus-circle"></i> Nova Despesa
            </a>
        </div>
    </div>
    
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Maio <small>2016</small></h3>
                    <div class="box-tools">
                        <div class="input-group" style="width: 150px;">
                            <input type="text" name="table_search" class="form-control input-sm pull-right" placeholder="Pesquisar">
                            <div class="input-group-btn">
                                <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover">
                        <tr>
                            <th>Dia/hora</th>
                            <th>Tipo</th>
                            <th>Descrição</th>
                            <th>Categoria</th>
                            <th>Valor</th>
                            <th>Espécie</th>
                        </tr>

                        <jsp:useBean id="transacaoDAO" scope="page" class="modelo.TransacaoDAO" />
                        
                        <c:forEach items="${transacaoDAO.listarDesc()}" var="transacao">
                            <c:choose>
                                <c:when test="${transacao.getIdUsuario().getIdUsuario() == sessionScope.idUsuario }">
                                    <tr>
                                        <td><fmt:formatDate value="${transacao.getDttransacao()}" pattern="dd/MM/yyyy"/></td>
                                        <td><span class="label label-${transacao.getIdTipoTransacao().getNome()}"> ${transacao.getIdTipoTransacao().getNome() } </span></td>
                                        <td>${transacao.getDescricao()}</td>
                                        <td><i class="fa fa-tag" style="color:${transacao.getIdCategoria().getCor()}"></i> ${transacao.getIdCategoria().getNome()}</td>
                                        <td align="right">R$${transacao.getValor()}</td>
                                        <c:choose>
                                            <c:when test="${transacao.getIdEspecie().getIdEspecie() == 1}">
                                                <td>${transacao.getIdEspecie().getNome()}</td> 
                                            </c:when>
                                            <c:when test="${transacao.getIdEspecie().getIdEspecie() == 2}">
                                                <td>${transacao.getIdEspecie().getNome()}<img src="${transacao.getIdCartao().getIdBandeira().getLogoUrl()}" class="bandeira-logo" title="${transacao.getIdCartao().getIdBandeira().getNome()}/${transacao.getIdCartao().getNome()}"/></td> 
                                                </c:when>
                                            </c:choose>
                                    </tr>
                                </c:when>
                            </c:choose>
                            
                        </c:forEach>
                        
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>
    
</section>

<script>
    $(function(){
        function formatState (state) {
            if (!state.id) { return state.text; }
            var $state = $(
              '<span><div style="background-color:' + state.element.getAttribute('data-cor') + '" class="categoria-tag"></div> ' + state.text + '</span>'
            );
            return $state;
        };
        function formatStateCartao (state) {
            if (!state.id) { return state.text; }
            var $state = $(
              '<span><img src="' + state.element.getAttribute('data-url-logo') + '" class="bandeira-logo"/> ' + state.text + '</span>'
            );
            return $state;
        };
        //Initialize Select2 Elements
        $(".select2").select2({
            templateResult: formatState,
            templateSelection: formatState
        });
        
        $(".select2-cartao").select2({
            templateResult: formatStateCartao,
            templateSelection: formatStateCartao
        });
        
        //Datemask dd/mm/yyyy
        $("[data-mask]").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        $("#valor").inputmask();
        
        $('#especie').on('change', function(){
           if(this.options[this.selectedIndex].value == "2"){
               $('#cartao-input').css('display', 'block');
               $('#cartao-input select').attr('name', 'cartao');
           }else{
               $('#cartao-input').css('display', 'none');
               $('#cartao-input select').attr('name', '');
           }
        });
    });
</script>

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
        Cartões
        <small>Gerênciar</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="home.jsp"><i class="fa fa-dashboard"></i>Home</a></li>
        <li class="active">Cartões</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">

    <div class="row">
        <div class="col-xs-6">
            <div class="box box-primary">
                <div class="box-header">
                    <i class="ion ion-card"></i>
                    <h3 class="box-title">Meus</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <ul class="todo-list">
                        <form id="newcartao_form">
                            <div class="form-group">
                                <div class="col-sm-5">
                                    <select name="idbandeira" class="form-control select2-cartao" >
                                        <jsp:useBean id="bandeiraDAO" scope="page" class="modelo.BandeiraDAO" />
                                        <c:set var="listaBandeira"  value="${bandeiraDAO.listar()}" scope="page"/>

                                        <c:forEach items="${listaBandeira}" var="bandeira">
                                            <option data-url-logo="${bandeira.getLogoUrl()}" value="${bandeira.getIdBandeira()}">${bandeira.getNome()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-sm-5">
                                    <input name="nomecartao" type="text" class="form-control" id="valor" placeholder="nome..." >
                                </div>
                                <div class="col-sm-2">
                                    <input type="submit" class="btn btn-default" value="Add" >
                                </div>
                            </div>
                            
                            
                        </form>
                    </ul>
                    <br>
                    <ul id="customCartao-list" class="todo-list">
                        <jsp:useBean id="cartaoDAO" scope="page" class="modelo.CartaoDAO" />
                        <c:set var="listaCartao"  value="${cartaoDAO.listarActive()}" scope="page"/>

                        <c:forEach items="${listaCartao}" var="cartao">
                            <c:choose>
                                <c:when test="${cartao.getIdUsuario().getIdUsuario() == sessionScope.idUsuario}">
                                    <li data-idcartao="${cartao.getIdCartao()}">
                                        <img class="bandeira-logo" title="${cartao.getIdBandeira().getNome()}" src="${cartao.getIdBandeira().getLogoUrl()}"/>
                                        <span class="control-label">${cartao.getNome()}</span>
                                        <div class="tools">
                                            <i class="fa fa-times delcartao_bt"></i>
                                        </div>
                                    </li>
                                </c:when>
                            </c:choose>

                        </c:forEach>
                    </ul>
                </div><!-- /.box-body -->
            </div>
        </div>


</section>
<script>
    $(function(){
        function formatStateCartao (state) {
            if (!state.id) { return state.text; }
            var $state = $(
              '<span><img src="' + state.element.getAttribute('data-url-logo') + '" class="bandeira-logo-select2"/> ' + state.text + '</span>'
            );
            return $state;
        };
        $(".select2-cartao").select2({
             templateResult: formatStateCartao,
             templateSelection: formatStateCartao
         }); 
    });
</script>
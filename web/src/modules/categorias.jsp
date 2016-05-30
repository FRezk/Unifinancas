<%-- 
    Document   : home
    Created on : May 15, 2016, 8:32:02 PM
    Author     : Fernando Rezk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Categorias
        <small>Gerênciar</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="home.jsp"><i class="fa fa-dashboard"></i>Home</a></li>
        <li class="active">Categorias</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    
    <div class="row">
        <div class="col-md-6">
            <div class="box box-primary">
                <div class="box-header">
                    <i class="ion ion-clipboard"></i>
                    <h3 class="box-title">Custom</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <ul class="todo-list no-edit">
                        <li>
                            <form id="newcat_form">
                                <div class="cat-cor my-colorpicker" style="background-color: #DDD"></div>
                                <input name="catcolor" type="hidden" value=""> 
                                <input name="catnome" type="text" class="form-control catnome" placeholder="nome...">
                                <input type="submit" class="btn btn-default" value="Add">
                            </form>
                            
                        </li>
                    </ul>
                    <ul id="customCat-list" class="todo-list">
                        <jsp:useBean id="categoriaDAO" scope="page" class="modelo.CategoriaDAO" />
                        <c:set var="listaCategoria"  value="${categoriaDAO.listarAtivo()}" scope="page"/>

                        <c:forEach items="${listaCategoria}" var="categoria">
                            <c:choose>
                                <c:when test="${categoria.getIdUsuario() == sessionScope.idUsuario }">
                                    <li data-idcat="${categoria.getIdCategoria()}">
                                        <div class="cat-cor" style="background-color: ${categoria.getCor()}"></div>
                                        <span class="control-label">${categoria.getNome()}</span>
                                        <div class="tools">
                                            <i class="fa fa-times delcat_bt"></i>
                                        </div>
                                    </li>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </ul>
                    
                </div><!-- /.box-body -->
            </div>
        </div>
        <div class="col-md-6">
            <div class="box box-primary">
                <div class="box-header">
                    <i class="fa fa-tags"></i>
                    <h3 class="box-title">Default</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <ul class="todo-list no-edit">
                        <c:set var="listaCategoria"  value="${categoriaDAO.listar()}" scope="page"/>
                        <c:forEach items="${listaCategoria}" var="categoria">
                            <c:choose>
                                <c:when test="${categoria.getIdUsuario() == 0}">
                                    <li>
                                        <div class="cat-cor" style="background-color: ${categoria.getCor()}"></div>
                                        <span class="control-label">${categoria.getNome()}</span>
                                    </li>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </div><!-- /.box-body -->
            </div>
        </div>
    </div>
    
    
</section>

<script>
    $(function(){
       //color picker with addon
        $("#newcat_form .my-colorpicker").colorpicker().on('changeColor', function(e) {
            $("#newcat_form input[name=catcolor]").val(e.color.toHex());
            $(this)[0].style.backgroundColor = e.color.toHex();
            
        });
        
        var delcat = function(){
           var $container =  $(this).parent().parent();
           var _idcat = $container.attr('data-idcat');
           $.ajax({
               url: 'src/code/categoriaWS.jsp',
               type: 'post',
               data: {
                   funcao: 'APAGAR',
                   idcat: _idcat
               },
               success: function(retorno){
                   var r = JSON.parse(retorno);
                    
                    if(r.idStatus == 0){
                        alert(r.dsStatus);
                    } else if(r.idStatus == 1){
                        $container.remove();
                        console.log(r.dsStatus, r.idcat);
                    }
               }
            });
           console.log($container.attr('data-idcat'));
        };
        $('.delcat_bt').on('click', delcat);
        
        $('#newcat_form').on('submit', function(e){
            var _catcor = this.catcolor.value;
            var _catnome = this.catnome.value;
            if(!_catcor){
                alert('escolha uma cor');
                return false;
            }
            if(!_catnome){
                alert('escolha um nome');
                return false;
            }
            $.ajax({
               url: 'src/code/categoriaWS.jsp',
               type: 'post',
               data: {
                   funcao: 'CADASTRAR',
                   catcor: _catcor,
                   catnome: _catnome
               },
               success: function(retorno){
                   var r = JSON.parse(retorno);
                    
                    if(r.idStatus == 0){
                        alert(r.dsStatus);
                    } else if(r.idStatus == 1){
                        var newcat = '<li data-idcat="'+r.idcat+'"><div class="cat-cor" style="background-color:'+_catcor+'"></div><span class="control-label">'+_catnome+'</span><div class="tools"><i class="fa fa-times delcat_bt"></i></div></li>';
                        $('#customCat-list').prepend(newcat);
                        //o novo registro de categoria vem com um botao de deletar categoria, mas precisa ser adicionado o evento de deletar categoria somente a ele
                        $('#customCat-list li[data-idcat='+r.idcat+'] .delcat_bt').on('click', delcat);
                        $('#newcat_form')[0].reset();
                        $("#newcat_form input[name=catcolor]").val('');
                        $("#newcat_form .my-colorpicker")[0].style.backgroundColor = "#DDD";
                    }
               }
            });
            //apos cadastrar
            //$('#customCat-list').prepend('<li data-idcat=""><div class="cat-cor" style="background-color:'+catcolor+'"></div><span class="control-label">'+catnome+'</span><div class="tools"><i class="fa fa-times"></i></div></li>');
            
            e.preventDefault();
        });
    });
</script>
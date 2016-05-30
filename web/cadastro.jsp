<%-- 
    Document   : index
    Created on : May 15, 2016, 8:47:43 PM
    Author     : Fernando Rezk
--%>
<%@ page pageEncoding="UTF-8"%>
<% HttpSession nsession = request.getSession(false);
if(nsession.getAttribute("nomeUsuario")!=null){
    response.sendRedirect("home.jsp");
}
%>
<!DOCTYPE html>
<!-- Index -->
<html>
<head>
	<title>Cadastro</title>
        <link rel="shortcut icon" type="image/png" href="src/img/favicon.png"/>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- STYLES -->
	<link rel="stylesheet" type="text/css" href="src/lib/style/normalize.css"/>
	<link rel="stylesheet" type="text/css" href="src/lib/bootstrap/css/bootstrap-theme.min.css"/>
	<link rel="stylesheet" type="text/css" href="src/lib/bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="src/style/componentes.css">
        <link href="template/plugins/iCheck/all.css" rel="stylesheet" type="text/css"/>
        
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="src/lib/font-awesome/css/font-awesome.min.css"/>
        <!-- Ionicons -->
        <link rel="stylesheet" type="text/css" href="template/ionicons/css/ionicons.min.css"/>
        <!-- Theme style -->
        <link rel="stylesheet" href="template/dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="template/dist/css/skins/skin-black.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="template/plugins/iCheck/flat/blue.css">

        <!-- CUSTOM STYLE -->
        <link rel="stylesheet" type="text/css" href="src/style/login.css"/>
		
</head>
<body>
    <div class="loading"><i class="fa fa-circle-o-notch fa-spin"></i></div>
	<div class="login-container">
                <a href="index.jsp"><img src="src/img/logo.png"></a>

		<form name="cadastro" method="get" id="cadastroForm">
			<!-- Email -->
                        <div class="input-group">
			  <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
			  <input name="emailUsuario" type="text" class="form-control" placeholder="E-mail">
			</div>
                        <!-- Nome Completo -->
			<div class="input-group">
			  <span class="input-group-addon"><i class="fa fa-user"></i></span>
			  <input name="nomeUsuario" type="text" class="form-control" placeholder="Nome Completo">
			</div>
			<!-- Password -->	
			<div class="input-group">
			  <span class="input-group-addon"><i class="fa fa-lock"></i></span>
			  <input name="senhaUsuario" type="password" class="form-control" placeholder="Senha">
			</div>
                        <!-- ReType Password -->	
			<div class="input-group">
			  <span class="input-group-addon"><i class="fa fa-lock"></i></span>
			  <input name="confirmaSenhaUsuario" type="password" class="form-control" placeholder="Confirmar senha">
			</div>
                        <input type="checkbox" name="termos">
                            <span>Eu aceito os <a href="#termos">termos de contrato</a>.</span>
			<input type="submit" class="btn btn-primary" value="Cadastrar">
			<div class="clear"></div>
		</form>
	</div>


	<!-- FRAMEWORKS -->
	<script type="text/javascript" src="src/lib/jquery/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="src/lib/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="src/js/cadastro.js"></script>
</body>
</html>
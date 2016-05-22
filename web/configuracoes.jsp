<%-- 
    Document   : configuracoes
    Created on : 21/05/2016, 15:49:57
    Author     : Jefferson
--%>

<%@ page pageEncoding="UTF-8"%>
<%@include file="src/code/checkSession.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Configurações</title>
    <link rel="shortcut icon" type="image/png" href="src/img/favicon.png"/>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="template/bootstrap/css/bootstrap.min.css">
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
    <!-- Morris chart -->
    <!-- <link rel="stylesheet" href="template/plugins/morris/morris.css"> -->
    <!-- jvectormap -->
    <!-- <link rel="stylesheet" href="template/plugins/jvectormap/jquery-jvectormap-1.2.2.css"> -->
    <!-- Date Picker -->
    <!-- <link rel="stylesheet" href="template/plugins/datepicker/datepicker3.css"> -->
    <!-- Daterange picker -->
    <!-- <link rel="stylesheet" href="template/plugins/daterangepicker/daterangepicker-bs3.css"> -->
    <!-- bootstrap wysihtml5 - text editor -->
    <!-- <link rel="stylesheet" href="template/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"> -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- CUSTOM STYLE -->
    
    <%@include file="src/modules/main-scripts.jsp" %>

  </head>
  <body class="hold-transition skin-black sidebar-mini">
    <div class="wrapper">

      <%@include file="src/modules/main-header.jsp" %>
      <%@include file="src/modules/main-sidebar.jsp" %>

      <!-- Conteúdo da Página -->
      <div class="content-wrapper">
        <%@include file="src/modules/configuracoes.jsp" %>
        
      </div><!-- /.content-wrapper -->
      <%@include file="src/modules/main-footer.jsp" %>
      <%@include file="src/modules/control-sidebar.jsp" %>
      


      
    </div><!-- ./wrapper -->

    


  </body>
</html>

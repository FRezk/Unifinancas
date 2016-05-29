<%@ page pageEncoding="UTF-8"%>
<header class="main-header">
  <!-- Logo -->
  <a href="home.jsp" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><img src="src/img/logo-50x50.png" width="50px" height="50px"/></span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><b>Unifinanças</b></span>
  </a>
  <!-- Header Navbar: style can be found in header.less -->
  <nav class="navbar navbar-static-top" role="navigation">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
      <span class="sr-only">Toggle navigation</span>
    </a>
    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">

        <!-- User Account: style can be found in dropdown.less -->
        <li class="dropdown user user-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <img src="src/img/profile/default-profile.png" class="user-image" alt="User Image">
            <span class="hidden-xs"><%=session.getAttribute("nomeUsuario")%></span>
          </a>
          <ul class="dropdown-menu">
            <!-- User image -->
            <li class="user-header">
              <img src="src/img/profile/default-profile.png" class="img-circle" alt="User Image">
              <p>
                <%=session.getAttribute("nomeUsuario")%>
                <small>Membro desde. 2015</small>
              </p>
            </li>
            <!-- Menu Body -->
            <!-- <li class="user-body">
              <div class="col-xs-4 text-center">
                <a href="#"></a>
              </div>
              <div class="col-xs-4 text-center">
                <a href="#"></a>
              </div>
              <div class="col-xs-4 text-center">
                <a href="#"></a>
              </div>
            </li> -->
            <!-- Menu Footer-->
            <li class="user-footer">
              <div class="pull-left">
                <a href="#" class="btn btn-default btn-flat">Perfil</a>
              </div>
              <div class="pull-right">
                <a href="src/code/logout.jsp" class="btn btn-default btn-flat">Sair</a>
              </div>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>
</header>



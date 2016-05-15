<%-- 
    Document   : incluirUsuario
    Created on : May 15, 2016, 6:38:08 PM
    Author     : Fernando
--%>

<%@page import="dao.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%                      
    String nomeUsuario = (String) request.getParameter("nomeUsuario");
    String senhaUsuario = (String) request.getParameter("senhaUsuario");
    
    UsuarioDAO dao = new UsuarioDAO();
    Usuario obj = new Usuario();
    obj.setNome(nomeUsuario);
    obj.setSenha(senhaUsuario);
    
    dao.incluir(obj);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

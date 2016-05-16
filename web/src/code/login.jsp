<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String emailUsuario = (String) request.getParameter("emailUsuario");
  String senhaUsuario = (String) request.getParameter("senhaUsuario");
  
  UsuarioDAO dao = new UsuarioDAO();
  List<Usuario> lista;
  JSONObject json = new JSONObject();
       json.put("idStatus", 0);
       json.put("dsStatus", "Usuário ou senha Inválido");
  lista = dao.listar();
  for(Usuario user : lista){
      if(user.getEmail().equalsIgnoreCase(emailUsuario) && user.getSenha().equalsIgnoreCase(senhaUsuario)){
       json.put("idStatus", 1);
       json.put("dsStatus", "Sucesso");
       session.setAttribute( "nomeUsuario", user.getNome() );
       session.setAttribute("emailUsuario", user.getEmail() );
       break;
       }
  }
out.print(json);
%>
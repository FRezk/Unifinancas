<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String nomeUsuario = (String) request.getParameter("nomeUsuario");
  String senhaUsuario = (String) request.getParameter("senhaUsuario");
  
  UsuarioDAO dao = new UsuarioDAO();
  List<Usuario> lista;
  Usuario usuario = new Usuario();
  JSONObject json = new JSONObject();
       json.put("idStatus", 0);
       json.put("dsStatus", "Usuário ou senha Inválido");
  lista = dao.listar();
  for(Usuario user : lista){
      if(user.getNome().equalsIgnoreCase(nomeUsuario) && user.getSenha().equalsIgnoreCase(senhaUsuario)){
       json.put("idStatus", 1);
       json.put("dsStatus", "Sucesso");
       session.setAttribute( "nomeUsuario", nomeUsuario );
       break;
       }
  }
out.print(json);
%>
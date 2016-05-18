<%-- 
    Document   : incluirUsuario
    Created on : May 15, 2016, 6:38:08 PM
    Author     : Fernando
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>
<%@page import="dao.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%                      
    String emailUsuario = (String) request.getParameter("emailUsuario");
    String nomeUsuario = (String) request.getParameter("nomeUsuario");
    String senhaUsuario = (String) request.getParameter("senhaUsuario");
    String confirmaSenhaUsuario = (String) request.getParameter("confirmaSenhaUsuario");
    JSONObject json = new JSONObject();
    /**
     * ID 0 - Usuário já cadastrado.
     * ID 1 - Cadastro realizado com sucesso.
     * ID 2 - Senhas divergentes.
     * ID 3 - Email em branco.
     * ID 4 - Nome em branco.
     * ID 5 - Senha em Branco.
     */
    if(emailUsuario.equals("")){
        json.put("idStatus", 3);
        json.put("dsStatus", "Por favor, informar um e-mail.");
        out.print(json);
        return;
    }
    if(nomeUsuario.equals("")){
        json.put("idStatus", 4);
        json.put("dsStatus", "Por favor, informar um nome completo.");
        out.print(json);
        return;
    }
    if(senhaUsuario.equals("")){
        json.put("idStatus", 5);
        json.put("dsStatus", "Por favor, informar uma senha.");
        out.print(json);
        return;
    }
    
    
    if(!senhaUsuario.equals(confirmaSenhaUsuario)){
       json.put("idStatus", 2);
       json.put("dsStatus", "Senhas divergente. Por favor, digite novamente.");
       out.print(json);
       return;
    }
    
    List<Usuario> lista;
    UsuarioDAO dao = new UsuarioDAO();
    lista = dao.listar();
    for(Usuario user : lista){
      if(user.getEmail().equalsIgnoreCase(emailUsuario)){
       json.put("idStatus", 0);
       json.put("dsStatus", "E-mail já cadastrado.");
       out.print(json);
       return;
       }
  }

    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = new Date();
    Usuario obj = new Usuario();
    obj.setEmail(emailUsuario);
    obj.setNome(nomeUsuario);
    obj.setSenha(senhaUsuario);
    obj.setDtcadastro(dateFormat.format(date));
    dao.incluir(obj);
    
    json.put("idStatus", 1);
    json.put("dsStatus", "Cadastro criado com sucesso!");
    session.setAttribute("nomeUsuario", nomeUsuario );
    session.setAttribute("emailUsuario", emailUsuario );
    out.print(json);
%>
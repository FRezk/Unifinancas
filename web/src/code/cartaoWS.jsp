<%-- 
    Document   : cartaoWS
    Created on : May 28, 2016, 3:47:11 AM
    Author     : Fernando
--%>

<%@page import="dao.Usuario"%>
<%@page import="dao.Bandeira"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.Cartao"%>
<%@page import="modelo.CartaoDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>
<%
    HttpSession nsession = request.getSession(false);
    Integer idusuario = (Integer) nsession.getAttribute("idUsuario");
    String funcao = (String) request.getParameter("funcao");
    
    JSONObject json = new JSONObject();
    json.put("idStatus", 0);
    json.put("dsStatus", "Algo deu errado");
    
    if(funcao.equalsIgnoreCase("CADASTRAR")){
        Integer idbandeira = Integer.parseInt(request.getParameter("idbandeira"));
        String nomeCartao = (String) request.getParameter("nomecartao");
        
        Bandeira bandeiraObj = new Bandeira();
        bandeiraObj.setIdBandeira(idbandeira);
        
        Usuario usuarioObj = new Usuario();
        usuarioObj.setIdUsuario(idusuario);
        
        CartaoDAO cartaoDAO = new CartaoDAO();
        Cartao cartaoObj = new Cartao();
        
        cartaoObj.setIdBandeira(bandeiraObj);
        cartaoObj.setIdUsuario(usuarioObj);
        cartaoObj.setNome(nomeCartao);
        
        Cartao cartaoInserido = cartaoDAO.incluir(cartaoObj);
        
        

        
        json.put("idStatus", 1);
        json.put("idcartao", cartaoInserido.getIdCartao());
        json.put("urlBandeiraLogo", cartaoInserido.getIdBandeira().getLogoUrl() );
        json.put("bandeiraNome", cartaoInserido.getIdBandeira().getNome() );
        json.put("dsStatus", "Cartao cadastrada com sucesso!");
    }else if(funcao.equalsIgnoreCase("APAGAR")) {
        Integer idcartao = Integer.parseInt(request.getParameter("idcartao"));
        
        CartaoDAO cartaoDAO = new CartaoDAO();
        Cartao cartaoObj = new Cartao();
        
        Usuario usuarioObj = new Usuario();
        usuarioObj.setIdUsuario(idusuario);
        
        cartaoObj.setIdCartao(idcartao);
        cartaoObj.setIdUsuario(usuarioObj);
        
        cartaoDAO.excluir(cartaoObj);
        
        
        json.put("idStatus", 1);
        json.put("dsStatus", "Cartao excluido com sucesso!");
        json.put("idcartao", idcartao);
    }
    out.print(json);
%>

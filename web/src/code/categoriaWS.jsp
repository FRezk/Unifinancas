<%-- 
    Document   : categoriaWS
    Created on : 27/05/2016, 22:00:49
    Author     : Jefferson
--%>

<%@page import="dao.Categoria"%>
<%@page import="modelo.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        String catcor = (String) request.getParameter("catcor");
        String catnome = (String) request.getParameter("catnome");
        
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        Categoria categoriaObj = new Categoria();
        categoriaObj.setIdUsuario(idusuario);
        categoriaObj.setNome(catnome);
        categoriaObj.setCor(catcor);
        
        Categoria teste = categoriaDAO.incluir(categoriaObj);
        
        json.put("idStatus", 1);
        json.put("idcat", teste.getIdCategoria());
        json.put("dsStatus", "Categoria cadastrada com sucesso!");
    }else if(funcao.equalsIgnoreCase("APAGAR")) {
        Integer idcat = Integer.parseInt(request.getParameter("idcat"));
        
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        Categoria categoriaObj = new Categoria();
        
        categoriaObj.setIdCategoria(idcat);
        categoriaObj.setIdUsuario(idusuario);

        categoriaDAO.excluir(categoriaObj);
        
        
        json.put("idStatus", 1);
        json.put("dsStatus", "Categoria excluida com sucesso!");
        json.put("idcat", idcat);
    }
    out.print(json);
%>

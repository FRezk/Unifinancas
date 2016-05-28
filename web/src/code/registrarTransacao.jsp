<%-- 
    Document   : registrarTransacao
    Created on : 22/05/2016, 11:22:23
    Author     : Jefferson
--%>

<%@page import="dao.Especie"%>
<%@page import="dao.TipoTransacao"%>
<%@page import="dao.Categoria"%>
<%@page import="dao.Bandeira"%>
<%@page import="dao.Cartao"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.Transacao"%>
<%@page import="modelo.CategoriaDAO"%>
<%@page import="modelo.CartaoDAO"%>
<%@page import="modelo.BandeiraDAO"%>
<%@page import="modelo.TransacaoDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>
<%@page import="dao.Usuario"%>
<%@page import="modelo.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession nsession = request.getSession(false);
    Integer idusuario = (Integer) nsession.getAttribute("idUsuario");
    Usuario usuarioObj = new Usuario();
    usuarioObj.setIdUsuario(idusuario);

    String stransacao  = (String) request.getParameter("transacao");
    String sdescricao  = (String) request.getParameter("descricao");
    Double dvalor      = Double.parseDouble(request.getParameter("valor"));
    String sdtcadastro = (String) request.getParameter("dtcadastro");
    Integer icategoria  = Integer.parseInt(request.getParameter("categoria"));
    Integer iEspecie = Integer.parseInt(request.getParameter("especie"));
    System.out.println(iEspecie);
    
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Date dtcadastro = sdf.parse(sdtcadastro);
    
//    System.out.println("transacao: " + stransacao);
//    System.out.println("descricao: " + sdescricao);
//    System.out.println("valor: " + dvalor);
//    System.out.println("data: " + sdtcadastro);
//    System.out.println("categoria: " + icategoria);


    JSONObject json = new JSONObject();
    json.put("idStatus", 0);
    json.put("dsStatus", "Algo deu errado");  
    try{
        TransacaoDAO transacaoDAO = new TransacaoDAO();
        CategoriaDAO categoriaDAO = new CategoriaDAO();

        Transacao transacaoObj = new Transacao();
        Categoria categoriaObj = new Categoria();
        TipoTransacao tipoTransacaoObj = new TipoTransacao();
        Especie especieObj = new Especie();
        especieObj.setIdEspecie(iEspecie);

        categoriaObj.setIdCategoria(icategoria);

        if (stransacao.equalsIgnoreCase("RECEITA")) {
            tipoTransacaoObj.setIdTipoTransacao(2);
            transacaoObj.setIdTipoTransacao(tipoTransacaoObj);//receita
            transacaoObj.setDescricao(sdescricao);
            //alter table transacao alter column valor type double precision using cast(valor as double precision);
            transacaoObj.setValor(dvalor);
            transacaoObj.setDttransacao(dtcadastro);
            transacaoObj.setIdUsuario(usuarioObj);
            transacaoObj.setIdCategoria(categoriaObj);
            
            transacaoDAO.incluir(transacaoObj);
            
            json.put("idStatus", 1);
            json.put("dsStatus", "Receita Cadastrada com sucesso!");
            
        }else if (stransacao.equalsIgnoreCase("DESPESA")) {
            Integer iespecie = Integer.parseInt(request.getParameter("especie"));
            String scartao = (String) request.getParameter("cartao");
            

            tipoTransacaoObj.setIdTipoTransacao(1);
            transacaoObj.setIdTipoTransacao(tipoTransacaoObj);//despesa
            transacaoObj.setDescricao(sdescricao);
            //alter table transacao alter column valor type double precision using cast(valor as double precision);
            transacaoObj.setValor(dvalor);
            transacaoObj.setDttransacao(dtcadastro);
            transacaoObj.setIdUsuario(usuarioObj);
            transacaoObj.setIdCategoria(categoriaObj);
            transacaoObj.setIdEspecie(especieObj);
            
            
            if(!scartao.equalsIgnoreCase("")){
                Integer icartao = Integer.parseInt(scartao);
                Cartao  cartaoObj   = new Cartao();
                cartaoObj.setIdCartao(icartao);
                transacaoObj.setIdCartao(cartaoObj);
            }
            
            transacaoDAO.incluir(transacaoObj);
            
            json.put("idStatus", 1);
            json.put("dsStatus", "Despesa Cadastrada com sucesso!");
        }
    }catch(Exception err){
        System.out.println(err);
    }
    out.print(json);
%>

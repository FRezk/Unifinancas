<%-- 
    Document   : transacoesMes
    Created on : 29/05/2016, 23:53:17
    Author     : Jefferson
--%>


<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="util.ConexaoJSP"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    try {
        HttpSession nsession = request.getSession(false);
        Integer idusuario = (Integer) nsession.getAttribute("idUsuario");
        int despesa = 1;
        int receita = 2;
        
        Connection con = new ConexaoJSP().getConnection();

        
        //RECEITA
        String query = "SELECT to_char(dttransacao, 'dd/MM') AS dia, sum(valor) as valor FROM transacao WHERE id_tipo_transacao = "+receita+" AND id_usuario = "+idusuario+" GROUP BY dttransacao";
        PreparedStatement myPreparedStatement = con.prepareStatement(query);

        ResultSet rs = myPreparedStatement.executeQuery();
        
        JSONObject json = new JSONObject();
        
        JSONArray labels = new JSONArray();
        JSONArray dataReceita = new JSONArray();
        
        //provisorio!
        for(int i = 1; i <= 31; i++){
            labels.put(i);
        }
        
        
        while (rs.next()) {
            
            //labelsReceita.put(rs.getString("dia"));
            dataReceita.put(rs.getInt("valor"));
            
            //json.put("labels", labelsReceita);
            
        }
        
        //DESPESA
        query = "SELECT to_char(dttransacao, 'dd/MM') AS dia, sum(valor) as valor FROM transacao WHERE id_tipo_transacao = " + despesa + " AND id_usuario = "+idusuario+" GROUP BY dttransacao";
        myPreparedStatement = con.prepareStatement(query);

        rs = myPreparedStatement.executeQuery();


        //JSONArray labelsDespesa = new JSONArray();
        JSONArray dataDespesa = new JSONArray();

        while (rs.next()) {

            //labelsDespesa.put(rs.getString("dia"));
            dataDespesa.put(rs.getInt("valor"));

            //json.put("labels", labelsDespesa);
        }

        
        JSONArray datasets = new JSONArray();
        JSONObject receitas = new JSONObject();
        
        receitas.put("label", "Receitas");
        receitas.put("fillColor", "#11BF9D");
        receitas.put("strokeColor", "#11BF9D");
        receitas.put("pointStrokeColor", "#11BF9D");
        receitas.put("pointHighlightFill", "white");
        receitas.put("pointHighlightStroke", "#11BF9D");
        receitas.put("data", dataReceita);
        
        JSONObject despesas = new JSONObject();
        
        despesas.put("label", "Despesa");
        despesas.put("fillColor", "#E35849");
        despesas.put("strokeColor", "#E35849");
        despesas.put("pointStrokeColor", "#E35849");
        despesas.put("pointHighlightFill", "white");
        despesas.put("pointHighlightStroke", "#E35849");
        despesas.put("data", dataDespesa);
        
        datasets.put(receitas);
        datasets.put(despesas);
        
        
        json.put("labels", labels);
        json.put("datasets", datasets);
        
        out.print(json);
        
        myPreparedStatement.close();
        con.close();

    } catch (SQLException ex) {
        out.print("SQLException: " + ex.getMessage());
        out.print("SQLState: " + ex.getSQLState());
        out.print("VendorError: " + ex.getErrorCode());
    }
%>

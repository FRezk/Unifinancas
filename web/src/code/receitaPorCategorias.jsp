<%-- 
    Document   : despesaPorCategorias
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
        
        Connection con = new ConexaoJSP().getConnection();

        String query = "SELECT t.id_categoria, c.nome, c.cor, sum(t.valor) AS receita FROM transacao t INNER JOIN categoria c ON t.id_categoria = c.id_categoria WHERE t.id_tipo_transacao = 2 AND t.id_usuario = "+idusuario+" GROUP BY t.id_categoria, c.nome, c.cor";
        PreparedStatement myPreparedStatement = con.prepareStatement(query);

        ResultSet rs = myPreparedStatement.executeQuery();

        Boolean temResultado = false;
        JSONArray jsonArray = new JSONArray();

        while (rs.next()) {
            temResultado = true;
            JSONObject json = new JSONObject();

            json.put("value", rs.getDouble("receita"));
            json.put("color", rs.getString("cor"));
            json.put("highlight", rs.getString("cor"));
            json.put("label", rs.getString("nome"));

            jsonArray.put(json);
        }

        out.print(jsonArray);
        myPreparedStatement.close();
        con.close();

    } catch (SQLException ex) {
        out.print("SQLException: " + ex.getMessage());
        out.print("SQLState: " + ex.getSQLState());
        out.print("VendorError: " + ex.getErrorCode());
    }
%>

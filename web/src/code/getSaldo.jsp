<%-- 
    Document   : getSaldo
    Created on : 30/05/2016, 14:50:42
    Author     : tecnet
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

        String query = "SELECT ((SELECT sum(valor) FROM transacao WHERE id_usuario = "+idusuario+" AND id_tipo_transacao = 2 GROUP BY id_usuario ) - (SELECT sum(valor) FROM transacao WHERE id_usuario = "+idusuario+" AND id_tipo_transacao = 1 GROUP BY id_usuario )) as saldo FROM transacao WHERE id_usuario = "+idusuario+" GROUP BY id_usuario";
        PreparedStatement myPreparedStatement = con.prepareStatement(query);

        ResultSet rs = myPreparedStatement.executeQuery();
        
        JSONObject json = new JSONObject();

        if (rs.next()) {
            
            json.put("saldo", rs.getDouble("saldo"));
        }

        out.print(json);

        myPreparedStatement.close();
        con.close();

    } catch (SQLException ex) {
        out.print("SQLException: " + ex.getMessage());
        out.print("SQLState: " + ex.getSQLState());
        out.print("VendorError: " + ex.getErrorCode());
    }
%>

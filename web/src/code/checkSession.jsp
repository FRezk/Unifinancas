<%-- 
    Document   : checkSession
    Created on : May 15, 2016, 8:10:10 PM
    Author     : Fernando Rezk
--%>

<% HttpSession nsession = request.getSession(false);
if(nsession.getAttribute("nomeUsuario")==null){
    response.sendRedirect("index.jsp");
}
%>
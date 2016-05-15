<%-- 
    Document   : logout
    Created on : May 15, 2016, 8:14:20 PM
    Author     : Fernando Rezk
--%>
<% 
    session.invalidate();
    response.sendRedirect("../../index.jsp");

%>

<%@ include file="../banco/database.jsp" %>
<% if(session.getAttribute("usuarioAutenticado") == null) response.sendRedirect("entrar.jsp");%>
<%
    String id = request.getParameter("id");
    String nota = request.getParameter(id);
    if(nota.equals("null"))
        response.sendRedirect("../avPendentes.jsp?erro=1");
    else{
        String query = "UPDATE avaliacao SET nota = " + nota + " WHERE id = " + id;
        executarQuery(query);
        response.sendRedirect("../avPendentes.jsp");
    }
%>
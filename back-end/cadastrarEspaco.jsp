<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ include file="/banco/database.jsp" %>
<% if(session.getAttribute("usuarioAutenticado") == null) response.sendRedirect("entrar.jsp");%>

<% 
    String titulo = request.getParameter("titulo");
    String descricao = request.getParameter("descricao");
    String capacidade = request.getParameter("capacidade");
    String query = "INSERT INTO espaco (titulo, descricao, capacidade, ocupado) VALUES (?, ?, ?, 0)";
    executarQueryExterno(query, titulo, descricao, capacidade);
    response.sendRedirect("../cadastrarEspaco.html");
%>
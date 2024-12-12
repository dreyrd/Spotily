<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ include file="/banco/database.jsp" %>
<% if(session.getAttribute("usuarioAutenticado") == null) response.sendRedirect("entrar.jsp");%>

<% 
    String titulo = request.getParameter("titulo");
    String descricao = request.getParameter("descricao");
    String capacidade = request.getParameter("capacidade");
    String imagem = request.getParameter("image");

    String query = "INSERT INTO espaco (titulo, descricao, capacidade, ocupado) VALUES (?, ?, ?, 0)";
    executarQueryExterno(query, titulo, descricao, capacidade);

    String queryBuscarId = "SELECT id FROM espaco WHERE titulo = ? LIMIT 1";
    ResultSet rs = executarSelectExterno(queryBuscarId, titulo);

    if (rs != null && rs.next()) {
        
        String id = rs.getString("id");
        String queryCadastrar = "INSERT INTO foto_espaco (foto, espaco) VALUES (?, ?)";
        executarQueryExterno(queryCadastrar, imagem, id);

    }

    response.sendRedirect("../cadastrarEspaco.html");
%>
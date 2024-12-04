<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@include file="conectar.jsp" %>

<% 
    String titulo = request.getParameter("titulo");
    String descricao = request.getParameter("descricao");
    String capacidade = request.getParameter("capacidade");


    try {
        if (conexao != null) {
            String query = "INSERT INTO espaco (titulo, descricao, capacidade, ocupado) VALUES (?, ?, ?, 0)";

            PreparedStatement insert = conexao.prepareStatement(query);
            insert.setString(1, titulo);
            insert.setString(2, descricao);
            insert.setString(3, capacidade);

            int linhasAfetadas = insert.executeUpdate();

            if (linhasAfetadas > 0) {
                response.sendRedirect("../cadastrarEspaco.html");
            } else {
                out.println("Erro ao cadastrar. Tente novamente.");
            }

            insert.close();
        } else {
            out.println("Falha na conexão com o banco de dados.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Erro ao inserir no banco de dados: " + e.getMessage());
    }
%>
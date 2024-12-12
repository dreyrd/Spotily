<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@include file="../banco/database.jsp" %>
<%
    String cpf = request.getParameter("cpf");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String confirmarSenha = request.getParameter("confirmarSenha");

    if (!senha.equals(confirmarSenha)) {
        out.println("As senhas não coincidem. Tente novamente.");
    } else {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(senha.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                hexString.append(String.format("%02x", b));
            }
            String senhaCriptografada = hexString.toString();

            String query = "INSERT INTO usuario (cpf, nome, email, senha, black_list, adm) VALUES (?, ?, ?, ?, 0, 0)";
            executarQueryExterno(query, cpf, nome, email, senhaCriptografada);

            response.sendRedirect("../entrar.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Erro ao inserir no banco de dados: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Erro ao criptografar a senha: " + e.getMessage());
        }
    }
%>

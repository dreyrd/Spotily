<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@include file="conectar.jsp" %>
<%
    String cpf = request.getParameter("cpf").replaceAll("\\D", ""); // Remove pontos e traços
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String confirmarSenha = request.getParameter("confirmarSenha");

    // Checa se o cpf tem 11 digitos
    if (cpf.length() != 11) {
        out.println("<p style='color:red;'>CPF inválido! O CPF deve conter exatamente 11 dígitos.</p>");
    }
    else if (!senha.equals(confirmarSenha)) {
        out.println("<p style='color:red;'>As senhas não coincidem. Tente novamente.</p>");
    } 
    else {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(senha.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                hexString.append(String.format("%02x", b));
            }
            String senhaCriptografada = hexString.toString();

            if (conexao != null) {
                String query = "INSERT INTO usuario (cpf, nome, email, senha, black_list, adm) VALUES (?, ?, ?, ?, 0, 0)";

                PreparedStatement stmt = conexao.prepareStatement(query);
                stmt.setString(1, cpf);
                stmt.setString(2, nome);
                stmt.setString(3, email);
                stmt.setString(4, senhaCriptografada); 

                int linhasAfetadas = stmt.executeUpdate();

                if (linhasAfetadas > 0) {
                    response.sendRedirect("index.html");
                } else {
                    out.println("Erro ao cadastrar. Tente novamente.");
                }

                stmt.close();
            } else {
                out.println("Falha na conexão com o banco de dados.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Erro ao inserir no banco de dados: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Erro ao criptografar a senha: " + e.getMessage());
        }
    }
%>

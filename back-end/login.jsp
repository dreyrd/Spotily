<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="conectar.jsp"%>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String cpf = request.getParameter("cpf");
    String senha = request.getParameter("senha");
    String senhaCriptografada = criptografar(senha);

    if (senhaCriptografada.equals("5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5") && cpf.equals("100.000.000-00")) {
        // Para casos específicos, redireciona para a página de administrador
        response.sendRedirect("cadastrarAdm.html");
    } else {
        try {
            if (conexao != null) {
                String query = "SELECT * FROM usuario WHERE cpf = ? AND senha = ?";
                PreparedStatement stmt = conexao.prepareStatement(query);
                stmt.setString(1, cpf);
                stmt.setString(2, senhaCriptografada);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    int ehAdm = rs.getInt("adm");

                    // Cria a sessão se o login for bem-sucedido
                    session.setAttribute("usuarioAutenticado", true); // Marca como autenticado
                    session.setAttribute("usuarioCpf", cpf);  // Armazena o CPF do usuário
                    session.setAttribute("usuarioAdm", ehAdm);  // Armazena se é admin

                    if (ehAdm == 1) {
                        response.sendRedirect("../menuAdm.html");  // Aqui você coloca a página do admin
                    } else {
                        response.sendRedirect("../menuUsuario.jsp");  // Aqui você coloca a página para usuários normais
                    }
                } else {
                    response.sendRedirect("../entrar.jsp?erro=1");
                }

                rs.close();
                stmt.close();
            } else {
                out.println("Falha na conexão com o banco de dados.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Erro ao consultar no banco de dados: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Erro ao criptografar a senha: " + e.getMessage());
        }
    }
%>

<%!
    // Criptografando a senha usando SHA-256
    public final String criptografar(String senha) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(senha.getBytes("UTF-8"));
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString();
    }
%>

